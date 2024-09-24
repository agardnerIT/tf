module "autotag_v2" {
  source = "./modules/autotag_v2"
  providers = {
    dynatrace = dynatrace
  }
}
