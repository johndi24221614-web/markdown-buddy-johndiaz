# luxury-detailing-analysis

> **AI Assistance Declaration**: I used Claude (Anthropic, model Claude Sonnet 5.5) on October 19, 2026 for layout suggestions, drafting the Markdown and R Markdown structure, writing assistance, and for generating the synthetic dataset (with a Python script) and the first draft of the R script. Prompts used: see the AI Assistance Disclosure section below and `Appendix.md`. I verified outputs by running the script and knitting the .Rmd in Posit Cloud, recalculating the averages in an Excel workbook and comparing them with the R output, and previewing the files on GitHub. All final calculations are done by myself. I am responsible for the accuracy and originality of this work.

## Overview

An R project that analyses a **synthetic** dataset of luxury-car detailing services. It summarises the number of jobs, average price (CAD), average duration (hours) and average customer rating for each service type, and plots the average price per service.

The project was created for BDA400 (Data Science Tools and Techniques), Assignment 1: *Markdown Buddy*.

## Project Structure

```text
markdown-buddy-johndiaz/
├── README.md                    # Project documentation (this file)
├── analyze_detailing.Rmd        # R Markdown documentation of the script
├── Reflection.md                # Answers to the reflection questions
├── Appendix.md                  # AI prompts and key responses
├── LICENSE                      # MIT License
├── data/
│   └── detailing_services.csv   # Synthetic dataset (120 rows)
└── scripts/
    └── analyze_detailing.R      # Analysis script
```

Running the script also creates a `figures/` folder with the generated chart.

## Data

`data/detailing_services.csv` is entirely **synthetic**. It contains no real customer or business data. It was generated once with an AI-assisted Python script using a fixed random seed (42) and saved as a static CSV file; the generator script is not part of this repository.

| Column | Description |
|---|---|
| `service_id` | Unique job identifier (S001 to S120) |
| `service_date` | Date of the service (2026) |
| `vehicle_class` | Sedan, SUV, Coupe or Convertible |
| `service_type` | Express Exterior Wash, Interior Deep Clean, Full Detail, Paint Correction, Ceramic Coating or Headlight Restoration |
| `duration_hours` | Time spent on the job, in hours |
| `price_cad` | Price charged, in Canadian dollars |
| `customer_rating` | Customer rating (out of 5.0) |

## Installation

1. Install [R](https://cran.r-project.org/) (version 4.1 or later) and, optionally, [RStudio](https://posit.co/download/rstudio-desktop/). You can also use Posit Cloud.
2. Clone the repository:

   ```bash
   git clone https://github.com/johndi24221614-web/markdown-buddy-johndiaz.git
   ```

3. Install the required packages in R:

   ```r
   install.packages(c("tidyverse", "rmarkdown"))
   ```

## Example Code

Run the analysis from the project root:

```r
source("scripts/analyze_detailing.R")
```

The script prints a summary table to the console, with one row per service type and the columns `n_services`, `avg_price_cad`, `avg_duration_hours` and `avg_rating`. It also saves the chart `figures/avg_price_by_service.png`.

To render the documentation of the script:

```r
rmarkdown::render("analyze_detailing.Rmd")
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## AI Assistance Disclosure

**Tool used:** Claude (Anthropic), model Claude Sonnet 5.5, on October 19, 2026.

**Main prompts** (in Spanish in the original conversation; full details in [Appendix.md](Appendix.md)):

1. "Explain what sections a good GitHub README for an R data analysis project should include." (seed prompt, Step 1)
2. "Revise the sections list so it's concise and uses Markdown headers and bullet formatting." (refinement prompt, Step 1)
3. "Check the Markdown syntax for correctness and readability." (critique prompt, Step 1)
4. A request to build the project files (README, .Rmd, Reflection, Appendix) for an analysis of luxury-car detailing services using synthetic data.
5. "Review the Markdown for syntax errors and suggest 2 improvements for clarity." and "Is the Markdown consistent with RMarkdown best practices?" (critique prompts, Steps 2 and 3, applied to my files during a review)
6. A request for an Excel workbook to check the averages (the `COUNTIF` and `AVERAGEIF` formulas were prepared with Claude; I reviewed them and compared the results with the R output).

**Changes I made after reviewing the outputs:**

- Replaced the `YOUR-USERNAME` placeholder in the clone command with my GitHub username.
- Fixed Markdown syntax errors found during review (extra asterisks in a heading, duplicated `##` in `Reflection.md`).
- Added a note that the dataset was generated with a Python script, and a description of the expected output of the script, to this README.
- Accepted the suggested improvements for the .Rmd: a setup chunk, a table of contents and a clearer section order.
- Ran the script and knitted the .Rmd in Posit Cloud, and rechecked the averages in Excel against the R output.
- Rewrote my reflection answers using real examples from my review.
