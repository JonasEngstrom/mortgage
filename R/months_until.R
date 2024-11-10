#' Calculate the Number of Months Between Two Dates
#'
#' Calculates the number of months between two dates.
#'
#' @param to_date Second date.
#' @param from_date First date. Defaults to today.
#'
#' @return A numeric.
#' @export
#'
#' @examples
#' number_of_months <- months_until(Sys.Date() + 365)
months_until <- function(to_date, from_date = Sys.Date()) {
  seq(from_date, to_date, by = 'month') |>
    length() |>
    (\(x) return(x - 1))()
}
