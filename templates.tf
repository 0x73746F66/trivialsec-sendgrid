resource "sendgrid_template" "templates" {
  for_each    = local.templates
  name        = each.value
  generation  = "dynamic"
}

data "local_file" "templates" {
  for_each    = local.templates
  filename    = "./templates/${each.key}/template.html"
}

resource "sendgrid_template_version" "account_recovery" {
  for_each               = local.templates
  name                   = each.value
  template_id            = sendgrid_template.templates[each.key].id
  active                 = 1
  html_content           = data.local_file.templates[each.key].content
  generate_plain_content = true
  subject                = "Trivial Security - ${each.value}"
}

output "template_ids" {
  value = {
    for k, v in sendgrid_template.templates : k => v.id
  }
}
