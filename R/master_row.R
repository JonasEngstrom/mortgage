master_row <- function(master_tokens) {
  tibble::tibble(
    day_number = 1,
    date = master_tokens$initial_date,
    remaining_principal = master_tokens$initial_principal,
    interest_rate = master_tokens$daily_interest_rates[day_number + master_tokens$historical_offset] + master_tokens$daily_interest_markup,
    index_development = master_tokens$daily_index_development[day_number + master_tokens$historical_offset],
    standard_rate = master_tokens$standard_rate[day_number + master_tokens$historical_offset],
  ) |>
    mutate(
      loan_to_value_ratio = lvr(remaining_principal, master_tokens$asset_value),
      debt_ratio = debt_ratio(remaining_principal, master_tokens$household_gross_income),
      minimum_monthly_payment = minimum_monthly_payment(master_tokens$initial_principal, loan_to_value_ratio, debt_ratio),
      index_fund_value = 0,
      fund_payment = 0,
      loan_payment = if_else(mday(date) == 1, master_tokens$initial_principal / master_tokens$pay_off_time - fund_payment, 0),
      age = floor(interval(master_tokens$birth_day, Sys.Date()) / years(1)),
      insurance_fee = insurance_cost(age, index_fund_value),
      accrued_captial_tax = 0,
      current_year_cumulative_capital_tax = 0,
      cumulative_principal_payments = 0,
      difference_cumulative_principal_payments_and_index_fund_vaule = index_fund_value - cumulative_principal_payments,
      total_monthly_cost = loan_payment + fund_payment + master_tokens$housing_association_fee,
      fund_costs = 0
    ) |>
    (\(x) return(x))()
}

next_row <- function(master_table, master_tokens) {
  master_table |>
    bind_rows(
      master_table |>
        filter(row_number() == n()) |>
        mutate(
          day_number = day_number + 1,
          date = date + 1,
          remaining_principal = remaining_principal * (1 + interest_rate),
          interest_rate = master_tokens$daily_interest_rates[day_number + master_tokens$historical_offset] + master_tokens$daily_interest_markup,
          index_fund_value = index_fund_value * (1 + index_development),
          index_development = master_tokens$daily_index_development[day_number + master_tokens$historical_offset],
          standard_rate = master_tokens$standard_rate[day_number + master_tokens$historical_offset],
          loan_to_value_ratio = lvr(remaining_principal, master_tokens$asset_value),
          debt_ratio = debt_ratio(remaining_principal, master_tokens$household_gross_income),
          minimum_monthly_payment = minimum_monthly_payment(master_tokens$initial_principal, loan_to_value_ratio, debt_ratio),
          age = floor(interval(master_tokens$birth_day, Sys.Date()) / years(1)),
          fund_payment = if_else(mday(date) == 1, (master_tokens$initial_principal / master_tokens$pay_off_time - minimum_monthly_payment) * master_tokens$fraction_invested, 0),
          loan_payment = if_else(mday(date) == 1, master_tokens$initial_principal / master_tokens$pay_off_time - fund_payment + master_table |> filter(year(date) == year(max(date)) & month(date) == month(max(date))) |> summarize(monthly_interest = diff(range(remaining_principal))) |> pull(monthly_interest), 0),
          accrued_captial_tax = if_else(yday(date) == 1, standard_sum(date, standard_rate, index_fund_value), 0) + standard_sum(date, standard_rate, fund_payment),
          fund_costs = if_else(yday(date) == 1, insurance_cost(age, index_fund_value) + accrued_captial_tax + index_fund_value * master_tokens$yearly_fund_fee, 0)
        ) |>
        mutate(
          remaining_principal = remaining_principal - loan_payment,
          index_fund_value = index_fund_value + fund_payment - fund_costs
        )
    ) |>
    (\(x) return(x))()
}

next_row_loop <- function(master_table, master_tokens, n_days) {
  for (i in 1:n_days) {
    master_table <-
      next_row(master_table, master_tokens)
  }

  return(master_table)
}

