#'@title Run the GOTM model
#'
#'@description
#'This runs the GOTM model on the specific simulation stored in \code{sim_folder}.
#'The specified \code{sim_folder} must contain a valid NML file.
#'
#'@param sim_folder the directory where simulation files are contained
#'@param verbose should output of GOTM be shown
#'@param args Optional arguments to pass to GOTM executable
#'
#'@keywords methods
#'@author
#'Jordan Read, Luke Winslow
#'@examples
#'sim_folder <- system.file('extdata', package = 'GOTMr')
#'run_gotm(sim_folder)
#'\dontrun{
#'out_file <- file.path(sim_folder,'output.nc')
#'nml_file <- file.path(sim_folder,'gotm2.nml')
#'library(gotmtools)
#'fig_path <- tempfile("temperature", fileext = '.png')
#'plot_temp(file = out_file, fig_path = fig_path)
#'cat('find plot here: '); cat(fig_path)
#' }
#'@export
#'@importFrom utils packageName
run_gotm <- function (sim_folder = ".", verbose = TRUE, args = character())
{
  if (sum(file.exists(c(file.path(sim_folder, "airsea.nml"),
                     file.path(sim_folder, "gotmrun.nml"),
                     file.path(sim_folder, "gotmmean.nml"),
                     file.path(sim_folder, "gotmturb.nml")))) != 4) {
    stop("You must have a valid GOTM setup in your sim_folder: ",
         sim_folder)
  }
  if (.Platform$pkgType == "win.binary") {
    return(run_gotmWin(sim_folder, verbose, args))
  }

  #Code for adapting to OSX and UNIX
  # else if (.Platform$pkgType == "mac.binary" || .Platform$pkgType ==
  #          "mac.binary.mavericks") {
  #   maj_v_number <- as.numeric(strsplit(Sys.info()["release"][[1]],
  #                                       ".", fixed = T)[[1]][1])
  #   if (maj_v_number < 13) {
  #     stop("pre-mavericks mac OSX is not supported. Consider upgrading")
  #   }
  #   return(run_gotmOSx(sim_folder, verbose, args))
  # }
  # else if (.Platform$pkgType == "source") {
  #   return(run_gotmNIX(sim_folder, verbose, args))
  # }
}

run_gotmWin <- function(sim_folder, verbose = TRUE, args){

  if(.Platform$r_arch == 'x64'){
    gotm_path <- system.file('extbin/win64GOTM/gotm.exe', package= 'GOTMr')
  }else{
    stop('No GOTM executable available for your machine yet...')
  }

  origin <- getwd()
  setwd(sim_folder)

  tryCatch({
    if (verbose){
      out <- system2(gotm_path, wait = TRUE, stdout = "",
                     stderr = "", args=args)
    } else {
      out <- system2(gotm_path, wait = TRUE, stdout = NULL,
                     stderr = NULL, args=args)
    }
    setwd(origin)
    return(out)
  }, error = function(err) {
    print(paste("GOTM_ERROR:  ",err))
    setwd(origin)
  })
}