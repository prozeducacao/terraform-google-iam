/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/******************************************
  Provider configuration
 *****************************************/
provider "google" {
  version = "~> 3.36"
}

provider "google-beta" {
  version = "~> 3.36"
}

/******************************************
  Module folder_iam_binding calling
 *****************************************/
module "folder-iam" {
  source  = "../../modules/folders_iam/"
  folders = [var.folder_one, var.folder_two]

  mode = "additive"

  bindings = {
    "roles/resourcemanager.folderEditor" = [
      "serviceAccount:${var.sa_email}",
      "group:${var.group_email}",
    ]

    "roles/resourcemanager.folderViewer" = [
      "user:${var.user_email}",
    ]
  }
}
