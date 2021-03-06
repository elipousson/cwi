% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/adj_inflation.R
\name{adj_inflation}
\alias{adj_inflation}
\title{Add inflation-adjusted values to a data frame}
\usage{
adj_inflation(
  .data,
  value,
  year,
  base_year = 2018,
  key = Sys.getenv("BLS_KEY")
)
}
\arguments{
\item{.data}{A data frame containing monetary values by year.}

\item{value}{Bare column name of monetary values; for safety, has no default.}

\item{year}{Bare column name of years; for safety, has no default.}

\item{base_year}{Year on which to base inflation amounts; defaults to 2016.}

\item{key}{A string giving the BLS API key. Defaults to the value in \code{Sys.getenv("BLS_KEY")}.}
}
\value{
A data frame with two additional columns: adjustment factors, and adjusted values. The adjusted values column is named based on the name supplied as \code{value}; e.g. if \code{value = avg_wage}, the adjusted column is named \code{adj_avg_wage}.
}
\description{
This is modeled after \code{\link[blscrapeR:inflation_adjust]{blscrapeR::inflation_adjust()}} that joins a data frame with an inflation adjustment table from the Bureau of Labor Statistics, then calculates adjusted values. It returns the original data frame with two additional columns for adjustment factors and adjustment values.
}
\details{
\strong{Note:} Because \code{adj_inflation} makes API calls, internet access is required.
}
\examples{
\dontrun{
  wages <- data.frame(
    fiscal_year = 2010:2016,
    wage = c(50000, 51000, 52000, 53000, 54000, 55000, 54000)
  )
  adj_inflation(wages, value = wage, year = fiscal_year, base_year = 2016)
}
}
