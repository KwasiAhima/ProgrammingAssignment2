## These 2 functions, makeCacheMatrix and cacheSolve, are used in conjunction 
## to create an inverse of a matrix and cache its valvue (the inverse), and
## to pull that cached inverse (if already calculated) into the working environment 
## in with cacheSolve is called.


## makeCacheMatrix computes the inverse of a matrix, x, and stores its value for later use
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(solve) inv <<- solve
  getInverse <- function() inv
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}
