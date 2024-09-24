module "autotag_v2" {
  source = "./modules/autotag_v2"

  providers = {
    dynatrace = {
      version = "~> 1.0"
      source = "dynatrace-oss/dynatrace"
    }
  }
}
