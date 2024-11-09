#' Get OMXS30 Data from Nasdaq OMX Nordic’s Old Site
#'
#' Download historical data on the OMXS30 index form the Nasdaq OMX Nordic site
#' that closes on November 14th 2024. This data stretches back to 1986, whereas
#' the data on the new site only goes back ten years. Data downloaded using this
#' function can be merged with data from the new site. A separate function
#' handles data import from the new site. The current function will not work
#' after November 14th 2024, but is used as an internal support function to
#' download data included in the package. It might be removed in the future.
#'
#' @param instrument Instrument ID. Defaults to the OMXS30 index.
#' @param start_date Start date. Defaults to 1986-09-30.
#' @param sleep_time Seconds to wait between scraping commands.
#'
#' @return A tibble of historical OMXS30 data.
#' @export
#'
#' @examples
#' \dontrun{
#' old_omx_data <- get_old_
#' }
get_old_omx <- function(
    instrument = 'SE0000337842',
    start_date = '1986-09-30',
    sleep_time = 4
  ) {
  cxn <-
    'https://www.nasdaqomxnordic.com/index/historiska_kurser?Instrument=' |>
    paste(instrument, sep = '') |>
    rvest::read_html_live()

  Sys.sleep(sleep_time)

  cxn$click(css = '#popup > div > button')
  Sys.sleep(sleep_time)
  cxn$click(css = '#FromDate', n_clicks = 3)
  Sys.sleep(sleep_time)
  cxn$press(css = '#FromDate', key_code = 'Delete')
  Sys.sleep(sleep_time)
  cxn$type(css = '#FromDate', text = start_date)
  Sys.sleep(sleep_time)
  cxn$press(css = '#FromDate', key_code = 'Escape')
  Sys.sleep(sleep_time)
  cxn$click(css = '#searchHistoricalFundsId > div:nth-child(4) > div > span')
  Sys.sleep(sleep_time)
  cxn$click(css = '#exportExcel')

  Sys.sleep(sleep_time)

  return_tibble <-
    cxn |>
    rvest::html_element(css = '#exportExcel') |>
    rvest::html_attr('href') |>
    (\(x) sub('data:application/csv;charset=utf-8,sep=;\n', '', x))() |>
    readr::read_delim(delim = ';') |>
    dplyr::rename_all(\(x) sub(' ', '_', x) |> tolower()) |>
    dplyr::select(-8)

  cxn$session$close()

  return(return_tibble)
}
