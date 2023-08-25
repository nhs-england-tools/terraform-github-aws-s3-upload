# Terraform GitHub AWS S3 Upload module

This module provides the iam role and policy for a GitHub action to use to upload files to an S3 bucket. This module includes the following:

1. IAM role
1. IAM policy

## Table of Contents

- [Terraform GitHub AWS S3 Upload module](#terraform-github-aws-s3-upload-module)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
    - [Prerequisites](#prerequisites)
  - [Usage](#usage)
  - [Architecture](#architecture)
    - [Diagrams](#diagrams)
    - [Configuration](#configuration)
  - [Contributing](#contributing)
  - [Contacts](#contacts)
  - [Licence](#licence)

## Installation

This module can be called by including the following:

```hcl
module "github_aws_s3_upload" {
  source               = "github.com/nhs-england-tools/terraform-github-action-s3-upload?ref=v0.0.1"
  project_name         = "my-github-aws-s3-upload"
  github_organisation  = "my-github-organisation"
  github_repository    = "my-github-repository"
  github_branch        = "my-main-branch"
  bucket_name          = "my-bucket-to-upload-to"
  bucket_resources     = [
    "arn:aws:s3:::my_bucket_to_upload_to/some_file.js",
    "arn:aws:s3:::my_bucket_to_upload_to/some_other_file.js"
    ]
}
```

It's worth noting that the `github_branch` variable will default to `main`.

### Prerequisites

The following software packages or their equivalents are expected to be installed

- [Terraform](https://developer.hashicorp.com/terraform/downloads)

## Usage

After a successful installation, provide an informative example of how this project can be used. Additional code snippets, screenshots and demos work well in this space. You may also link to the other documentation resources, e.g. the [User Guide](./docs/user-guide.md) to demonstrate more use cases and to show more features.

## Architecture

### Diagrams

The [C4 model](https://c4model.com/) is a simple and intuitive way to create software architecture diagrams that are clear, consistent, scalable and most importantly collaborative. This should result in documenting all the system interfaces, external dependencies and integration points.

### Configuration

Most of the projects are built with customisability and extendability in mind. At a minimum, this can be achieved by implementing service level configuration options and settings. The intention of this section is to show how this can be used. If the system processes data, you could mention here for example how the input is prepared for testing - anonymised, synthetic or live data.

## Contributing

Describe or link templates on how to raise an issue, feature request or make a contribution to the codebase. Reference the other documentation files, like

- Environment setup for contribution, i.e. `CONTRIBUTING.md`
- Coding standards, branching, linting, practices for development and testing
- Release process, versioning, changelog
- Backlog, board, roadmap, ways of working
- High-level requirements, guiding principles, decision records, etc.

## Contacts

Provide a way to contact the owners of this project. It can be a team, an individual or information on the means of getting in touch via active communication channels, e.g. opening a GitHub discussion, raising an issue, etc.

## Licence

> The [LICENCE.md](./LICENCE.md) file will need to be updated with the correct year and owner

Unless stated otherwise, the codebase is released under the MIT License. This covers both the codebase and any sample code in the documentation.

Any HTML or Markdown documentation is [© Crown Copyright](https://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/uk-government-licensing-framework/crown-copyright/) and available under the terms of the [Open Government Licence v3.0](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).
