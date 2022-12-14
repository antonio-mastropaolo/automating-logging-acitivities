library(exact2x2)
library(effsize)
library(xtable)


res=list(Dataset=c(),McNemar.p=c(),McNemar.OR=c())

d<-"Dataset/MC-Data/lance-leonid-pp.csv"
pp<-read.csv(d)
m=mcnemar.exact(pp$LANCE,pp$LEONID)
res$Dataset=c(res$Dataset,as.character(d))
res$McNemar.p=c(res$McNemar.p, m$p.value)
res$McNemar.OR=c(res$McNemar.OR,m$estimate)

d<-"Dataset/MC-Data/lance-leonid-var.csv"
var<-read.csv(d)
m=mcnemar.exact(var$LANCE,var$LEONID)
res$Dataset=c(res$Dataset,as.character(d))
res$McNemar.p=c(res$McNemar.p, m$p.value)
res$McNemar.OR=c(res$McNemar.OR,m$estimate)

d<-"Dataset/MC-Data/lance-leonid-lvl.csv"
lvl<-read.csv(d)
m=mcnemar.exact(lvl$LANCE,lvl$LEONID)
res$Dataset=c(res$Dataset,as.character(d))
res$McNemar.p=c(res$McNemar.p, m$p.value)
res$McNemar.OR=c(res$McNemar.OR,m$estimate)

d<-"Dataset/MC-Data/lance-leonid-msg.csv"
msg<-read.csv(d)
m=mcnemar.exact(msg$LANCE,msg$LEONID)
res$Dataset=c(res$Dataset,as.character(d))
res$McNemar.p=c(res$McNemar.p, m$p.value)
res$McNemar.OR=c(res$McNemar.OR,m$estimate)

d<-"Dataset/MC-Data/lance-leonid-pos.csv"
pos<-read.csv(d)
m=mcnemar.exact(pos$LANCE,pos$LEONID)
res$Dataset=c(res$Dataset,as.character(d))
res$McNemar.p=c(res$McNemar.p, m$p.value)
res$McNemar.OR=c(res$McNemar.OR,m$estimate)

d<-"Dataset/MC-Data/lance-leonid-wrong-msg.csv"
msgWrong<-read.csv(d)
m=mcnemar.exact(msgWrong$LANCE,msgWrong$LEONID)
res$Dataset=c(res$Dataset,as.character(d))
res$McNemar.p=c(res$McNemar.p, m$p.value)
res$McNemar.OR=c(res$McNemar.OR,m$estimate)



res=data.frame(res)
#p-value adjustment
res$McNemar.p=p.adjust(res$McNemar.p,method="BH")
print(res)
