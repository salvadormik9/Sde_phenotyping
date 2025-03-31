
#### Setup #####
library(patternize)
library(recolorize)
library(EBImage)
library(raster)

#### Step 1: Image Alignment ####

#set of specimen IDs

IDlist <- tools::file_path_sans_ext(dir("C:/Users/salva/Downloads/Sde_phenotyping", 
                                        pattern = "\\.jpeg$", 
                                        full.names = TRUE))

#goes into my Sde_phenotyping directory and pulls out any files with the .jpeg extension 

#make list with images 
imageList <- makeList(IDlist,
                      type = "image",
                      extension = c(".jpeg", ".JPEG"))

# Get a list of all image files in your folder
image_paths <- list.files("C:/Users/salva/Downloads/Sde_phenotyping",
                          pattern = "_cc\\.jpeg$", full.names = TRUE)

# Remove file extensions to create an ID list
IDlist <- tools::file_path_sans_ext(basename(image_paths))

# Manually read all images as EBImage objects
imageList <- lapply(image_paths, function(path) {
  if (file.exists(path)) {
    img <- EBImage::readImage(path)
    return(img)
  } else {
    return(NULL)
  }
})

# Name each image based on its ID
names(imageList) <- IDlist




# Print a message if any images failed to load
if(length(imageList) == 0) {
  stop("🚨 No images were loaded. Double-check your file path or file extensions.")
} else {
  cat("✅ Successfully loaded", length(imageList), "images.\n")
}



#make list with landmarks

landmarkList <- makeList(IDlist,
                         type = "landmark",
                         extension = "_landmarks.txt")

#set target as P9051078
target <- as.matrix(read.table("P9051078_cc_landmarks.txt", header = FALSE))

imageEx = imageList[['P9051078_cc.jpeg']]

#set up mask
mask1 <- read.table("C:/Users/salva/Downloads/Sde_phenotyping/patternize/masks/P9051078_cc_polygonmask.txt", header = FALSE)
# mask2 <- read.table("C:/Users/salva/Downloads/Sde_phenotyping/patternize/masks/P9051078_cc_analfin_mask.txt", header = FALSE)
# mask3 <- read.table("C:/Users/salva/Downloads/Sde_phenotyping/patternize/masks/P9051078_cc_dorsalfin_mask.txt", header = FALSE)
# mask4 <- read.table("C:/Users/salva/Downloads/Sde_phenotyping/patternize/masks/P9051078_cc_pelvicfin_mask.txt", header = FALSE)
# mask5 <- read.table("C:/Users/salva/Downloads/Sde_phenotyping/patternize/masks/P9051078_cc_pectoralfin_mask.txt", header = FALSE)

options(expressions = 5000)

imageList_aligned <- alignLan(imageList, landmarkList, transformRef = target, 
                              adjustCoords = TRUE,
                              plotTransformed = TRUE, 
                              resampleFactor = 5, 
                              cartoonID = 'P9051078')
                              maskOutline = mask1, 
                              inverse = list(FALSE, TRUE, TRUE, FALSE, FALSE))



