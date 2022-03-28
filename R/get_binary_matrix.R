get_binary_matrix = function(pixel_matrix, threshold = 0.8){
  single_channel = to_one_channel(pixel_matrix)
  binary_matrix = single_channel>threshold
  return(binary_matrix)
}
