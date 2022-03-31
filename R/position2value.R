#' Get the value of data
#'
#' This function returns the value of detected data set based on the position and axis extreme value information
#'
#' @param data_position a two-column matrix with the position of the data points.
#' @param label_position a list with length=4, with the position of the extreme value on corresponding axis.
#' @param ymax the maximum y value showing on the plot
#' @param ymin the minimum y value showing on the plot
#' @param xmin the maximum x value showing on the plot
#' @param xmax the minimum x value showing on the plot
#' @returns data a two-column matrix with the predicted value of the data points.
position2value = function(data_position, label_position, ymax,ymin,xmin,xmax){
  y_unit = (ymax-ymin)/(label_position[2]-label_position[1])
  x_unit = (xmax-xmin)/(label_position[4]-label_position[3])
  data = matrix(0,nrow = nrow(data_position), ncol = 2)
  for( i in seq(nrow(data_position))){
    data[i,2] = (label_position[2]-data_position[i,1])*y_unit + ymin
    data[i,1] = (data_position[i,2] - label_position[3])*x_unit + xmin
  }
  return(data)
}
