## Put comments here that give an overall description of what your
## functions do

## Pretty much used the same logic from the example, but instead of using
## a numeric vector, I used a matrix instead

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setslv <- function(mtx) m <<- mtx
        getslv <- function() m
        list(set = set, get = get, setslv = setslv, getslv = getslv)
}


## In addition to using the logic from the example, I added some code to check that the cached solved matrix 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        #Create object m
        m <- NULL
       
        #check that there is a solved matrix cached
        #if not then set m to NULL
        #else assign the cached solved matrix to m
        if (length(x$getslv())==0) {m <- NULL }
        else { m <- x$getslv() }

        #check if m us not null.
        #if it is not null, then fetch the cached value
        if (!is.null(m)) {
                      message("getting cached data")
                      return(m)
        }

        #if m is null then solve the matrix and cache it
	  data <- x$get()
        m <- solve(data)
        x$setslv(m)
        m
}
