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
#' @return A tibble of historical policy rates.
#' @export
#'
#' @md
#' @examples
#' \dontrun{
#' policy_rates <- get_policy_rate()
#' }
get_policy_rate <- function(
    series_id = 'SECBREPOEFF',
    start_date = '1994-06-01',
    end_date = Sys.time() |> strftime('%Y-%m-%d')
  ) {
  NULL -> value

  'https://api.riksbank.se/' |>
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
    dplyr::rename(policy_rate = value) |>
    (\(x) return(x))()
}
