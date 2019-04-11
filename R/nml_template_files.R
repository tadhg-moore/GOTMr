#'@title Return the path to a template of current NML files
#'
#'@description
#'The NML files can change with updated versions of GOTM. This returns a path to a directory with example NML files for running GOTM.
#'
#'@keywords methods
#'
#'@author
#'Tadhg Moore
#'@examples
#'\dontrun{
#' nml_template_files()
#'}
#'
#'@export
nml_template_files <- function(){
  return(system.file('extdata/', package=packageName()))
}
