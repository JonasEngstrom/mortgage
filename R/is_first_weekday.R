#' Check Whether Date is First Weekday
#'
#' Takes a date an returns True if it is the first weekday of the month.
#'
#' @param date A date.
#'
#' @return A Boolean.
#' @export
#'
#' @examples
#' as.Date('2014-01-03') |> is_first_weekday()
is_first_weekday <- function(date) {
  date_range <-
    c(rep(1, 5), 3, 2)

  first_day <-
    date |>
    lubridate::floor_date(unit = 'months') |>
    lubridate::wday(week_start = 1)

  return(date_range[first_day] == lubridate::mday(date))
}
