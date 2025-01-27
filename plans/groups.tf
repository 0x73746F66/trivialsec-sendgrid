resource "sendgrid_unsubscribe_group" "subscriptions" {
	name   = "Product Updates"
	description = "The default unsubscribe group"
    is_default = true
}

resource "sendgrid_unsubscribe_group" "notifications" {
	name   = "Notifications"
	description = "Important account updates such as change password and billing"
}

resource "sendgrid_unsubscribe_group" "focus_group" {
	name   = "Focus Group"
	description = "During development we may invite customers to try for free new features we are working on"
}

resource "sendgrid_unsubscribe_group" "marketing" {
	name   = "Marketing & Promotions"
	description = "From time to time our team may let subscribers or existing customers know about exclusive deals"
}
resource "sendgrid_unsubscribe_group" "contact_us" {
	name   = "Contact Us"
	description = "All messages sent from this list originate from a request you made for us to contact you"
}
resource "sendgrid_unsubscribe_group" "internal" {
	name   = "Internal"
	description = "Emails sent to internal staff only"
}

output "group_ids" {
  value = {
    "subscriptions" = sendgrid_unsubscribe_group.subscriptions.id
    "notifications" = sendgrid_unsubscribe_group.notifications.id
    "focus_group"   = sendgrid_unsubscribe_group.focus_group.id
    "marketing"     = sendgrid_unsubscribe_group.marketing.id
    "contact_us"    = sendgrid_unsubscribe_group.contact_us.id
    "internal"      = sendgrid_unsubscribe_group.internal.id
  }
}
