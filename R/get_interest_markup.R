#' Get Daily Interest Markup
#'
#' Get mean markup on interest used by the banks Swedbank, Nordea, SEB, and
#' Swedbank, as compared to the Swedish Naional Bank’s policy rate, converted to
#' a daily interest rate.
#'
#' @return A numeric.
#' @export
#'
#' @examples
#' \dontrun{
#' current_mean_interest_markup <- get_interest_markup()
#' }
get_interest_markup <- function() {
  NULL ->
    bank ->
    interest ->
    policy_rate ->
    mean_list ->
    mean_policy ->
    markup

  get_current_list_rates() |>
    dplyr::left_join(get_policy_rate(), by = dplyr::join_by(date)) |>
    dplyr::filter(bank %in% c('Handelsbanken', 'Nordea', 'SEB', 'Swedbank')) |>
    dplyr::summarize(mean_list = mean(interest), mean_policy = mean(policy_rate), mean_year = mean(lubridate::year(date))) |>
    dplyr::mutate(dplyr::across(dplyr::everything(), ~ daily_interest_rate(. / 100, mean_year))) |>
    dplyr::mutate(markup = mean_list - mean_policy) |>
    dplyr::pull(markup) |>
    (\(x) return(x))()
}
