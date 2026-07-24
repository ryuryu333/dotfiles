let
  util = import "util/record.ncl",
  {
    RepositryInput,
    ListWithBaseSetting,
    ..
  } = import "schema/user_input/repository.ncl",
  { GithubRepositorySchema, .. } =
    import "schema/resource/github_repository.ncl",
  { ResourceSchema, .. } =
    import "schema/resource/resource.ncl",
in
{
  to_resources
    | RepositryInput -> ResourceSchema
    = fun repositoryInput =>
      repositoryInput
      |> std.record.map (fun _ repositries =>
        repositries.list
          |> std.record.map (fun _ repository =>
            # 個別設定を優先して共通設定とマージ
            repositries."!base_setting"
              |> util.set_priority_1_top_field
            &
            repository
              |> util.set_priority_2_top_field
          )
          |> std.record.map (fun field_name repository =>
            repository
            & { name | force = field_name, }
          )
        )
}
