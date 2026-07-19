let { RequiredProvidersSchema, .. } = import "required_providers.ncl",
in
{
  TerraformSchema = {
    terraform | {
        required_providers
          | {
            _ | RequiredProvidersSchema,
          },
      },
    }
