resource "aws_route53_record" "sendgrid_cname" {
    zone_id = local.hosted_zone
    name    = "29380702.${local.apex_domain}"
    type    = "CNAME"
    ttl     = 300
    records = ["sendgrid.net"]
}
resource "aws_route53_record" "sendgrid_dkim_0" {
    zone_id = local.hosted_zone
    name    = "s1._domainkey.${local.apex_domain}"
    type    = "CNAME"
    ttl     = 300
    records = ["s1.domainkey.u29380702.wl203.sendgrid.net"]
}
resource "aws_route53_record" "sendgrid_dkim_1" {
    zone_id = local.hosted_zone
    name    = "s2._domainkey.${local.apex_domain}"
    type    = "CNAME"
    ttl     = 300
    records = ["s2.domainkey.u29380702.wl203.sendgrid.net"]
}
resource "aws_route53_record" "sendgrid_tracker_0" {
    zone_id = local.hosted_zone
    name    = "em3683.${local.apex_domain}"
    type    = "CNAME"
    ttl     = 300
    records = ["u29380702.wl203.sendgrid.net"]
}
resource "aws_route53_record" "sendgrid_tracker_1" {
    zone_id = local.hosted_zone
    name    = "url7808.${local.apex_domain}"
    type    = "CNAME"
    ttl     = 300
    records = ["sendgrid.net"]
}
