make_master_tokens <- function(
    asset_value,
    initial_principal,
    household_gross_income,
    housing_association_fee,
    birth_day = '1987-01-01',
    historical_offset = 0L,
    daily_interest_markup = get_interest_markup(),
    pay_off_time = 25 * 12,
    fraction_invested = 1,
    yearly_fund_fee = 0,
    initial_date = Sys.Date(),
    daily_interest_rates = daily_table |> pull(interest),
    daily_index_development = daily_table |> pull(omxs30),
    standard_rate = daily_table |> pull(standard_rate)
  ) {
  list(
    household_gross_income = ifelse(is.numeric(household_gross_income), household_gross_income, stop('household_gross_income needs to be a numeric')),
    fraction_invested = ifelse(dplyr::between(fraction_invested, 0, 1), fraction_invested, stop('fraction_invested needs to be between 0 and 1')),
    yearly_fund_fee = ifelse(is.numeric(yearly_fund_fee), yearly_fund_fee, stop('fund_fee needs to be a numeric')),
    housing_association_fee = ifelse(is.numeric(housing_association_fee), housing_association_fee, stop('housing_association_fee needs to be a numeric')),
    birth_day = as.Date(birth_day),
    historical_offset = ifelse(is.integer(historical_offset), historical_offset, stop('historical_offset needs to be an integer')),
    daily_interest_markup = ifelse(is.numeric(daily_interest_markup), daily_interest_markup, stop('daily_interest_markup needs to be a numeric')),
    pay_off_time = ifelse(is.numeric(pay_off_time), pay_off_time, stop('pay_off_time needs to be a numeric')),
    asset_value = ifelse(is.numeric(asset_value), asset_value, stop('asset_value needs to be a numeric')),
    initial_principal = ifelse(is.numeric(initial_principal), initial_principal, stop('initial_principal needs to be a numeric')),
    initial_date = as.Date(initial_date),
    daily_interest_rates = daily_interest_rates,
    daily_index_development = daily_index_development,
    standard_rate = standard_rate
  ) |>
    (\(x) return(x))()
}
