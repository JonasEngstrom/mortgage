master_row <- function(
    birth_day,
    historical_offset,
    interest_markup,
    asset_value,
    initial_principal,
    household_gross_income,
    pay_off_time,
    fraction_invested,
    day_number,
    date,
    remaining_principal,
    cumulative_interest,
    index_fund_value,
    cumulative_capital_tax
  ) {
  tibble::tibble(
    day_number,
    date,
    remaining_principal,
    interest_rate = daily_table |> filter(row_number() == day_number + historical_offset) |> pull(interest) + interest_markup,
    index_development = daily_table |> filter(row_number() == day_number + historical_offset) |> pull(omxs30),
    standard_rate = daily_table |> filter(row_number() == day_number + historical_offset) |> pull(standard_rate)
  ) |>
    mutate(
      accrued_interest = remaining_principal * interest_rate,
      current_month_cumulative_interest = if_else(mday(date) == 1, 0, cumulative_interest),
      loan_to_value_ratio = lvr(remaining_principal, asset_value),
      debt_ratio = debt_ratio(remaining_principal, household_gross_income),
      minimum_monthly_payment = minimum_monthly_payment(initial_principal, loan_to_value_ratio, debt_ratio),
      goal_monthly_payment = initial_principal / pay_off_time,
      monthly_investment = (goal_monthly_payment - minimum_monthly_payment) * fraction_invested,
      index_fund_value = index_fund_value,
      loan_payment = if_else(mday(date) == 1, current_month_cumulative_interest + goal_monthly_payment - monthly_investment, 0),
      fund_payment = if_else(mday(date) == 1, monthly_investment, 0),
      age = floor(interval(birth_day, Sys.Date()) / years(1)),
      insurance_fee = insurance_cost(age, index_fund_value),
      accrued_captial_tax = standard_sum(date, standard_rate, fund_payment),
      current_year_cumulative_capital_tax = if_else(yday(date) == 1, 0, cumulative_capital_tax)
    ) |>
    (\(x) return(x))()
}
