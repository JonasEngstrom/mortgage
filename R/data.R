#' OMXS30 Index Data Between 1986-09-30 and 2024-11-06
#'
#' [OMX Stockholm 30
#' Index](https://www.nasdaq.com/european-market-activity/indexes/omxs30?id=SE0000337842)
#' prices between 1986-09-30 and 2024-11-06. The reason that these historical
#' prices are stored in a separate dataset is that the new Nasdaq OMX Nordic
#' website, as of November 2024, only shows data for the last ten years. Data
#' from the new website could be combined with this dataset to provide a longer
#' time series.
#'
#' @format ## `old_omxs30` A data frame with 9,560 rows and 7 columns:
#' \describe{
#'   \item{date}{Date of observation.}
#'   \item{high_price}{High price.}
#'   \item{low_price}{Low price.}
#'   \item{closing_price}{Closing price.}
#'   \item{average_price}{Average price. Data available between 2006-06-08 and 2011-01-12. All values either 0 or NA for some reason.}
#'   \item{total_volume}{Total volume. Data available between 2009-10-26 and 2024-11-06. All values either 1 or NA for some reason.}
#'   \item{turnover}{Turnover. Data available between 2006-03-20 and 2014-12-05.}
#' }
#'
#' @md
#' @source
#' <https://www.nasdaqomxnordic.com/index/historiska_kurser?Instrument=SE0000337842>
"old_omxs30"
