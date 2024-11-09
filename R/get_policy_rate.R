#' Get Historical Policy Rates from the Swedish Central Bank
#'
#' Downloads the Swedish policy rate using [the Swedish Central Banks’s
#' API](https://developer.api.riksbank.se).
#'
#' @param series_id Series ID used by the Swedish Central Bank. Defaults to the
#'   policy rate, i.e. SECBREPOEFF.
#' @param start_date Start date. Defaults to 1994-06-01.
#' @param end_date End date. Defaults to today.
#'
#' @return
#' @export
#'
#' @examples
get_policy_rate <- function(
    series_id = 'SECBREPOEFF',
    start_date = '1994-06-01',
    end_date = Sys.time() %>% strftime('%Y-%m-%d')
  ) {
  'https://api.riksbank.se/' %>%
    httr2::request() |>
    httr2::req_url_path(
      'swea/v1/Observations',
      series_id,
      start_date,
      end_date
    ) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::tibble() |>
    dplyr::mutate(date = as.Date(date)) |>
    (\(x) return(x))()
}
