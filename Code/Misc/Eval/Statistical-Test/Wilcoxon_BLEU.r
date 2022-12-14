library(effsize)

################## BLEU ##################

bleuLANCE_LEONID1<-read.csv("Dataset/Wilcoxon-Data/BLEU-LANCE-LEONID1.csv",header=TRUE)
bleuLANCE_LEONID3<-read.csv("Dataset/Wilcoxon-Data/BLEU-LANCE-LEONID3.csv",header=TRUE)
bleuLANCE_LEONID5<-read.csv("Dataset/Wilcoxon-Data/BLEU-LANCE-LEONID5.csv",header=TRUE)

resBLEU=list(Dataset=c(),Wilcoxon.p=c())

resBLEU$Dataset=c(resBLEU$Dataset,as.character("Dataset/Wilcoxon-Data/BLEU-LANCE-LEONID1.csv"))
resBLEU$Wilcoxon.p=c(wilcox.test(bleuLANCE_LEONID1$scoreLANCE,bleuLANCE_LEONID1$scoreLEONID1,alternative="two.side",paired=TRUE)$p.value)
cliff.delta(bleuLANCE_LEONID1$scoreLANCE,bleuLANCE_LEONID1$scoreLEONID1)


resBLEU$Dataset=c(resBLEU$Dataset,as.character("Dataset/Wilcoxon-Data/BLEU-LANCE-LEONID3.csv"))
resBLEU$Wilcoxon.p=c(wilcox.test(bleuLANCE_LEONID3$scoreLANCE,bleuLANCE_LEONID3$scoreLEONID3,alternative="two.side",paired=TRUE)$p.value)
cliff.delta(bleuLANCE_LEONID3$scoreLANCE,bleuLANCE_LEONID3$scoreLEONID3)

resBLEU$Dataset=c(resBLEU$Dataset,as.character("Dataset/Wilcoxon-Data/BLEU-LANCE-LEONID5.csv"))
resBLEU$Wilcoxon.p=c(wilcox.test(bleuLANCE_LEONID5$scoreLANCE,bleuLANCE_LEONID5$scoreLEONID5,alternative="two.side",paired=TRUE)$p.value)
cliff.delta(bleuLANCE_LEONID5$scoreLANCE,bleuLANCE_LEONID5$scoreLEONID5)


resBLEU=data.frame(resBLEU)
resBLEU$Wilcoxon.p=p.adjust(resBLEU$Wilcoxon.p,method="holm")
print(resBLEU)





