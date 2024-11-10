#' Get Current List Rates from Swedish Banks
#'
#' Downloads the current list rates from the Swedish banks listed on [this
#' site](https://www.konsumenternas.se/konsumentstod/jamforelser/lan--betalningar/lan/jamfor-borantor/).
#'
#' @return A tibble of list rates, banks, and the date they were updated.
#' @export
#'
#' @md
#' @examples
#' \dontrun{
#' list_rates <- get_current_list_rates()
#' }
get_current_list_rates <- function() {
  NULL ->
    `3mn` ->
    Fretag ->
    interest

  cxn <- rvest::read_html_live('https://www.konsumenternas.se/konsumentstod/jamforelser/lan--betalningar/lan/jamfor-borantor/')

  cxn$click('#aktuella-listrantor---annonserade-rantor > header > a > span > svg.accordion-item__icon--plus.information-item__icon.information-item__icon--plus')

  list_rate_table <-
    cxn$html_elements('#aktuella-listrantor---annonserade-rantor > div > div.position-relative > div > div > div.__panel') |>
    rvest::html_table() |>
    purrr::pluck(1) |>
    dplyr::rename_with(~ str_remove_all(., '[\u00E5\u00F6 ]')) |>
    dplyr::mutate(interest = stringr::str_replace(`3mn`, '^(\\d*),(\\d{2})(.*)', '\\1.\\2') |> as.numeric()) |>
    dplyr::mutate(date = cxn$html_elements('#aktuella-listrantor---annonserade-rantor > div > div.mt-0.mb-3') |> rvest::html_text() |> stringr::str_extract('\\d{4}-\\d{2}-\\d{2}') |> as.Date()) |>
    dplyr::select(date, bank = Fretag, interest) |>
    tidyr::drop_na()

  cxn$session$close()

  return(list_rate_table)
}
