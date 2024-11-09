#' Calculate Rate of Change as a Geometric Mean
#'
#' Calculate the rate of change between two values per unit of time. Uses the
#' following formula to calculate a geometric mean: \deqn{\text{rate of change}
#' = \sqrt[\Delta_{\text{time}}]{\frac{\text{end value}}{\text{start value}}} -
#' 1}
#'
#' @param start_value Value at start of period.
#' @param end_value Value at end of period.
#' @param time_delta Length of period.
#'
#' @return The rate of change per time unit.
#' @export
#'
#' @examples
#' rate_of_change(100, 200, 31)
rate_of_change <- function(start_value, end_value, time_delta) {
  return((end_value / start_value) ^ (1 / time_delta) - 1)
}
