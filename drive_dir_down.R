library(googledrive)
source("drive_downloaders.R")
# -------------------------------------------------------------------------#
.email <- "hugh.graham@earthengine.permianglobal.com"

googledrive::drive_auth(.email)

d <- drive_download_dir(drive.folder="Drive-DL-testing")

drive_get("Drive-DL-testing") |>
  as_id() |>
  drive_dir_down()

library(usethis)


use_git()
