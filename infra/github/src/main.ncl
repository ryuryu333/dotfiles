let
  required_providers = import "data/required_providers.ncl",
  provider_data = import "data/provider.ncl",
  repositories_data = import "data/repositories.ncl",
  repository_lib = import "lib/github_repository.ncl",
  { TfJsonSchema } = import "schema/tf_json.ncl",
in
let configuration
  | TfJsonSchema
  = {
    terraform.required_providers = required_providers,
    provider = provider_data,
    resource.github_repository =
      repositories_data
      |> repository_lib.to_resources,
  },
in
configuration
