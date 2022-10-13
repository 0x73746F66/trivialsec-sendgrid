locals {
    aws_default_region      = "ap-southeast-2"
    hosted_zone             = "Z04169281YCJD2GS4F5ER"
    apex_domain             = "trivialsec.com"
    templates               = {
        account_recovery        = "Account Recovery"
        magic_link              = "Magic Link"
        recovery_request        = "Recovery Request"
        registrations           = "Registration"
        subscriptions           = "Subscription"
        updated_email           = "Updated Email"
        invitations             = "Member Invitation"
        support                 = "Support Request"
    }
}
