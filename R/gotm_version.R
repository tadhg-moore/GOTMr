#'@title Return the current GOTM model version
#'
#'@description
#'Returns the current version of the GOTM model being used
#'
#'@keywords methods
#'
#'@author
#'Tadhg Moore
#'@examples
#' print(gotm_version())
#'
#'
#'@export
gotm_version <- function(){
  run_gotm(nml_template_files(), verbose=TRUE, args='--version')
}
