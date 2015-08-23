## This pair of functions will create a special matrix object that can
##cache its inverse and also compute the inverse of the matrix, however
## the matrix supplied should be always invertible



## 
## The function creates a special "matrix object", which is really a list containing a function to
#Thus it caches the value of the inverse of the matrix input
##set the value of the matrix
##get the value of the matrix
##set the value of the inverse
##get the value of the inverse

makeCacheMatrix <- function(x = matrix())   
{                                      
  inv<-NULL                              
  set<-function(y)
  {
    x<<-y
    inv<<-NULL
  }
  get<-function() x
  setmatrix<-function(solve) inv<<- solve
  getmatrix<-function() inv
  list(set=set, get=get,
       setmatrix=setmatrix,
       getmatrix=getmatrix)
}

## 2.The following function calculates the inverse of the special
# "matrix" created with the makeCacheMatrix  function. However, it
## first checks to see if the inverse has already been calculated.
## If so, it gets the inverse from the cache and skips the
## computation. Otherwise, it calculates the inverse of the data
## and sets the value of the inverse in the cache via the setmatrix
##function.

cacheSolve <- function(x=matrix(), ...)  
{                                       
  inv<-x$getmatrix()
  if(!is.null(inv))
  {
    message("getting cached data")
    return(inv)
  }
  matrix<-x$get()
  inv<-solve(matrix, ...)
  x$setmatrix(inv)
  inv
  ## Returns a matrix that is the inverse of 'x'
}


