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

#' OMXS30 Index Data Since 1986-09-30 and 2024-11-08
#'
#' [OMX Stockholm 30
#' Index](https://www.nasdaq.com/european-market-activity/indexes/omxs30?id=SE0000337842)
#' prices between 1986-09-30 and 2024-11-08.
#'
#' @format ## `long_omxs30` A data frame with 9,562 rows and 7 columns:
#' \describe{
#'   \item{date}{Date of observation.}
#'   \item{high_price}{High price.}
#'   \item{low_price}{Low price.}
#'   \item{closing_price}{Closing price.}
#'   \item{average_price}{Average price.}
#'   \item{total_volume}{Total volume.}
#'   \item{turnover}{Turnover.}
#' }
#'
#' @md
#' @source
#' <https://www.nasdaqomxnordic.com/index/historiska_kurser?Instrument=SE0000337842>
#' <https://www.nasdaq.com/european-market-activity/indexes/omxs30?id=SE0000337842>
"long_omxs30"

#' A Table of Daily Interest Rate and Rates of Change in OMXS30 and CPI between
#' 1994-06-01 and 2024-08-01
#'
#' A table of daily rates of change in [the Swedish Central Bank policy
#' rate](https://www.riksbank.se/sv/statistik/rantor-och-valutakurser/styrranta-in--och-utlaningsranta/),
#' [the OMX Stockholm 30
#' Index](https://www.nasdaq.com/european-market-activity/indexes/omxs30?id=SE0000337842),
#' and [the Swedish consumer price
#' index](https://www.scb.se/hitta-statistik/statistik-efter-amne/priser-och-konsumtion/konsumentprisindex/konsumentprisindex-kpi/).
#'
#' @format ## `daily_table` A data frame with 11,010 rows and 7 columns:
#' \describe{
#'   \item{date}{Date of observation.}
#'   \item{interest}{Daily Swedish policy rate.}
#'   \item{omxs30}{Daily rate of change in the OMXS 30 index.}
#'   \item{cpi}{Daily rate of change in the Swedish consumer price index. Note that observations are only made once per month.}
#' }
#'
#' @md
#' @source
#' <https://www.riksbank.se/sv/statistik/rantor-och-valutakurser/styrranta-in--och-utlaningsranta/>
#' <https://www.nasdaq.com/european-market-activity/indexes/omxs30?id=SE0000337842>
#' <https://www.scb.se/hitta-statistik/statistik-efter-amne/priser-och-konsumtion/konsumentprisindex/konsumentprisindex-kpi/>
"daily_table"
