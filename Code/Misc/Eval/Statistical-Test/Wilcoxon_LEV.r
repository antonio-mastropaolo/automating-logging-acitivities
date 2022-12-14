library(effsize)

################## LEVENSHTEIN ##################

levLANCE_LEONID1<-read.csv("Dataset/Wilcoxon-Data/LEV-LANCE-LEONID1.csv",header=TRUE)
levLANCE_LEONID3<-read.csv("Dataset/Wilcoxon-Data/LEV-LANCE-LEONID3.csv",header=TRUE)
levLANCE_LEONID5<-read.csv("Dataset/Wilcoxon-Data/LEV-LANCE-LEONID5.csv",header=TRUE)

sevLEV=list(Dataset=c(),Wilcoxon.p=c())

sevLEV$Dataset=c(sevLEV$Dataset,as.character("Dataset/Wilcoxon-Data/LEV-LANCE-LEONID1.csv"))
sevLEV$Wilcoxon.p=c(wilcox.test(levLANCE_LEONID1$scoreLANCE,levLANCE_LEONID1$scoreLEONID1,alternative="two.side",paired=TRUE)$p.value)
cliff.delta(levLANCE_LEONID1$scoreLANCE,levLANCE_LEONID1$scoreLEONID1)


sevLEV$Dataset=c(sevLEV$Dataset,as.character("Dataset/Wilcoxon-Data/LEV-LANCE-LEONID3.csv"))
sevLEV$Wilcoxon.p=c(wilcox.test(levLANCE_LEONID3$scoreLANCE,levLANCE_LEONID3$scoreLEONID3,alternative="two.side",paired=TRUE)$p.value)
cliff.delta(levLANCE_LEONID3$scoreLANCE,levLANCE_LEONID3$scoreLEONID3)

sevLEV$Dataset=c(sevLEV$Dataset,as.character("Dataset/Wilcoxon-Data/LEV-LANCE-LEONID5.csv"))
sevLEV$Wilcoxon.p=c(wilcox.test(levLANCE_LEONID5$scoreLANCE,levLANCE_LEONID5$scoreLEONID5,alternative="two.side",paired=TRUE)$p.value)
cliff.delta(levLANCE_LEONID5$scoreLANCE,levLANCE_LEONID5$scoreLEONID5)


sevLEV=data.frame(sevLEV)
sevLEV$Wilcoxon.p=p.adjust(sevLEV$Wilcoxon.p,method="holm")
print(sevLEV)





