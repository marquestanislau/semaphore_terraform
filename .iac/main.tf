terraform {
  required_providers {
    semaphoreui = {
      source = "CruGlobal/semaphoreui"
      version = "1.1.0"
    }
  }
}

provider "semaphoreui" {
  hostname  = "localhost"
  port      = 3000   # Default: 3000
  path      = "/api" # Default: "/api"
  protocol  = "http" # Default: "https"
  api_token = "fwyypk0fcpbfdttfuh_39hytoi-kbx1qh4f1l7jd15i="
}

