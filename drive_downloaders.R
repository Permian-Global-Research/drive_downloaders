
#' download drive files from dribble with path column
#'
#' @param x a dribble with path column
#' @param .parent character. a folder in which to save the drive folder structure
#' @param .overwrite logical. Should files be overwritten
#' 
#' @return The original input dribble
#' @noRd
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

#' Search files and folder in drive
#' 
#' retain file paths as a column in a dribble. Recusrively search directory for
#' files and retain their folder structure.
#'
#' @param drive.parent The parent drive from which to search for files
#'
#' @return
#' @noRd
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


#' Download a drive directory
#' 
#' This function downloads the entire contents of a google drive direcory, 
#' whilst maintaining the folder structure.
#'
#' @param drive.folder Something that identifies the folder of interest on your 
#' Google Drive. Can be a name or path, a file id or URL marked with as_id(), 
#' or a dribble.
#' @param dest.folder default is `here::here()`. The folder in which to save the 
#' folder from google drive.
#' @param fileext default NULL. Can be any file extension - if given, only files
#' with this extension will be downloaded.
#'
#' @return A dribble containing all files downloaded including a path column
#' detailing the location of the downloaded file.
#' @export
#'
#' @examples
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
