#' Utility function to map table with their columns/rows in a bigger table (Map Over Multiple Inputs Simultaneously)
#'
#' @param v import Actigraphy Raw data
#' @return The lengths and values of runs of equal values in a vector.
#' @export


make_df_index <- function(v){
  table_rle <- vec_rle(v) #use vec_rle function
  divide_points <- c(0,cumsum(names(table_rle))) #Returns a vector whose elements are the cumulative sums of the elements of the argument.
  table_index <- map2((divide_points + 1)[1:length(divide_points)-1],
                      divide_points[2:length(divide_points)],
                      ~.x:.y) #list every value between x and y in each column
  return(table_index[table_rle])
}
