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
        |> std.record.map (fun _ repository =>
          input."!base_setting"
            |> util.set_priority_1_top_field
          &
          repository
            |> util.set_priority_2_top_field
      ),

  merge_repositories_groups
    | { _ : { _ : RepositoryWithSetting } }
      -> { _ : RepositoryWithSetting }
    = fun input =>
      input
        |> std.record.values
        |> std.record.merge_all,

  merge_setting_into_each_repository
    | { _ : RepositoryWithSetting }
        -> { _ : RepositoryWithSetting }
    = fun repositories =>
      repositories
        |> std.record.map (fun _ repository =>
          repository.setting
            |> util.set_priority_1_top_field
          &
          repository
            |> util.set_priority_2_top_field
        ),

  set_repository_name_from_fieldname
    | { _ : RepositoryWithSetting }
        -> { _ : RepositoryWithSetting }
    = fun repositories =>
        repositories
          |> std.record.map (fun field_name repository =>
              repository
              & { name | force = field_name, }
            ),

  mk_repository_source
    | RepositoryWithSetting
      -> GithubRepositorySchema
    = fun repository =>
      repository
        |> (fun {
            setting = _,
            ruleset = _,
            ..rest
          } => rest),

  mk_ruleset_resource
    | String
      -> Array GithubRepositoryRulesetSchema
      -> { _ : GithubRepositoryRulesetSchema }
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
        ),
      
in
let
  to_resources
    | RepositryInput -> ResourceSchema
    = fun repositories_groups =>
      repositories_groups
        |> std.record.map
            merge_base_setting_into_each_repository
        |> merge_repositories_groups
        |> merge_setting_into_each_repository
        |> set_repository_name_from_fieldname
in
{
  
}