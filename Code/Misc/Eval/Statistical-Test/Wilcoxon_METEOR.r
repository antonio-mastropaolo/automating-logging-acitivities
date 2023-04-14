library(effsize)

################## METEOR ##################

meteorLANCE_LEONID1<-read.csv("Dataset/Wilcoxon-Data/METEOR-LANCE-LEONID1.csv",header=TRUE)
meteorLANCE_LEONID3<-read.csv("Dataset/Wilcoxon-Data/METEOR-LANCE-LEONID3.csv",header=TRUE)
meteorLANCE_LEONID5<-read.csv("Dataset/Wilcoxon-Data/METEOR-LANCE-LEONID5.csv",header=TRUE)

resMETEOR=list(Dataset=c(),Wilcoxon.p=c())

resMETEOR$Dataset=c(resMETEOR$Dataset,as.character("Dataset/Wilcoxon-Data/METEOR-LANCE-LEONID1.csv"))
resMETEOR$Wilcoxon.p=c(wilcox.test(meteorLANCE_LEONID1$scoreLANCE,meteorLANCE_LEONID1$scoreLEONID1,alternative="two.side",paired=TRUE)$p.value)
cliff.delta(meteorLANCE_LEONID1$scoreLANCE,meteorLANCE_LEONID1$scoreLEONID1)


resMETEOR$Dataset=append(resMETEOR$Dataset,as.character("Dataset/Wilcoxon-Data/METEOR-LANCE-LEONID3.csv"))
resMETEOR$Wilcoxon.p=append(resMETEOR$Wilcoxon.p,wilcox.test(meteorLANCE_LEONID3$scoreLANCE,meteorLANCE_LEONID3$scoreLEONID3,alternative="two.side",paired=TRUE)$p.value)
cliff.delta(meteorLANCE_LEONID3$scoreLANCE,meteorLANCE_LEONID3$scoreLEONID3)

resMETEOR$Dataset=append(resMETEOR$Dataset,as.character("Dataset/Wilcoxon-Data/METEOR-LANCE-LEONID5.csv"))
resMETEOR$Wilcoxon.p=append(resMETEOR$Wilcoxon.p,wilcox.test(meteorLANCE_LEONID5$scoreLANCE,meteorLANCE_LEONID5$scoreLEONID5,alternative="two.side",paired=TRUE)$p.value)
cliff.delta(meteorLANCE_LEONID5$scoreLANCE,meteorLANCE_LEONID5$scoreLEONID5)


resMETEOR=data.frame(resMETEOR)
resMETEOR$Wilcoxon.p=p.adjust(resMETEOR$Wilcoxon.p,method="holm")
print(resMETEOR)





