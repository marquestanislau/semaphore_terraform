# Static Inventory Example
resource "semaphoreui_project_inventory" "static" {
  project_id = semaphoreui_project.project.id
  name       = "Static Inventory"
  ssh_key_id = semaphoreui_project_key.none.id
  static = {
    inventory = <<-EOT
      [website]
      172.18.8.40
      172.18.8.41
    EOT
    # Optional
    become_key_id = 3
  }
}
