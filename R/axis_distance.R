#' Compute the largest distance between pixels with FALSE value
#'
#' This function return the largest distance between pixels with FALSE value in an array selected from a binary matrix.
#'
#' @param bi_array an array selected from a binary matrix
#' @return the largest distance between pixels with FALSE value on bi_array

axis_distance = function(bi_array){
  max_id =0
  min_id =0
  for(i in seq(length(bi_array))){
    if(bi_array[i]==FALSE){
      min_id = i
      break
    }}
  for(i in seq(length(bi_array),1,-1)){
    if(bi_array[i]==FALSE){
      max_id = i
      break
    }}
  return(max_id-min_id)
}

