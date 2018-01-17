## ----setup, echo = TRUE, include = FALSE---------------------------------
library(pander)
library(Foodmapping)

## ---- echo = TRUE--------------------------------------------------------
v_fz_tk_sort_r( "Tomatoes" , "raw. tomatoes" )

## ---- echo = TRUE--------------------------------------------------------
v_fz_tk_sort_r( "Tomatoe and basil soup" , "Tomatoe soup with basil" )

## ---- echo = TRUE--------------------------------------------------------
v_fz_tk_sort_r( "Tomatoes" , "Carot soup" )

## ---- echo = TRUE--------------------------------------------------------
data(food_sample)

food_names1 <- food_sample$FOODNAME_ENG
food_names2 <- food_sample$FOODNAME_ENG_COMP

scores <- v_fz_tk_sort_r( food_names1 , food_names2)

results <- data.frame(
  name1 = food_names1,
  name2 = food_names2,
  score = scores
)
pander(head(results), split.table = Inf )

## ---- echo = TRUE--------------------------------------------------------
# make a large example of  10'000 comparisons - takes < 5 seconds
large_example <- expand.grid( A = food_names1[ 1:100 ] , B  = food_names2[ 1:100 ] ) # create all pairwise comparisons
dim( large_example )
system.time(
  scores <- v_fz_tk_sort_r( as.character( large_example$A ), as.character( large_example$B ) )
)

