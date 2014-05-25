## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## The function creates "vector" of functions used to set and get 
## inv. matrix values from/to environment

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setSol <- function(sol) m <<- sol
        getSol <- function() m
        list(set = set, get = get,
             setSol = setSol,
             getSol = getSol)
}

## This function takes a vector of functions as an argument and looks 
##for already solved inverse of matrix in environment
## If there is no values in environment, it calculates them 
## using R solve() function

cacheSolve <- function(x, ...) {
        m <- x$getSol()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setSol(m)
        m
}
