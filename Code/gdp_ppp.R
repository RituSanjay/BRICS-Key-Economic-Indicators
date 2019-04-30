#Purchasing Power Parity

#lets first see the trend of PPP-GDP

ts.plot((bra_ppp_gdp_ts/100000000000),col="black",type='o', main='1990-2017: PPP - GDP (in 100 billions US$)',
        lwd=1.9,lty=1,
        ylab="PPP: GDP  ",xlab='year',
        ylim=c(-15,250))
lines((chn_ppp_gdp_ts/100000000000),col="red",type='o', lwd=1.9)
lines((ind_ppp_gdp_ts/100000000000),col="blue",type='o', lwd=1.9)
lines((rus_ppp_gdp_ts/100000000000),col="green",type='o', lwd=1.9)
lines((zaf_ppp_gdp_ts/100000000000),col="orange",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("BRA","CHN","IND","RUS","ZAF"),
       col=c("black","red","Blue","Green","orange"),lwd=2,cex=0.7,horiz=TRUE)
grid (20,20, lty = 6) 

#okay forget GNI -  makes no logical sense
ts.plot((bra_ppp_gni_ts/100000000000),col="black",type='o', main='1990-2017: PPP - GNI (in 100 billions US$)',
        lwd=1.9,lty=1,
        ylab="PPP: GNI  ",xlab='year',
        ylim=c(-15,250))
lines((chn_ppp_gni_ts/100000000000),col="red",type='o', lwd=1.9)
lines((ind_ppp_gni_ts/100000000000),col="blue",type='o', lwd=1.9)
lines((rus_ppp_gni_ts/100000000000),col="green",type='o', lwd=1.9)
lines((zaf_ppp_gni_ts/100000000000),col="orange",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("BRA","CHN","IND","RUS","ZAF"),
       col=c("black","red","Blue","Green","orange"),lwd=2,cex=0.7,horiz=TRUE)
grid (20,20, lty = 6) 


# so low lets divide everything up

#Brazil
ts.plot((bra_ppp_gdp_ts/10000000000),col="black",type='o', main='1990-2017: PPP - GDP(in 10 billions US$) vs Inflation ',
        lwd=1.9,
        ylab="PPP: GDP  ",xlab='year',
        ylim=c(0,3000))
lines((bra_cpi_ts),col="red",type='o', lwd=1.9)
grid (20,20, lty = 6) 

ts.plot((bra_pop_female_ts),col="blue",type='o', main='1990-2017: Population % : Age 20-34 Years',
        lwd=1.9,
        ylab=" Population % ",xlab='year',
        ylim=c(0,40))
lines((bra_pop_male_ts),col="orange",type='o', lwd=1.9)
grid (20,20, lty = 6)



#China
ts.plot((chn_ppp_gdp_ts/10000000000),col="black",type='o', main='1990-2017: PPP - GDP(in 10 billions US$) vs Inflation',
        lwd=1.9,
        ylab="PPP: GDP  ",xlab='year',
        ylim=c(0,3000))
lines((chn_cpi_ts),col="red",type='o', lwd=1.9)
grid (20,20, lty = 6) 

ts.plot((chn_pop_female_ts),col="blue",type='o', main='1990-2017: Population % : Age 20-34 Years',
        lwd=1.9,
        ylab=" Population % ",xlab='year',
        ylim=c(0,40))
lines((chn_pop_male_ts),col="orange",type='o', lwd=1.9)
grid (20,20, lty = 6)


#India
ts.plot((ind_ppp_gdp_ts/10000000000),col="black",type='o', main='1990-2017: PPP - GDP(in 10 billions US$) vs Inflation',
        lwd=1.9,
        ylab="PPP: GDP  ",xlab='year',
        ylim=c(0,3000))
lines((ind_cpi_ts),col="red",type='o', lwd=1.9)
grid (20,20, lty = 6) 

ts.plot((ind_pop_female_ts),col="blue",type='o', main='1990-2017: Population % : Age 20-34 Years',
        lwd=1.9,
        ylab=" Population % ",xlab='year',
        ylim=c(0,40))
lines((ind_pop_male_ts),col="orange",type='o', lwd=1.9)
grid (20,20, lty = 6)


#Russia
ts.plot((rus_ppp_gdp_ts/10000000000),col="black",type='o', main='1990-2017: PPP - GDP(in 10 billions US$) vs Inflation',
        lwd=1.9,
        ylab="PPP: GDP  ",xlab='year',
        ylim=c(0,3000))
lines((rus_cpi_ts),col="red",type='o', lwd=1.9)
grid (20,20, lty = 6) 

ts.plot((rus_pop_female_ts),col="blue",type='o', main='1990-2017: Population % : Age 20-34 Years',
        lwd=1.9,
        ylab=" Population % ",xlab='year',
        ylim=c(0,40))
lines((rus_pop_male_ts),col="orange",type='o', lwd=1.9)
grid (20,20, lty = 6)


#South Africa
ts.plot((zaf_ppp_gdp_ts/10000000000),col="black",type='o', main='1990-2017: PPP - GDP(in 10 billions US$) vs Inflation',
        lwd=1.9,
        ylab="PPP: GDP  ",xlab='year',
        ylim=c(0,3000))
lines((zaf_cpi_ts),col="red",type='o', lwd=1.9)
grid (20,20, lty = 6) 

ts.plot((zaf_pop_female_ts),col="blue",type='o', main='1990-2017: Population % : Age 20-34 Years',
        lwd=1.9,
        ylab=" Population % ",xlab='year',
        ylim=c(0,40))
lines((zaf_pop_male_ts),col="orange",type='o', lwd=1.9)
grid (20,20, lty = 6)