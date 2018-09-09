save_path <- "../R-package/data/"
path <- "original_data"
setwd(path)
rm(list = ls()); gc(reset = TRUE)

# from dyslexia.txt to dyslexia.rda
dyslexia <- read.table("dyslexia.txt")
dyslexia <- rbind(t(dyslexia[1:6, ]), t(dyslexia[7:12, ]))
rownames(dyslexia) <- 1:12
colnames(dyslexia) <- paste0("d", 1:6)

data_list <- list()
data_list[["y"]] <- dyslexia
data_list[["x"]] <- rep(c("control", "dyslexia"), each = 6)

dyslexia <- data_list
save(dyslexia, file = paste0(save_path, "dyslexia.rda"))

# from stereoONH.txt to stereoONH.rda
stereoONH <- read.table("stereoONH.txt")
id <- rep(1:15, each = 4)
label <- rep(c("AL", "AR", "BL", "BR"), 15)
i <- 1
start_index <- seq(from = 1, to = 120, by = 2)
index <- 1:length(start_index)
data_list <- list()
for (i in index) {
  start <- start_index[[i]]
  data_list[[i]] <- t(stereoONH[start:(start+1), -1])
  rownames(data_list[[i]]) <- 1:9
  colnames(data_list[[i]]) <- c("x", "y")
}

stereoONH <- list()
stereoONH[["y"]] <- data_list
stereoONH[["x"]] <- data.frame(id, label)

save(stereoONH, file = paste0(save_path, "stereoONH.rda"))

# wind
library(circular)
windc <- circular(wind)
plot(windc, cex=1.5, bin=720, stack=TRUE, sep=0.035, shrink=1.3)

