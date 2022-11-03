

resource "azurerm_synapse_workspace" "workspace" {
  name                                 = var.workspace_name
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  storage_data_lake_gen2_filesystem_id = var.storage_data_lake_gen2_filesystem_id
  sql_administrator_login              = var.settings.sql_administrator_login
  sql_administrator_login_password     = lookup(var.settings, "sql_administrator_login_password", random_password.sql_admin.0.result) # Allows either random or input param
  sql_identity_control_enabled         = lookup(var.settings, "sql_identity_control_enabled", null)
  managed_virtual_network_enabled      = lookup(var.settings, "managed_virtual_network_enabled", false)
  managed_resource_group_name          = lookup(var.settings, "managed_resource_group_name", null)
  public_network_access_enabled        = false
  tags                                 = var.tags

  identity {
    type = "SystemAssigned"
  }

  dynamic "sql_aad_admin" {
    for_each = try(var.settings.sql_aad_admin, {})

    content {
      login     = var.settings.sql_aad_admin.login
      object_id = var.settings.sql_aad_admin.object_id
      tenant_id = var.settings.sql_aad_admin.tenant_id
    }
  }

  dynamic "azure_devops_repo" {
    for_each = try(var.settings.azure_devops_repo, {})

    content {
      account_name    = var.settings.azure_devops_repo.account_name
      branch_name     = lookup(var.settings.azure_devops_repo, "branch_name", "main")
      project_name    = var.settings.azure_devops_repo.project_name
      repository_name = var.settings.azure_devops_repo.repo_name
      root_folder     = lookup(var.settings.azure_devops_repo, "root_folder", "/")
    }
  }

  dynamic "customer_managed_key" {
    for_each = var.settings.customer_managed_key_versionless_id == null ? [] : [1]

    content {
      key_versionless_id = var.settings.customer_managed_key_versionless_id
      key_name           = lookup(var.settings, "key_name", null)
    }
  }

  dynamic "github_repo" {
    for_each = try(var.settings.github_repo, {})

    content {
      account_name    = var.settings.github_repo.account_name
      branch_name     = var.settings.github_repo.project_name
      repository_name = var.settings.github_repo.branch_name
      root_folder     = var.settings.github_repo.root_folder
      git_url         = var.settings.github_repo.git_url
    }
  }

}



# random password if not added as an input param.
resource "random_password" "sql_admin" {
  count = var.settings.sql_administrator_login_password == null ? 1 : 0

  length           = 128
  special          = true
  upper            = true
  number           = true
  override_special = "$#%"
}

# Store the generated password into keyvault for retrieval.
resource "azurerm_key_vault_secret" "sql_admin_password" {
  count = var.settings.sql_administrator_login_password == null ? 1 : 0

  name         = format("%s-synapse-sql-admin-password", azurerm_synapse_workspace.workspace.name)
  value        = random_password.sql_admin.0.result
  key_vault_id = var.keyvault_id

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}

resource "azurerm_key_vault_secret" "sql_admin" {
  count = var.settings.sql_administrator_login_password == null ? 1 : 0

  name         = format("%s-synapse-sql-admin-username", azurerm_synapse_workspace.workspace.name)
  value        = var.settings.sql_administrator_login
  key_vault_id = var.keyvault_id
}

resource "azurerm_key_vault_secret" "synapse_name" {
  count = var.settings.sql_administrator_login_password == null ? 1 : 0

  name         = format("%s-synapse-name", azurerm_synapse_workspace.workspace.name)
  value        = azurerm_synapse_workspace.workspace.name
  key_vault_id = var.keyvault_id
}
