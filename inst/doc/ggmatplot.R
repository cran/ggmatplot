## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE,
  warning = FALSE
)

## ----defining-data------------------------------------------------------------
# vector x
x <- c(rnorm(100, sd = 2))

head(x)

# matrix z
y <- x * 0.5 + rnorm(100, sd = 1)
fit.y <- fitted(lm(y ~ x))
z <- cbind(actual = y,
           fitted = fit.y)

head(z)

## ----point-plot---------------------------------------------------------------
library(ggmatplot)

ggmatplot(x, z)

## ----point-plot-w-parameters--------------------------------------------------
ggmatplot(x, z,
          shape = "circle", # using a single shape over both groups
          color = c("blue","purple") # assigning two colors to the two groups
          )

## ----point-plot-w-theme-------------------------------------------------------
ggmatplot(x, z,
          shape = "circle",
          color = c("blue","purple"),
          size = 2,
          alpha = 0.5
          ) +
  theme_bw()


## ----iris-data----------------------------------------------------------------
library(tidyr)
library(dplyr)

iris_numeric <- iris %>%
  select(is.numeric)

head(iris_numeric)

## ----iris-ggplot2-density-plot------------------------------------------------
iris_numeric_long <- iris_numeric %>%
  pivot_longer(cols = everything(),
               names_to = "Feature",
               values_to = "Measurement") 

head(iris_numeric_long)

iris_numeric_long %>%
  ggplot(aes(x = Measurement,
             color = Feature)) +
  geom_density()

## ----iris-ggmatplot-density-plot----------------------------------------------
ggmatplot(iris_numeric, plot_type = "density", alpha = 0)

## ----airline-data-------------------------------------------------------------
AirPassengers <- matrix(AirPassengers,
  ncol = 12, byrow = FALSE,
  dimnames = list(month.abb, as.character(1949:1960))
)

AirPassengers

## ----airline-data-split-------------------------------------------------------
months <- rownames(AirPassengers)
nPassengers <- AirPassengers[, 1:12]

## ----line-plot----------------------------------------------------------------
ggmatplot(
  x = months,
  y = nPassengers,
  plot_type = "line",
  size = 1,
  legend_label = c(1949:1960),
  xlab = "Month",
  ylab = "Total airline passengers (in thousands)",
  legend_title = "Year"
) +
  theme_minimal()

