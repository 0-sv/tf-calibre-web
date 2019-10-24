# Project variables
variable image {
    description = "Your GCP image built with Cloud Build."
}

variable "project" {
    description = "Project ID on GCP."
}

variable "region" {
    description = "Region where you can create Cloud Run services. In Europe this is limited to europe-west1."
    default = "europe-west1"
}