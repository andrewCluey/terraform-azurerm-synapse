<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.20.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.4.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.20.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.sql_admin](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.sql_admin_password](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.synapse_name](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/key_vault_secret) | resource |
| [azurerm_synapse_workspace.workspace](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/synapse_workspace) | resource |
| [random_password.sql_admin](https://registry.terraform.io/providers/hashicorp/random/3.4.3/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_lake_gen2_filesystem_id"></a> [data\_lake\_gen2\_filesystem\_id](#input\_data\_lake\_gen2\_filesystem\_id) | description | `string` | n/a | yes |
| <a name="input_keyvault_id"></a> [keyvault\_id](#input\_keyvault\_id) | description | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | description | `string` | `"uksouth"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | description | `string` | n/a | yes |
| <a name="input_settings"></a> [settings](#input\_settings) | description | `any` | `{}` | no |
| <a name="input_storage_data_lake_gen2_filesystem_id"></a> [storage\_data\_lake\_gen2\_filesystem\_id](#input\_storage\_data\_lake\_gen2\_filesystem\_id) | description | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | description | `map` | `{}` | no |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | description | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->