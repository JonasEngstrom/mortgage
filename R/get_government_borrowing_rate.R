#' Get Government Borrowing Rate
#'
#' Downloads the government borrowing rate from [the Swedish National Debt
#' Office](https://www.riksgalden.se/sv/var-verksamhet/statslanerantan/).
#'
#' @return A tibble.
#' @export
#'
#' @examples
#' \dontrun{
#' gbr_table <- get_government_borrowing_rate()
#' }
get_government_borrowing_rate <- function() {
  readr::read_delim(
    'https://www.riksgalden.se/globalassets/dokument_sve/statslaneranta/slr-historisk-statslaneranta-csv.csv',
    delim = ';',
    skip = 1,
    col_names = c('date', 'gbr', 'yearly_mean'),
    locale = readr::locale(decimal_mark = ',')
  ) |>
    (\(x) return(x))()
}
