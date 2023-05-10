locals {
    aws_default_region      = "ap-southeast-2"
    hosted_zone             = "Z04169281YCJD2GS4F5ER"
    apex_domain             = "trivialsec.com"
    templates               = {
        magic_link              = "Magic Link"
        recovery_request        = "Recovery Request"
        registrations           = "Registration"
        subscriptions           = "Subscription"
        updated_email           = "Updated Email"
        invitations             = "Member Invitation"
        support                 = "Support Request"
        scan_completed          = "On-demand scanning complete"
        webhook_signing_secret  = "Webhokk endpoint registration"
        findings_digest         = "Findings Digest"
        early_warning_service   = "Early Warning Service (EWS) Alert"
        login_location          = "Login from a new location"
    }
}
