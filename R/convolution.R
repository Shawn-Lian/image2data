convolution = function(input_data,use_kernel,padding_value=0,stride = 1){
  h = dim(use_kernel)[1]
  w = dim(use_kernel)[2]
  input_data = padding(input_data,padding_value)
  res = matrix(0,nrow = (dim(input_data)[1]-h)%/%stride+1,
               ncol = (dim(input_data)[2]-w)%/%stride+1)
  for (i in seq(1,dim(res)[1])){
    for (j in seq(1,dim(res)[2])){
      res[i,j] = sum(input_data[((i-1)*stride+1):((i-1)*stride+h),
                                ((j-1)*stride+1):((j-1)*stride+w)] * use_kernel)}}
  return(res)
}
