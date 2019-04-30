#Balance of Payments - Foreign Direct Investment
# balance of payments =  record of all economic transactions between the residents of the country and 
#the rest of the world in a particular period of time

#inflows
ts.plot(bra_bop_fdi_net_ts,col="black",type='o',
     ylab="BoP Net Foreign Direct Investment ",xlab='year',
     ylim=c(-100000000000,10000000000))
lines(chn_bop_fdi_net_ts,col="red",type='o')
lines(ind_bop_fdi_net_ts,col="blue",type='o')
lines(rus_bop_fdi_net_ts,col="green",type='o')
lines(zaf_bop_fdi_net_ts,col="gray",type='o')


# Foreign Direct Investments - outflow vs inflows - describe the trend -  find economic events that drove these trends i.e. ups and downs
par(mfrow=c(3,2))
ts.plot((bra_bop_fdi_net_inflow_ts),col="black",type='o', main='Brazil',lwd=1.5,lty=1,pch=19,
        ylab="BoP FDI Inflow vs Outflow  ",xlab='year',
        ylim=c(-3,5))
lines((bra_bop_fdi_net_outflow_ts),col="red",type='o')
legend(x="bottomright",inset=0,legend=c("Inflow","Outflow"),col=c("black","red"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6, col = "cornsilk2") 

ts.plot((chn_bop_fdi_net_inflow_ts),col="black",type='o', main='China',lwd=1.5,lty=1,pch=19,
        ylab="BoP FDI Inflow vs Outflow  ",xlab='year',
        ylim=c(-3,6))
lines((chn_bop_fdi_net_outflow_ts),col="red",type='o')
legend(x="bottomright",inset=0,legend=c("Inflow","Outflow"),col=c("black","red"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6, col = "cornsilk2") 


ts.plot((ind_bop_fdi_net_inflow_ts),col="black",type='o', main='India',lwd=1.5,lty=1,pch=19,
        ylab="BoP FDI Inflow vs Outflow  ",xlab='year',
        ylim=c(-3,5))
lines((ind_bop_fdi_net_outflow_ts),col="red",type='o')
legend(x="bottomright",inset=0,legend=c("Inflow","Outflow"),col=c("black","red"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6, col = "cornsilk2") 


ts.plot((rus_bop_fdi_net_inflow_ts),col="black",type='o', main='Russia',lwd=1.5,lty=1,pch=19,
        ylab="BoP FDI Inflow vs Outflow  ",xlab='year',
        ylim=c(-3,5))
lines((rus_bop_fdi_net_outflow_ts),col="red",type='o')
legend(x="bottomright",inset=0,legend=c("Inflow","Outflow"),col=c("black","red"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6, col = "cornsilk2") 


ts.plot((zaf_bop_fdi_net_inflow_ts),col="black",type='o', main='South Africa',lwd=1.5,lty=1,pch=19,
        ylab="BoP FDI Inflow vs Outflow  ",xlab='year',
        ylim=c(-3,6))
lines((zaf_bop_fdi_net_outflow_ts),col="red",type='o')
legend(x="bottomright",inset=0,legend=c("Inflow","Outflow"),col=c("black","red"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6, col = "cornsilk2") 


