##  Debugging tools in R
##  Refer to Coursera R Programming Course from John Hopkins

###############################################
##########  Diagnosing the Problem   ##########
###############################################

#  Problem indicators
#  message, warning, error, condition

#  Warning statement

#log(-1)
    #   [1] NaN
    #   Warning message:
    #   In log(-1) : NaNs produced


printmessage <- function(x){
  
  if(x>0)
    print("x is greater than zero")
  else
    print("x is less than or equal to zero")
  
  invisible(x)  #  function that prevents autoprinting
  
}

printmessage(2)
    # [1] "x is greater than zero"

#  error message below
#printmessage(NA)
    # Error in if (x > 0) print("x is greater than zero") else print("x is less than or equal to zero") : 
    #   missing value where TRUE/FALSE needed


#   Try to take care of the NA values
printmessage2 <- function(x){
  
  if(is.na(x))
    print("x is a missing value!")
  else if(x>0)
    print("x is greater than zero")
  else
    print("x is less than or equal to zero")
  
  invisible(x)  #  function that prevents autoprinting
  
}

printmessage2(log(-1))
    # [1] "x is a missing value!"


###############################################
################  Traceback   #################
###############################################

#  traceback,debug,browser,trace,recover

#  traceback needs to be used right away

mean(value)
    # Error in mean(value) : object 'value' not found
traceback()
    # 1: mean(value)

lm(y-x)
    #  Error in stats::model.frame(formula = y - x, drop.unused.levels = TRUE) :   object 'y' not found
traceback()
    # 4: stats::model.frame(formula = y - x, drop.unused.levels = TRUE)
    # 3: eval(expr, envir, enclos)
    # 2: eval(mf, parent.frame())
    # 1: lm(y - x)

###############################################
##################  Debug  ####################
###############################################

#  Debug lm

debug(lm)
lm(y-x)
    # debugging in: lm(y - x)
    # debug: {
    #   ret.x <- x
    #   ret.y <- y
    #   cl <- match.call()
    #   mf <- match.call(expand.dots = FALSE)
    #   m <- match(c("formula", "data", "subset", "weights", "na.action", 
    #                "offset"), names(mf), 0L)
    #   mf <- mf[c(1L, m)]
    #   mf$drop.unused.levels <- TRUE
    #   mf[[1L]] <- quote(stats::model.frame)
    #   mf <- eval(mf, parent.frame())
    #   if (method == "model.frame") 
    #     return(mf)
    #   else if (method != "qr") 
    #     warning(gettextf("method = '%s' is not supported. Using 'qr'", 
    #                      method), domain = NA)
    #   mt <- attr(mf, "terms")
    #   y <- model.response(mf, "numeric")
    #   w <- as.vector(model.weights(mf))
    #   if (!is.null(w) && !is.numeric(w)) 
    #     stop("'weights' must be a numeric vector")
    #   offset <- as.vector(model.offset(mf))
    #   if (!is.null(offset)) {
    #     if (length(offset) != NROW(y)) 
    #       stop(gettextf("number of offsets is %d, should equal %d (number of observations)", 
    #                     length(offset), NROW(y)), domain = NA)
    #   }
    #   if (is.empty.model(mt)) {
    #     x <- NULL
    #     z <- list(coefficients = if (is.matrix(y)) matrix(, 0, 
    #                                                       3) else numeric(), residuals = y, fitted.values = 0 * 
    #                 y, weights = w, rank = 0L, df.residual = if (!is.null(w)) sum(w != 
    #                                                                                 0) else if (is.matrix(y)) nrow(y) else length(y))
    #     if (!is.null(offset)) {
    #       z$fitted.values <- offset
    #       z$residuals <- y - offset
    #     }
    #   }
    #   else {
    #     x <- model.matrix(mt, mf, contrasts)
    #     z <- if (is.null(w)) 
    #       lm.fit(x, y, offset = offset, singular.ok = singular.ok, 
    #              ...)
    #     else lm.wfit(x, y, w, offset = offset, singular.ok = singular.ok, 
    #                  ...)
    #   }
    #   class(z) <- c(if (is.matrix(y)) "mlm", "lm")
    #   z$na.action <- attr(mf, "na.action")
    #   z$offset <- offset
    #   z$contrasts <- attr(x, "contrasts")
    #   z$xlevels <- .getXlevels(mt, mf)
    #   z$call <- cl
    #   z$terms <- mt
    #   if (model) 
    #     z$model <- mf
    #   if (ret.x) 
    #     z$x <- x
    #   if (ret.y) 
    #     z$y <- y
    #   if (!qr) 
    #     z$qr <- NULL
    #   z
    # }
    # Browse[2]> 

#  Browser output - keep pushing n until the error

    # Browse[2]> n
    # debug: ret.x <- x
    # Browse[2]> n
    # debug: ret.y <- y
    # Browse[2]> n
    # debug: cl <- match.call()
    # Browse[2]> n
    # debug: mf <- match.call(expand.dots = FALSE)
    # Browse[2]> n
    # debug: m <- match(c("formula", "data", "subset", "weights", "na.action", 
    #                     "offset"), names(mf), 0L)
    # Browse[2]> n
    # debug: mf <- mf[c(1L, m)]
    # Browse[2]> n
    # debug: mf$drop.unused.levels <- TRUE
    # Browse[2]> n
    # debug: mf[[1L]] <- quote(stats::model.frame)
    # Browse[2]> n
    # debug: mf <- eval(mf, parent.frame())
    # Browse[2]> n
    # Error in stats::model.frame(formula = y - x, drop.unused.levels = TRUE) : 
    #   object 'y' not found

###############################################
################  recover  ####################
###############################################


options(error = recover)

read.csv("nosuchfile")
    # Error in file(file, "rt") : cannot open the connection
    # In addition: Warning message:
    #   In file(file, "rt") :
    #   cannot open file 'nosuchfile': No such file or directory
    # 
    # Enter a frame number, or 0 to exit   
    # 
    # 1: read.csv("nosuchfile")
    # 2: read.table(file = file, header = header, sep = sep, quote = quote, dec = dec,
    #               3: file(file, "rt")
    #               
    #               Selection: 

#  Selection will show the function error details.  









