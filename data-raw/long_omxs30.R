long_omxs30 <-
  get_omx() |>
  dplyr::select(-bid, -ask, -open, -trades) |>
  dplyr::filter(!(date %in% (long_omxs30 |> dplyr::pull(date)))) |>
  dplyr::mutate(date = as.Date(date)) |>
  dplyr::bind_rows(long_omxs30)

usethis::use_data(long_omxs30, overwrite = TRUE)
