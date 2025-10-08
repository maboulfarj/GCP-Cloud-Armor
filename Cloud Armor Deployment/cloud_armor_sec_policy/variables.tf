
variable "default_rules" {
  default = {
    def_rule = {
      action         = "allow"
      priority       = "2147483647"
      versioned_expr = "SRC_IPS_V1"
      src_ip_ranges  = ["*"]
      description    = "Default rule"
      preview        = false
    }
  }
  type = map(object({
    action         = string
    priority       = string
    versioned_expr = string
    src_ip_ranges  = list(string)
    description    = string
    preview        = bool
    })
  )
}
variable "adaptive_protection_enabled" {
  type        = bool
  description = "Enable adaptive protection"
  default     = false
}
 
variable "throttle_rules" {
  default = {
    def_rule = {
      action                            = "throttle"
      priority                          = "4000"
      versioned_expr                    = "SRC_IPS_V1"
      src_ip_ranges                     = ["*"]
      description                       = "Throttling traffic rule"
      conform_action                    = "allow"
      exceed_action                     = "deny(429)"
      enforce_on_key                    = "ALL"
      rate_limit_threshold_count        = "100"
      rate_limit_threshold_interval_sec = "60"
      preview                           = true
    }
  }
  type = map(object({
    action                            = string
    priority                          = string
    versioned_expr                    = string
    src_ip_ranges                     = list(string)
    description                       = string
    conform_action                    = string
    exceed_action                     = string
    enforce_on_key                    = string
    rate_limit_threshold_count        = number
    rate_limit_threshold_interval_sec = number
    preview                           = bool
    })
  )
}


variable "countries_rules" {
  default = {
    def_rule = {
      action      = "deny(403)"
      priority    = "3000"
      expression  = "'[CN, RU]'.contains(origin.region_code)"
      description = "Deny if region code is listed"
      preview     = true
    }
  }
  type = map(object({
    action      = string
    priority    = string
    expression  = string
    description = string
    preview     = bool
    })
  )
}

variable "owasp_rules" {
  default = {
    rule_sqli = {
      action      = "deny(403)"
      priority    = "1000"
      description = "SQL injection"
      preview     = true

      expression = "evaluatePreconfiguredWaf('sqli-v33-stable', {'sensitivity': 4})"
    }
    rule_xss = {
      action      = "deny(403)"
      priority    = "1001"
      description = "Cross-site scripting"
      preview     = true

      expression = "evaluatePreconfiguredWaf('xss-v33-stable', {'sensitivity': 2})"

    }
    rule_lfi = {
      action      = "deny(403)"
      priority    = "1002"
      description = "Local file inclusion"
      preview     = true

      expression = "evaluatePreconfiguredWaf('lfi-v33-stable', {'sensitivity': 1})"
    }
    rule_rce = {
      action      = "deny(403)"
      priority    = "1003"
      description = "Remote code execution"
      preview     = true

      expression = "evaluatePreconfiguredWaf('rce-v33-stable', {'sensitivity': 3})"
    }
    rule_rfi = {
      action      = "deny(403)"
      priority    = "1004"
      description = "Remote file inclusion"
      preview     = true

      expression = "evaluatePreconfiguredWaf('rfi-v33-stable', {'sensitivity': 2})"
    }
    rule_methodenforcement = {
      action      = "deny(403)"
      priority    = "1005"
      description = "Method enforcement"
      preview     = true

      expression = "evaluatePreconfiguredWaf('methodenforcement-v33-stable', {'sensitivity': 1})"
    }
    rule_scandetection = {
      action      = "deny(403)"
      priority    = "1006"
      description = "Scanner detection"
      preview     = true

      expression = "evaluatePreconfiguredWaf('scannerdetection-v33-stable', {'sensitivity': 2})"
    }
    rule_protocolattack = {
      action      = "deny(403)"
      priority    = "1007"
      description = "Protocol Attack"
      preview     = true


      expression = "evaluatePreconfiguredWaf('protocolattack-v33-stable', {'sensitivity': 3})"
    }
    rule_php = {
      action      = "deny(403)"
      priority    = "1008"
      description = "PHP"
      preview     = true

      expression = "evaluatePreconfiguredWaf('php-v33-stable', {'sensitivity': 3})"
    }
    rule_sessionfixation = {
      action      = "deny(403)"
      priority    = "1009"
      description = "Session Fixation"
      preview     = true

      expression = "evaluatePreconfiguredWaf('sessionfixation-v33-stable', {'sensitivity': 1})"
    }
    rule_java = {
      action      = "deny(403)"
      priority    = "1010"
      description = "Java attack"
      preview     = true

      expression = "evaluatePreconfiguredWaf('java-v33-stable', {'sensitivity': 3})"
    }
    rule_nodejs = {
      action      = "deny(403)"
      priority    = "1011"
      description = "NodeJS attack"
      preview     = true

      expression = "evaluatePreconfiguredWaf('nodejs-v33-stable', {'sensitivity': 1})"
    }
  }
  type = map(object({
    action      = string
    priority    = string
    description = string
    preview     = bool
    expression  = string
    })
  )
}
 
variable "cves_and_vulnerabilities_rules" {
  default = {
    rule_apache_log4j = {
      action      = "deny(403)"
      priority    = "2000"
      description = "Apache Log4j CVE-2021-44228"
      preview     = true

      expression = "evaluatePreconfiguredWaf('cve-canary', {'sensitivity': 3})"
    }
    rule_json_sqli = {
      action      = "deny(403)"
      priority    = "2001"
      description = "JSON-formatted content SQLi"
      preview     = true

      expression = "evaluatePreconfiguredWaf('json-sqli-canary', {'sensitivity': 2})"
    }
  }
  type = map(object({
    action      = string
    priority    = string
    description = string
    preview     = bool
    expression  = string
    })
  )
}