locals {
  env = "staging"
  region = "us-east-2"
  zone1 = "us-east-2a"
  zone2 = "us-east-2b"
  eks_name = "weather-app-eks"
 #eks_name = "weather-app-eks-${local.env}"
  eks_version = "1.30"
}