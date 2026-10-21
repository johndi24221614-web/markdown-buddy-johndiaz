# scripts/analyze_detailing.R
# Purpose: Summarise a synthetic dataset of luxury-car detailing services
#          (average price, duration and rating per service type) and plot
#          the average price per service.
# Input:   data/detailing_services.csv
# Output:  a summary table printed to the console and
#          figures/avg_price_by_service.png
# Usage:   run from the project root:  source("scripts/analyze_detailing.R")

library(tidyverse)

# 1. Load the data ------------------------------------------------------------
data_path <- "data/detailing_services.csv"
detailing <- read_csv(data_path, show_col_types = FALSE)

# 2. Summarise by service type ------------------------------------------------
summary_by_service <- detailing |>
  group_by(service_type) |>
  summarise(
    n_services         = n(),
    avg_price_cad      = round(mean(price_cad), 2),
    avg_duration_hours = round(mean(duration_hours), 2),
    avg_rating         = round(mean(customer_rating), 2),
    .groups = "drop"
  ) |>
  arrange(desc(avg_price_cad))

print(summary_by_service)

# 3. Plot average price per service type --------------------------------------
price_plot <- ggplot(
  summary_by_service,
  aes(x = reorder(service_type, avg_price_cad), y = avg_price_cad)
) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Average Price by Detailing Service",
    subtitle = "Synthetic data, luxury vehicles",
    x = NULL,
    y = "Average price (CAD)"
  ) +
  theme_minimal()

# 4. Save the figure ----------------------------------------------------------
dir.create("figures", showWarnings = FALSE)
ggsave("figures/avg_price_by_service.png", price_plot,
       width = 8, height = 5, dpi = 150)
