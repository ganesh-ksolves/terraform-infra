resource "aws_instance" "this" {
  count                  = var.instance_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_ids[count.index % length(var.subnet_ids)]
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name

  tags = merge(
    var.tags,
    {
      Name = "${var.tags["Name"]}-${count.index + 1}"
    }
  )
}