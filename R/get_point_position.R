#' Get the position of data points on binary image
#'
#' This function returns the position of data points on Axis by using convolution method.
#'
#' @param binary_matrix a two-dimension binary matrix generated by a binary image
#' @returns data_position a two-column matrix with the position of the data points.

get_point_position = function(binary_matrix){
  stride = 6
  threshold = -230 # two hyperparmeters in this function

  label_position = detect_label(binary_matrix)
  point_area = binary_matrix[1:(label_position[2]-.03*dim(binary_matrix)[1]),
                             (label_position[1]+floor(.03*dim(binary_matrix)[2]))
                             :dim(binary_matrix)[2]]
  kernel = matrix(0,nrow = 9, ncol= 9)
  for( i in seq(9)){
    for(j in seq(9)){
      k = min(min(i,j),10-max(i,j))
      kernel[i,j] = -k**2
    }
  }
  cvl_res =convolution(point_area,kernel,stride = stride)>threshold
  data_y = which(cvl_res,arr.ind = T)[,1]*stride
  data_x = which(cvl_res,arr.ind = T)[,2]*stride +
    label_position[1]+floor(.03*dim(binary_matrix)[2])
  # data_y = (which(cvl_res)%/%dim(cvl_res)[1])*stride + 5
  # data_x = ((which(cvl_res)-1)%%dim(cvl_res)[1])*stride + floor(44*(dim(binary_matrix)[2]/676)) + 4
  data_position = matrix(c(data_y,data_x),ncol =2)
  return(data_position)
}




