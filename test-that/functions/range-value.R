
# @title Range Value
# @param x numeric vector
# @return range as max - min
range_value <- function(x, na.rm) {
  if(!is.logical(na.rn)) stop("na.rm must be a boolean")
  if (na.rm == T)
    x = na.omit(x)
  max(x) - min(x)
}