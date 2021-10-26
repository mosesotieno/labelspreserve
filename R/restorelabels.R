#' Restore the variable labels
#'
#' @param data The data you want to restore its variable labels
#' @param variable_labels The variable labels saved in a list
#'
#' @return data.frame
#' @export
#'
#'
#' @examples
#' preservelabels(labelspreserve::sample_data)
#' restorelabels(labelspreserve::sample_data)
restorelabels <- function(data, variable_labels = data_labels){

for(i in names(data)){
  attr(data[[i]], "label") <- variable_labels[[i]]
  }
data
}
