# Initialize ====
library(dplyr)
library(openxlsx)
library(tidymodels)

# load and prepare data ====
#' assuming each row represents one unique patient
data_raw <- read.xlsx(
  "workshop-materials/lukemia-remission-data.xlsx",
  rowNames = FALSE, detectDates = TRUE,
  skipEmptyRows = TRUE, skipEmptyCols = TRUE) |>
  mutate(id = 1:n())

glimpse(data_raw)
# check for missing values
data_raw %>% summarise(across(everything(), ~ sum(is.na(.))))

# analyzing data ====

data_raw |> count(status)
data_raw |> count(sex)

# survival analysis ====

library(survival)
library(survminer)

data_raw |> head()
survival_y <- with(data_raw, Surv(time, status)) # survival object
survival_y
fit_km <- survfit(survival_y ~ 1)
summary(fit_km)

fit_km |>
  ggsurvplot(data = data_raw,
             xlab = "time", ylab = "survival probability",
             title = "Kaplan-Meier survival curve")
