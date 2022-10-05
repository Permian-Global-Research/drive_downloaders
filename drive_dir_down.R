library(googledrive)
source("drive_downloaders.R")
# -------------------------------------------------------------------------#
.email <- "EMAIL"

googledrive::drive_auth(.email)

d <- drive_download_dir(drive.folder="Drive-DL-testing")

drive_get("Drive-DL-testing") |>
  as_id() |>
  drive_dir_down()

