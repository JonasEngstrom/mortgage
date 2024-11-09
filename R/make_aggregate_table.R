make_aggregate_table <- function() {
  amended_long_omxs30 <-
    get_omx() |>
    dplyr::select(-bid, -ask, -open, -trades) |>
    dplyr::filter(!(date %in% (long_omxs30 |> dplyr::pull(date)))) |>
    dplyr::mutate(date = as.Date(date)) |>
    dplyr::bind_rows(long_omxs30)

  policy_rate <-
    get_policy_rate()

  cpi <-
    get_cpi()

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
    dplyr::left_join(amended_long_omxs30 |> dplyr::select(date, omxs30 = closing_price), by = dplyr::join_by(date)) |>
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
    tidyr::fill(-date, .direction = 'down')

  return(aggregate_table)
}
