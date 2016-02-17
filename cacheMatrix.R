## These 2 functions, makeCacheMatrix and cacheSolve, are used in conjunction 
## to create an inverse of a matrix and cache its valvue (the inverse), and
## to pull that cached inverse (if already calculated) into the working environment 
## in which cacheSolve is called.


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

## This function either pulls the cached matrix from "makeCacheMatrix" if already solved (i.e. if NOT NULL), 
## or it solves it using the last 4 lines of code, saves it (in x$setInverse), 
## and prints it to screen (inv)

cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setInverse(inv)
  inv
}
