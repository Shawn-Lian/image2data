get_point_position = function(binary_matrix){
  stride = 6
  threshold = -230 # two hyperparmeters in this function
  point_area = binary_matrix[1:640,
                             floor(44*(dim(binary_matrix)[2]/676)):dim(binary_matrix)[2]]
  kernel = matrix(0,nrow = 9, ncol= 9)
  for( i in seq(9)){
    for(j in seq(9)){
      k = min(min(i,j),10-max(i,j))
      kernel[i,j] = -k**2
    }
  }
  cvl_res =convolution(point_area,kernel,stride = stride)>threshold
  data_y = (which(cvl_res)%/%dim(cvl_res)[1])*stride + 5
  data_x = ((which(cvl_res)-1)%%dim(cvl_res)[1])*stride + floor(44*(dim(binary_matrix)[2]/676)) + 4
  data_position = matrix(c(data_y,data_x),ncol =2)
  return(data_position)
}


