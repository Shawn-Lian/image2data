#' Compute the two-dimensional convolution
#'
#' This function return the result of two-dimensional convolution on the input data with input kernel
#'
#' @param input_data a two-dimension matrix that need to perform convolution method on
#' @param use_kernel the kernel that used to compute the two-dimension convolution
#' @param padding_value how many zero-value rows and columns are supposed to be added before computing, with default = 0
#' @param stride the stride size to take when computing, with default = 1
#' @return res the convolution result

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
