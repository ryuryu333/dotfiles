let
  { ResourceSchema, .. } =
    import "schema/resource/resource.ncl",
in
{
  TfJsonSchema = {
    terraform | {
      required_providers | {
        github | {
          source | String,
          version | String,
        }
      }
    },
    provider | {
      github | {
        owner | String,
      }
    },
    resource | ResourceSchema,
  },
}
