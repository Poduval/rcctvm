utils::globalVariables(c("sex", "wbc", "treatment"))

#' Predict risk of Leukemia remission
#'
#' Dispatches to appropriate method based on input type.
#'
#' @param x Either a data.frame or values for sex, wbc, treatment.
#' @param ... Additional arguments (e.g., sex, wbc, treatment if x is not a data frame).
#'
#' @return A numeric vector of relative risk predictions.
#'
#' @export
#'
predict_risk <- function(x, ...) {
  UseMethod("predict_risk")
}

#' Predict risk using individual vectors
#'
#' @param x Placeholder, ignored.
#' @param sex Character vector of "male" or "female".
#' @param wbc Numeric vector of white blood cell counts.
#' @param treatment Character vector of "standard" or "new".
#' @param ... Unused.
#'
#' @return A numeric vector of risk predictions.
#'
#' @export
#'
predict_risk.default <- function(x = NULL, sex, wbc, treatment, ...) {

  if (length(sex) != length(wbc) || length(wbc) != length(treatment)) {
    stop("all input vectors must be of the same length.")
  }

  newdata <- data.frame(sex = sex, wbc = wbc, treatment = treatment,
                        stringsAsFactors = FALSE)
  predict_risk(newdata)
}

#' Predict risk using a data frame
#'
#' @param x A data frame with columns: sex, wbc, treatment.
#' @param ... Not used.
#'
#' @return A numeric vector of risk predictions.
#'
#' @import survival
#' @importFrom stats predict
#' @export
#'
predict_risk.data.frame <- function(x, ...) {

  # check if the required columns are present
  required_vars <- c("sex", "wbc", "treatment")

  if (!all(required_vars %in% names(x)))
    stop("data must contain the columns: sex, wbc, and treatment.")

  if (any(!tolower(x$sex) %in% c("male", "female")))
    stop("`sex` must be 'male' or 'female'.")

  if (any(!tolower(x$treatment) %in% c("standard", "new")))
    stop("`treatment` must be 'standard' or 'new'.")

  if (any(!is.numeric(x$wbc) | x$wbc <= 0))
    stop("`wbc` must be a positive number.")

  # transform input data
  X_model <- transform(
    x,
    sex = ifelse(tolower(sex) == "male", 0, 1),
    logWBC = log(wbc),
    rx = ifelse(tolower(treatment) == "new", 1, 0)
  )

  # predict using the Cox model
  predict(.internal_model, newdata = X_model, type = "risk")
}
