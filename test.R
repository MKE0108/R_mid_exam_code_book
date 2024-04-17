a=read.csv("bg/Week 2/AQX.csv")
b=read.csv("bg/Week 2/AQXsite.csv")

outer=merge(x=a,y=b,by="SiteName",all=TRUE)
left=merge(x=a,y=b,by="SiteName",all.x=TRUE)
right=merge(x=a,y=b,by="SiteName",all.y=TRUE)
inner=merge(x=a,y=b,by="SiteName",all=FALSE)
#save outer left right inner as csv
write.csv(outer,"bg/Week 2/AQSouter.csv")
write.csv(left,"bg/Week 2/AQSleft.csv")
write.csv(right,"bg/Week 2/AQSright.csv")
write.csv(inner,"bg/Week 2/AQSinner.csv")
