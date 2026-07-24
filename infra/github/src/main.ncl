let
  { TfJsonSchema, .. } =
    import "schema/tf_json.ncl",
  { mk_resource, .. } =
    import "lib/repository.ncl",
  data = {
    provider = import "data/provider.ncl",
    repository = import "data/repository.ncl",
  },
in
let configuration
  | TfJsonSchema
  =
    data.provider
    & {
      resource =
        data.repository
        |> mk_resource,
    },
in
configuration
