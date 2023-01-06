resource "sendgrid_template" "templates" {
  for_each    = local.templates
  name        = each.value
  generation  = "dynamic"
}

data "local_file" "templates" {
  for_each    = local.templates
  filename    = "../templates/${each.key}/template.html"
}

data "local_file" "json" {
  for_each    = local.templates
  filename    = "../templates/${each.key}/template.html.json"
}

resource "sendgrid_template_version" "versions" {
  for_each               = local.templates
  name                   = each.value
  template_id            = sendgrid_template.templates[each.key].id
  active                 = 1
  html_content           = data.local_file.templates[each.key].content
  test_data              = data.local_file.json[each.key].content
  generate_plain_content = true
  subject                = "Trivial Security - {{subject}}"
}

output "template_ids" {
  value = {
    for k, v in sendgrid_template.templates : k => v.id
  }
}
