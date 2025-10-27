project_id = "tf-project-476106"
region = "us-central1"
network_name = "vpc-network-01"
subnet1_name = "subnet-01"
subnet1_cidr = "10.0.1.0/24"
subnet2_name = "subnet-02"
subnet2_cidr = "10.0.2.0/24"
bucket_name = "tf-state-bucket_01"
firewall_rules = [
    {
        name = "allow-ssh-http-https-icmp"
        description = "Allow SSH, HTTP, HTTPS, and ICMP traffic"
        allows = [
            {protocol = "tcp", ports = ["22", "80", "443"]},
            {protocol = "icmp"}
        ]
        direction = "INGRESS"
        source_ranges = ["0.0.0.0/0"]
    }
]