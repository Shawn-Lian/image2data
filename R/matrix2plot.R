#' Plot the image of a given matrix
#'
#' This function plots the image of a given matrix as a multiple channel image.
#'
#' @param pixel_matrix a three-dimension matrix that can generate a multiple channels image
matrix2plot = function(pixel_matrix){
  longImage = reshape::melt(pixel_matrix)
  rgbImage = reshape(longImage, timevar = 'X3', idvar = c('X1','X2'), direction = 'wide')
  rgbImage$X1 = rep(max(rgbImage$X1):1,ncol(pixel_matrix))
  colorColumns = rgbImage[,substr(colnames(rgbImage),1,5)=='value']
  with(rgbImage,plot(X2,X1,col = rgb(colorColumns),asp = 1,pch = '.',axes = F,xlab='',ylab=''))
}
