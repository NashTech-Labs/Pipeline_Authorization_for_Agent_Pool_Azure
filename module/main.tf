resource "azuredevops_project" "example" {
  name = var.project_name_VV
}

data "azuredevops_agent_pool" "example" {
  name = var.agent_pool_VV
}

resource "azuredevops_agent_queue" "example" {
  project_id    = azuredevops_project.example.id
  agent_pool_id = data.azuredevops_agent_pool.example.id
}

# Grant access to queue to all pipelines in the project
resource "azuredevops_resource_authorization" "example" {
  project_id  = azuredevops_project.example.id
  resource_id = azuredevops_agent_queue.example.id
  type        = "queue"
  authorized  = true
}