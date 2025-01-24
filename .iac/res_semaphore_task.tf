# Task Template
resource "semaphoreui_project_template" "task" {
  project_id     = semaphoreui_project.project.id
  environment_id = semaphoreui_project_environment.environment.id
  inventory_id   = semaphoreui_project_inventory.static.id
  repository_id  = semaphoreui_project_repository.repository.id
  name           = "Template"
  playbook       = "playbook.yml"
  description    = "Description"
  arguments = [
    "--help",
    "--vvv",
  ]
  allow_override_args_in_task = true

  survey_vars = [{
    name     = "age"
    title    = "What is your age?"
    required = true
    type     = "integer"
    }, {
    name  = "question"
    title = "Pick one."
    type  = "enum"
    enum_values = {
      "First Value"  = "1"
      "Second Value" = "2"
    }
  }]

  vaults = [{
    name = "" # default vault
    password = {
      vault_key_id = semaphoreui_project_key.none.id
    }
    }, {
    name = "database"
    script = {
      script = "path/to/script-client.py"
    }
  }]
}

# Build Template
resource "semaphoreui_project_template" "build" {
  project_id     = semaphoreui_project.project.id
  environment_id = semaphoreui_project_environment.environment.id
  inventory_id   = semaphoreui_project_inventory.static.id
  repository_id  = semaphoreui_project_repository.repository.id
  name           = "Build"
  playbook       = "build.yml"
  build = {
    start_version = "1.0.0"
  }
}

# Deploy Template
resource "semaphoreui_project_template" "deploy" {
  project_id     = semaphoreui_project.project.id
  environment_id = semaphoreui_project_environment.environment.id
  inventory_id   = semaphoreui_project_inventory.static.id
  repository_id  = semaphoreui_project_repository.repository.id
  name           = "Deploy"
  playbook       = "deploy.yml"
  deploy = {
    build_template_id = semaphoreui_project_template.build.id
    autorun           = false
  }
}