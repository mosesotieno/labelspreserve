#' Preserve the variable labels
#'
#' Preserve the variable labels of a given dataset
#' before conducting manipulation that drops those
#' the labels
#'
#' @param data The data you want to preserve its variable labels
#'
#' @return list
#' @export
#'
#' @examples
#' preservelabels(labelspreserve::sample_data)
preservelabels <- function(data){
  data_labels <<- vector("list")

  for(i in names(data)){
    data_labels[[i]] <<- attr(data[[i]], "label")

  }
  return(data_labels)

  on.exit(rm(data_labels))

}
