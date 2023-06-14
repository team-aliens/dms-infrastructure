resource "cloudflare_pages_project" "admin_pages" {

  account_id        = "16d0f8fe5b59ee4106adfa648547c305"
  name              = "dms"
  production_branch = "main"

  build_config {
    build_command       = "npm run build"
    destination_dir     = "build"
    root_dir            = "services/admin"
  }

  source {
    type = "github"
    config {
      owner                         = "team-aliens"
      repo_name                     = "DMS"
      production_branch             = "main"
      pr_comments_enabled           = true
      deployments_enabled           = true
      production_deployment_enabled = true
      preview_deployment_setting    = "all"
      preview_branch_includes       = ["dev", "preview"]
      preview_branch_excludes       = ["main"]
    }
  }

  deployment_configs {
    production {
      environment_variables = {
        APP_PUBLIC_URL = "https://api.aliens-dms.com/"
        NODE_VERSION = 16
      }
    }
    preview {
      environment_variables = {
        APP_PUBLIC_URL = "https://api-dev.aliens-dms.com/"
        NODE_VERSION = 16
      }
    }
  }

}

resource "cloudflare_pages_domain" "admin_pages_domain" {
  account_id   = "16d0f8fe5b59ee4106adfa648547c305"
  project_name = "dms"
  domain       = "admin.aliens-dms.com"
}

resource "cloudflare_pages_domain" "admin_pages_dev_domain" {
  account_id   = "16d0f8fe5b59ee4106adfa648547c305"
  project_name = "dms"
  domain       = "admin-dev.aliens-dms.com"
}
