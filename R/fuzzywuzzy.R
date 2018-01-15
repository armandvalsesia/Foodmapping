# Author: docker
###############################################################################


.get_fuzz_matcher <- function(){
  #require(fuzzywuzzyR)
  fuzzywuzzyR::FuzzMatcher$new()
}


#' Partial_token_sort_ratio 
#'  
#'  => wrapper to get the Partial_token_sort_ratio function
#' 
#' @param init (a FuzzMatcher Object)
#'
#' @author Marc Lamarine
#' @return an integer

fz_tk_sort_r <- function( init = .get_fuzz_matcher()) {
  init$Partial_token_sort_ratio
}



#' Vectorized Partial Token Sort_Ratio 
#'  
#'  => compute the parallel partial token sort ratio between two strings
#' 
#' @param string1 a character string.
#' @param string2 a character string.
#' @param force_ascii allow only ASCII characters (force convert to ascii) 
#' @param full_process either TRUE or FALSE. If TRUE then it process the string by : 1. removing all  but letters and numbers, 2. trim whitespace, 3. force to lower case
#' 
#' @author Marc Lamarine
#' @return a vector
#' @export
v_fz_tk_sort_r <- Vectorize(fz_tk_sort_r())




#' Add Partial Token Sort_Ratio Score
#' 
#' => add a SCORE column to the data.frame using
#'   v_fz_tk_sort_r method
#' 
#' @param df data.frame
#' @param s1 first string
#' @param s2 second string
#'
#' @author  Marc Lamarine
#' @return  data.frame
#' @keywords internal

compute_fuzzy_scores <- function(df, s1, s2) {
  cols <- colnames(df)
  if(!s1 %in% cols) stop(sprintf("%s is not in data.frame", s1))
  if(!s2 %in% cols) stop(sprintf("%s is not in data.frame", s2))
  cbind(df, SCORE = v_fz_tk_sort_r(as.character(df[[s1]]), as.character(df[[s2]])))
  
} 




