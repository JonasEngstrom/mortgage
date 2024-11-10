#' Calculate the Standard Rate of Capital Income
#'
#' Calculate the standard rate of capital income, using [the method described by
#' Avanza](https://www.avanza.se/lar-dig-mer/avanza-akademin/skatt-deklaration/hur-beskattas-en-kapitalforsakring.html).
#'
#' @param government_borrowing_rate_table A table of the government borrowing
#'   rate, from the function `get_governemnt_borroing_rate()`.
#'
#' @return A tibble.
#' @export
#'
#' @seealso [get_government_borrowing_rate()]
#' @seealso [gbr_table]
#'
#' @md
#' @examples
#' \dontrun{
#' calculate_standard_rate()
#' }
calculate_standard_rate <- function(government_borrowing_rate_table = mortgage::gbr_table) {
  NULL ->
    gbr ->
    standard_rate

  government_borrowing_rate_table |>
    dplyr::filter(lubridate::month(date) == 11) |>
    dplyr::group_by(lubridate::year(date)) |>
    dplyr::filter(date == max(date)) |>
    dplyr::ungroup() |>
    dplyr::arrange(date) |>
    dplyr::mutate(standard_rate = dplyr::lag(gbr) + 1) |>
    dplyr::mutate(standard_rate = dplyr::if_else(standard_rate < 1.25, 1.25 / 100, standard_rate / 100)) |>
    dplyr::mutate(date = lubridate::floor_date(date, unit = 'year')) |>
    dplyr::select(date, standard_rate) |>
    tidyr::drop_na() |>
    (\(x) return(x))()
}
