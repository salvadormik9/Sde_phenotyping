#### Setup ####

#Set my working directory to Sde_phenotyping

setwd("C:/Users/salva/Downloads/Sde_phenotyping")

#Install recolorize
install.packages("recolorize")

#Load packages
library(recolorize)

#Note: Before running the rest of this code, make sure to edit the photograph. In Adobe Express, I removed the background, increased the sharpness to 50, and set highlights to -100 (to remove any light reflection).

#### Using the package ####

#User Guide that Walks through the Package: https://hiweller.rbind.io/post/introduction-to-recolorize/

# get the path to the image (comes with the package, so we use system.file):
img <- "C:/Users/salva/Downloads/Sde_phenotyping/P7170195_bgrm_cc.png"

# fit a color map
#Parameters, bins into 64 total clusters (4^3 = 64) and cutoff similarity for grouping color centers together = 45%
recolorize_obj <- recolorize2(img,
                              bins = 4,
                              cutoff = 45)




