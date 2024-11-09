#' Get OMXS30 Data from Nasdaq OMX Nordic
#'
#' Download historical data on the OMXS30 index form the Nasdaq OMX Nordic site.
#'
#' @param instrument Instrument ID. Defaults to the OMXS30 index.
#' @param start_date Start date. Defaults to ten years and one day before today.
#' @param end_date End date. Defaults to one day before today.
#'
#' @return A tibble of historical OMXS30 data.
#' @export
#'
#' @examples
#' \dontrun{
#' omx_data <- get_omx()
#' }
get_omx <- function(
    instrument = 'SE0000337842',
    start_date = (Sys.time() - lubridate::years(10) - lubridate::days(1)) |> format('%Y-%m-%d'),
    end_date = (Sys.time() - lubridate::days(1)) |> format('%Y-%m-%d')
) {
  NULL ->
    dateTime ->
    high ->
    low ->
    close ->
    average ->
    totalVolume

  cxn <-
    paste(
      'https://api.nasdaq.com/api/nordic/instruments/',
      instrument,
      '/chart/download?assetClass=INDEXES&fromDate=',
      start_date,
      '&toDate=',
      end_date,
      sep = ''
    ) |>
    rvest::read_html_live()

  downloaded_data <-
    cxn$html_elements('pre') |>
    rvest::html_text() |>
    jsonlite::fromJSON()

  return_tibble <-
    downloaded_data$data$charts$rows |>
    tibble::tibble() |>
    dplyr::mutate(dplyr::across(-dateTime, ~ suppressWarnings(sub(',', '', .) |> as.numeric()))) |>
    dplyr::rename(
      date = dateTime,
      high_price = high,
      low_price = low,
      closing_price = close,
      average_price = average,
      total_volume = totalVolume
    )

  cxn$session$close()

  return(return_tibble)
}
