#' Make a Table of Daily Interest Rates and Rate of Change in OMXS30 and CPI
#'
#' Makes a table of daily rates of change in [the Swedish Central Bank policy
#' rate](https://www.riksbank.se/sv/statistik/rantor-och-valutakurser/styrranta-in--och-utlaningsranta/),
#' [the OMX Stockholm 30
#' Index](https://www.nasdaq.com/european-market-activity/indexes/omxs30?id=SE0000337842),
#' and [the Swedish consumer price
#' index](https://www.scb.se/hitta-statistik/statistik-efter-amne/priser-och-konsumtion/konsumentprisindex/konsumentprisindex-kpi/).
#'
#' @return A table of daily rate of change of interest, OMXS30, and CPI.
#' @export
#'
#' @md
#' @examples
#' \dontrun{
#' daily_table <- make_daily_table()
#' }
make_daily_table <- function() {
  NULL ->
    bid ->
    ask ->
    open ->
    trades ->
    closing_price ->
    date ->
    long_omxs30 ->
    lead_date ->
    lead_closing_price ->
    lead_cpi ->
    daily_omxs30_change ->
    daily_policy_change ->
    daily_policy_rate ->
    daily_cpi_change

  amended_long_omxs30 <-
    get_omx() |>
    dplyr::select(-bid, -ask, -open, -trades) |>
    dplyr::filter(!(date %in% (long_omxs30 |> dplyr::pull(date)))) |>
    dplyr::mutate(date = as.Date(date)) |>
    dplyr::bind_rows(long_omxs30) |>
    dplyr::mutate(closing_price = dplyr::na_if(closing_price, 0))

  amended_long_omxs30 <-
    seq(min(amended_long_omxs30$date), max(amended_long_omxs30$date), by = 'days') |>
    (\(x) tibble::tibble(date = x))() |>
    dplyr::left_join(amended_long_omxs30, by = dplyr::join_by(date)) |>
    tidyr::fill(closing_price, .direction = 'down') |>
    dplyr::mutate(lead_date = dplyr::lead(date), lead_closing_price = dplyr::lead(closing_price)) |>
    dplyr::filter(!is.na(lead_date) | !is.na(lead_closing_price)) |>
    dplyr::mutate(daily_omxs30_change = rate_of_change(closing_price, lead_closing_price, difftime(lead_date, date) |> as.numeric())) |>
    dplyr::select(-lead_date, -lead_closing_price)

  policy_rate <-
    get_policy_rate() |>
    dplyr::mutate(daily_policy_rate = daily_interest_rate(policy_rate/100, lubridate::year(date)))

  cpi <-
    get_cpi() |>
    dplyr::mutate(lead_date = dplyr::lead(date), lead_cpi = dplyr::lead(cpi)) |>
    dplyr::filter(!is.na(lead_date) | !is.na(lead_cpi)) |>
    dplyr::mutate(daily_cpi_change = rate_of_change(cpi, lead_cpi, difftime(date, lead_date) |> as.numeric())) |>
    dplyr::select(-lead_date, -lead_cpi)

  first_date <-
    c(
      amended_long_omxs30 |> dplyr::pull(date),
      policy_rate |> dplyr::pull(date),
      cpi |> dplyr::pull(date)
    ) |>
    min()

  temp_aggregate_table <-
    seq(first_date, to = Sys.Date(), by = 'day') |>
    (\(x) tibble::tibble(date = x))() |>
    dplyr::left_join(policy_rate, by = dplyr::join_by(date)) |>
    dplyr::left_join(amended_long_omxs30 |> dplyr::select(date, omxs30 = closing_price, daily_omxs30_change), by = dplyr::join_by(date)) |>
    dplyr::left_join(cpi, by = dplyr::join_by(date))

  complete_date_extremes <-
    temp_aggregate_table |>
    tidyr::drop_na() |>
    dplyr::summarize(first_complete_date = min(date), last_complete_date = max(date))

  first_complete_date <-
    complete_date_extremes |>
    dplyr::pull(first_complete_date)

  last_complete_date <-
    complete_date_extremes |>
    dplyr::pull(last_complete_date)

  aggregate_table <-
    temp_aggregate_table |>
    dplyr::filter(dplyr::between(date, first_complete_date, last_complete_date)) |>
    dplyr::arrange(date) |>
    tidyr::fill(-date, .direction = 'down') |>
    dplyr::select(
      date,
      interest = daily_policy_rate,
      omxs30 = daily_omxs30_change,
      cpi = daily_cpi_change
    )

  return(aggregate_table)
}
