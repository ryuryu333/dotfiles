let
  required_providers = import "data/required_providers.ncl",
  provider_data = import "data/provider.ncl",
  repositories = import "data/repositories.ncl",
  { TfJsonSchema } = import "schema/tf_json.ncl",
in
let configuration
  | TfJsonSchema
  = {
    terraform.required_providers = required_providers,
    provider = provider_data,
    resource.github_repository = repositories,
  },
in
configuration
