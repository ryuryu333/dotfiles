let
  util = import "util/record.ncl",
  {
    RepositryInput,
    ListWithBaseSetting,
    RepositoryWithSetting,
    ..
  } = import "schema/user_input/repository.ncl",
  { GithubRepositorySchema, .. } =
    import "schema/resource/github_repository.ncl",
  { GithubRepositoryRulesetSchema, .. } =
    import "schema/resource/github_repository_ruleset.ncl",
  { ResourceSchema, .. } =
    import "schema/resource/resource.ncl",
in
let
  merge_base_setting_into_each_repository
    | ListWithBaseSetting -> { _ : RepositoryWithSetting }
    = fun input =>
      input.list
        |> std.record.map_values (fun repository =>
          (
            input."!base_setting"
              |> util.set_priority_negative_1_top_field
          )
          &
          repository
      ),

  merge_setting_into_each_repository
    | { _ : RepositoryWithSetting }
        -> { _ : RepositoryWithSetting }
    = fun repositories =>
      repositories
        |> std.record.map_values (fun repository =>
          (
            repository.setting
              |> util.set_priority_negative_2_top_field
          )
          &
          repository
        ),

  set_repository_name_from_fieldname
    | { _ : RepositoryWithSetting }
        ->{ _ : RepositoryWithSetting }
    = fun repositories =>
        repositories
          |> std.record.map (fun field_name repository =>
              repository
              & { name | force = field_name, }
            ),

  mk_repository_source
    | { _ : RepositoryWithSetting }
      -> ResourceSchema
    = fun repositories =>
      repositories
        |> std.record.map_values (fun repository =>
          repository
            |> (fun {
              setting = _,
              ruleset = _,
              ..repository_resource
            } => repository_resource)
        )
        |> (fun repository_resources => {
          github_repository = repository_resources,
        }),

  mk_ruleset_resource
    | String
      -> Array GithubRepositoryRulesetSchema
      -> ResourceSchema
    = fun repository_name rulesets =>
      rulesets
        |> std.array.map_with_index (fun index ruleset =>
          {
            field = "%{repository_name}-%{index}",
            value = ruleset,
          }
        )
        |> std.record.from_array
        |> std.record.map (fun field_name ruleset =>
          ruleset
          & {
            name | force = field_name,
            repository | force = repository_name,
          }
        )
        |> (fun ruleset_resources => {
          github_repository_ruleset = ruleset_resources,
        }),
in
let
  mk_ruleset_resource_from_repositories
    | { _ : RepositoryWithSetting }
      -> ResourceSchema
    = fun repositories =>
        repositories
          |> std.record.map_values (fun repository =>
            if std.record.has_field "ruleset" repository then
              mk_ruleset_resource repository.name repository.ruleset
            else
              {}
          )
          |> util.merge_record_values
in
{
  mk_resource
    | RepositryInput -> ResourceSchema
    = fun repositories_groups =>
      repositories_groups
        |> std.record.map_values
            merge_base_setting_into_each_repository
        |> util.merge_record_values
        |> merge_setting_into_each_repository
        |> set_repository_name_from_fieldname
        |> (fun repositories =>
          (
            repositories
              |> mk_repository_source
          )
          &
          (
            repositories
              |> mk_ruleset_resource_from_repositories
          )
        )
}
