position2value = function(data_position, label_position, ymax,ymin,xmin,xmax){
  #label_value =
  y_unit = (ymax-ymin)/(label_position[2]-label_position[1])
  x_unit = (xmax-xmin)/(label_position[4]-label_position[3])
  data = matrix(0,nrow = nrow(data_position), ncol = 2)
  for( i in seq(nrow(data_position))){
    data[i,1] = (label_position[2]-data_position[i,1])*y_unit + ymin
    data[i,2] = (data_position[i,2] - label_position[3])*x_unit + xmin
  }
  return(data)
}
