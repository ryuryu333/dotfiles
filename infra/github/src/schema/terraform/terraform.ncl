let { RequiredProvidersSchema } = import "./module/required_providers.ncl",
in
{
  TerraformSchema = {
    required_providers | RequiredProvidersSchema,
  },
}
