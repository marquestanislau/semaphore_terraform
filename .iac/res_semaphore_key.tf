resource "semaphoreui_project_key" "none" {
  project_id = semaphoreui_project.project.id
  name       = "None"
  none       = {}
}