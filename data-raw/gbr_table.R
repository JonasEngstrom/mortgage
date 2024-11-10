gbr_table <-
  get_government_borrowing_rate()

usethis::use_data(gbr_table, overwrite = TRUE)
