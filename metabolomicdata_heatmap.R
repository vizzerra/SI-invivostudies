---
title: "MetabolomicsHeatmap"
author: "Andres Vizzerra"
date: "3/23/2023"
---
  
knitr::opts_chunk$set(echo = TRUE)  

if (!requireNamespace("pheatmap", quietly = TRUE))
  install.packages("pheatmap")
library(pheatmap)

# Importing metabolomic dataset
tab2 <- read.delim("/Users/Vizzerra/Documents/Warfel Lab/Bioinformatics/WT_TKO_mice/TG_DG_significant_abbrev.txt", header = TRUE)
# Format headers and make strings numerics
tgdg <- as.data.frame(tab2)
        rownames(tgdg) <- tgdg[, 1]
        tgdg[, 1] <- NULL
        tgdg <- as.matrix(tgdg)
        mat <- matrix(rnorm(18*24),nrow = 18,ncol=24)
pheatmap(tgdg)
#Change tile colors
bluewhitered <- c("blue", "white", "red")
pal <- colorRampPalette(bluewhitered)(100)
pheatmap(tgdg, col = pal)
#Create annotations and list of colors for treatment groups
cat_df = data.frame("Group" = c(rep("WT",5),rep("TKO",5)))
          rownames(cat_df) = colnames(tgdg)
          annoCol<-list(Group=c(WT="red", TKO="blue"))
pheatmap(
          tgdg, col=pal, 
          cluster_rows = T, 
          cluster_cols = F, 
          border_color=NA, 
          scale = "row", 
          clustering_distance_rows = "euclidean", 
          clustering_distance_cols = "euclidean", 
          clustering_method = "complete", 
          cellwidth = 15, 
          annotation = cat_df,
          annotation_colors = annoCol
)
## Clustering the heatmap, set to TRUE   
pheatmap(
  tgdg, col=pal, 
  cluster_rows = T, 
  cluster_cols = F, 
  border_color=NA, 
  scale = "row", 
  clustering_method = "complete",
  annotation = cat_df,
  annotation_colors = annoCol
)
#Distance methods
pheatmap(
  tgdg, col=pal, 
  cluster_rows = T, 
  cluster_cols = F, 
  border_color=NA, 
  scale = "row", 
  clustering_distance_rows = "euclidean", 
  clustering_distance_cols = "euclidean", 
  clustering_method = "complete", 
  annotation = cat_df,
  annotation_colors = annoCol,
  cellwidth = 15
)
