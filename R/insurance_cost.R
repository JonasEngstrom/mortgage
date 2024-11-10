#' Calculate Risk Cost for Kapitalforsakring at Avanza Based on Age
#'
#' Calculate the monthly risk cost of a [kapitalforsakring at
#' Avanza](https://www.avanza.se/konton-lan-prislista/konton/kapitalforsakring/fordjupad-information-kapitalforsakring.html#riskkostnad)
#' based on age and insured amount.
#'
#' @param age Age.
#' @param amount Amount in kapitalforsakring.
#'
#' @return A numeric.
#' @export
#'
#' @examples
#' cost <- insurance_cost(25, 100000)
insurance_cost <- function(age, amount) {
  NULL ->
    price_per_million ->
    price_per_crown

  if (age < 20) {
    calculation_age <- 20
  } else if (age > 90) {
    calculation_age <- 90
  } else {
    calculation_age <- round(age / 5) * 5
  }

  tibble::tibble(
      age = seq(20, 90, 5),
      price_per_million = c(.7, .72, .56, .72, 1.05, 1.73, 2.94, 4.66, 7.42, 13.30, 21.1, 35.56, 63.94, 114.4, 196.42)
    ) |>
    dplyr::mutate(price_per_crown = price_per_million / (1e6 / 101 * 100)) |>
    dplyr::mutate(amount = amount * price_per_crown) |>
    dplyr::filter(age == calculation_age) |>
    dplyr::pull(amount) |>
    (\(x) return(x))()
}
