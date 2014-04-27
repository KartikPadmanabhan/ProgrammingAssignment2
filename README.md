### Assignment: Caching the Inverse of a Matrix

Matrix inversion is usually a costly computation and their may be some
benefit to caching the inverse of a matrix rather than compute it
repeatedly (there are also alternatives to matrix inversion that we will
not discuss here). Your assignment is to write a pair of functions that
cache the inverse of a matrix.

Write the following functions:

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated (and the matrix has not changed), then the
    `cachesolve` should retrieve the inverse from the cache.

Computing the inverse of a square matrix can be done with the `solve`
function in R. For example, if `X` is a square invertible matrix, then
`solve(X)` returns its inverse.

For this assignment, assume that the matrix supplied is always
invertible.

In order to complete this assignment, you must do the following:

1.  Clone the GitHub repository containing the stub R files at
    [https://github.com/rdpeng/ProgrammingAssignment2](https://github.com/rdpeng/ProgrammingAssignment2)
2.  Edit the R file contained in the git repository and place your
    solution in that file (please do not rename the file).
3.  Commit your completed R file into YOUR git repository and push your
    git branch to your GitHub account.
4.  Submit to Coursera the URL to your GitHub repository that contains
    the completed R code for the assignment.

SAMPLE TESTCASE FOR THE PROGRAM:
--------------------------------

> source('~/Desktop/github_repo/ProgrammingAssignment2/cachematrix.R') </BR>
> x <- makeCacheMatrix(matrix(c(1, 4, 9, 3, 7, 2, 8, 4, 1), ncol=3))   </BR>
> x$get()
     [,1] [,2] [,3]
[1,]    1    3    8
[2,]    4    7    4
[3,]    9    2    1
> source('~/Desktop/github_repo/ProgrammingAssignment2/cachematrix.R') </BR>
> x <- makeCacheMatrix(matrix(c(1, 4, 9, 3, 7, 2, 8, 4, 1), ncol=3))  </BR>
> x$get()
     [,1] [,2] [,3]
[1,]    1    3    8
[2,]    4    7    4
[3,]    9    2    1
> inverse = cacheSolve(x)
> inverse
             [,1]        [,2]        [,3]
[1,]  0.002898551 -0.03768116  0.12753623
[2,] -0.092753623  0.20579710 -0.08115942
[3,]  0.159420290 -0.07246377  0.01449275
