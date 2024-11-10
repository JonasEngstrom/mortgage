#' Adjust for Inflation
#'
#' Adjust value for inflation, using to different consumer price index values.
#'
#' @param value_to_adjust The amount to adjust.
#' @param from_cpi The starting counsumer price index value.
#' @param to_cpi The ending consumer price index value.
#'
#' @return A numeric.
#' @export
#'
#' @examples
#' adjust_for_inflation(100, 50, 100)
adjust_for_inflation <- function(value_to_adjust, from_cpi, to_cpi) {
  return((to_cpi - from_cpi) / from_cpi * value_to_adjust + value_to_adjust)
}
