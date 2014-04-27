#makeCacheMatrix creates a special "matrix", a list containing function to set/get values of matrix
#and set/get the value of inverse of matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  
  #Setter function for setting the value of matrix
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  #Setter function for getting the value of matrix
  get <- function() x
  
  #Setter function for setting the value of matrix
  setinverse <- function(inverse) inv <<- inverse
  
  #Getter function for getting the value of matrix
  getinverse <- function() inv
  
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## cacheSolve computes the inverse of the special matrix that is returned by makeCacheMatrix above.
# if the inverse already exists or has been already calculated, it simply retrieves the inverse from
#cache

cacheSolve <- function(x, ...) {
  #try to get inverse from cache first
  m <- x$getinverse()
  #if inverse of the matrix exists (that is if computed m above isn't null)
  if(!is.null(m)) {
    message("getting cached matrix")
    #simply return this inverse
    return(m)
  }
  
  #if inverse doesn't exists get the actual matrix to compute inverse
  data <- x$get()
  
  #check for singularity...that is if matrix cannot be inversed determitent is 0
  #NOTE that this step isn't really needed here as we are assuming that that matrix 
  #PROVIDED TO US IS ALWAYS INVERTIBLE. 
  #But this condition is a good check to ensure we never go wrong
  if(det(data)<-0){
    message("matrix is singular, and cannot be inversed!")
  }
  
  #calculates the inverse using solve()
  m <- solve(data, ...)
  
  #set the inverse back into the cache for the computed inverse above.
  x$setinverse(m)
  
  m
}
