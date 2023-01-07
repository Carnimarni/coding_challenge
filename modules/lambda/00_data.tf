data "aws_region" "current" {}

# deployed region could be used by referencing the data variable above
# ${data.aws_region.current.name}