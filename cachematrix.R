## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# The following functions are used to create a special object that stores a matrix and caches its inverse. 

makeCacheMatrix <- function(x = matrix()) {
  a <- NULL
  set <- function(y) {
    x <<- y
    a <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) a <<- inverse
  getinverse <- function() a
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
#This function calculates the inverse of the “matrix” returned by the function makeCacheMatrix above. 
#If the inverse has already been calculated (and the matrix is the same), then this function retrieves the inverse from the cache.


cacheSolve <- function(x, ...) {
  a <- x$getinverse()
  if (!is.null(a)) {
    message("get cached data")
    return(a)
  }
  data <- x$get()
  a <- solve(data, ...)
  x$setinverse(a)
  a
}
