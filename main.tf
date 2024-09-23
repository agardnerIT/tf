resource "dynatrace_autotag_v2" "sampleagremote" {
  name                        = "sampleagremote"
  /* ensure that this resource instance doesn't maintain the rules */
  rules_maintained_externally = true
}

/*
  Be careful when maintaining `dynatrace_autotag_rules` in separate modules.
  Do not execute `terraform apply` in parallel when several modules contain 
  `dynatrace_autotag_rules` referring to the same `dynatrace_autotag_v2`.
*/
resource "dynatrace_autotag_rules" "sampleagremote" {
  auto_tag_id = dynatrace_autotag_v2.sample.id
  rules {
    rule {
      type                = "SELECTOR"
      enabled             = true
      entity_selector     = "type(SERVICE),tag(sampleag)"
      value_format        = "disabled"
      value_normalization = "Leave text as-is"
    }
  }
}
