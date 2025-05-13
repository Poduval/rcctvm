# Initialize ====
library(openxlsx)

# load and prepare data ====
survival_data <- read.xlsx(
  "data-raw/data-survival.xlsx",
  rowNames = FALSE, detectDates = TRUE,
  skipEmptyRows = TRUE, skipEmptyCols = TRUE)

library(survival)

.internal_model <- coxph(Surv(time, status) ~ sex + logWBC + rx, data = survival_data)
