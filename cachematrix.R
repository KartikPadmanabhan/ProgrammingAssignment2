## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
	        inv <- NULL
        set <- function(y) {
			                x <<- y
		                inv <<- NULL
						        }
		        get <- function() x
		        setinverse <- function(inverse) inv <<- inverse
				        getinverse <- function() inv
				        list(set = set, get = get,
							              setinverse = setinverse,
										               getinverse = getinverse)
						        
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
	        m <- x$getinverse()
        if(!is.null(m)) {
			                message("getting cached matrix")
		                return(m)
						        }
		        data <- x$get()
		        if(det(data)<-0){
					                message("matrix is singular, and cannot be inversed!")
				        }
				        
				        m <- solve(data, ...)
				        x$setinverse(m)
						        m
}

