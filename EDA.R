# EXPLORATORY DATA ANALYSIS
library(tidyverse)
# VARIATION
# Visualizing  Distributions:

# categorical variables; to examine the distributions of a categorical variable, use a bar chart
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))
# to analyse the above manually, you can use dplyr
diamonds %>%
  count(cut)

# continous variables; to examine the distribution of a continous variable, use a histogram
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat), binwidth = 0.5)
# and it can also manually by using dplyr and ggplot
diamonds %>%
  count(cut_width(carat, 0.5))

# exploring a variety of binwidths: zooming into just the diamonds with a size of less than 3 carats
smaller <- diamonds %>%
  filter(carat < 3)

ggplot(data = smaller, mapping = aes(x = carat)) +
  geom_histogram(binwidth = 0.1)

# for overlaying multiple histograms in the same plot, use freq_poly
ggplot(data = smaller, mapping = aes(x = carat, color = cut)) +
  geom_freqpoly(binwidth = 0.1)


# Typical Values
ggplot(data = smaller, mapping = aes(x = carat)) +
  geom_histogram(binwidth = 0.01)

ggplot(data = smaller, mapping = aes(x = carat)) +
  geom_freqpoly(binwidth = 0.01)
  
# the following histogram shows the lenght(in minutes) of
#227 erruptions of the Old faithful gyser in yellowsstone

ggplot(data = faithful, mapping = aes(x = eruptions)) +
  geom_histogram(binwidth = 0.25)

ggplot(data = faithful, mapping = aes(x = eruptions)) +
  geom_freqpoly(binwidth = 0.01)

faithful %>%
  count(eruptions) %>%

view(faithful %>%
       count(eruptions))


# Unusual Variables (Outliers):
# take the distribution of the y variable from the diamond dataset
ggplot(diamonds) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.5)
# the above code makes a plot having so many observations in
# the common bins that the rare bins are so short that you cant see them
# zoom into small values of the y-axis with coord_cartesian()
ggplot(diamonds) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.5) +
  coord_cartesian(ylim = c(0, 50))


# plucking the three unusual values out with dplyr
unusual <- diamonds %>%
  filter(y < 3 | y > 20) %>%
  arrange(y)
unusual

#Exercise
  

    


