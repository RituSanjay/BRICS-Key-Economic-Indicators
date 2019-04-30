#Gross Domestic Product
source("HWplot.R")
#Expense (% of GDP)
#Exports of goods and services (% of GDP)
#Foreign direct investment, net inflows (% of GDP)
#Foreign direct investment, net outflows (% of GDP)
#GDP (current US$)
#GDP growth (annual %)
#GDP per capita (current US$)
#Imports of goods and services (% of GDP)
#Tax revenue (% of GDP)
#Trade (% of GDP)

#first lets plot the GDP components for all countries
title(main = "1999-2017: % of GDP")
par(mfrow=c(3,2))
ts.plot((bra_gdp_expense_ts),col="black",type='o',
        lwd=1.9,
        ylab="% of GDP (Brazil)",xlab='year',
        ylim=c(-6,40))
lines((bra_gdp_exports_goods_services_ts),col="red",type='o', lwd=1.9)
lines((bra_gdp_fdi_net_inflows_ts),col="blue",type='o', lwd=1.9)
lines((bra_gdp_fdi_net_outflows_ts),col="green",type='o', lwd=1.9)
lines((bra_gdp_imports_goods_services_ts),col="orange",type='o', lwd=1.9)
lines((bra_gdp_tax_revenue_ts),col="pink",type='o', lwd=1.9)
lines((bra_gdp_trade_ts),col="gray",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("Expense","Exports","FDI-Inflow","FDI-Outflow","Imports","TaxRevenue","Trade"),
       col=c("black","red","Blue","Green","orange","pink","gray"),lwd=2,cex=0.5,horiz=TRUE)
grid (10,10, lty = 6) 

ts.plot((chn_gdp_expense_ts),col="black",type='o',
        lwd=1.9,
        ylab="% of GDP (China)",xlab='year',
        ylim=c(-6,65))
lines((chn_gdp_exports_goods_services_ts),col="red",type='o', lwd=1.9)
lines((chn_gdp_fdi_net_inflows_ts),col="blue",type='o', lwd=1.9)
lines((chn_gdp_fdi_net_outflows_ts),col="green",type='o', lwd=1.9)
lines((chn_gdp_imports_goods_services_ts),col="orange",type='o', lwd=1.9)
lines((chn_gdp_tax_revenue_ts),col="pink",type='o', lwd=1.9)
lines((chn_gdp_trade_ts),col="gray",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("Expense","Exports","FDI-Inflow","FDI-Outflow","Imports","TaxRevenue","Trade"),
       col=c("black","red","Blue","Green","orange","pink","gray"),lwd=2,cex=0.5,horiz=TRUE)
grid (10,10, lty = 6) 

ts.plot((ind_gdp_expense_ts),col="black",type='o',
        lwd=1.9,
        ylab="% of GDP (India)",xlab='year',
        ylim=c(-6,65))
lines((ind_gdp_exports_goods_services_ts),col="red",type='o', lwd=1.9)
lines((ind_gdp_fdi_net_inflows_ts),col="blue",type='o', lwd=1.9)
lines((ind_gdp_fdi_net_outflows_ts),col="green",type='o', lwd=1.9)
lines((ind_gdp_imports_goods_services_ts),col="orange",type='o', lwd=1.9)
lines((ind_gdp_tax_revenue_ts),col="pink",type='o', lwd=1.9)
lines((ind_gdp_trade_ts),col="gray",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("Expense","Exports","FDI-Inflow","FDI-Outflow","Imports","TaxRevenue","Trade"),
       col=c("black","red","Blue","Green","orange","pink","gray"),lwd=2,cex=0.5,horiz=TRUE)
grid (10,10, lty = 6) 

ts.plot((rus_gdp_expense_ts),col="black",type='o',
        lwd=1.9,
        ylab="% of GDP (Russia)",xlab='year',
        ylim=c(-6,75))
lines((rus_gdp_exports_goods_services_ts),col="red",type='o', lwd=1.9)
lines((rus_gdp_fdi_net_inflows_ts),col="blue",type='o', lwd=1.9)
lines((rus_gdp_fdi_net_outflows_ts),col="green",type='o', lwd=1.9)
lines((rus_gdp_imports_goods_services_ts),col="orange",type='o', lwd=1.9)
lines((rus_gdp_tax_revenue_ts),col="pink",type='o', lwd=1.9)
lines((rus_gdp_trade_ts),col="gray",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("Expense","Exports","FDI-Inflow","FDI-Outflow","Imports","TaxRevenue","Trade"),
       col=c("black","red","Blue","Green","orange","pink","gray"),lwd=2,cex=0.5,horiz=TRUE)
grid (10,10, lty = 6) 

ts.plot((zaf_gdp_expense_ts),col="black",type='o',
        lwd=1.9,
        ylab="% of GDP (South AFrica)",xlab='year',
        ylim=c(-6,75))
lines((zaf_gdp_exports_goods_services_ts),col="red",type='o', lwd=1.9)
lines((zaf_gdp_fdi_net_inflows_ts),col="blue",type='o', lwd=1.9)
lines((zaf_gdp_fdi_net_outflows_ts),col="green",type='o', lwd=1.9)
lines((zaf_gdp_imports_goods_services_ts),col="orange",type='o', lwd=1.9)
lines((zaf_gdp_tax_revenue_ts),col="pink",type='o', lwd=1.9)
lines((zaf_gdp_trade_ts),col="gray",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("Expense","Exports","FDI-Inflow","FDI-Outflow","Imports","TaxRevenue","Trade"),
       col=c("black","red","Blue","Green","orange","pink","gray"),lwd=2,cex=0.5,horiz=TRUE)
grid (10,10, lty = 6) 




###************************************************************************
#Next lets look at the grp growth rate for the countries
ts.plot((bra_gdp_growth_ts),col="black",type='o', main='1999-2017: GDP Growth Rate',
        lwd=1.7,
        ylab="BoP FDI Inflow vs Outflow  ",xlab='year',
        ylim=c(-10,20))
lines((chn_gdp_growth_ts),col="red",type='o', lwd=1.7)
lines((ind_gdp_growth_ts),col="blue",type='o', lwd=1.7)
lines((rus_gdp_growth_ts),col="green",type='o', lwd=1.7)
lines((zaf_gdp_growth_ts),col="dark gray",type='o', lwd=1.7)
legend(x="bottomleft",inset=0,legend=c("BRA","CHN","IND","RUS","ZAF"),
       col=c("black","red","Blue","Green","dark gray"),lwd=2,cex=0.7,horiz=TRUE)
grid (20,20, lty = 6)


##***************************************************************************
#consider the GDP for the five countries
par(mfrow=c(1,2))
ts.plot((bra_gdp_ts/100000000000),col="black",type='o', main='1999-2017: GDP (in 100 billion US$)',
        lwd=1.7,
        ylab="BoP FDI Inflow vs Outflow  ",xlab='year',
        ylim=c(0,120))
lines((chn_gdp_ts/100000000000),col="red",type='o', lwd=1.7)
lines((ind_gdp_ts/100000000000),col="blue",type='o', lwd=1.7)
lines((rus_gdp_ts/100000000000),col="green",type='o', lwd=1.7)
lines((zaf_gdp_ts/100000000000),col="dark gray",type='o', lwd=1.7)
legend(x="bottomleft",inset=0,legend=c("BRA","CHN","IND","RUS","ZAF"),
       col=c("black","red","Blue","Green","dark gray"),lwd=2,cex=0.7,horiz=TRUE)
grid (20,20, lty = 6)

##***************************************************************************
#consider the GDP per capita for the five countries
ts.plot((bra_gdp_per_capita_ts/1000),col="black",type='o', main='1999-2017: GDP per Capita (in thousands US$)',
        lwd=1.7,
        ylab="BoP FDI Inflow vs Outflow  ",xlab='year',
       ylim=c(0,17))
lines((chn_gdp_per_capita_ts/1000),col="red",type='o', lwd=1.7)
lines((ind_gdp_per_capita_ts/1000),col="blue",type='o', lwd=1.7)
lines((rus_gdp_per_capita_ts/1000),col="green",type='o', lwd=1.7)
lines((zaf_gdp_per_capita_ts/1000),col="dark gray",type='o', lwd=1.7)
legend(x="bottomleft",inset=0,legend=c("BRA","CHN","IND","RUS","ZAF"),
       col=c("black","red","Blue","Green","dark gray"),lwd=2,cex=0.7,horiz=TRUE)
grid (20,20, lty = 6)

#########################****************************************************

#Now we need to predict the GDP and GDP growth

#Brazil
b_gdp <- HoltWinters(bra_gdp_ts/100000000000, gamma = FALSE)
summary(b_gdp)
plot(b_gdp)
grid (20,20, lty = 6)
forecast_b_gdp <- predict(b_gdp, n.ahead = 5, prediction.interval = T, level = 0.95)
summary(forecast_b_gdp)
plot(b_gdp, forecast_b_gdp,type='o')
grid (20,20, lty = 6)

b_gdp_growth <- HoltWinters(bra_gdp_growth_ts, gamma = FALSE)
summary(b_gdp_growth)
plot(b_gdp_growth)
grid (20,20, lty = 6)
forecast_b_gdp_growth <- predict(b_gdp_growth, n.ahead = 5, prediction.interval = T, level = 0.95)
summary(forecast_b_gdp_growth)
plot(b_gdp_growth, forecast_b_gdp_growth,type='o')
grid (20,20, lty = 6)

#China
c_gdp <- HoltWinters(chn_gdp_ts/100000000000, gamma = FALSE)
summary(c_gdp)
plot(c_gdp)
grid (20,20, lty = 6)
forecast_c_gdp <- predict(c_gdp, n.ahead = 5, prediction.interval = T, level = 0.95)
summary(forecast_c_gdp)
plot(c_gdp, forecast_c_gdp,type='o')
grid (20,20, lty = 6)

c_gdp_growth <- HoltWinters(chn_gdp_growth_ts, gamma = FALSE)
summary(c_gdp_growth)
plot(c_gdp_growth)
grid (20,20, lty = 6)
forecast_c_gdp_growth <- predict(c_gdp_growth, n.ahead = 5, prediction.interval = T, level = 0.95)
summary(forecast_c_gdp_growth)
plot(c_gdp_growth, forecast_c_gdp_growth,type='o')
grid (20,20, lty = 6)

#India
i_gdp <- HoltWinters(ind_gdp_ts/100000000000, gamma = FALSE)
summary(i_gdp)
plot(i_gdp)
grid (20,20, lty = 6)
forecast_i_gdp <- predict(i_gdp, n.ahead = 5, prediction.interval = T, level = 0.95)
summary(forecast_i_gdp)
plot(i_gdp, forecast_i_gdp,type='o')
grid (20,20, lty = 6)

i_gdp_growth <- HoltWinters(ind_gdp_growth_ts, gamma = FALSE)
summary(i_gdp_growth)
plot(i_gdp_growth)
grid (20,20, lty = 6)
forecast_i_gdp_growth <- predict(i_gdp_growth, n.ahead = 5, prediction.interval = T, level = 0.95)
summary(forecast_i_gdp_growth)
plot(i_gdp_growth, forecast_i_gdp_growth,type='o')
grid (20,20, lty = 6)

#Russia
r_gdp <- HoltWinters(rus_gdp_ts/100000000000, gamma = FALSE)
summary(r_gdp)
plot(r_gdp)
grid (20,20, lty = 6)
forecast_r_gdp <- predict(r_gdp, n.ahead = 5, prediction.interval = T, level = 0.95)
summary(forecast_r_gdp)
plot(r_gdp, forecast_r_gdp,type='o')
grid (20,20, lty = 6)

r_gdp_growth <- HoltWinters(rus_gdp_growth_ts, gamma = FALSE)
summary(r_gdp_growth)
plot(r_gdp_growth)
grid (20,20, lty = 6)
forecast_r_gdp_growth <- predict(r_gdp_growth, n.ahead = 5, prediction.interval = T, level = 0.95)
summary(forecast_r_gdp_growth)
plot(r_gdp_growth, forecast_r_gdp_growth,type='o')
grid (20,20, lty = 6)

#South Africa
z_gdp <- HoltWinters(zaf_gdp_ts/100000000000, gamma = FALSE)
summary(z_gdp)
plot(z_gdp)
grid (20,20, lty = 6)
forecast_z_gdp <- predict(z_gdp, n.ahead = 5, prediction.interval = T, level = 0.95)
summary(forecast_z_gdp)
plot(z_gdp, forecast_z_gdp,type='o')
grid (20,20, lty = 6)

z_gdp_growth <- HoltWinters(zaf_gdp_growth_ts, gamma = FALSE)
summary(z_gdp_growth)
plot(z_gdp_growth)
grid (20,20, lty = 6)
forecast_z_gdp_growth <- predict(z_gdp_growth, n.ahead = 5, prediction.interval = T, level = 0.95)
summary(forecast_z_gdp_growth)
plot(z_gdp_growth, forecast_z_gdp_growth,type='o')
grid (20,20, lty = 6)