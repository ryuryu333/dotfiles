let
  { TerraformSchema } = import "./terraform/terraform.ncl",
  { ProviderSchema } = import "./provider/provider.ncl",
  { ResourceSchema } = import "./resource/resource.ncl",
in
{
  TfJsonSchema = {
    terraform | TerraformSchema,
    provide | ProviderSchema,
    resource | ResourceSchema,
  },
}
