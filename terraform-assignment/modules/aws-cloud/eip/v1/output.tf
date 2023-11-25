output "eip_created" {
  description = "Details about the eip created"
  value = {
    for k, this in aws_eip.eip : k => {
      allocation_id = this.allocation_id
      id         = this.id
      public_ip  = this.public_ip
      private_ip = this.private_ip
      tags_all    = this.tags_all
    }
  }
}