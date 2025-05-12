#### Setup ####

#Set my working directory to Sde_phenotyping

setwd("C:/Users/salva/Downloads/Sde_phenotyping_new")

# #Install recolorize
# install.packages("recolorize")

#Load packages
library(recolorize)

#Note: Before running the rest of this code, make sure to edit the photograph. In Adobe Express, I removed the background, increased the sharpness to 50, and set highlights to -100 (to remove any light reflection).

#### Using the package ####

#User Guide that Walks through the Package: https://hiweller.rbind.io/post/introduction-to-recolorize/

#Before reading in the image, make sure to remove the background of the image. I used Pixlr background remover (https://pixlr.com/remove-background/), but you can also use Adobe Express (https://www.adobe.com/express/feature/image/remove-background). 

# get the path to the image (comes with the package, so we use system.file):
img <- "C:/Users/salva/Downloads/Sde_phenotyping_new/recolorize/P7170195_input_test1_bgrm_cc.png"
img2 <- "C:/Users/salva/Downloads/Sde_phenotyping_new/recolorize/recolorize_input_test2_bgrm_cc.png"

# fit a color map
#Parameters, bins into 64 total clusters (4^3 = 64) and cutoff similarity for grouping color centers together = 45%
recolorize_obj1 <- recolorize2(img,
                              bins = 4,
                              cutoff = 45)

recolorize_obj2 <- recolorize2(img2,
                               bins = 4, 
                               cutoff = 45)




