#Reserves

ts.plot((bra_bop_reserves_ts/1000000000000),col="black",type='o',
        ylab="BoP Reserves (in trillions US$)",xlab='Year'
        ,ylim=c(0,4)
        )
lines((chn_bop_reserves_ts/1000000000000),col="red",type='o')
lines((ind_bop_reserves_ts/1000000000000),col="blue",type='o')
lines((rus_bop_reserves_ts/1000000000000),col="green",type='o')
lines((zaf_bop_reserves_ts/1000000000000),col="gray",type='o')

par(mfrow=c(3,2))
ts.plot((bra_bop_reserves_ts/1000000000000),col="red",type='o', main='Brazil',lwd=2,lty=1.5,pch=11,
        ylab="BoP Reserves (in trillions US$)",xlab='Year'
        ,ylim=c(0,0.5))
grid (10,10, lty = 6, col = "cornsilk2") 

ts.plot((chn_bop_reserves_ts/1000000000000),col="red",type='o', main='China',lwd=2, lty=1.5,pch=11,
        ylab="BoP Reserves (in trillions US$)",xlab='Year'
        ,ylim=c(0,4))
grid (10,10, lty = 6, col = "cornsilk2") 

ts.plot((ind_bop_reserves_ts/1000000000000),col="red",type='o', main='India',lwd=2, lty=1.5,pch=11,
        ylab="BoP Reserves (in trillions US$)",xlab='Year'
        ,ylim=c(0,0.5))
grid (10,10, lty = 6, col = "cornsilk2") 

ts.plot((rus_bop_reserves_ts/1000000000000),col="red",type='o', main='Russia',lwd=2, lty=1.5,pch=11,
        ylab="BoP Reserves (in trillions US$)",xlab='Year'
        ,ylim=c(0,0.7))
grid (10,10, lty = 6, col = "cornsilk2") 

ts.plot((zaf_bop_reserves_ts/1000000000000),col="red",type='o', main='South Africa',lwd=2, lty=1.5,pch=11,
        ylab="BoP Reserves (in trillions US$)",xlab='Year'
        ,ylim=c(0,0.2))
grid (10,10, lty = 6, col = "cornsilk2") 