#First lets see the net primary income in countries from exports and imports goods and services
ts.plot((bra_bop_goods_services_net_pri_income_ts/10000000000),col="black",type='o', main='1994-2017: Net Primary Income(in billions US$)',
        lwd=1.7,lty=1,pch=19,
        ylab="BoP FDI Inflow vs Outflow  ",xlab='year',
        ylim=c(-8,3.5))
lines((chn_bop_goods_services_net_pri_income_ts/10000000000),col="red",type='o', lwd=1.7)
lines((ind_bop_goods_services_net_pri_income_ts/10000000000),col="blue",type='o', lwd=1.7)
lines((rus_bop_goods_services_net_pri_income_ts/10000000000),col="green",type='o', lwd=1.7)
lines((zaf_bop_goods_services_net_pri_income_ts/10000000000),col="dark gray",type='o', lwd=1.7)
legend(x="bottomleft",inset=0,legend=c("BRA","CHN","IND","RUS","ZAF"),
       col=c("black","red","Blue","Green","dark gray"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6) 



#Exports:
#Agricultural raw materials exports (% of merchandise exports)
#Commercial service exports (current US$)
#Computer, communications and other services (% of commercial service exports)
#Food exports (% of merchandise exports)
#Fuel exports (% of merchandise exports)
#Insurance and financial services (% of commercial service exports)
#Manufactures exports (% of merchandise exports)
#Medium and high-tech exports (% manufactured exports)
#Merchandise exports (current US$)
#Merchandise exports by the reporting economy (current US$)
#Ores and metals exports (% of merchandise exports)
#Transport services (% of commercial service exports)
#Travel services (% of commercial service exports)

#Imports:
#Agricultural raw materials imports (% of merchandise imports)
#Commercial service imports (current US$)
#Computer, communications and other services (% of commercial service imports)
#Food imports (% of merchandise imports)
#Fuel imports (% of merchandise imports)
#Insurance and financial services (% of commercial service imports)
#Manufactures imports (% of merchandise imports)
#Merchandise imports (current US$)
#Ores and metals imports (% of merchandise imports)
#Transport services (% of commercial service imports)
#Travel services (% of commercial service imports)


#imports and exports are in two categories : as a % of merchandise and as a % of comercial services
par(mfrow=c(2,2))
title(main = "1996-2017: Imports (Brazil)")
ts.plot((bra_imports_agri_raw_materials_ts),col="black",type='o',
        lwd=1.9,
        ylab="Imports (% of Merchandise) ",xlab='year',
        ylim=c(-5,80))
lines((bra_imports_food_ts),col="red",type='o', lwd=1.9)
lines((bra_imports_fuel_ts),col="blue",type='o', lwd=1.9)
lines((bra_imports_manufacturing_ts),col="green",type='o', lwd=1.9)
lines((bra_imports_ores_metals_ts),col="orange",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("Agri","Food","Fuel","Manufactures","Ores/Metal"),
       col=c("black","red","Blue","Green","orange"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6) 

ts.plot((bra_imports_computer_communications_ts),col="black",type='o',
        lwd=1.9,
        ylab="Imports (% of Commercial Services) ",xlab='year',
        ylim=c(-5,100))
lines((bra_imports_insurance_financial_ts),col="red",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("ComputerTech","Insurance/Finance"),
       col=c("black","red"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6) 

title(main = "1996-2017: Exports (Brazil)")
ts.plot((bra_exports_agri_raw_materials_ts),col="black",type='o',
        lwd=1.9,
        ylab="Exports (% of Merchandise) ",xlab='year',
        ylim=c(-5,80))
lines((bra_exports_food_ts),col="red",type='o', lwd=1.9)
lines((bra_exports_fuel_ts),col="blue",type='o', lwd=1.9)
lines((bra_exports_manufacturing_ts),col="green",type='o', lwd=1.9)
lines((bra_exports_ores_metal_ts),col="orange",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("Agri","Food","Fuel","Manufactures","Ores/Metal"),
       col=c("black","red","Blue","Green","orange"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6) 

ts.plot((bra_exports_computer_communication_ts),col="black",type='o',
        lwd=1.9,
        ylab="Exports (% of Commercial Services) ",xlab='year',
        ylim=c(-5,100))
lines((bra_exports_insurance_financial_ts),col="red",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("ComputerTech","Insurance/Finance"),
       col=c("black","red"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6) 

#*****************************************************************

par(mfrow=c(2,2))
title(main = "1996-2017: Imports (China)")
ts.plot((chn_imports_agri_raw_materials_ts),col="black",type='o',
        lwd=1.9,
        ylab="Imports (% of Merchandise) ",xlab='year',
        ylim=c(-5,80))
lines((chn_imports_food_ts),col="red",type='o', lwd=1.9)
lines((chn_imports_fuel_ts),col="blue",type='o', lwd=1.9)
lines((chn_imports_manufacturing_ts),col="green",type='o', lwd=1.9)
lines((chn_imports_ores_metals_ts),col="orange",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("Agri","Food","Fuel","Manufactures","Ores/Metal"),
       col=c("black","red","Blue","Green","orange"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6) 

ts.plot((chn_imports_computer_communications_ts),col="black",type='o',
        lwd=1.9,
        ylab="Imports (% of Commercial Services) ",xlab='year',
        ylim=c(-5,100))
lines((chn_imports_insurance_financial_ts),col="red",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("ComputerTech","Insurance/Finance"),
       col=c("black","red"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6) 

title(main = "1996-2017: Exports (China)")
ts.plot((chn_exports_agri_raw_materials_ts),col="black",type='o',
        lwd=1.9,
        ylab="Exports (% of Merchandise) ",xlab='year',
        ylim=c(-5,10))
lines((chn_exports_food_ts),col="red",type='o', lwd=1.9)
lines((chn_exports_fuel_ts),col="blue",type='o', lwd=1.9)
lines((chn_exports_manufacturing_ts),col="green",type='o', lwd=1.9)
lines((chn_exports_ores_metal_ts),col="orange",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("Agri","Food","Fuel","Manufactures","Ores/Metal"),
       col=c("black","red","Blue","Green","orange"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6) 

ts.plot((chn_exports_computer_communication_ts),col="black",type='o',
        lwd=1.9,
        ylab="Exports (% of Commercial Services) ",xlab='year',
        ylim=c(-5,100))
lines((chn_exports_insurance_financial_ts),col="red",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("ComputerTech","Insurance/Finance"),
       col=c("black","red"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6) 


#*****************************************************************

par(mfrow=c(2,2))
title(main = "1996-2017: Imports (India)")
ts.plot((ind_imports_agri_raw_materials_ts),col="black",type='o',
        lwd=1.9,
        ylab="Imports (% of Merchandise) ",xlab='year',
        ylim=c(-5,80))
lines((ind_imports_food_ts),col="red",type='o', lwd=1.9)
lines((ind_imports_fuel_ts),col="blue",type='o', lwd=1.9)
lines((ind_imports_manufacturing_ts),col="green",type='o', lwd=1.9)
lines((ind_imports_ores_metals_ts),col="orange",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("Agri","Food","Fuel","Manufactures","Ores/Metal"),
       col=c("black","red","Blue","Green","orange"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6) 

ts.plot((ind_imports_computer_communications_ts),col="black",type='o',
        lwd=1.9,
        ylab="Imports (% of Commercial Services) ",xlab='year',
        ylim=c(-5,100))
lines((ind_imports_insurance_financial_ts),col="red",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("ComputerTech","Insurance/Finance"),
       col=c("black","red"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6) 

title(main = "1996-2017: Exports (India)")
ts.plot((ind_exports_agri_raw_materials_ts),col="black",type='o',
        lwd=1.9,
        ylab="Exports (% of Merchandise) ",xlab='year',
        ylim=c(-5,80))
lines((ind_exports_food_ts),col="red",type='o', lwd=1.9)
lines((ind_exports_fuel_ts),col="blue",type='o', lwd=1.9)
lines((ind_exports_manufacturing_ts),col="green",type='o', lwd=1.9)
lines((ind_exports_ores_metal_ts),col="orange",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("Agri","Food","Fuel","Manufactures","Ores/Metal"),
       col=c("black","red","Blue","Green","orange"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6) 

ts.plot((ind_exports_computer_communication_ts),col="black",type='o',
        lwd=1.9,
        ylab="Exports (% of Commercial Services) ",xlab='year',
        ylim=c(-5,100))
lines((ind_exports_insurance_financial_ts),col="red",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("ComputerTech","Insurance/Finance"),
       col=c("black","red"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6) 


#*****************************************************************

par(mfrow=c(2,2))
title(main = "1996-2017: Imports (Russia)")
ts.plot((rus_imports_agri_raw_materials_ts),col="black",type='o',
        lwd=1.9,
        ylab="Imports (% of Merchandise) ",xlab='year',
        ylim=c(-5,90))
lines((rus_imports_food_ts),col="red",type='o', lwd=1.9)
lines((rus_imports_fuel_ts),col="blue",type='o', lwd=1.9)
lines((rus_imports_manufacturing_ts),col="green",type='o', lwd=1.9)
lines((rus_imports_ores_metals_ts),col="orange",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("Agri","Food","Fuel","Manufactures","Ores/Metal"),
       col=c("black","red","Blue","Green","orange"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6) 

ts.plot((rus_imports_computer_communications_ts),col="black",type='o',
        lwd=1.9,
        ylab="Imports (% of Commercial Services) ",xlab='year',
        ylim=c(-5,100))
lines((rus_imports_insurance_financial_ts),col="red",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("ComputerTech","Insurance/Finance"),
       col=c("black","red"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6) 

title(main = "1996-2017: Exports (Russia)")
ts.plot((rus_exports_agri_raw_materials_ts),col="black",type='o',
        lwd=1.9,
        ylab="Exports (% of Merchandise) ",xlab='year',
        ylim=c(-5,80))
lines((rus_exports_food_ts),col="red",type='o', lwd=1.9)
lines((rus_exports_fuel_ts),col="blue",type='o', lwd=1.9)
lines((rus_exports_manufacturing_ts),col="green",type='o', lwd=1.9)
lines((rus_exports_ores_metal_ts),col="orange",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("Agri","Food","Fuel","Manufactures","Ores/Metal"),
       col=c("black","red","Blue","Green","orange"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6) 

ts.plot((rus_exports_computer_communication_ts),col="black",type='o',
        lwd=1.9,
        ylab="Exports (% of Commercial Services) ",xlab='year',
        ylim=c(-5,100))
lines((rus_exports_insurance_financial_ts),col="red",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("ComputerTech","Insurance/Finance"),
       col=c("black","red"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6) 

#*****************************************************************

par(mfrow=c(2,2))
title(main = "1996-2017: Imports (South Africa)")
ts.plot((zaf_imports_agri_raw_materials_ts),col="black",type='o',
        lwd=1.9,
        ylab="Imports (% of Merchandise) ",xlab='year',
        ylim=c(-5,80))
lines((zaf_imports_food_ts),col="red",type='o', lwd=1.9)
lines((zaf_imports_fuel_ts),col="blue",type='o', lwd=1.9)
lines((zaf_imports_manufacturing_ts),col="green",type='o', lwd=1.9)
lines((zaf_imports_ores_metals_ts),col="orange",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("Agri","Food","Fuel","Manufactures","Ores/Metal"),
       col=c("black","red","Blue","Green","orange"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6) 

ts.plot((zaf_imports_computer_communications_ts),col="black",type='o',
        lwd=1.9,
        ylab="Imports (% of Commercial Services) ",xlab='year',
        ylim=c(-5,100))
lines((zaf_imports_insurance_financial_ts),col="red",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("ComputerTech","Insurance/Finance"),
       col=c("black","red"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6) 

title(main = "1996-2017: Exports (South Africa)")
ts.plot((zaf_exports_agri_raw_materials_ts),col="black",type='o',
        lwd=1.9,
        ylab="Exports (% of Merchandise) ",xlab='year',
        ylim=c(-5,80))
lines((zaf_exports_food_ts),col="red",type='o', lwd=1.9)
lines((zaf_exports_fuel_ts),col="blue",type='o', lwd=1.9)
lines((zaf_exports_manufacturing_ts),col="green",type='o', lwd=1.9)
lines((zaf_exports_ores_metal_ts),col="orange",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("Agri","Food","Fuel","Manufactures","Ores/Metal"),
       col=c("black","red","Blue","Green","orange"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6) 

ts.plot((zaf_exports_computer_communication_ts),col="black",type='o',
        lwd=1.9,
        ylab="Exports (% of Commercial Services) ",xlab='year',
        ylim=c(-5,100))
lines((zaf_exports_insurance_finance_ts),col="red",type='o', lwd=1.9)
legend(x="bottomleft",inset=0,legend=c("ComputerTech","Insurance/Finance"),
       col=c("black","red"),lwd=2,cex=0.7,horiz=TRUE)
grid (10,10, lty = 6) 

