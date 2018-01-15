context("fuzzywuzzy")

#==============================================================================
s1 <- "fuzzy wuzzy was a bear"
s2 <- "wuzzy fuzzy was a bear"
s3 <- "guzzy buzzy was a bear"
s4 <- "fizzy wazzy was a bear"
seq1 <- c(s1, s2, s3, s4)
data(food_sample)
#=============================================================================

.python_install <- function() {
	expect_true(fuzzywuzzyR:::check_availability())
}
test_that('python_install', .python_install())


..get_fuzz_matcher <- function() {
	targ <- eurofirC5:::.get_fuzz_matcher()
  expect_equal(class(targ), c("FuzzMatcher", "R6")) 
  expect_equal(formals(targ$Partial_token_sort_ratio), 
    pairlist(string1 = NULL, string2 = NULL, force_ascii = TRUE, full_process = TRUE)
  )  
  
  
  
}
test_that('.get_fuzz_matcher', ..get_fuzz_matcher())


.fz_tk_sort_r <- function() {
  
	fz <- fz_tk_sort_r() 
  expect_equal(fz( s1, s2), 100)
  expect_equal(fz( s1, s1), 100)
  expect_equal(fz( s1, s3), 73)
  expect_equal(fz( s1, s4), 91)
  
  
}
test_that('fz_tk_sort_r', .fz_tk_sort_r())



.v_fz_tk_sort_r <- function() {
	v_fz_tk_sort_r(seq1, seq1)
  v_fz_tk_sort_r(seq1, rev(seq1))
   
}
test_that('v_fz_tk_sort_r', .v_fz_tk_sort_r())


.compute_fuzzy_scores <- function() {
	
  expect_error( compute_fuzzy_scores(food_sample, 
          'TOTO', 'FOODNAME_ENG_COMP'), 'TOTO')
  expect_error( compute_fuzzy_scores(food_sample, 
           'FOODNAME_ENG_COMP', 'TOTO'), 'TOTO')
  
  targ <- compute_fuzzy_scores(food_sample, 
    'FOODNAME_ENG', 'FOODNAME_ENG_COMP')
  expect_equal(targ$SCORE, c(54L, 65L, 70L, 76L, 73L, 59L, 63L, 57L, 55L, 91L, 64L, 68L, 
      29L, 73L, 69L, 70L, 100L, 54L, 85L, 56L, 62L, 69L, 64L, 77L, 
      100L, 67L, 59L, 65L, 56L, 58L, 59L, 54L, 48L, 65L, 59L, 48L, 
      76L, 70L, 65L, 64L, 56L, 55L, 67L, 64L, 65L, 60L, 45L, 50L, 54L, 
      58L, 59L, 67L, 60L, 63L, 63L, 64L, 80L, 64L, 80L, 58L, 76L, 60L, 
      70L, 73L, 54L, 71L, 56L, 43L, 62L, 71L, 67L, 64L, 67L, 78L, 25L, 
      48L, 56L, 75L, 78L, 60L, 53L, 62L, 73L, 58L, 74L, 67L, 67L, 81L, 
      64L, 59L, 62L, 53L, 67L, 76L, 54L, 61L, 62L, 68L, 62L, 55L, 100L, 
      100L, 100L, 100L, 100L, 56L, 70L, 100L, 100L, 68L, 100L, 100L, 
      100L, 92L, 100L, 63L, 100L, 58L, 100L, 77L, 36L, 85L, 100L, 100L, 
      100L, 83L, 100L, 100L, 100L, 100L, 100L, 78L, 100L, 100L, 100L, 
      100L, 100L, 40L, 100L, 100L, 36L, 70L, 100L, 100L, 94L, 67L, 
      77L, 74L, 100L, 100L, 100L, 100L, 100L, 100L, 100L, 79L, 81L, 
      100L, 100L, 100L, 100L, 100L, 71L, 80L, 100L, 100L, 100L, 100L, 
      100L, 100L, 100L, 100L, 100L, 71L, 100L, 70L, 100L, 100L, 100L, 
      25L, 61L, 100L, 100L, 100L, 100L, 100L, 100L, 100L, 80L, 100L, 
      100L, 100L, 100L, 100L, 69L, 73L, 77L, 100L, 82L, 100L))
  
  
  score <- v_fz_tk_sort_r(as.character(food_sample[['FOODNAME_ENG']]), 
      as.character(food_sample[['FOODNAME_ENG_COMP']]))
  expect_equal(targ$SCORE, as.integer(score))
  
}
test_that('compute_fuzzy_scores', .compute_fuzzy_scores())





