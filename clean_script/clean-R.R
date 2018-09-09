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

# orbit
orbit <- read.table("orbit.txt", header = 1, row.names = 1)
save(orbit, file = paste0(save_path, "orbit.rda"))

# skull normal
skullnormal <- read.table("skullnormal.txt", header = 1)
end_index1 <- which(skullnormal[["Id.months.gender"]] == "2406-168-2")
end_index2 <- which(skullnormal[["Id.months.gender"]] == "2802-168-1")
y <- rbind(cbind(skullnormal[1:end_index1[1], ], skullnormal[(end_index1[1]+1): end_index1[2], -1]), 
           cbind(skullnormal[(end_index1[2] + 1):end_index2[1], ], skullnormal[(end_index2[1]+1): end_index2[2], -1]))

data_list <- list()
data_list[["y"]] <- y[, -1]
colnames(data_list[["y"]]) <- paste0(rep(c("x", "y"), 8), rep(1:8, each = 2))
x <- as.data.frame(apply(do.call("rbind", strsplit(as.character(y[[1]]), "-")), 2, as.numeric))
colnames(x) <- c("id", "months", "gender")
data_list[["x"]] <- x
rownames(data_list[["y"]]) <- data_list[["x"]][["id"]]

skullnormal <- data_list
save(skullnormal, file = paste0(save_path, "skullnormal.rda"))

#
acidproteinase <- read.table("acidproteinase.txt", header = 1)

data_list <- list()
data_list[["proteinA"]] <- acidproteinase[1:49, ]
data_list[["proteinB"]] <- acidproteinase[50:98, ]
data_list[["proteinC"]] <- acidproteinase[99:nrow(acidproteinase), ]

acidproteinase <- data_list
save(acidproteinase, file = paste0(save_path, "acidproteinase.rda"))

# 
polyhedral3D <- read.table("polyhedral3D.txt")
polyhedral3D[, 1] <- NULL
y <- lapply(split(polyhedral3D, f = as.factor(rep(1:32, each = 2))), function(x) {
  x <- t(x)
  colnames(x) <- c("x", "y")
  rownames(x) <- 1:nrow(x)
  x
})
x <- rep(c("figure 1.14", "figure 1.15"), each = 16)

data_list <- list()
data_list[["y"]] <- y
data_list[["x"]] <- x
polyhedral3D <- data_list
save(polyhedral3D, file = paste0(save_path, "polyhedral3D.rda"))
