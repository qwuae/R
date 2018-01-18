# firstly we'll  have a quick look at attributes you can alter in the graphics device
# you can alter pretty much everything... once you know where to look
# this example aims to give you an insight into what can be controlled and how
# as well as getting you to be more comfortable in R

# just rememeber that coding can be challenging, fun, frustrtaing and rewarding


    ### ????????????????????????????????????????????????????????????????????
    ### note that a question/challenge will appear like this ??? 
    ### the code following a question might not work until you alter it...

    # also remember that anything after a '#' is invisible to R
    # this allows us to right comments and instructions alongside code
    # you can write your own notes in this script

    # comments appear in green, just like the words you are reading right now

    # whereas code will appear in black and blue colours
    
    # if you run the above code you will get an error in the console
    # which will appear in red
    
    ### ??????????????????????????????????????????
    ### write your name below so it is a comment
    


    # as you work through this script, read the comments and run the code
    # ask any questions!
    # there are no silly questions!
    # mistakes are good for your learning!
    # you will not break aything if you get an error!!!!

#____________________________________________________________________________________________
# 1 # first let's create some 'dummy' data

    # we will create two vectors of random data  with the runif 'function'
    # if you run these lines of code again you will get new random numbers

    xR <- runif( 50, 80, 100 ) # this means "generate 50 random numbers between 80 and 100"
    yR <- runif( 50, 80, 100 )

    # which we can plot using the 'plot' function
    
    plot( xR, yR)

    # this has plotted xR on the x axis and yR on the y
    # the deafault is to use points
    # but you can also create lines using the 'type' argument

    plot( xR, yR, 
          type='l' )

    # our data is in the range of 80 to 100
    # if this were % data we could zoom out to show the data in context
    # by changing the scales of the plot with 'xlim' and 'ylim'

    plot( xR, yR, 
          type='p',  
          xlim=c(0,100), ylim=c(0,100) )
    
    ### ?????????????????????????????????????????????????????
    ### can you use this control to zoom in to the data ???
    
    # we can remove the axes by setting that argument to false
    # and we set the x and y labels as blanks
    # this code then only renders the data and nothing more
    
    plot( xR, yR, 
          axes=F, 
          xlab="", ylab="")
    
    
    # not that in the code we have open and closed brackets
    # this tells R what is relevant to that function
    
    # without the closed bracket R will expect some more information
    
    plot( x, y 
          
    # in the console you will see that there is a '+'...
    # also you will see that there are red circles with crosses in the script

    # a potential error will also be shown if a semi colon is used instead of a comma
    
    plot( x; y )

    # if you run this code with a semi colon
    # you will get an error "... unexpected symbols in..."
    # the 'arguments' in a 'function' should always be separated by commas

    ### ????????????????????????????????????????????????????????????????????????????
    ### correct these code errors so that the red circles and crosses dissappear ??? 
    
        
    # you will notice that Rstudio autocompletes brackets so you don't lose track 
    
    ### ???????????????????????????????????????????/
    ###  to see what happens type a ( 

    
    
#____________________________________________________________________________________________
# 2 # all these objects can be modified, for example:
    # the 'cex' argument changes the size of the points (the default being 1)
    
    plot( xR, yR, 
          axes=F, 
          xlab="", ylab="", 
          cex=5 )

    # and the 'col' argument controls the colour

    plot( xR, yR, 
          axes=F, 
          xlab="", ylab="", 
          cex=5, 
          col="hotpink" )

    # and the point type is defined by pch, with 19 being a filled circle
  
    plot( xR, yR, 
          axes=F, 
          xlab="", ylab="", 
          cex=500, 
          col="hotpink", 
          pch=19 )
    
    ### ??????????????????????????????????
    ### how big can you make the points???
    
    # many of these controls can take vectors (a list of numbers)
    # for instance, if we have a third set of data called 'zR'
    # we can set the size of each point using its value
    
    zR <- runif ( 50, 1, 5 )
    
    zR
    
    ### ????????????????????????????????????????????
    ### how would you set 'cex' by this vector ??? 
    ### you need to input something into ???
    
    plot( xR, yR, 
          axes=F, 
          xlab="", ylab="", 
          cex=???, 
          col="hotpink", 
          pch=19 )
    
    # when R inteprets this it draw a point at the first number in xR and yR
    # and then sets the size by the first number in zR
    # and so on... each point being set by the corresponding numbers in xR, yR and zR
    # this means these 'vectors' have to be the same length
    
    # for example, try plotting the numbers 1 to 5 ('1:5') against 1 to 6 ('1:6)
    
    plot ( 1:5, 1:6)

    # then try the following

    plot ( 1:5, 1:5, cex=1:6)
    
    # note that this plot still works even though you have specified 6 numbers for 'cex'
    
    # ????????????????????????????????????????????????????????
    ### why does it work???
    ### which values of 'cex=1:6' are 
    
    # 'par' can be used for many and varied controls
    # including background colour ('bg')
    
    par(bg="darkgrey")
    
    # we can then create a plot on the dark grey background
    
    plot( xR, yR, 
          axes=F, 
          xlab="", ylab="", 
          cex=zR, 
          col=rgb( 1,1,1, 0.5, maxColorValue = 1), 
          pch=19 )

    # note that we defined colour with 'rgb' so we could set the transparency 
    # in rgb the arguments control red, green, blue, alpha (tranparency)
    
    # you can think about the code as a 'form' that requests a plot
    # each "argument" defines attributes in the plot "function" 
    # it is just like you are being very specific about what you want
    # for example:
    
    par(bg="darkgrey") # set the background to black
        
    plot( xR, # specify the x data
          yR, # specify the y data 
          axes=F, # whether to include the axes
          xlab="", # the x axis label
          ylab="", # and y axis label
          cex=zR, # what size the points should be (if there are points)
          col=rgb( 1,1,1, 0.5, maxColorValue = 1), # colours 
          pch=19 # type of points
          )
        
    # it may seem more complicated, but this is usualy written as a single line
    # e.g.
    
    plot( xR, yR, axes=F, xlab="", ylab="", cex=zR, col=rgb( 1,1,1, 0.5, maxColorValue = 1), pch=19 )
    
    # this just saves space and will give you exactly the same result 
    # once we know what we are looking at the code is not so scary!

    
    # note that the spaces in the code are, in general, for us
    # the lines of code below do exactly the same thing
    # they just look different 
    
    plot(xR,yR,axes=F,xlab="",ylab="",cex=zR,col=rgb(1,1,1,0.5,maxColorValue=1),pch=19)
      
                    plot(      xR,      yR,
                     axes=F,                                        xlab="",ylab="",
      cex=zR,col=rgb(1,1, 1,0.5,maxColorValue=1
                                                  ),pch=19
      )    
    
    ### ??????????????????????????????????????????????
    ### what do you think good code would look like???
    ### alter the following code so it is formatted so you can read it  

                    plot(      xR,      yR,
                     axes=F,                                        xlab="",ylab="",
      cex=zR,col=rgb(1,1, 1,0.5,maxColorValue=1
                                                 ),pch=19
    )    
    
                    
    ### ??????????????????????????????????????????????????????????????????????
    ### how can you "break" this line of code by pressing the return button???
                    
    plot(xR,yR,axes=F,xlab="",ylab="",cex=zR,col=rgb(1,1,1,0.5,maxColorValue=1),pch=19)
                    
#____________________________________________________________________________________________
# 3 # an axis can be added back in using the 'axis' function
    # the first arguments sets the side, 1=bottom, 2=left, 3=top, 4=right

    plot( xR, yR, axes=F, xlab="", ylab="", cex=zR, col=rgb( 1,1,1, 0.5, maxColorValue = 1), pch=19 )
    axis( side= 1, col="white", col.axis="white")
    
    # we can control many aspects of the axis, such as the colours of each component 
    # and where the tick marks are 
    
    axis( side= 2, # the side where axis should appear 
         at=seq(80, 100, by=5), # where the tick marks should be
         col="white", # the colour of the  axis line
         col.ticks="hotpink", # colour for the ticks
         col.axis="turquoise1") # colour for the numbers/text
    
    
    # the text can be changed, if needed...

    plot( xR, yR, axes=F, xlab="", ylab="", cex=zR, col=rgb( 1,1,1, 0.5, maxColorValue = 1), pch=19 )
    axis( side= 1, col="white", col.axis="white")
    
    axis(2,                         # the side where axis should appear 
         at=seq(80, 100, by=5),     # where the tick marks should be
         labels= c("greg", "james", "nataliya", "joao", "michael"),
         col="white",               # the colour of the  axis line
         col.ticks="hotpink",       # colour for the ticks
         col.axis="turquoise1" )    # colour for the numbers/text
    
    
    ### ??????????????????????????????
    ### can you add another axis ???
    ### can you change its colours ???
    

    # we can add axes to any of the sides
    # and use a vector to define where the tick marks are 'at'
    
    axis(4, at=yR, col="white")

    # we will now add some lines, but only where the x value is bigger than the y
    # this code get's a vector of 'true' and 'false' for x > y
    
    TF <- xR > yR
    TF
    
    ### ??????????????????????????????????????????????????????
    ### can you write the code to to index xR and yR by TF ???
    
    ### when we say 'index' we mean that we are telling R where to look in a list
    ### if we wanted the first numbers from a vector we could use 'x[1]'
    ### for the first 5 elements we could  use 'x[5]'
    ### don't think too hard, have a guess it may work and it might not!
    
    lines( ??? , ??? , lwd=2, col="yellow" )
    
    # note that 'lwd' controls the line width
    
    # we can add more points over the top if we like
    # here we'll use 'zR' again but subtract 1 to make the circle smaller
    # as well as vectors, we can do some 'maths' in these functions
    
    points( xR, yR, 
            cex=zR-1, # for instance if we want to augment or scale a number 
            col="white", pch=19 )
    
    points( xR, yR, 
            cex=zR^2, # a number could be squared to exagerate the point size for example 
            col="white", pch=19 )

    # and add text, in this case where y is greater than x
    
    TF1 <- yR > xR 

    text( xR[TF1], yR[TF1], labels = round(yR, digits=1), 
          cex=0.8 , col="cyan3" ) 
    
    # note that 'cex' also controls thinge like text size

#____________________________________________________________________________________________
# 4 # you can add a title in the main plot function, but we can also use 'title'
    
    title( "Nothing to see here :)", col.main="white", cex.main=3 )

    # this also allows us to add axis labels back in
    
    title( xlab= "this is the x label", col="white" )
    
    ### ????????????????????????????????
    ### why can't you see the axis ???
    
    ### hint - check the documentation for colours - '?title'

    # you should now have a feel for how the graphics device works
    # and the kinds of ways you can control it
    
#____________________________________________________________________________________________
# 5 # here is all the code 
    # this 'program' looks less intimidating now you have been through all the steps
    # see what you can do to change the formatting
    # it doesn't have to 'look good'... 
    # ... just play around for a few minutes before moving on
    # can you change the size/colours for different components?
    
    par(bg="darkgrey")
    
    plot( xR, yR, axes=F, xlab="", ylab="", cex=4, 
          col=rgb( 1,1,1, 0.5, maxColorValue = 1), pch=19 )
        
        axis(1, col="white", col.axis="white")
        axis(2, at=seq(80, 100, by=5), col="white", col.ticks="hotpink", col.axis="turquoise1")
        axis(4, at=yR, col="white")
        
    TF <- xR > yR
    TF
      lines(xR[TF], yR[TF], lwd=2, col="yellow" )
    
    points( xR, yR, cex=1.6, col="white", pch=19 )
    
    TF1 <- yR > xR 
      text( xR[TF1], yR[TF1], labels = round(yR, digits=1), cex=0.8 , col="cyan3" ) 
    
    title("Nothing to see here :)", col.main="white", cex.main=3)
    title(xlab= "this is the x label", col.lab="grey80")
    title(ylab= "the y axis should also be labelled", col.lab="grey80")
    
    
    # it may be becoming clear that the code is read from top to bottom
    
    # close all the plots you have then try running the code out of order
    # close all of your graphics devices and then try....
    
    lines( xR, yR, col="yellow")
    
    plot( xR, yR )
    
    
    # also note that each object you create in the graphics device will be a layer
    # and so if we add something it will overlay the previous thing
    # so the last piece of code we run will produce the foreground
    #     ____ 
    #    /   /__
    #   /   /  /
    #  /___/  /___
    #    /   /   /
    #   /___/   /
    #    /     /
    #   /_____/
    #
    # for instance:

    plot( xR, yR )
        
    points( xR, yR, cex=1, col="red", pch=15 )
    
    points( xR, yR, cex=6, col="purple", pch=19 )
    
    lines( xR, yR, lwd=3, col="grey" )
    
    ### ?????????????????????????????????????????????????????
    ### can you change the order of this code so that we have:
    ### a purple  circle on top of the grey lines
    ### and the red square at the front ??? 
    
    
    # well done!
    # you have learnt alot already!
    # and that means learn as in 'experience' rather than having to learn every command
    
    