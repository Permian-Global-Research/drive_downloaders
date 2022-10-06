library(googledrive)
source("drive_downloaders.R")
# source("drive_download_dir_alt.R")
# -------------------------------------------------------------------------#
.email <- "EMAIL"

googledrive::drive_auth()

d <- drive_download_dir(drive.folder="Drive-DL-testing", fileext = ".R")

drive_get("Drive-DL-testing") |>
  as_id() |>
  drive_dir_down()

.url <- "https://drive.google.com/drive/folders/1rRPmBZT0OhU-sFDmvWCKEMiYt7Tqh8aM"
drive_ls(.url, recursive = TRUE)

d <- drive_download_dir(drive.folder=.url)


d2 <- drive_download_dir_alt(.url)


#install.packages(fs)
googledrive::drive_get(id = )


reprex::reprex({
  library(googledrive)
  library(fs)
  
  drive_down_files <- function(x, .overwrite = TRUE) {
    .x <- dplyr::select(x, !drive_resource)
    purrr::pwalk(.x, function(...){
      drib <- list(...)
      .dir <- dirname(drib$path)
      .file <- file.path(.dir, basename( drib$path))
      if (!dir.exists(.dir)) dir.create(.dir, recursive = TRUE)
      drive_download(drib$id, .file, overwrite = .overwrite)
    })
    return(x)
  }
  

  split_files_n_folds <- function(drive.parent){
    
    dr_fold <- drive_ls(drive.parent, type='folder')
    
    dr_all <- drive_ls(drive.parent, type=NULL)
    
    files <- generics::setdiff(dr_all, dr_fold)|>
      dplyr::mutate(path = file.path(drive.parent, name))
    
    if (nrow(dr_fold)>0){
      p.list <- file.path(drive.parent, dr_fold$name)
      drib.deep <- p.list |>
        purrr::map(~split_files_n_folds(.x))
    }
    
    if (exists("drib.deep")) {
      .f <- dplyr::bind_rows(files, drib.deep)
    } else {
      .f <- files
    }
    
    return(.f)
  }
  
  
  drive_download_dir <- function(drive.folder, dest.folder=here::here(), 
                                 fileext=NULL){
    
    .parent <- drive_get(drive.folder)$name
    
    file.drib <- split_files_n_folds(.parent)|>
      dplyr::mutate(path=file.path(dest.folder, path))
    
    if (!is.null(fileext)){
      file.drib <- file.drib |>
        dplyr::filter(grepl(fileext, name))
    }
    
    if (nrow(file.drib)<1) stop("There are no files to download!")
    
    drive_down_files(file.drib)
  }
  
  d <- suppressMessages(
    drive_download_dir(drive.folder="Drive-DL-testing")
    )
  
  print(d)
  
  dir_tree(path = "Drive-DL-testing", recurse = TRUE)
})
