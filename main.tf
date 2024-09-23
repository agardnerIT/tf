resource "dynatrace_autotag_v2" "sampleagremote1" {
  name                        = "sampleagremote1"
  /* ensure that this resource instance doesn't maintain the rules */
  rules_maintained_externally = true
}

/*
  Be careful when maintaining `dynatrace_autotag_rules` in separate modules.
  Do not execute `terraform apply` in parallel when several modules contain 
  `dynatrace_autotag_rules` referring to the same `dynatrace_autotag_v2`.
*/
resource "dynatrace_autotag_rules" "sampleagremote1" {
  auto_tag_id = dynatrace_autotag_v2.sampleagremote1.id
  rules {
    rule {
      type                = "SELECTOR"
      enabled             = true
      entity_selector     = "type(SERVICE),tag(sampleagremote1)"
      value_format        = "disabled"
      value_normalization = "Leave text as-is"
    }
  }
}
