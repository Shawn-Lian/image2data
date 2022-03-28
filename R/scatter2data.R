scatter2data = function(scatter_file,ymax,ymin,xmax,xmin){
  origin_image = png::readPNG(scatter_file)
  bi_matrix = get_binary_matrix(origin_image)
  return(position2value(get_point_position(bi_matrix),get_label_position(bi_matrix),
                 ymax,ymin,xmax,xmin))
}
