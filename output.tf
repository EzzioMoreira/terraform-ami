output "ID_AMI" {
    description = "For output id ami"
    value = {
        for ami in aws_ami.awsami:
        ami.tags.Name => [ami.id]
    }
}