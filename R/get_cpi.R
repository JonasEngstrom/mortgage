#' Get Consumer Price Index from Statistics Sweden
#'
#' Downloads consumer price index from [the Statistics Sweden
#' API](https://www.statistikdatabasen.scb.se).
#'
#' @return A tibble of historical consumer price index values. Note that the
#'   dates in the return tibble are set to the first day of their respective
#'   months, due to limitations in how dates are stored. The values apply to the
#'   entire months in question.
#' @export
#'
#' @md
#' @examples
#' \dontrun{
#' cpi_data <- get_cpi()
#' }
get_cpi <- function() {
  NULL ->
    key ->
    values

  'https://api.scb.se' |>
    httr2::request() |>
    httr2::req_url_path(
      'OV0104/v1/doris/sv/ssd/START/PR/PR0101/PR0101A/KPItotM'
    ) |>
    httr2::req_body_json(
      list(
        query = list(
          list(
            code = "ContentsCode",
            selection = list(
              filter = "item",
              values = list("000004VU")
            )
          )
        ),
        response = list(
          format = "json"
        )
      )
    ) |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = TRUE) |>
    purrr::pluck('data') |>
    tidyr::unnest(cols = dplyr::everything()) |>
    dplyr::mutate(
      key = stringr::str_replace(key, '(\\d{4})M(\\d{2})', '\\1-\\2-01') |> as.Date(),
      values = as.numeric(values)
    ) |>
    dplyr::rename(date = key, cpi = values) |>
    (\(x) return(x))()
}
