library(googledrive)
source("drive_downloaders.R")
# -------------------------------------------------------------------------#
.email <- "EMAIL"

googledrive::drive_auth(.email)

d <- drive_download_dir(drive.folder="Drive-DL-testing")

drive_get("Drive-DL-testing") |>
  as_id() |>
  drive_dir_down()

.url <- "https://drive.google.com/drive/folders/1rRPmBZT0OhU-sFDmvWCKEMiYt7Tqh8aM"
d <- drive_download_dir(drive.folder=.url)

#install.packages(fs)
library(fs)
dir_tree(path = "Drive-DL-testing", recurse = TRUE)
