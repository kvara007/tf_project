module "project-services" {
    source = "terraform-google-modules/project-factory/google//modules/project-services"
    version = "~> 18.1"

    project_id = "tf-project-476106"
    billing_account = "019618-F75185-770CE6"
    name = "tf-project-476106"

    activate_apis = [
        "compute.googleapis.com",
        "container.googleapis.com",
        "sqladmin.googleapis.com"
    ]
}