library(effsize)

rougeLANCE_LEONID1<-read.csv("Dataset/Wilcoxon-Data/ROUGE-LANCE-LEONID1.csv",header=TRUE)
rougeLANCE_LEONID3<-read.csv("Dataset/Wilcoxon-Data/ROUGE-LANCE-LEONID3.csv",header=TRUE)
rougeLANCE_LEONID5<-read.csv("Dataset/Wilcoxon-Data/ROUGE-LANCE-LEONID5.csv",header=TRUE)

resROUGE=list(Dataset=c(),Wilcoxon.p=c())

resROUGE$Dataset=c(resROUGE$Dataset,as.character("Dataset/Wilcoxon-Data/ROUGE-LANCE-LEONID1.csv"))
resROUGE$Wilcoxon.p=c(wilcox.test(rougeLANCE_LEONID1$scoreLANCE,rougeLANCE_LEONID1$scoreLEONID1,alternative="two.side",paired=TRUE)$p.value)
cliff.delta(rougeLANCE_LEONID1$scoreLANCE,rougeLANCE_LEONID1$scoreLEONID1)


resROUGE$Dataset=c(resROUGE$Dataset,as.character("Dataset/Wilcoxon-Data/ROUGE-LANCE-LEONID3.csv"))
resROUGE$Wilcoxon.p=c(wilcox.test(rougeLANCE_LEONID3$scoreLANCE,rougeLANCE_LEONID3$scoreLEONID3,alternative="two.side",paired=TRUE)$p.value)
cliff.delta(rougeLANCE_LEONID3$scoreLANCE,rougeLANCE_LEONID3$scoreLEONID3)

resROUGE$Dataset=c(resROUGE$Dataset,as.character("Dataset/Wilcoxon-Data/ROUGE-LANCE-LEONID5.csv"))
resROUGE$Wilcoxon.p=c(wilcox.test(rougeLANCE_LEONID5$scoreLANCE,rougeLANCE_LEONID5$scoreLEONID5,alternative="two.side",paired=TRUE)$p.value)
cliff.delta(rougeLANCE_LEONID5$scoreLANCE,rougeLANCE_LEONID5$scoreLEONID5)


resROUGE=data.frame(resROUGE)
resROUGE$Wilcoxon.p=p.adjust(resROUGE$Wilcoxon.p,method="holm")
print(resROUGE)
