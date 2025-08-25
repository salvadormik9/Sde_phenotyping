
#### Setup ####

## Set my working directory to Sde_phenotyping
setwd("C:/Users/salva/Downloads/Sde_phenotyping_new")

## Install and load dependencies ##

#Install devtools to download patternize from GitHub 
#install.packages("devtools")
#library(devtools)
#install_github("StevenVB12/patternize")


#Install the following packages to get the patternize functions patLanRGB and patLanK
#install.packages("Morpho")
#devtools::install_github("zarquon42b/Morpho")

#Install BiocManager and EBImage to read in the images 
#install.packages("BiocManager")
#BiocManager::install("EBImage")


#Install raster to read in the images
#install.packages("raster")

## Load packages ##
library(patternize)
library(Morpho)
library(devtools)
library(raster)
library(viridis)

####New Code (Based on Patternize Tutorial) ####
#Patternize Step-by-Step Tutorial: https://github.com/StevenVB12/patternize
#Patternize Examples: https://github.com/StevenVB12/patternize-examples

#List with samples
IDlist <- c('P9051000',
            'P9051078',
            'P9061511')


#Make list with landmarks

prepath <- 'patternize/landmarks'
extension <- "_cc_landmarks.txt"
landmarkList <- makeList(IDlist, 'landmark', prepath, extension)

#Make list with images
prepath <- 'patternize/images'
extension <- '_cc.jpeg'
imageList <- makeList(IDlist, 'image', prepath, extension)


#transformref
target <- landmarkList[['P9051000']]

#run alignment of color patterns
RGB <- c(0,0,0)
rasterList_lanRGB <- patLanRGB(imageList, landmarkList, RGB, transformRef = target, resampleFactor = 3, 
                               colOffset = 0.15, crop = TRUE, res = 200, adjustCoords = TRUE, plot = 'stack')

# sum the colorpatterns
summedRaster_lanRGB <- sumRaster(rasterList_lanRGB, IDlist, type = 'RGB')

# plot heatmap
outline_P9051000 <- read.table("C:/Users/salva/Downloads/Sde_phenotyping_new/patternize/cartoon/P9051000_cc_outline.txt", h= F)
# lines_P9051000 <- list.files(path='cartoon',
#                            full.names = T)

colfunc <- inferno(100)
plotHeat(summedRaster_lanRGB, IDlist, plotCartoon = TRUE, refShape = 'target', outline = outline_P9051000, 
          landList = landmarkList, adjustCoords = TRUE,
         imageList = imageList, cartoonID = 'P9051000', cartoonFill = 'black', cartoonOrder = 'under', 
         colpalette = colfunc)



#### Patternize With Color-Corrected Edited Images ####
#Make list with images
prepath <- 'patternize/images'
extension <- '_cc_extreme.jpeg'
imageList <- makeList(IDlist, 'image', prepath, extension)

#transformref
target <- landmarkList[['P9051000']]

#run alignment of color patterns
RGB <- c(0,0,0)
rasterList_lanRGB_extreme <- patLanRGB(imageList, 
                               landmarkList,
                               RGB, 
                               transformRef = target, 
                               resampleFactor = 3, 
                               colOffset = 0.15, 
                               crop = TRUE,
                               res = 200,
                               adjustCoords = TRUE,
                               plot = 'stack')

# sum the colorpatterns
summedRaster_lanRGB_extreme <- sumRaster(rasterList_lanRGB_extreme, IDlist, type = 'RGB')

# read in outline of one of the fish
outline_P9051000 <- read.table("C:/Users/salva/Downloads/Sde_phenotyping_new/patternize/cartoon/P9051000_cc_outline.txt", h= F)

#plot the heatmap
colfunc <- inferno(100)
plotHeat(summedRaster_lanRGB_extreme,
         IDlist, plotCartoon = TRUE,
         refShape = 'target',
         outline = outline_P9051000, 
         landList = landmarkList,
         adjustCoords = TRUE,
         imageList = imageList,
         cartoonID = 'P9051000', 
         cartoonFill = 'black', 
         cartoonOrder = 'under', 
         colpalette = colfunc)

#### Patternize With Color-Corrected Edited Images of Just the Head ####

#Make list with images

IDlist <- c('P9051000',
            'P9051078',
            'P9061511')

prepath <- 'patternize/images'
extension <- '_cc_extreme_head.jpeg'
imageList <- makeList(IDlist, 'image', prepath, extension)

#Make list with landmarks

prepath <- 'patternize/landmarks'
extension <- "_cc_extreme_head_landmarks.txt"
landmarkList <- makeList(IDlist, 'landmark', prepath, extension)

#transformref
target <- landmarkList[['P9061511']]

#run alignment of color patterns
RGB <- c(0,0,0)
rasterList_lanRGB_extreme <- patLanRGB(imageList, 
                                       landmarkList,
                                       RGB, 
                                       transformRef = target, 
                                       resampleFactor = 3, 
                                       colOffset = 0.15, 
                                       crop = TRUE,
                                       res = 200,
                                       adjustCoords = TRUE,
                                       plot = 'stack')

# sum the colorpatterns
summedRaster_lanRGB_extreme <- sumRaster(rasterList_lanRGB_extreme, IDlist, type = 'RGB')

# read in outline of one of the fish
outline_P9061511 <- read.table("C:/Users/salva/Downloads/Sde_phenotyping_new/patternize/cartoon/P9061511_cc_outline_extreme_head.txt", h= F)

#plot the heatmap
colfunc <- inferno(100)
plotHeat(summedRaster_lanRGB_extreme,
         IDlist, plotCartoon = TRUE,
         refShape = 'target',
         outline = outline_P9061511, 
         landList = landmarkList,
         adjustCoords = TRUE,
         imageList = imageList,
         cartoonID = 'P9061511', 
         cartoonFill = 'black', 
         cartoonOrder = 'under', 
         colpalette = colfunc)

#### Recolorize and Patternize Workflow ####


##Aligning images: still in progress

#same Image List, ID list, Landmark List as above
#We are using a different target image
# target <- landmarkList[['P9051078']]
# 
# mask1 <- read.table("C:/Users/salva/Downloads/Sde_phenotyping/patternize/masks/P9051078_cc_polygonmask.txt", header = FALSE)
# # mask2 <- read.table("C:/Users/salva/Downloads/Sde_phenotyping/patternize/masks/P9051078_cc_analfin_mask.txt", header = FALSE)
# # mask3 <- read.table("C:/Users/salva/Downloads/Sde_phenotyping/patternize/masks/P9051078_cc_dorsalfin_mask.txt", header = FALSE)
# # mask4 <- read.table("C:/Users/salva/Downloads/Sde_phenotyping/patternize/masks/P9051078_cc_pelvicfin_mask.txt", header = FALSE)
# # mask5 <- read.table("C:/Users/salva/Downloads/Sde_phenotyping/patternize/masks/P9051078_cc_pectoralfin_mask.txt", header = FALSE)
# 
# # options(expressions = 5000)
# # 
# # imageList_aligned <- alignLan(imageList, landmarkList, transformRef = target, 
# #                               adjustCoords = TRUE,
# #                               plotTransformed = TRUE, 
# #                               resampleFactor = 5, 
# #                               cartoonID = 'P9051078')
# #                               maskOutline = mask1, 
# #                               inverse = list(FALSE))



## Segment images in recolorize 

library(recolorize)

# convert from RasterBricks to image arrays using the brick_to_array function:
imgs <- lapply(imageList, brick_to_array)
names(imgs) <- names(imageList)


# save raster extents for later conversion:
extent_list <- lapply(imageList_aligned, raster::extent)