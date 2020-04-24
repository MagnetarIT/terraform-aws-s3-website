<a href=https://magnetarconsulting.co.uk><img src="https://magnetarconsulting.co.uk/wp-content/uploads/2020/04/small-helping-you-innovate-magnetar.png" width="300"></a>


# terraform-aws-s3-website
Terraform (>= 0.12.0) module to create an S3 website

[![Build Status](https://dev.azure.com/MagnetarIT/terraform-aws-s3-website/_apis/build/status/MagnetarIT.terraform-aws-s3-website?branchName=master)](https://dev.azure.com/MagnetarIT/terraform-aws-s3-website/_build/latest?definitionId=14&branchName=master) ![Latest Release](https://img.shields.io/github/release/MagnetarIT/terraform-aws-s3-website.svg)


- [Intro](#Intro)
- [Example](#Example)
- [Inputs](#Inputs)
- [Outputs](#Outputs)
- [Support](#Support)
- [License](#License)

----

## Example
```hcl

provider "aws" {
  region = "eu-west-2"
}

module "redirect" {
  source                   = "git::https://github.com/MagnetarIT/terraform-aws-s3-website.git?ref=tags/0.1.0"
  namespace                = "mag"
  environment              = "testing"
  name                     = "website"
  hostname                 = "website-test.magnetar.it"
  r53_record_name          = "website-test.magnetar.it"
  r53_zone_name            = "magnetar.it"
  force_destroy            = true
  redirect_all_requests_to = "magnetarconsulting.co.uk"
}

```

----

## Intro
This module will create the following resources
- s3 website
- r53 record

---

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |

---

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `policy` or `role`) | `list(string)` | `[]` | no |
| cors\_allowed\_headers | List of allowed headers | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| cors\_allowed\_methods | List of allowed methods (e.g. GET, PUT, POST, DELETE, HEAD) | `list(string)` | <pre>[<br>  "GET"<br>]</pre> | no |
| cors\_allowed\_origins | List of allowed origins (e.g. example.com, test.com) | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| cors\_expose\_headers | List of expose header in the response | `list(string)` | <pre>[<br>  "ETag"<br>]</pre> | no |
| cors\_max\_age\_seconds | Time in seconds that browser can cache the response | `number` | `3600` | no |
| deployment\_actions | List of actions to permit deployment ARNs to perform | `list(string)` | <pre>[<br>  "s3:PutObject",<br>  "s3:PutObjectAcl",<br>  "s3:GetObject",<br>  "s3:DeleteObject",<br>  "s3:ListBucket",<br>  "s3:ListBucketMultipartUploads",<br>  "s3:GetBucketLocation",<br>  "s3:AbortMultipartUpload"<br>]</pre> | no |
| deployment\_arns | (Optional) Map of deployment ARNs to lists of S3 path prefixes to grant `deployment_actions` permissions | `map(any)` | `{}` | no |
| environment | Stage (e.g. `prod`, `dev`, `staging`) | `string` | `""` | no |
| error\_document | An absolute path to the document to return in case of a 4XX error | `string` | `"404.html"` | no |
| force\_destroy | Delete all objects from the bucket so that the bucket can be destroyed without error (e.g. `true` or `false`) | `bool` | `false` | no |
| hostname | Name of website bucket in `fqdn` format (e.g. `test.example.com`). IMPORTANT! Do not add trailing dot (`.`) | `string` | n/a | yes |
| index\_document | Amazon S3 returns this index document when requests are made to the root domain or any of the subfolders | `string` | `"index.html"` | no |
| lifecycle\_rule\_enabled | Enable or disable lifecycle rule | `bool` | `false` | no |
| logs\_expiration\_days | Number of days after which to expunge the objects | `number` | `90` | no |
| logs\_glacier\_transition\_days | Number of days after which to move the data to the glacier storage tier | `number` | `60` | no |
| logs\_standard\_transition\_days | Number of days to persist in the standard storage tier before moving to the glacier tier | `number` | `30` | no |
| name | The Name of the application or solution  (e.g. `bastion` or `portal`) | `string` | n/a | yes |
| namespace | Namespace (e.g. `eg` or `cp`) | `string` | `""` | no |
| noncurrent\_version\_expiration\_days | Specifies when noncurrent object versions expire | `number` | `90` | no |
| noncurrent\_version\_transition\_days | Number of days to persist in the standard storage tier before moving to the glacier tier infrequent access tier | `number` | `30` | no |
| prefix | Prefix identifying one or more objects to which the rule applies | `string` | `""` | no |
| r53\_record\_name | The fqdn DNS record for R53 | `string` | n/a | yes |
| r53\_zone\_name | The DNS zone name for R53 | `string` | n/a | yes |
| redirect\_all\_requests\_to | A hostname to redirect all website requests for this bucket to. If this is set `index_document` will be ignored | `string` | `""` | no |
| region | AWS region this bucket should reside in | `string` | `""` | no |
| replication\_source\_principal\_arns | (Optional) List of principal ARNs to grant replication access from different AWS accounts | `list(string)` | `[]` | no |
| routing\_rules | A json array containing routing rules describing redirect behavior and when redirects are applied | `string` | `""` | no |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')`) | `map(string)` | `{}` | no |
| versioning\_enabled | Enable or disable versioning | `bool` | `false` | no |

---

## Outputs

| Name | Description |
|------|-------------|
| hostname | Bucket hostname |
| s3\_bucket\_arn | ARN identifier of website bucket |
| s3\_bucket\_domain\_name | Name of website bucket |
| s3\_bucket\_hosted\_zone\_id | The Route 53 Hosted Zone ID for this bucket's region |
| s3\_bucket\_name | DNS record of website bucket |
| s3\_bucket\_website\_domain | The domain of the website endpoint |
| s3\_bucket\_website\_endpoint | The website endpoint URL |
| s3\_r53\_fqdn | The Route 53 record for the S3 bucket |

## Support

Reach out to me at one of the following places!

- Website at <a href="https://magnetarconsulting.co.uk" target="_blank">`magnetarconsulting.co.uk`</a>
- Twitter at <a href="https://twitter.com/magnetarIT" target="_blank">`@magnetarIT`</a>
- LinkedIn at <a href="https://www.linkedin.com/company/magnetar-it-consulting" target="_blank">`magnetar-it-consulting`</a>

---

## License 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
