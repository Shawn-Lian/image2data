padding = function(input_data, padding_value){
  if (length(padding_value)==1){
    p1 = padding_value
    p2 = padding_value}
  else{
    p1 = padding_value[1]
    p2 = padding_value[2]
  }
  p1_matrix = matrix(0,nrow = p1,ncol = dim(input_data)[2])
  res = rbind(p1_matrix,input_data,p1_matrix)
  p2_matrix = matrix(0,nrow = dim(res)[1], ncol = p2)
  res = cbind(p2_matrix,res,p2_matrix)
  return(res)
}
