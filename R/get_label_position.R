get_label_position = function(binary_matrix){
  # The x-axis pixel is between [641:644]
  # The y-axis pixel is between [40:44]
  ymax_position = 1 # the height of image
  ymin_position = 684
  xmin_position = 1
  xmax_position = dim(binary_matrix)[2]
  # this is a 676-length vector to detect where the max and min of y are
  xaxis = apply(binary_matrix[641:644,],2,function(x){all(x==0)})
  yaxis = apply(binary_matrix[,floor((40:44)*(dim(binary_matrix)[2]/676)-2)],1,
                function(x){all(x==0)})
  while(xaxis[xmin_position]==0){xmin_position = xmin_position + 1 }
  while(xaxis[xmax_position]==0){xmax_position = xmax_position - 1 }
  while(yaxis[ymin_position]==0){ymin_position = ymin_position - 1 }
  while(yaxis[ymax_position]==0){ymax_position = ymax_position + 1 }
  return(c(ymax_position,ymin_position,xmin_position,xmax_position))
}



