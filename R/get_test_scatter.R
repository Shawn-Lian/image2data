get_test_scatter = function(){
  library(ggplot2)
  set.seed(0)
  X = rnorm(30)
  Y = rnorm(30)
  test_image = ggplot() +
    geom_point(aes(X,Y))
  ggsave('test_plot.png',plot = test_image, dpi = 100)
}
