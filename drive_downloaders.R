
#' download drive files from dribble with path column
#'
#' @param x a dribble with path column
#' @param .parent character. a folder in which to save the drive folder structure
#' @param .overwrite logical. Should files be overwritten
#' 
#' @return The original input dribble
#' @noRd
drive_down_files <- function(x, .overwrite = TRUE) {
  
  .x <- x[, !(names(x) == "drive_resource")]
  
  purrr::pwalk(.x, function(...){
    drib <- list(...)
    .dir <- dirname(drib$path)
    if (!dir.exists(.dir)) dir.create(.dir, recursive = TRUE)
    googledrive::drive_download(drib$id, drib$path, overwrite = .overwrite)
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
  
  dr_fold <- googledrive::drive_ls(drive.parent, type='folder')
  dr_all <- googledrive::drive_ls(drive.parent, type=NULL)
  
  files <- generics::setdiff(dr_all, dr_fold)
  files$path <- file.path(drive.parent, files$name)
  
  if (nrow(dr_fold)>0){
    p.list <- file.path(drive.parent, dr_fold$name)
    drib.deep <- p.list |>
      purrr::map(~split_files_n_folds(.x))
  }
  
  if (exists("drib.deep")) {
    .f <- do.call("rbind", c(list(files),drib.deep))
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
drive_download_dir <- function(drive.folder, dest.folder=getwd(), 
                               fileext=NULL){
  if(!googledrive::is_folder(
    suppressMessages(googledrive::drive_get(drive.folder)))){
    stop("A Google Drive folder for drive.folder is required.")
  }
  .parent <- googledrive::drive_get(drive.folder)$name
  
  file.drib <- split_files_n_folds(.parent)
  file.drib$path <- file.path(dest.folder, file.drib$path)
  
  if (!is.null(fileext)){
    file.drib <- file.drib[grepl(fileext, file.drib$name),]
  }
  
  if (nrow(file.drib)<1) stop("There are no files to download!")
  
  drive_down_files(file.drib)
}
