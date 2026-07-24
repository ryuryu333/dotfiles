let
  { TfJsonSchema, .. } =
    import "schema/tf_json.ncl",
  data = {
    provider = import "data/provider.ncl",
    repository = import "data/repository.ncl",
  },
in
let configuration
  | TfJsonSchema
  = 
    data.provider,
in
configuration
