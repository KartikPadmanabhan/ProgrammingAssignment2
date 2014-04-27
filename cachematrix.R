#
#MATRIX INVERSION PROGRAMMING ASSIGNMENT:
#----------------------------------------  
#> source('~/Desktop/github_repo/ProgrammingAssignment2/cachematrix.R') 
#> x <- makeCacheMatrix(matrix(c(1, 4, 9, 3, 7, 2, 8, 4, 1), ncol=3))  
#> x$get()
#[,1] [,2] [,3]
#[1,]    1    3    8
#[2,]    4    7    4
#[3,]    9    2    1
#> inverse = cacheSolve(x)
#> inverse
#[,1]        [,2]        [,3]
#[1,]  0.002898551 -0.03768116  0.12753623
#[2,] -0.092753623  0.20579710 -0.08115942
#[3,]  0.159420290 -0.07246377  0.01449275


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
  
  #Final cached list storing all our getters and setters
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
   
  #calculates the inverse using solve()
  m <- solve(data, ...)
  
  #set the inverse back into the cache for the computed inverse above.
  x$setinverse(m)
  
  m
}
