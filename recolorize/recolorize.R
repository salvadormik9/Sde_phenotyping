#### Setup ####

#Set my working directory to Sde_phenotyping

setwd("C:/Users/salva/Downloads/Sde_phenotyping_new")

# #Install recolorize
# install.packages("recolorize")

#Load packages
library(recolorize)
library(magrittr)
library(magick)
#Note: Before running the rest of this code, make sure to edit the photograph. In Adobe Express, I removed the background, increased the sharpness to 50, and set highlights to -100 (to remove any light reflection).

#### Using the package ####

#User Guide that Walks through the Package: https://hiweller.rbind.io/post/introduction-to-recolorize/

#Before reading in the image, make sure to remove the background of the image. I used Pixlr background remover (https://pixlr.com/remove-background/), but you can also use Adobe Express (https://www.adobe.com/express/feature/image/remove-background). 

# get the path to the image (comes with the package, so we use system.file):
##using just the head
img <- "C:/Users/salva/Downloads/Sde_phenotyping_new/recolorize/Inputs/P7170195_input_test1_head_bgrm_cc.png"
img2 <- "C:/Users/salva/Downloads/Sde_phenotyping_new/recolorize/Inputs/P9050977_input_test2_head_bgrm_cc.png"
  #Image 2 was highly edited to make the colors more visible
img3 <- "C:/Users/salva/Downloads/Sde_phenotyping_new/recolorize/Inputs/P9050977_input_test3_head_raw_bgrm.png"
  #raw image version of Image 2 to compare against the highly edited

#### Testing ####
# fit a color map using recolorize2 that combines all the workflow steps
#Parameters, bins into 64 total clusters (4^3 = 64) and cutoff similarity for grouping color centers together = 45%
recolorize_obj1 <- recolorize2(img,
                              bins = 4,
                              cutoff = 45)

recolorize_obj2 <- recolorize2(img2,
                               bins = 4, 
                               cutoff = 45)


recolorize_obj3 <- recolorize2(img3,
                               bins = 4, 
                               cutoff = 45)


#### Basic Workflow if you want to change the smaller details####
#Initial Clustering Step: We bin all the pixels into 27 clusters (3^3)
init_fit_obj3 <- recolorize(img3,
                           method = "hist",
                           bins = 3,
                           color_space = "sRGB")


#Refinement Step: Combine clusters by their similarity
refined_fit_obj3 <- recluster(init_fit_obj3, 
                              cutoff = 45)


# Using recolorizeVector (need to debug this)
#recolorizeVector converts a bitmap (i.e. pixel) image to a vector image.
# img3_magick <- image_read("C:/Users/salva/Downloads/Sde_phenotyping_new/recolorize/Inputs/P9050977_input_test3_bgrm_cc.png")
# img3_flat <- image_flatten(image_background(img3_magick, "black"))
# 
# img3_flat_cropped <-image_trim(img3_flat)
# 
# img3_flat_cropped_small <- image_scale(img3_flat_cropped, "500")
# 
# image_write(img3_flat_cropped_small, path = "img3_cleaned.jpg", format = "jpg")  # forces no alpha
# 
# recolorize_obj3_clean <- recolorize2("img3_cleaned.jpg", 
#                                      bins = 4,
#                                      cutoff = 45)
# 
# rc_vector <- recolorizeVector(recolorize_obj3_clean, 
#                               size_filter = 0.01,
#                               smoothness = 3, 
#                               plotting = TRUE)
# 
# 
# # to save as an SVG:
# svg(filename = "corbett_vector.svg", width = 2, height = 4)
# plot(rc_vector)
# dev.off()


