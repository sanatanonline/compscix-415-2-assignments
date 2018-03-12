library(tidyverse)

# look at a histogram of carat to pick some good cutoff points
diamonds %>% ggplot(aes(x = carat)) + geom_histogram()

# create a new tibble with a categorical carat variable
diamonds_2 <- diamonds %>% mutate(carat_fct = 
                                    factor(case_when(carat < 1 ~ 'small',
                                                     carat >= 1 & carat < 2 ~ 'med',
                                                     carat >= 2 ~ 'large'), 
                                           levels = c('small', 'med', 'large')))

# plot the boxplots, facet on carat_fct
diamonds_2 %>% ggplot(aes(x = cut, y = price)) +
  geom_boxplot() +
  facet_wrap(~carat_fct)
