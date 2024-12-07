% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{daily_table}
\alias{daily_table}
\title{A Table of Daily Interest Rate and Rates of Change in OMXS30 and CPI between
1994-06-01 and 2024-08-01}
\format{
\subsection{\code{daily_table} A data frame with 11,010 rows and 7 columns:}{

\describe{
\item{date}{Date of observation.}
\item{interest}{Daily Swedish policy rate.}
\item{omxs30}{Daily rate of change in the OMXS 30 index.}
\item{cpi}{Daily rate of change in the Swedish consumer price index. Note that observations are only made once per month.}
}
}
}
\source{
\url{https://www.riksbank.se/sv/statistik/rantor-och-valutakurser/styrranta-in--och-utlaningsranta/}
\url{https://www.nasdaq.com/european-market-activity/indexes/omxs30?id=SE0000337842}
\url{https://www.scb.se/hitta-statistik/statistik-efter-amne/priser-och-konsumtion/konsumentprisindex/konsumentprisindex-kpi/}
}
\usage{
daily_table
}
\description{
A table of daily rates of change in \href{https://www.riksbank.se/sv/statistik/rantor-och-valutakurser/styrranta-in--och-utlaningsranta/}{the Swedish Central Bank policy rate},
\href{https://www.nasdaq.com/european-market-activity/indexes/omxs30?id=SE0000337842}{the OMX Stockholm 30 Index},
and \href{https://www.scb.se/hitta-statistik/statistik-efter-amne/priser-och-konsumtion/konsumentprisindex/konsumentprisindex-kpi/}{the Swedish consumer price index}.
}
\keyword{datasets}
