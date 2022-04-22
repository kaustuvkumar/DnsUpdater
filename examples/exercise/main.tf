# Configure the DNS Provider
provider "dns" {
  update {
    server = "127.0.0.1"
  }
}
module "dns_updater" {
  source = "../../."
  for_each = {
#    event_pattern = file("${path.module}/*.json"
  event_pattern = file("/*.json")
  }
}
resource "dns_a_record_set" "www" {
  zone = "example.com."
  name = "www"
  addresses = [ ${dns_ip}
  ]
  ttl = 300
}    