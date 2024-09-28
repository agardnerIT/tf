resource "dynatrace_autotag_v2" "crossplane-created2" {
  name                          = "crossplane-created2"
  description                   = "2this is an autotag rule created by crossplane2"
  # rules_maintained_externally = false
  rules {
    rule {
      type                = "ME"
      enabled             = true
      value_normalization = "Leave text as-is"
      attribute_rule {
        entity_type                 = "SERVICE"
        service_to_host_propagation = true
        service_to_pgpropagation    = true
        conditions {
          condition {
            case_sensitive = true
            key            = "HOST_GROUP_NAME"
            operator       = "EQUALS"
            string_value   = "crossplane"
          }
        }
      }
    }
  }
}
