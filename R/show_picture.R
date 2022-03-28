show_picture = function(pic_address){
  readImage = png::readPNG(pic_address)
  longImage = reshape::melt(readImage)
  rgbImage = reshape(longImage, timevar = 'X3', idvar = c('X1','X2'), direction = 'wide')
  rgbImage$X1 = rep(max(rgbImage$X1):1,ncol(readImage))
  colorColumns = rgbImage[,substr(colnames(rgbImage),1,5)=='value']
  with(rgbImage,plot(X2,X1,col = rgb(colorColumns),asp = 1,pch = '.',axes = F,xlab='',ylab=''))
}
