provider "aws" {
  region = "eu-west-2"
}


module "s3_website" {
  source                   = "../"
  namespace                = "mag"
  environment              = "testing"
  name                     = "website"
  hostname                 = "website-test.magnetar.it"
  r53_record_name          = "website-test.magnetar.it"
  r53_zone_name            = "magnetar.it"
  force_destroy            = true
  redirect_all_requests_to = "magnetarconsulting.co.uk"
}
