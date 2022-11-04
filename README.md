<!-- BEGIN_TF_DOCS -->
# terraform-azurerm-synapse
Creates a new Synapse workspace with options to create.....

Future changes to include:
  - Update Azurerm provider to use 3.29.x, Additional attributes available.

## Example - default
```hcl

```

## Example -
```hcl

```

## Example - Parametrised deployment using .tfvars variable file.
```hcl
provider "azurerm" {
  features {}
}
variable "workspace_name" {
  type        = string
}
```

### TFVARS file. Can be used to provide different input parameters when deploying to multiple environments.
```hcl
workspace_name                       = "demo-syn-name"
keyvault_id                          = "uiyiuy-subuyuhoi/keyvault/id"
location                             = "uksouth"
resource_group_name                  = "rg-example-data"
settings                             = {}
storage_data_lake_gen2_filesystem_id = "ijoi-ihiuhiu/storage/g2sahnsstorageaccountid"
tags                                 = {
    environment = "Dev",
    data_owner = "clureA"
}
````


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_keyvault_id"></a> [keyvault\_id](#input\_keyvault\_id) | description | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | description | `string` | `"uksouth"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | description | `string` | n/a | yes |
| <a name="input_settings"></a> [settings](#input\_settings) | description | `any` | `{}` | no |
| <a name="input_storage_data_lake_gen2_filesystem_id"></a> [storage\_data\_lake\_gen2\_filesystem\_id](#input\_storage\_data\_lake\_gen2\_filesystem\_id) | description | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | description | `map(any)` | `{}` | no |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | description | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->