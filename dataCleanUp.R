### =============================================
### Following code & data are from:
###  http://byrneslab.net/teaching/biol-607-2014/
###====================================================

---
title: "Data clean up"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```



Data from Reusch et al. 2005 PNAS


```{r, echo=FALSE}
westNile <- file.choose()

```
```{r}
head(westNile)
# only checking columns 3 & 4
head(westNile[, 3:4])
#column names
names(westNile)
#finding missing data
westNile$Species.Richness
corvid <-westNile$Corvid.Abundance
# find the bad values
which(westNile$Corvid.Abundance == 9999)
plot(corvid) # care this is not corrected for "Not Available"
#replace with NAs
westNile$Corvid.Abundance[which(westNile$Corvid.Abundance==9999)] <- NA

```

```{r, echo=FALSE}
#change "NOT AVAILABLE" to NA and convert to float
westNile <- read.csv("../DataFiles/../wetNile.csv", 
                     na.strings = "NOT AVAILABLE")
westNile$Corvid.Abundance
westNile$Corvid.Abundance[which(westNile$Corvid.Abundance==9999)] <- NA

```

```{r}
# check westNile$Virus.Incidence
westNile$WNV.incidence
# negative values to be changed to 0
westNile$WNV.incidence[which(westNile$WNV.incidence < 0)] <- 0; westNile$WNV.incidence
#get summaries
summary(westNile)

```
## Including Plots

You can also embed plots, for example:

```{r}
# generic plot - just to visualize how data would look
plot(westNile$WNV.incidence)

```



