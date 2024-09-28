resource "dynatrace_autotag_v2" "crossplane-created" {
  name                          = "crossplane-created"
  description                   = "this is an autotag rule created by crossplane"
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
            string_value   = "fooCrossplane"
          }
        }
      }
    }
  }
}

resource "dynatrace_autotag_v2" "manually-created" {
  name                          = "manually-created"
  description                   = "this is a manually created autotag rule"
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
            string_value   = "foo"
          }
        }
      }
    }
  }
}
