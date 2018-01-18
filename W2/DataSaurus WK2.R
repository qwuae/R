      ### In this script we are going to 
      ### quickly explore some more of the basics of creating graphics in R
      ### (NB there will be spelling mistakes in teh comments :)
      
      ### don't try to remember EVERYTHING, don't get too bogged down in the details
      ### you just need to get a feel for R and computing

      ### when constructing your own code there will be ALOT of trial and error
      ### so this is a slightly artifical/skewed view of using R
      ### you will learn the most when you "learn by doing"

#____________________________________________________________________________________________
# 1 # we will use a dataset that is in the'Datasaurus' package
    # to make this easy I have donwloaded it for you
    # look in moodle, download the file 
    # and then set your working directory to its location

    # you can set the working directory manually via the 'session' tab 
    
    # or you could copy and paste its location to the 'setwd' function
    # this allows you to SET your Working Directory in code
    
    setwd( "F:/Storage/Documents/GitHub/R/W2" )
    
    # to read csv data in you use the 'read.csv' function
    
    read.csv("datasaurus.csv")
    
    # we'll give the dataset a short name to make our code tidier.
    
    d12 <- read.csv("datasaurus.csv")
    
    # the summary shows us it has three columns
    # the name of the dataset, and then numbers in x and y 
    
    summary(d12)
    
    # we can also get the column names using the 'names' function
    
    names(d12)
    
    # do you remember that we can pick a column from the data using the '$' symbol?
    # so if we write d12$x we would get the number in x for example
    
    # we'll have a look at the column called 'dataset'
    
    d12$dataset
    
    d12$x
  
#____________________________________________________________________________________________
# 2 # we want to find out why this is called datasaurus?
  
    # our first plot will be off ALL the data
    
    plot(d12$x, d12$y)
    
    # depending on your setup in R studio the plot will appear in 
    # the 'plots' window (bottom right of R studio)
    # or perhaps a separate graphics device...
    
    # a new graphics device can be initiated using 'dev.new()'
    # note that this device is now the 'active' graphics device
    
    dev.new()
    plot(d12$x, d12$y)
    
    # this is a bit of a mess!
    # there were a few different values for 'dataset' in the data
  
    # how are we going to look through them all?
    # we can pick a single dataset categorey using code like this
    
    d12[d12$dataset=="star", ]
    
    # does that look complicated?!?!
    
    # let's break it down
    # we have a column called 'dataset'
    
    d12$dataset
    
    # and we just want the data where this column is 'star'
    # we write this with a double equals sign
    
    d12$dataset=="star"
    
    # this code has now told us which rows have value 'star'
    # if the value =='star R has told us it is 'TRUE'
    
    # we can use this to select data from 'd12'
    
    # maybe we could put it into the square brackets? 
    # do yo uthink this will work?
    d12[ d12$dataset=="star" ]
    
    # the error message suggests we haven't specified the columns
    # so we add a comma
    
    d12[d12$dataset=="star", ]
    
    # this code means...
    # in d12
    # find the rows where d12$dataset=="star"
    # the column indicates what we would like in terms of columns
    
    # we could have said 'just give us column 1' ... or 2 or 3 
    d12[d12$dataset=="star", 1]
    d12[d12$dataset=="star", 2]
    d12[d12$dataset=="star", 3]
    
    # or all three columns
    d12[d12$dataset=="star", 1:3]
    
    # which is just the same as 
    d12[d12$dataset=="star", ]
    
    # this will make more sense the more you do it...
    
    # we'll pick  a different value of 'dataset'
    # ... and give it to a variable of that name
    
    dino <- d12[d12$dataset=="dino", ]
    
    # and plot it....
    
    plot( dino$x, dino$y  ) 
    
    # remembering that '$' let's us specify which column we want 
    
    # so this is why it is called 'datasaurus' ... because it has a dinosaur in it!!!
    # this isn't earth shattering news, but we have learnt alot in the process
    
#____________________________________________________________________________________________
# 3 # we will use the dino data set to find out more about R graphics
    
    # there are a variety of different plot types
    # e.g a line graph is produced by type ='l'
    
    plot(dino$x, dino$y, type = 'l' )
    
    # and points are drawn by 'p'
    # this is the default for this kind of data
    
    plot(dino$x,dino$y, type = 'p' )
    
    # in the last section we saw that it is straightforward to customise the plots
    # to make the colour blue...
    
    plot(dino$x, dino$y, type = 'l' , col="blue")
    
    # blue with thick Line WiDths
    
    plot(dino$x, dino$y, type = 'l' , col="blue", lwd=2)
    
    # blue points 
    
    plot(dino$x, dino$y, type = 'p' , col="blue")

    
    ### ??????????????????????????????????????????????????????????????????
    ### can you plot the T Rex with percentage signs '%' as the points ???
    ### can you make the points LARGE and your favourite colour ???
    ### write your code here ...
    
    plot( dino$x, dino$y, type = 'n', col = "skyblue")
    
    ### hint: just google 'R pch' and look at the image search
    ### https://www.google.co.uk/search?q=R+pch&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjYhb73rNzWAhUKLcAKHYDoArgQ_AUICigB&biw=1365&bih=659
    
    # there are other plot types
    # "p","l", "n", "h", "o", "b", "c", "s", "S"

    # wouldn't it be easier if we could show all these plots at once?
    # the 'par' function can help us as it determines lots of the graphical features
    
    # we will use this code to draw 3 rows of plots in 3 columns
    par( mfrow=c(3,3) )
    # mfrow means the plots are drawn by row (we could use mfcol to draw by column) 
    # and we have given mfrow two numbers
    # the first determines the number of rows
    # and the second defines the number of columns
    # remember, rows then columns, rows-columns rows-columns rows-columns...
    
    # now we can draw all these plots at once 
    plot(dino$x, dino$y, type = 'p' )
    plot(dino$x, dino$y, type = 'l' )
    plot(dino$x, dino$y, type = 'n' )
    plot(dino$x, dino$y, type = 'h' )
    plot(dino$x, dino$y, type = 'o' )
    plot(dino$x, dino$y, type = 'b' )
    plot(dino$x, dino$y, type = 'c' )
    plot(dino$x, dino$y, type = 's' )
    plot(dino$x, dino$y, type = 'S' )
    
    # using par(mfrow=c(...) is very handy for basic layouts 
    # especially when we are learning about plots

    
    ### ????????????????????????????????????????????????????????????????????????
    ### can you tell the graphics device to draw two plots next to each other???
    
    par(mfrow=c( 2, 2 ) )
    
    ### remember that the numbers should be the number of rows then columns
    
    # we can use this to see what the difference is when we customise the plot 
    
    plot(dino$x, dino$y)
    plot(dino$x, dino$y, las=1) 
    
    # can you see what has changed?
    # what doe 'las' do?
    
    # it might make it clearer to change the axis colour....

    plot(dino$x, dino$y)
    plot(dino$x, dino$y, las=1, col.axis="red") 
    
    # let's use these paired plots to see some of the things we can control, and how...

    # note that we can also set some features in 'par'
    par(mfrow=c(1,2))
    
    par(las=1)
    plot(dino$x, dino$y)
    
    par(las=2)
    plot(dino$x, dino$y, col.axis="red")
    
    # what do 'xaxs' & 'yaxs' control? 
    
    par( mfrow=c(1,2) )
    
    plot(dino$x, dino$y)
    plot(dino$x, dino$y, xaxs='i', yaxs='i')
    
    # if you needed to know the coordinates of the axis
    # you could use this...
    
    par("usr") # returns the x min, x max, ymin, y max
    
    par(mfrow=c(1,2))
    plot(dino$x, dino$y)
    par( "usr" )
    
    plot( dino$x, dino$y, xaxs='i', yaxs='i' )
    par( "usr" )
    # now we can see the difference and have the evidence
    
    # we can also switch the  axes on and off as we saw previously
    # axes=F is axes = FALSE, both pieces of code work 
    
    par( mfrow=c(1,2) )
    
    plot( dino$x, dino$y)
    plot( dino$x, dino$y, axes=F )
    
    # how do we get the axes back?
    # type/run each line of code individually
    
    axis( 1 )
    axis( 2 )
    axis( 3 )
    axis( 4 )
    box()
    
    # remember that the order is bottom (1), left(2), top(3), right(4)
    
    # it is a bit annoying that we can't see the axis on the right
    # but we can alter the MARgins of the plot using par

    
    par( mfrow=c(1,2) )
    
    plot( dino$x, dino$y )
    axis( 4 )
    
    par( mar=c( 4,4,4,4 ) )
    plot( dino$x, dino$y )
    axis( 4 )
    
    # like the numbering in the axis
    # the values in 'mar' reference the bottom, the left, then the top and right
    # beacuse it is a list of numbers we declare it in 'c(...)'
    
    # we can place this in the same call to 'par' as our layout     
    par( mfrow=c(1,2), mar=c( 4,4,4,4 ))
    
    plot(dino$x, dino$y)
    
    ### ????????????????????????????????????????????????
    ### can you rememeber how to switch off the axis ???
    
    plot(dino$x, dino$y, ??? )
    
    axis(1)
    axis(2)
    axis(3)
    axis(4)
    box()
    
    #
    #
    #
    #
    #
    #
    #
    #
    #
    #
 #  #  #
  # # #
   ###
    #
    
    # everything is configuarble...

    par(mfrow=c(1,2), mar=c(4,4,2,1))
    
    plot(dino$x, dino$y, axes=F )
    axis(1) # this gives us the  default axis
    
    plot(dino$x, dino$y, axes=F )
    axis(1, at = c(40,60,100)) # this draws and axis at these points...      
    
    # try this...
    par(mfrow=c(1,2), mar=c(4,4,2,1))
    plot(dino$x, dino$y, axes=F )
    axis(1) 
    
    plot(dino$x, dino$y, axes=F )
    axis(1, at = dino$x)  # you can even give the axis a vector...
                          
    ### ????????????????????????????????????????????????
    ### where has it drawn the tick marks on the axis???
    
    # we can also  change labels...
    # so we specify where the tick marks are located and what the labels are
    
    par(mfrow=c(1,2), mar=c(4,4,2,1))
    plot(dino$x, dino$y, axes=F )
    axis(1, at = c(40,60,100))      
    
    plot(dino$x, dino$y, axes=F )
    axis(1, at = c(40,60,100), labels = c("OUT", "OF", "DATA"))      
    

    ### ??????????????????????????????????????????????
    ### can you make some paired plots of your own ???
    ### remember that when you use 'plot' you are also using all its defaults
    ### you can change these in your paired plots and look up details using:
    
    ?par
    
    plot( dino$x, dino$y,
          type='p', # a plot with points
          pch = 1,# using open circles as the points
          col="black", # with a black as the colour
          axes=T, # including axes
          main = "", # no title is specified
          xlab = "x", # uses the variable name
          ylab = "y", #also the variable name
          cex = 1, # the point size
          asp = 0, # each interval on the x axis scales to 1 unit on the y axis
          ann = T, # annotation is switched on, e.g. axis labels
          bty = "o", # the box type drawn around the plot
          cex.axis = 1, # the relative size of axis text
          cex.lab = 1, # and the relative sixe of the labels
          col.axis="black", # # the axis colour
          col.lab="black", # the label colour
          fg="black", # colour for axis ticks and teh bounding box
          las=0, # rotation of the text in axis labels
          xaxs="r", # controls the axes range, the default extends the data range by 4%
          yaxs="r", # and a sepearte control for the y axis
          xaxt="s", # tells R if we want an x axis
          yaxt="s", # and for the y axis
          # there are more arguments and defaults ... 
          # which you can find in the documentation for 'par' and 'plot'
          # aswell as for other specific plot types
    )    
    
    
#____________________________________________________________________________________________
# 4 # adding object to plots
    
    # starting with a plot
    
    plot( dino$x, dino$y ) 
    
    # we can add a rectangle
    
    rect(30,30,40,40)
    
    # this draw a rectangle with bottom left corner 30, 30
    # and top right corner 40, 40
    
    # we can change the colour
    
    rect(45,45,55,55, col="hotpink")    
    
    # we can change the border of the rectangle too...
    
    rect(60,60,70,70, col="hotpink", border ="blue")    
    
    # or 'switch off' the border
    
    rect(75,75,85,85, col="hotpink", border =F)    
    
    ### ???????????????????????????????????????????????????????????????????
    ### can you add a rectangle so the T Rex is holding a peice of paper???
    
    
    # we can also use vectors in rect
    # and calculate values based on vectors  
    
    plot(dino$x, dino$y, type='n')
    rect(dino$x, dino$y, dino$x +5, dino$y + 5)
    
    # now a rectangle has been drawn at each of our points
    # and the rectangle is 5 units wide and 5 units high
    
    # we can't see the top values properly
    # so let's change the axis range
    # and centre the rectangles on the data coordinates 
    
    ### ??????????????????????????????????????????????????????????????????
    ### can you alter the values in xlim and ylim so there is more room???
    
    plot( dino$x, dino$y, type='n', xlim=c(???, ???), ylim=c(???, ???) )
    
    
    # then you can add in the rectangles so they are centred on the points
    
    hw <- 2.5 # 'hw' is Half the Width of the rect
    rect(dino$x-hw, dino$y-hw, dino$x+hw, dino$y+hw)
    
    #    hw
    #   |---|
        ###########
        #    |    #
        #    |    #
        #    *    #
        #    |    #
        #    |    #
        ###########
    #        |----|
    #          hw  
      
    # notice that we have now give 'rect' a vector/variable 
    # as well as carrying out some "maths" in the function

    # we could replace the rectangles with text specifying the values

    plot(dino$x, dino$y, type='n', xlim=c(15, 105), ylim=c(-5, 105))
    text(dino$x, dino$y, labels = dino$x)
    
    # to add both values we can use 'paste'
    # as there are lots of decimal points we can use 'round' to cut the unwanted digits off
    
    plot(dino$x, dino$y, type='n', xlim=c(15, 105), ylim=c(-5, 105))

    # note that text is smaller using the 'cex' argument 
    # like lwd, cex defaults to 1
    
    text(dino$x, dino$y, 
         labels = paste( round(dino$x, digits=1), " , ", round(dino$y, digits=1)), 
         cex=0.4)
    
    # there is quite alot going on here
    # firstly we are rounding a number to 1 decimal place (1 'digit')
    
    dino$y
    round(dino$y, digits=1)
    
    paste("we", "are", "also", "pasting", "that", "text", "together")
    
    # as we have seen it is easy to add lines to a plot
    
    plot(dino$x, dino$y, type='n', xlim=c(15, 105), ylim=c(-5, 105))
    lines(dino$x, dino$y)
    
    # but also arrows ...
    
    plot(dino$x, dino$y, type='n', xlim=c(15, 105), ylim=c(-5, 105))
    arrows(dino$x, dino$y-5, dino$x, dino$y+5)
    
    # the first two coordinates are the start point and the second two are the end
    
    # if you are unsure of what "arguments" a functions takes
    # you can press the TAB button on the keyboard when the cursor is inside the brackets
    
    arrows(  )
    
    # the arrows can be used to draw error bars by changing the arguments
    # code=3 draws an arrowhead at both ends
    # the angle should be 90 to flatten the arrow
    # length is the width of the arrow head
    
    plot(dino$x, dino$y, type='n', xlim=c(15, 105), ylim=c(-5, 105))
    arrows(dino$x, dino$y-5, 
           dino$x, dino$y+5, 
           code=3, 
           angle=90, 
           length=0.04)
    
    points(dino$x, dino$y, pch=19)
    
    
#____________________________________________________________________________________________
# 5 # computing skills that can make everything easier
    
    # remember how pleased we were when we could draw all the types of plot at once!
    
    par( mfrow=c(3,3) )
      plot(dino$x, dino$y, type = 'p' )
      plot(dino$x, dino$y, type = 'l' )
      plot(dino$x, dino$y, type = 'n' )
      plot(dino$x, dino$y, type = 'h' )
      plot(dino$x, dino$y, type = 'o' )
      plot(dino$x, dino$y, type = 'b' )
      plot(dino$x, dino$y, type = 'c' )
      plot(dino$x, dino$y, type = 's' )
      plot(dino$x, dino$y, type = 'S' )
    
    # this is a lot of code, a lot of typing, and a lot of copy and pasting
    # we could use something called a 'for' loop to make it even simpler...
    
    par(mfrow=c(3,3)) # this will reset the settings for the plot
    
    # and this code will draw a plot for each value of 'i' in the for loop
    for (i in 1:9) plot(dino$x, dino$y, type = 'l' )
    
    # for loops allow us to do things over and over again
    # for example, can you type every number from 1 to 1 million?
    
    # R can print it for you
    for(i in 1:1000000) print(i)
    
    # R can
    # (if you get bored you can press the Esc button :)
    
    # for loops are amazingly useful
    # just like we printed the i value,
    # we could use the 'i' value to define chracteristics in the  plot
    # for instance, the i value can be used to select an arbitary colour
    
    par(mfrow=c(3,3)) 
    for (i in 1:9) plot(dino$x, dino$y, type='l', col = i )
    
    # or line widths
    par(mfrow=c(3,3)) 
    for (i in 1:9) plot(dino$x, dino$y, type='l', col = i , lwd=i)
  
    # or the size of points in a type 'p' plot
    par(mfrow=c(3,3)) 
    for (i in 1:9) plot(dino$x, dino$y, type='p', cex=i)
    
    # or the kind of points in a type 'p' plot
    par(mfrow=c(3,3)) 
    for (i in 1:9) plot(dino$x, dino$y, type='p', pch=i)

    # but let's go back to the initial point of there being lots of plot types
    # so let's create a vector of the diffrent plot types
    
    plotTypes <- c( "p","l", "n", "h", "o", "b", "c", "s", "S" )
    
    length(plotTypes)
    
    # and use that vector to define the type
    
    par(mfrow=c(3,3)) 
    for(i in 1:length(plotTypes)) plot(dino$x, dino$y, type= plotTypes[i])
    
    # isn't that easier than writing all those lines of code like we did above?

        # if you are unfamiliar with for loops the it can be explained like this ...
        # the for loop starts at the value i=11... 
        # then runs the code with that value of i...
        # in this code plotTypes[i] gets the value of i from the for loop...
        # then finds that item in plotTypes... # plotoTypes[i]
        # and returns that to the type in the plot function...
        # the plot is drawn and the loop goes back to the start
        # but the value increase by 1 so i then equals 2.... 
        # the for loop keeps going until finally i=9 is reached
        # which is the length of the vector 'plotTypes'
    
        # ask a friend or put your hand up if you want to go through it in more detail

    # with this small bit of code we only have to specify 'plot' once!
    
    par(mfrow=c(3,3)) 
    for(i in 1:length(plotTypes)) plot(dino$x, dino$y, type= plotTypes[i])
    
    # this is very neat
    # we can make it even neater by just using 'plotTypes' in the 'for' loop
    # the for loop then goes through each element in plotTypes
    
    par(mfrow=c(3,3)) 
    for(i in plotTypes) plot(dino$x, dino$y, type= i)
    
    # if we wanted to use even less space 
    # we could use a semicolon ';' to denote the end of a line
    # this isn't necessarily helpful, but it is worth knowing 
    
    par(mfrow=c(3,3)); for(i in plotTypes) plot(dino$x, dino$y, type= i)
    
    # note that we could use any letter or word in the for loop
    # e.g. for( anyletter in 1:100 )... this would use 'anyletter' from 1 to 100
    
    par(mfrow=c(3,3))
    for(anyletter in plotTypes) plot(dino$x, dino$y, type= anyletter)
    
    # by adding in the 'main' argument we can set the title
    # the paste function allows us to combine text with the values
    
    ### ???????????????????????????????????????????????????????????
    ### using 'paste()', can you add in the title for each type ???
    ### look it up in par to see what how the MAIN title is refered to
    
    #
    #
    #
    #
    #
    #
    #
    #
    #
    #
    #
    #
    #
    #
    #
    #
 #  #  #
  # # #
   ###
    #    
    
    par(mfrow=c(3,3)) 
    for(i in 1:length(plotTypes)){
      plot(dino$x, dino$y, 
           type= plotTypes[i], 
           main = paste("type= ", plotTypes[i]))
    }
 
    # using the curly brackets allows us to write multiple lines of code 
    # within the for loop...
    
    # just like normal brackets they have to be paired
    # opening and closing the curly brackets around the code you would like to rerun 
    
    # we can use par to increase the MARgins of the plot
    # remember, the numbers refer to the bottom, left, top and right axes in that order
    # now you should be able to see the axis labels and the title (main)

    par(mfrow=c(3,3), mar=c(4,4,2,1))
    for(r in 1:length(plotTypes)){
      plot(dino$x, dino$y, type= plotTypes[r], main = paste("type= ", plotTypes[r]))
      # 'paste' allows you to combine free text ("the bit in qoutes") with variables
    }
    
    # you can change the axis labels if you like
    # otherwise R will use the vector names
    par(mfrow=c(3,3), mar=c(4,4,2,1))
    for(r in 1:length(plotTypes)){
      plot(dino$x, dino$y, 
           type= plotTypes[r], 
           xlab="the x axis", ylab="the y axis")
    }
    
    # some people find for loops very natural to understand
    # but for many people (including me) they can take a bit of getting used to
    
    # it is just a way of repeating some code over and over
    # they are called 'for' loops as an operation is looped for a specified set of values

    # feel free to go back and make sure you feel happy with the idea!
    
    
#____________________________________________________________________________________________
# 5 #  using the for loop to select data
    
    # remember our first plot?
    
    dev.new()
    plot(d12$x, d12$y)
    
    # this was very messy so we looked at the 'dino' data set on its own
    # could we look at all the datasets indivdually, in the same plot?
    
    # first we need to extract all the types of 'dataset' 
    # the easiest way is to convert those names to 'factors'
    
    as.factor(d12$dataset)
    
    # we could have done this when we read the data in
    # if we used the following read.csv("datasaurus.csv", stringsAsFactors = T)
    
    # a 'factor' is just like a catagorey
    # note that at the bottom of the console it says "13 Levels: away bullseye..."
    
    # we can extract all the unique levels of that factor using 'levels'
    
    levels( as.factor(d12$dataset) )
    
    # we can assign this to a variable so we can use it later
    d12lev <- levels(as.factor(d12$dataset))
    
    # if we want to know how many factors there are we can use 
    length(d12lev)
    
    # there are 13 levels so we need to pick a suitable combination for 'mfrow'
    # so that we can plot all the levels on one device
    
    par(mfrow=c(5,3))
  
      #then using a for loop to go through each level
    
    for(r in 1:length(d12lev) ){
      # to make the code more user friendly, we assign the data set to a variable
      # this is just like when we selected the dino data
      datLev <- d12[d12$dataset==d12lev[r],]
      # then we plot that data
      plot(datLev$x, datLev$y, type='p', pch=19, cex=0.2)
    }

    # simple!
    
    par(mfrow=c(5,3))
    # beacuse the data are a bit 'squished' let's increase the margins of the plots
    # using 'par' we can set the MARgins (as above)
    # (NB if you have already reset the margins the device remembers those settings!)
    par(mar=c(1,1,1,1)) 
    for(r in 1:length(d12lev) ){
      datLev <- d12[d12$dataset==d12lev[r],]
      plot(datLev$x, datLev$y, type='p', pch=19, cex=0.2, 
           # also note that the data range for each data set differs
           # we can add the 'xlim' and 'ylim' arguments in the plot function to set them 
           # in this case we set them to the min and max values
           xlim=c(min(d12$x), max(d12$x)) , ylim=c(min(d12$y), max(d12$y)))
    }

    # our code then looks like this....
    # code can look complicated 
    # but we can understand each piece individually (given time)
    # no one expects you to read code immediately!

    
    # jsut look at this code 
    # and think how much you could actually say about it!
    
    par(mfrow=c(5,3))
    par(mar=c(1,1,1,1))
    for(r in 1:length(d12lev) ){
      datLev <- d12[d12$dataset==d12lev[r],]
      plot(datLev$x, datLev$y, type='p', pch=19, cex=0.2, 
           xlim=c(min(d12$x), max(d12$x)) , ylim=c(min(d12$y), max(d12$y)))
    }
    
    ##__ review and encouragement
    
    # you have done a huge amount already...
    # you have learnt about plots, types, variables, and basic layouts....
    # and some things that can be quite hard... for loops and data subsetting
    
    # remember, it is near impossible to remember everything first time
    # but it is very possible to remember where to find things out
    # type ?par into the console
    # do some google searches when you have a problem, there is alot of help there!
    
    # the main goal with this is that you get a feel for code
    # what it looks like
    # how it is consturcted
    # what you can do with it
    
    # it may seem hard but the more examples we construct 
    # the more familiar you will get 
    
    
#____________________________________________________________________________________________
# 6 #  creating shapes with the polygon function
    
    # our dinosaur is missing an eye!
    
    # can we work out how to add that to the plot?
    
    # to start with let's draw all the points 
    # to see if we can find the eye coordinates
    # there are 142 data points in x
    
    length( dino$x )
    
    # so we'll set the graphics device so we could see a plot for each point
    
    par(mfrow=c(12,12))

    # we don't need axes and have lots of plots so let's set the margins to equal zero... 
    
    par(mar=c(0,0,0,0))
    
    
    # firstly let's draw a blank plot with a number in the background
    for(r in 1:length(dino$x)){
      plot(dino$x, dino$y, type='n', axes=F)
      # display each value of r in the background  
      text(50, 60, labels=r , col="skyblue", cex=3)
    }
    
    # we will now add a point in each iteration of the for loop
    par( mfrow=c(12,12), mar=c(0,0,0,0) )
    for(r in 1:length(dino$x)){
      plot(dino$x, dino$y, type='n', axes=F)
      text(50, 60, labels=r , col="skyblue", cex=3)
      # then plot the data points 
      points(dino$x[r], dino$y[r], pch=19, cex=0.3)
    }

    # we can see that the points are moving around 
    # but it would help to see every point from the beginning to that value of r
    
    ### ?????????????????????????????????????????
    ### can you think of how you would do this???
    
    # for example, if we wanted to draw the first thirty rows/points we could do this   
    points(dino$x[1:30], dino$y[1:30], pch=19, cex=0.3)
    
    
    #
    #
    #
    #
    #
    #
    #
    #
    #
    #
 #  #  #
  # # #
   ###
    #    
    
        
    # the whole code would look like this
    
    par( mfrow=c(12,12), mar=c(0,0,0,0) )
    for(r in 1:length(dino$x)){
      plot(dino$x, dino$y, type='n', axes=F)
      text(50, 60, labels=r , col="skyblue", cex=3)
      # then plot the data points up to that value of r
      points(dino$x[1:r], dino$y[1:r], pch=19, cex=0.3)
    }
   
    ### ?????????????????????????????????????????
    ### which number doe the eye first appear at?
    ### when does it finish?
    ### hint: look for where the nostril appears!
        

    ### ??????????????????????????????????????????????????
    ### can you draw 'lines' using the eye corrdinates ???
    ### can you make that line thick, and a bright colour?
    
    #
    #
    #
    #
    #
    #
    #
    #
    #
    #
 #  #  #
  # # #
   ###
    #    
    
    # in a new plot
    dev.new()
    # plot the dinosaur
    plot(dino$x, dino$y )
    
    # then we'll add your polygon
    
    polygon(dino$x[65:75], dino$y[65:75], col="black")
    
    # polygons can be extremely useful... and are essential when  drawing maps
    
#____________________________________________________________________________________________
# 7 #  saving your images
    
    # R has lots of graphics devices, we have just been using the default
    
    # for example the PNG device....
    # this is 'optimised' for PNGs and each device type has slight differences.
    
    # to save our plot we'll use this.
    # first select the directory you are working from/and want to save to
    # note that we use \\ rather than a single slash
    # this is a very minor annoyance as a single slash means something else...
    # ... we just have to accept it!
    
    setwd("C:\\Users\\Greg\\Documents\\Warwick - CIM\\Anti-Tufte")
    # setwd = SET Working Directory
    # you could do this in R studio but using code is best
    
    # then open the png device, stating a file name and any other arguments you need.
    png(file= "PNGtester.png", width=400, height= 400, res=45)
    # draw the plot
    plot(dino$x,dino$y, type ="p")
    # turn the device off
    dev.off()
    
    ### ?????????????????????
    ### where is this plot???
    
    # you can change parametrs such as the resolution... see the 'res' argument
    # compare this with the previous plot
    setwd("C:\\Users\\Greg\\Documents\\Warwick - CIM\\Anti-Tufte")
    png(file= "PNGtesterHIRES.png", width=400, height= 400, res=120)
    plot(dino$x,dino$y, type ="l")
    dev.off()
    
    # also pdfs...
    pdf("PDFtester.pdf")
    plot(dino$x, dino$y, type ="l")
    dev.off()
    
    # note that the defaults can differ.
    # for instance width and height have different units in PNG and PDF
    pdf("PDFtesterWIDE.pdf", width=7, height=2)
    plot(x,y, type ="l")
    dev.off()
    
    # you can also specify the width and height in a new graphics device.
    dev.new(width=5, height=10)
    dev.new(width=20, height=12)
    
#____________________________________________________________________________________________
# 7 #  different kinds of plot
    
    # so far we have just used 'plot'
    # there are other inbuilt plot types 
    
    par(mfrow=c(4,2))
    par(mar=c(0,0,0,0))
        barplot(dino$x)
        barplot(dino$x, horiz=T )
        hist(dino$x)
        pie(dino$x[1:10])
        boxplot(dino[, c("x", "y")])
        # some are better used with other data
        data(volcano)
        persp( volcano)
        contour( volcano ) 
        # and some are contained within other libraries
        require(plotrix)    # you will have to install this... can you rememebre how?
                            # go to 'tools' > 'Install Packages' ...
        pie3D(dino$x[1:10])
        
    # each type of plot/chart/graph in R can require a whole lesson 
    # and can have its own expectations of data format
    # each has different possibilities and limitations 
    # we will explore this some more later on...

        
    #__ more encouragement!
    
    # with these tools you really can do a huge range of things
    # most importantly you understand the components of plot, and what to look out for
        
    # we'll use these skills in the examples that follow 
    # often these choices will be made (taken away) from you
    # but you will understand the "magic" of the method
        
    # remember, remember, remember that repetition is the key to learning

    # even if you haven't understood every details you have come a long way
    # give yourslef a pat on the back!
        
    # you deserve a rest so see you next week...
    # but if you are keen...
    # set yourself a challenge to do something more with the datasuarus!
    # the more you do the more you will learn!
        
        
    # CREDITS: google 'datasaurus' to find out more about the dataset
