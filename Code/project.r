library("car", lib.loc="~/R/win-library/3.5")
library("data.table", lib.loc="~/R/win-library/3.5")
library("DescTools", lib.loc="~/R/win-library/3.5")
library("e1071", lib.loc="~/R/win-library/3.5")
library("ggplot2", lib.loc="~/R/win-library/3.5")
library("plyr", lib.loc="~/R/win-library/3.5")
library("rlang", lib.loc="~/R/win-library/3.5")
library("RMySQL", lib.loc="~/R/win-library/3.5")
library("datasets", lib.loc="C:/Program Files/R/R-3.5.1/library")
library("tidyverse", lib.loc="~/R/win-library/3.5")
library("Rcpp", lib.loc="~/R/win-library/3.5")
library("tibble", lib.loc="~/R/win-library/3.5")
library("forecast", lib.loc="~/R/win-library/3.5")
library("xts", lib.loc="~/R/win-library/3.5")
library("zoo", lib.loc="~/R/win-library/3.5")
library("astsa", lib.loc="~/R/win-library/3.5")

#start a MySQL connection
connect <- dbConnect(MySQL(),
                     user='root',
                     password='Mathews17',
                     host='localhost',
                     dbname='BRICS')

#Check that the connection works
summary(connect)
dbGetInfo(connect)
dbListTables(connect)
dbListFields(connect,"PPP")
dbGetQuery(connect,"SELECT countrycode,seriesname FROM Imports ")

#Create R datasets from the MySQLDatabase
BOP_FDI <- dbReadTable(connect,"BOP_FDI")
BOP_GoodsServices <- dbReadTable(connect,"BOP_GoodsServices")
BOP_Reserves <- dbReadTable(connect,"BOP_Reserves")
Exports <- dbReadTable(connect,"Exports")
GDP <- dbReadTable(connect,"GDP")
Imports <- dbReadTable(connect,"Imports")
PPP <- dbReadTable(connect,"PPP")
Population <- dbReadTable(connect,"Population_YoungGen")
Inflation <- dbReadTable(connect,"Inflation")

#create  a vector to store year values
yearIndex <- 1969:2018
test <- bra_bop_reserves_ts/1000000

#extract individual series' from the datasets
#BOP_FDI
bra_bop_fdi_net<- BOP_FDI[1,5:54]
bra_bop_fdi_net_inflow<- BOP_FDI[2,5:54]
bra_bop_fdi_net_outflow<- BOP_FDI[3,5:54]

chn_bop_fdi_net<- BOP_FDI[4,5:54]
chn_bop_fdi_net_inflow<- BOP_FDI[5,5:54]
chn_bop_fdi_net_outflow<- BOP_FDI[6,5:54]

ind_bop_fdi_net<- BOP_FDI[7,5:54]
ind_bop_fdi_net_inflow<- BOP_FDI[8,5:54]
ind_bop_fdi_net_outflow<- BOP_FDI[9,5:54]

rus_bop_fdi_net<- BOP_FDI[10,5:54]
rus_bop_fdi_net_inflow<- BOP_FDI[11,5:54]
rus_bop_fdi_net_outflow<- BOP_FDI[12,5:54]

zaf_bop_fdi_net<- BOP_FDI[13,5:54]
zaf_bop_fdi_net_inflow<- BOP_FDI[14,5:54]
zaf_bop_fdi_net_outflow<- BOP_FDI[15,5:54]

#BOP_GoodsServices
bra_bop_goods_services_imports<-BOP_GoodsServices[1,5:54]
bra_bop_goods_services_exports<-BOP_GoodsServices[2,5:54]
bra_bop_goods_services_net_pri_income<-BOP_GoodsServices[3,5:54]

chn_bop_goods_services_imports<-BOP_GoodsServices[4,5:54]
chn_bop_goods_services_exports<-BOP_GoodsServices[5,5:54]
chn_bop_goods_services_net_pri_income<-BOP_GoodsServices[6,5:54]

ind_bop_goods_services_imports<-BOP_GoodsServices[7,5:54]
ind_bop_goods_services_exports<-BOP_GoodsServices[8,5:54]
ind_bop_goods_services_net_pri_income<-BOP_GoodsServices[9,5:54]

rus_bop_goods_services_imports<-BOP_GoodsServices[10,5:54]
rus_bop_goods_services_exports<-BOP_GoodsServices[11,5:54]
rus_bop_goods_services_net_pri_income<-BOP_GoodsServices[12,5:54]

zaf_bop_goods_services_imports<-BOP_GoodsServices[13,5:54]
zaf_bop_goods_services_exports<-BOP_GoodsServices[14,5:54]
zaf_bop_goods_services_net_pri_income<-BOP_GoodsServices[15,5:54]

#BOP_Reserves
bra_bop_reserves<-BOP_Reserves[1,5:54]
chn_bop_reserves<-BOP_Reserves[2,5:54]
ind_bop_reserves<-BOP_Reserves[3,5:54]
rus_bop_reserves<-BOP_Reserves[4,5:54]
zaf_bop_reserves<-BOP_Reserves[5,5:54]

#Exports
bra_exports_agri_raw_materials<-Exports[1,5:54]
bra_exports_commercial_service<-Exports[2,5:54]
bra_exports_computer_communication<-Exports[3,5:54]
bra_exports_food<-Exports[4,5:54]
bra_exports_fuel<-Exports[5,5:54]
bra_exports_insurance_finance<-Exports[6,5:54]
bra_exports_manufacturing<-Exports[7,5:54]
bra_exports_medium_hightech<-Exports[8,5:54]
bra_exports_merchandise<-Exports[9,5:54]
bra_exports_ores_metal<-Exports[22,5:54]
bra_exports_transport_services<-Exports[23,5:54]
bra_exports_travel<-Exports[24,5:54]

chn_exports_agri_raw_materials<-Exports[25,5:54]
chn_exports_commercial_service<-Exports[26,5:54]
chn_exports_computer_communication<-Exports[27,5:54]
chn_exports_food<-Exports[28,5:54]
chn_exports_fuel<-Exports[29,5:54]
chn_exports_insurance_finance<-Exports[30,5:54]
chn_exports_manufacturing<-Exports[31,5:54]
chn_exports_medium_hightech<-Exports[32,5:54]
chn_exports_merchandise<-Exports[33,5:54]
chn_exports_ores_metal<-Exports[46,5:54]
chn_exports_transport_services<-Exports[47,5:54]
chn_exports_travel<-Exports[48,5:54]

ind_exports_agri_raw_materials<-Exports[49,5:54]
ind_exports_commercial_service<-Exports[50,5:54]
ind_exports_computer_communication<-Exports[51,5:54]
ind_exports_food<-Exports[52,5:54]
ind_exports_fuel<-Exports[53,5:54]
ind_exports_insurance_finance<-Exports[54,5:54]
ind_exports_manufacturing<-Exports[55,5:54]
ind_exports_medium_hightech<-Exports[56,5:54]
ind_exports_merchandise<-Exports[57,5:54]
ind_exports_ores_metal<-Exports[70,5:54]
ind_exports_transport_services<-Exports[71,5:54]
ind_exports_travel<-Exports[72,5:54]

rus_exports_agri_raw_materials<-Exports[73,5:54]
rus_exports_commercial_service<-Exports[74,5:54]
rus_exports_computer_communication<-Exports[75,5:54]
rus_exports_food<-Exports[76,5:54]
rus_exports_fuel<-Exports[77,5:54]
rus_exports_insurance_finance<-Exports[78,5:54]
rus_exports_manufacturing<-Exports[77,5:54]
rus_exports_medium_hightech<-Exports[80,5:54]
rus_exports_merchandise<-Exports[81,5:54]
rus_exports_ores_metal<-Exports[94,5:54]
rus_exports_transport_services<-Exports[95,5:54]
rus_exports_travel<-Exports[96,5:54]

zaf_exports_agri_raw_materials<-Exports[97,5:54]
zaf_exports_commercial_service<-Exports[98,5:54]
zaf_exports_computer_communication<-Exports[99,5:54]
zaf_exports_food<-Exports[100,5:54]
zaf_exports_fuel<-Exports[101,5:54]
zaf_exports_insurance_finance<-Exports[102,5:54]
zaf_exports_manufacturing<-Exports[103,5:54]
zaf_exports_medium_hightech<-Exports[104,5:54]
zaf_exports_merchandise<-Exports[105,5:54]
zaf_exports_ores_metal<-Exports[118,5:54]
zaf_exports_transport_services<-Exports[119,5:54]
zaf_exports_travel<-Exports[120,5:54]

#GDP
bra_gdp_expense<-GDP[1,5:54]
bra_gdp_exports_goods_services<-GDP[2,5:54]
bra_gdp_fdi_net_inflows<-GDP[3,5:54]
bra_gdp_fdi_net_outflows<-GDP[4,5:54]
bra_gdp<-GDP[5,5:54]
bra_gdp_growth<-GDP[6,5:54]
bra_gdp_per_capita<-GDP[7,5:54]
bra_gdp_imports_goods_services<-GDP[8,5:54]
bra_gdp_tax_revenue<-GDP[9,5:54]
bra_gdp_trade<-GDP[10,5:54]

chn_gdp_expense<-GDP[11,5:54]
chn_gdp_exports_goods_services<-GDP[12,5:54]
chn_gdp_fdi_net_inflows<-GDP[13,5:54]
chn_gdp_fdi_net_outflows<-GDP[14,5:54]
chn_gdp<-GDP[15,5:54]
chn_gdp_growth<-GDP[16,5:54]
chn_gdp_per_capita<-GDP[17,5:54]
chn_gdp_imports_goods_services<-GDP[18,5:54]
chn_gdp_tax_revenue<-GDP[19,5:54]
chn_gdp_trade<-GDP[20,5:54]

ind_gdp_expense<-GDP[21,5:54]
ind_gdp_exports_goods_services<-GDP[22,5:54]
ind_gdp_fdi_net_inflows<-GDP[23,5:54]
ind_gdp_fdi_net_outflows<-GDP[24,5:54]
ind_gdp<-GDP[25,5:54]
ind_gdp_growth<-GDP[26,5:54]
ind_gdp_per_capita<-GDP[27,5:54]
ind_gdp_imports_goods_services<-GDP[28,5:54]
ind_gdp_tax_revenue<-GDP[29,5:54]
ind_gdp_trade<-GDP[30,5:54]

rus_gdp_expense<-GDP[31,5:54]
rus_gdp_exports_goods_services<-GDP[32,5:54]
rus_gdp_fdi_net_inflows<-GDP[33,5:54]
rus_gdp_fdi_net_outflows<-GDP[34,5:54]
rus_gdp<-GDP[35,5:54]
rus_gdp_growth<-GDP[36,5:54]
rus_gdp_per_capita<-GDP[37,5:54]
rus_gdp_imports_goods_services<-GDP[38,5:54]
rus_gdp_tax_revenue<-GDP[39,5:54]
rus_gdp_trade<-GDP[40,5:54]

zaf_gdp_expense<-GDP[41,5:54]
zaf_gdp_exports_goods_services<-GDP[42,5:54]
zaf_gdp_fdi_net_inflows<-GDP[43,5:54]
zaf_gdp_fdi_net_outflows<-GDP[44,5:54]
zaf_gdp<-GDP[45,5:54]
zaf_gdp_growth<-GDP[46,5:54]
zaf_gdp_per_capita<-GDP[47,5:54]
zaf_gdp_imports_goods_services<-GDP[48,5:54]
zaf_gdp_tax_revenue<-GDP[49,5:54]
zaf_gdp_trade<-GDP[50,5:54]

#Imports
bra_imports_agri_raw_materials<-Imports[1,5:54]
bra_imports_commercial_service<-Imports[2,5:54]
bra_imports_computer_communications<-Imports[3,5:54]
bra_imports_food<-Imports[4,5:54]
bra_imports_fuel<-Imports[5,5:54]
bra_imports_insurance_financial<-Imports[6,5:54]
bra_imports_manufaturing<-Imports[7,5:54]
bra_imports_merchandise<-Imports[8,5:54]
bra_imports_ores_metals<-Imports[21,5:54]
bra_imports_transport<-Imports[22,5:54]
bra_imports_travel<-Imports[23,5:54]

chn_imports_agri_raw_materials<-Imports[24,5:54]
chn_imports_commercial_service<-Imports[25,5:54]
chn_imports_computer_communications<-Imports[26,5:54]
chn_imports_food<-Imports[27,5:54]
chn_imports_fuel<-Imports[28,5:54]
chn_imports_insurance_financial<-Imports[29,5:54]
chn_imports_manufaturing<-Imports[30,5:54]
chn_imports_merchandise<-Imports[31,5:54]
chn_imports_ores_metals<-Imports[44,5:54]
chn_imports_transport<-Imports[45,5:54]
chn_imports_travel<-Imports[46,5:54]

ind_imports_agri_raw_materials<-Imports[47,5:54]
ind_imports_commercial_service<-Imports[48,5:54]
ind_imports_computer_communications<-Imports[49,5:54]
ind_imports_food<-Imports[50,5:54]
ind_imports_fuel<-Imports[51,5:54]
ind_imports_insurance_financial<-Imports[52,5:54]
ind_imports_manufaturing<-Imports[53,5:54]
ind_imports_merchandise<-Imports[54,5:54]
ind_imports_ores_metals<-Imports[67,5:54]
ind_imports_transport<-Imports[68,5:54]
ind_imports_travel<-Imports[69,5:54]

rus_imports_agri_raw_materials<-Imports[70,5:54]
rus_imports_commercial_service<-Imports[71,5:54]
rus_imports_computer_communications<-Imports[72,5:54]
rus_imports_food<-Imports[73,5:54]
rus_imports_fuel<-Imports[74,5:54]
rus_imports_insurance_financial<-Imports[75,5:54]
rus_imports_manufaturing<-Imports[76,5:54]
rus_imports_merchandise<-Imports[77,5:54]
rus_imports_ores_metals<-Imports[90,5:54]
rus_imports_transport<-Imports[91,5:54]
rus_imports_travel<-Imports[92,5:54]

zaf_imports_agri_raw_materials<-Imports[93,5:54]
zaf_imports_commercial_service<-Imports[94,5:54]
zaf_imports_computer_communications<-Imports[95,5:54]
zaf_imports_food<-Imports[96,5:54]
zaf_imports_fuel<-Imports[97,5:54]
zaf_imports_insurance_financial<-Imports[98,5:54]
zaf_imports_manufaturing<-Imports[99,5:54]
zaf_imports_merchandise<-Imports[100,5:54]
zaf_imports_ores_metals<-Imports[113,5:54]
zaf_imports_transport<-Imports[114,5:54]
zaf_imports_travel<-Imports[115,5:54]


#PPP
bra_ppp_gdp<-PPP[1,5:54]
bra_ppp_gni<-PPP[2,5:54]

chn_ppp_gdp<-PPP[3,5:54]
chn_ppp_gni<-PPP[4,5:54]

ind_ppp_gdp<-PPP[5,5:54]
ind_ppp_gni<-PPP[6,5:54]

rus_ppp_gdp<-PPP[7,5:54]
rus_ppp_gni<-PPP[8,5:54]

zaf_ppp_gdp<-PPP[9,5:54]
zaf_ppp_gni<-PPP[10,5:54]


#Population
bra_pop_age_20_24_female<-Population[1,5:54]
bra_pop_age_20_24_male<-Population[2,5:54]
bra_pop_age_25_29_female<-Population[3,5:54]
bra_pop_age_25_29_male<-Population[4,5:54]
bra_pop_age_30_34_female<-Population[5,5:54]
bra_pop_age_30_34_male<-Population[6,5:54]

chn_pop_age_20_24_female<-Population[7,5:54]
chn_pop_age_20_24_male<-Population[8,5:54]
chn_pop_age_25_29_female<-Population[9,5:54]
chn_pop_age_25_29_male<-Population[10,5:54]
chn_pop_age_30_34_female<-Population[11,5:54]
chn_pop_age_30_34_male<-Population[12,5:54]

ind_pop_age_20_24_female<-Population[13,5:54]
ind_pop_age_20_24_male<-Population[14,5:54]
ind_pop_age_25_29_female<-Population[15,5:54]
ind_pop_age_25_29_male<-Population[16,5:54]
ind_pop_age_30_34_female<-Population[17,5:54]
ind_pop_age_30_34_male<-Population[18,5:54]

rus_pop_age_20_24_female<-Population[19,5:54]
rus_pop_age_20_24_male<-Population[20,5:54]
rus_pop_age_25_29_female<-Population[21,5:54]
rus_pop_age_25_29_male<-Population[22,5:54]
rus_pop_age_30_34_female<-Population[23,5:54]
rus_pop_age_30_34_male<-Population[24,5:54]

zaf_pop_age_20_24_female<-Population[25,5:54]
zaf_pop_age_20_24_male<-Population[26,5:54]
zaf_pop_age_25_29_female<-Population[27,5:54]
zaf_pop_age_25_29_male<-Population[28,5:54]
zaf_pop_age_30_34_female<-Population[29,5:54]
zaf_pop_age_30_34_male<-Population[30,5:54]

bra_pop_female<- bra_pop_age_20_24_female + bra_pop_age_25_29_female + bra_pop_age_30_34_female
bra_pop_male<-bra_pop_age_20_24_male+bra_pop_age_25_29_male+bra_pop_age_30_34_male

chn_pop_female<- chn_pop_age_20_24_female+chn_pop_age_25_29_female+chn_pop_age_30_34_female
chn_pop_male<- chn_pop_age_20_24_male+chn_pop_age_25_29_male+chn_pop_age_30_34_male

ind_pop_female<- ind_pop_age_20_24_female+ind_pop_age_25_29_female+ind_pop_age_30_34_female
ind_pop_male<- ind_pop_age_20_24_male+ind_pop_age_25_29_male+ind_pop_age_30_34_male

rus_pop_female<- rus_pop_age_20_24_female+rus_pop_age_25_29_female+rus_pop_age_30_34_female
rus_pop_male<- rus_pop_age_20_24_male+rus_pop_age_25_29_male+rus_pop_age_30_34_male

zaf_pop_female<- zaf_pop_age_20_24_female+zaf_pop_age_25_29_female+zaf_pop_age_30_34_female
zaf_pop_male<-zaf_pop_age_20_24_male+zaf_pop_age_25_29_male+zaf_pop_age_30_34_male


#inflation
bra_inflation <- Inflation[1,5:54]
chn_inflation <- Inflation[1,5:54]
ind_inflation <- Inflation[1,5:54]
rus_inflation <- Inflation[1,5:54]
zaf_inflation <- Inflation[1,5:54]

#Currencies

#*****************---------------------------------------------*************************#


#Convert the above dataframes to time series data
test<-as.double(bra_bop_reserves[,1:49])
test<-ts(test,start=1969,end=2017)
test1<-as.double(chn_bop_reserves[,1:49])
test1<-ts(test1,start=1969,end=2017)
test2<-as.double(ind_bop_reserves[,1:49])
test2<-ts(test2,start=1969,end=2017)
test3<-as.double(rus_bop_reserves[,1:49])
test3<-ts(test3,start=1969,end=2017)
test4<-as.double(zaf_bop_reserves[,1:49])
test4<-ts(test4,start=1969,end=2017)
ts.plot(bra_ppp_gdp_ts,type='o',ylim=c(0,9000000000000),col='black')
lines(chn_ppp_gdp_ts,type='o',col='red')
lines(ind_ppp_gdp_ts,type='o',col='blue')
lines(rus_ppp_gdp_ts,type='o',col='green')
lines(zaf_ppp_gdp_ts,type='o',col='grey')

#PPP
bra_ppp_gdp_ts<-ts(as.double(bra_ppp_gdp[,22:49]),start=1990,end=2017)
bra_ppp_gni_ts<-ts(as.double(bra_ppp_gni[,22:49]),start=1990,end=2017)

chn_ppp_gdp_ts<-ts(as.double(chn_ppp_gdp[,22:49]),start=1990,end=2017)
chn_ppp_gni_ts<-ts(as.double(chn_ppp_gdi[,22:49]),start=1990,end=2017)

ind_ppp_gdp_ts<-ts(as.double(ind_ppp_gdp[,22:49]),start=1990,end=2017)
ind_ppp_gni_ts<-ts(as.double(ind_ppp_gni[,22:49]),start=1990,end=2017)

rus_ppp_gdp_ts<-ts(as.double(rus_ppp_gdp[,22:49]),start=1990,end=2017)
rus_ppp_gni_ts<-ts(as.double(rus_ppp_gni[,22:49]),start=1990,end=2017)

zaf_ppp_gdp_ts<-ts(as.double(zaf_ppp_gdp[,22:49]),start=1990,end=2017)
zaf_ppp_gni_ts<-ts(as.double(zaf_ppp_gni[,22:49]),start=1990,end=2017)

#Imports
#Brazil started imports in 1975
bra_imports_agri_raw_materials_ts<-ts(as.double(bra_imports_agri_raw_materials[,28:49]),start=1996,end=2017)
bra_imports_commercial_service_ts<-ts(as.double(bra_imports_commercial_service[,28:49]),start=1996,end=2017)
bra_imports_computer_communications_ts<-ts(as.double(bra_imports_computer_communications[,28:49]),start=1996,end=2017)
bra_imports_food_ts<-ts(as.double(bra_imports_food[,28:49]),start=1996,end=2017)
bra_imports_fuel_ts<-ts(as.double(bra_imports_fuel[,28:49]),start=1996,end=2017)
bra_imports_insurance_financial_ts<-ts(as.double(bra_imports_insurance_financial[,28:49]),start=1996,end=2017)
bra_imports_manufacturing_ts<-ts(as.double(bra_imports_manufaturing[,28:49]),start=1996,end=2017)
bra_imports_merchandise_ts<-ts(as.double(bra_imports_merchandise[,28:49]),start=1996,end=2017)
bra_imports_ores_metals_ts<-ts(as.double(bra_imports_ores_metals[,28:49]),start=1996,end=2017)
bra_imports_transport_ts<-ts(as.double(bra_imports_transport[,28:49]),start=1996,end=2017)
bra_imports_travel_ts<-ts(as.double(bra_imports_travel[,28:49]),start=1996,end=2017)

#China started imports in 1984
chn_imports_agri_raw_materials_ts<-ts(as.double(chn_imports_agri_raw_materials[,28:49]),start=1996,end=2017)
chn_imports_commercial_service_ts<-ts(as.double(chn_imports_commercial_service[,28:49]),start=1996,end=2017)
chn_imports_computer_communications_ts<-ts(as.double(chn_imports_computer_communications[,28:49]),start=1996,end=2017)
chn_imports_food_ts<-ts(as.double(chn_imports_food[,28:49]),start=1996,end=2017)
chn_imports_fuel_ts<-ts(as.double(chn_imports_fuel[,28:49]),start=1996,end=2017)
chn_imports_insurance_financial_ts<-ts(as.double(chn_imports_insurance_financial[,28:49]),start=1996,end=2017)
chn_imports_manufacturing_ts<-ts(as.double(chn_imports_manufaturing[,28:49]),start=1996,end=2017)
chn_imports_merchandise_ts<-ts(as.double(chn_imports_merchandise[,28:49]),start=1996,end=2017)
chn_imports_ores_metals_ts<-ts(as.double(chn_imports_ores_metals[,28:49]),start=1996,end=2017)
chn_imports_transport_ts<-ts(as.double(chn_imports_transport[,28:49]),start=1996,end=2017)
chn_imports_travel_ts<-ts(as.double(chn_imports_travel[,28:49]),start=1996,end=2017)

#India started imports for food in 1969 , but other goods and services from 1975
ind_imports_agri_raw_materials_ts<-ts(as.double(ind_imports_agri_raw_materials[,28:49]),start=1996,end=2017)
ind_imports_commercial_service_ts<-ts(as.double(ind_imports_commercial_service[,28:49]),start=1996,end=2017)
ind_imports_computer_communications_ts<-ts(as.double(ind_imports_computer_communications[,28:49]),start=1996,end=2017)
ind_imports_food_ts<-ts(as.double(ind_imports_food[,28:49]),start=1996,end=2017)
ind_imports_fuel_ts<-ts(as.double(ind_imports_fuel[,28:49]),start=1996,end=2017)
ind_imports_insurance_financial_ts<-ts(as.double(ind_imports_insurance_financial[,28:49]),start=1996,end=2017)
ind_imports_manufacturing_ts<-ts(as.double(ind_imports_manufaturing[,28:49]),start=1996,end=2017)
ind_imports_merchandise_ts<-ts(as.double(ind_imports_merchandise[,28:49]),start=1996,end=2017)
ind_imports_ores_metals_ts<-ts(as.double(ind_imports_ores_metals[,28:49]),start=1996,end=2017)
ind_imports_transport_ts<-ts(as.double(ind_imports_transport[,28:49]),start=1996,end=2017)
ind_imports_travel_ts<-ts(as.double(ind_imports_travel[,28:49]),start=1996,end=2017)

#Russia started imports in 1996
rus_imports_agri_raw_materials_ts<-ts(as.double(rus_imports_agri_raw_materials[,28:49]),start=1996,end=2017)
rus_imports_commercial_service_ts<-ts(as.double(rus_imports_commercial_service[,28:49]),start=1996,end=2017)
rus_imports_computer_communications_ts<-ts(as.double(rus_imports_computer_communications[,28:49]),start=1996,end=2017)
rus_imports_food_ts<-ts(as.double(rus_imports_food[,28:49]),start=1996,end=2017)
rus_imports_fuel_ts<-ts(as.double(rus_imports_fuel[,28:49]),start=1996,end=2017)
rus_imports_insurance_financial_ts<-ts(as.double(rus_imports_insurance_financial[,28:49]),start=1996,end=2017)
rus_imports_manufacturing_ts<-ts(as.double(rus_imports_manufaturing[,28:49]),start=1996,end=2017)
rus_imports_merchandise_ts<-ts(as.double(rus_imports_merchandise[,28:49]),start=1996,end=2017)
rus_imports_ores_metals_ts<-ts(as.double(rus_imports_ores_metals[,28:49]),start=1996,end=2017)
rus_imports_transport_ts<-ts(as.double(rus_imports_transport[,28:49]),start=1996,end=2017)
rus_imports_travel_ts<-ts(as.double(rus_imports_travel[,28:49]),start=1996,end=2017)

#South Africa started imports in 1974
zaf_imports_agri_raw_materials_ts<-ts(as.double(zaf_imports_agri_raw_materials[,28:49]),start=1996,end=2017)
zaf_imports_commercial_service_ts<-ts(as.double(zaf_imports_commercial_service[,28:49]),start=1996,end=2017)
zaf_imports_computer_communications_ts<-ts(as.double(zaf_imports_computer_communications[,28:49]),start=1996,end=2017)
zaf_imports_food_ts<-ts(as.double(zaf_imports_food[,28:49]),start=1996,end=2017)
zaf_imports_fuel_ts<-ts(as.double(zaf_imports_fuel[,28:49]),start=1996,end=2017)
zaf_imports_insurance_financial_ts<-ts(as.double(zaf_imports_insurance_financial[,28:49]),start=1996,end=2017)
zaf_imports_manufacturing_ts<-ts(as.double(zaf_imports_manufaturing[,28:49]),start=1996,end=2017)
zaf_imports_merchandise_ts<-ts(as.double(zaf_imports_merchandise[,28:49]),start=1996,end=2017)
zaf_imports_ores_metals_ts<-ts(as.double(zaf_imports_ores_metals[,28:49]),start=1996,end=2017)
zaf_imports_transport_ts<-ts(as.double(zaf_imports_transport[,28:49]),start=1996,end=2017)
zaf_imports_travel_ts<-ts(as.double(zaf_imports_travel[,28:49]),start=1996,end=2017)


#GDP
bra_gdp_expense_ts<-ts(as.double(bra_gdp_expense[,31:49]),start=1999,end=2017)
bra_gdp_exports_goods_services_ts<-ts(as.double(bra_gdp_exports_goods_services[,31:49]),start=1999,end=2017)
bra_gdp_fdi_net_inflows_ts<-ts(as.double(bra_gdp_fdi_net_inflows[,31:49]),start=1999,end=2017)
bra_gdp_fdi_net_outflows_ts<-ts(as.double(bra_gdp_fdi_net_outflows[,31:49]),start=1999,end=2017)
bra_gdp_ts<-ts(as.numeric(bra_gdp[,31:49]),start=1999,end=2017)
bra_gdp_growth_ts<-ts(as.double(bra_gdp_growth[,31:49]),start=1999,end=2017)
bra_gdp_per_capita_ts<-ts(as.double(bra_gdp_per_capita[,31:49]),start=1999,end=2017)
bra_gdp_imports_goods_services_ts<-ts(as.double(bra_gdp_imports_goods_services[,31:49]),start=1999,end=2017)
bra_gdp_tax_revenue_ts<-ts(as.double(bra_gdp_tax_revenue[,31:49]),start=1999,end=2017)
bra_gdp_trade_ts<-ts(as.double(bra_gdp_trade[,31:49]),start=1999,end=2017)

chn_gdp_expense_ts<-ts(as.double(chn_gdp_expense[,31:49]),start=1999,end=2017)
chn_gdp_exports_goods_services_ts<-ts(as.double(chn_gdp_exports_goods_services[,31:49]),start=1999,end=2017)
chn_gdp_fdi_net_inflows_ts<-ts(as.double(chn_gdp_fdi_net_inflows[,31:49]),start=1999,end=2017)
chn_gdp_fdi_net_outflows_ts<-ts(as.double(chn_gdp_fdi_net_outflows[,31:49]),start=1999,end=2017)
chn_gdp_ts<-ts(as.double(chn_gdp[,31:49]),start=1999,end=2017)
chn_gdp_growth_ts<-ts(as.double(chn_gdp_growth[,31:49]),start=1999,end=2017)
chn_gdp_per_capita_ts<-ts(as.double(chn_gdp_per_capita[,31:49]),start=1999,end=2017)
chn_gdp_imports_goods_services_ts<-ts(as.double(chn_gdp_imports_goods_services[,31:49]),start=1999,end=2017)
chn_gdp_tax_revenue_ts<-ts(as.double(chn_gdp_tax_revenue[,31:49]),start=1999,end=2017)
chn_gdp_trade_ts<-ts(as.double(chn_gdp_trade[,31:49]),start=1999,end=2017)

ind_gdp_expense_ts<-ts(as.double(ind_gdp_expense[,31:49]),start=1999,end=2017)
ind_gdp_exports_goods_services_ts<-ts(as.double(ind_gdp_exports_goods_services[,31:49]),start=1999,end=2017)
ind_gdp_fdi_net_inflows_ts<-ts(as.double(ind_gdp_fdi_net_inflows[,31:49]),start=1999,end=2017)
ind_gdp_fdi_net_outflows_ts<-ts(as.double(ind_gdp_fdi_net_outflows[,31:49]),start=1999,end=2017)
ind_gdp_ts<-ts(as.double(ind_gdp[,31:49]),start=1999,end=2017)
ind_gdp_growth_ts<-ts(as.double(ind_gdp_growth[,31:49]),start=1999,end=2017)
ind_gdp_per_capita_ts<-ts(as.double(ind_gdp_per_capita[,31:49]),start=1999,end=2017)
ind_gdp_imports_goods_services_ts<-ts(as.double(ind_gdp_imports_goods_services[,31:49]),start=1999,end=2017)
ind_gdp_tax_revenue_ts<-ts(as.double(ind_gdp_tax_revenue[,31:49]),start=1999,end=2017)
ind_gdp_trade_ts<-ts(as.double(ind_gdp_trade[,31:49]),start=1999,end=2017)

rus_gdp_expense_ts<-ts(as.double(rus_gdp_expense[,31:49]),start=1999,end=2017)
rus_gdp_exports_goods_services_ts<-ts(as.double(rus_gdp_exports_goods_services[,31:49]),start=1999,end=2017)
rus_gdp_fdi_net_inflows_ts<-ts(as.double(rus_gdp_fdi_net_inflows[,31:49]),start=1999,end=2017)
rus_gdp_fdi_net_outflows_ts<-ts(as.double(rus_gdp_fdi_net_outflows[,31:49]),start=1999,end=2017)
rus_gdp_ts<-ts(as.double(rus_gdp[,31:49]),start=1999,end=2017)
rus_gdp_growth_ts<-ts(as.double(rus_gdp_growth[,31:49]),start=1999,end=2017)
rus_gdp_per_capita_ts<-ts(as.double(rus_gdp_per_capita[,31:49]),start=1999,end=2017)
rus_gdp_imports_goods_services_ts<-ts(as.double(rus_gdp_imports_goods_services[,31:49]),start=1999,end=2017)
rus_gdp_tax_revenue_ts<-ts(as.double(rus_gdp_tax_revenue[,31:49]),start=1999,end=2017)
rus_gdp_trade_ts<-ts(as.double(rus_gdp_trade[,31:49]),start=1999,end=2017)

zaf_gdp_expense_ts<-ts(as.double(zaf_gdp_expense[,31:49]),start=1999,end=2017)
zaf_gdp_exports_goods_services_ts<-ts(as.double(zaf_gdp_exports_goods_services[,31:49]),start=1999,end=2017)
zaf_gdp_fdi_net_inflows_ts<-ts(as.double(zaf_gdp_fdi_net_inflows[,31:49]),start=1999,end=2017)
zaf_gdp_fdi_net_outflows_ts<-ts(as.double(zaf_gdp_fdi_net_outflows[,31:49]),start=1999,end=2017)
zaf_gdp_ts<-ts(as.double(zaf_gdp[,31:49]),start=1999,end=2017)
zaf_gdp_growth_ts<-ts(as.double(zaf_gdp_growth[,31:49]),start=1999,end=2017)
zaf_gdp_per_capita_ts<-ts(as.double(zaf_gdp_per_capita[,31:49]),start=1999,end=2017)
zaf_gdp_imports_goods_services_ts<-ts(as.double(zaf_gdp_imports_goods_services[,31:49]),start=1999,end=2017)
zaf_gdp_tax_revenue_ts<-ts(as.double(zaf_gdp_tax_revenue[,31:49]),start=1999,end=2017)
zaf_gdp_trade_ts<-ts(as.double(zaf_gdp_trade[,31:49]),start=1999,end=2017)



#Exports
bra_exports_agri_raw_materials_ts<-ts(as.double(bra_exports_agri_raw_materials[,28:49]),start=1996,end=2017)
bra_exports_commercial_service_ts<-ts(as.double(bra_exports_commercial_service[,28:49]),start=1996,end=2017)
bra_exports_computer_communication_ts<-ts(as.double(bra_exports_computer_communication[,28:49]),start=1996,end=2017)
bra_exports_food_ts<-ts(as.double(bra_exports_food[,28:49]),start=1996,end=2017)
bra_exports_fuel_ts<-ts(as.double(bra_exports_fuel[,28:49]),start=1996,end=2017)
bra_exports_insurance_finance_ts<-ts(as.double(bra_exports_insurance_finance[,28:49]),start=1996,end=2017)
bra_exports_medium_hightech_ts<-ts(as.double(bra_exports_medium_hightech[,28:49]),start=1996,end=2017)
bra_exports_merchandise_ts<-ts(as.double(bra_exports_merchandise[,28:49]),start=1996,end=2017)
bra_exports_ores_metal_ts<-ts(as.double(bra_exports_ores_metal[,28:49]),start=1996,end=2017)
bra_exports_transport_services_ts<-ts(as.double(bra_exports_transport_services[,28:49]),start=1996,end=2017)
bra_exports_travel_ts<-ts(as.double(bra_exports_travel[,28:49]),start=1996,end=2017)


chn_exports_agri_raw_materials_ts<-ts(as.double(chn_exports_agri_raw_materials[,28:49]),start=1996,end=2017)
chn_exports_commercial_service_ts<-ts(as.double(chn_exports_commercial_service[,28:49]),start=1996,end=2017)
chn_exports_computer_communication_ts<-ts(as.double(chn_exports_computer_communication[,28:49]),start=1996,end=2017)
chn_exports_food_ts<-ts(as.double(chn_exports_food[,28:49]),start=1996,end=2017)
chn_exports_fuel_ts<-ts(as.double(chn_exports_fuel[,28:49]),start=1996,end=2017)
chn_exports_insurance_finance_ts<-ts(as.double(chn_exports_insurance_finance[,28:49]),start=1996,end=2017)
chn_exports_medium_hightech_ts<-ts(as.double(chn_exports_medium_hightech[,28:49]),start=1996,end=2017)
chn_exports_merchandise_ts<-ts(as.double(chn_exports_merchandise[,28:49]),start=1996,end=2017)
chn_exports_ores_metal_ts<-ts(as.double(chn_exports_ores_metal[,28:49]),start=1996,end=2017)
chn_exports_transport_services_ts<-ts(as.double(chn_exports_transport_services[,28:49]),start=1996,end=2017)
chn_exports_travel_ts<-ts(as.double(chn_exports_travel[,28:49]),start=1996,end=2017)


ind_exports_agri_raw_materials_ts<-ts(as.double(ind_exports_agri_raw_materials[,28:49]),start=1996,end=2017)
ind_exports_commercial_service_ts<-ts(as.double(ind_exports_commercial_service[,28:49]),start=1996,end=2017)
ind_exports_computer_communication_ts<-ts(as.double(ind_exports_computer_communication[,28:49]),start=1996,end=2017)
ind_exports_food_ts<-ts(as.double(ind_exports_food[,28:49]),start=1996,end=2017)
ind_exports_fuel_ts<-ts(as.double(ind_exports_fuel[,28:49]),start=1996,end=2017)
ind_exports_insurance_finance_ts<-ts(as.double(ind_exports_insurance_finance[,28:49]),start=1996,end=2017)
ind_exports_medium_hightech_ts<-ts(as.double(ind_exports_medium_hightech[,28:49]),start=1996,end=2017)
ind_exports_merchandise_ts<-ts(as.double(ind_exports_merchandise[,28:49]),start=1996,end=2017)
ind_exports_ores_metal_ts<-ts(as.double(ind_exports_ores_metal[,28:49]),start=1996,end=2017)
ind_exports_transport_services_ts<-ts(as.double(ind_exports_transport_services[,28:49]),start=1996,end=2017)
ind_exports_travel_ts<-ts(as.double(ind_exports_travel[,28:49]),start=1996,end=2017)


rus_exports_agri_raw_materials_ts<-ts(as.double(rus_exports_agri_raw_materials[,28:49]),start=1996,end=2017)
rus_exports_commercial_service_ts<-ts(as.double(rus_exports_commercial_service[,28:49]),start=1996,end=2017)
rus_exports_computer_communication_ts<-ts(as.double(rus_exports_computer_communication[,28:49]),start=1996,end=2017)
rus_exports_food_ts<-ts(as.double(rus_exports_food[,28:49]),start=1996,end=2017)
rus_exports_fuel_ts<-ts(as.double(rus_exports_fuel[,28:49]),start=1996,end=2017)
rus_exports_insurance_finance_ts<-ts(as.double(rus_exports_insurance_finance[,28:49]),start=1996,end=2017)
rus_exports_medium_hightech_ts<-ts(as.double(rus_exports_medium_hightech[,28:49]),start=1996,end=2017)
rus_exports_merchandise_ts<-ts(as.double(rus_exports_merchandise[,28:49]),start=1996,end=2017)
rus_exports_ores_metal_ts<-ts(as.double(rus_exports_ores_metal[,28:49]),start=1996,end=2017)
rus_exports_transport_services_ts<-ts(as.double(rus_exports_transport_services[,28:49]),start=1996,end=2017)
rus_exports_travel_ts<-ts(as.double(rus_exports_travel[,28:49]),start=1996,end=2017)


zaf_exports_agri_raw_materials_ts<-ts(as.double(zaf_exports_agri_raw_materials[,28:49]),start=1996,end=2017)
zaf_exports_commercial_service_ts<-ts(as.double(zaf_exports_commercial_service[,28:49]),start=1996,end=2017)
zaf_exports_computer_communication_ts<-ts(as.double(zaf_exports_computer_communication[,28:49]),start=1996,end=2017)
zaf_exports_food_ts<-ts(as.double(zaf_exports_food[,28:49]),start=1996,end=2017)
zaf_exports_fuel_ts<-ts(as.double(zaf_exports_fuel[,28:49]),start=1996,end=2017)
zaf_exports_insurance_finance_ts<-ts(as.double(zaf_exports_insurance_finance[,28:49]),start=1996,end=2017)
zaf_exports_medium_hightech_ts<-ts(as.double(zaf_exports_medium_hightech[,28:49]),start=1996,end=2017)
zaf_exports_merchandise_ts<-ts(as.double(zaf_exports_merchandise[,28:49]),start=1996,end=2017)
zaf_exports_ores_metal_ts<-ts(as.double(zaf_exports_ores_metal[,28:49]),start=1996,end=2017)
zaf_exports_transport_services_ts<-ts(as.double(zaf_exports_transport_services[,28:49]),start=1996,end=2017)
zaf_exports_travel_ts<-ts(as.double(zaf_exports_travel[,28:49]),start=1996,end=2017)



#BOP_Reserves
bra_bop_reserves_ts<-ts(as.double(bra_bop_reserves[,25:49]),start=1993,end=2017)
chn_bop_reserves_ts<-ts(as.double(chn_bop_reserves[,25:49]),start=1993,end=2017)
ind_bop_reserves_ts<-ts(as.double(ind_bop_reserves[,25:49]),start=1993,end=2017)
rus_bop_reserves_ts<-ts(as.double(rus_bop_reserves[,25:49]),start=1993,end=2017)
zaf_bop_reserves_ts<-ts(as.double(zaf_bop_reserves[,25:49]),start=1993,end=2017)



#BOP_GoodsServices
bra_bop_goods_services_imports_ts<-ts(as.double(bra_bop_goods_services_imports[,26:49]),start=1994,end=2017)
bra_bop_goods_services_exports_ts<-ts(as.double(bra_bop_goods_services_exports[,26:49]),start=1994,end=2017)
bra_bop_goods_services_net_pri_income_ts<-ts(as.double(bra_bop_goods_services_net_pri_income[,26:49]),start=1994,end=2017)

chn_bop_goods_services_imports_ts<-ts(as.double(chn_bop_goods_services_imports[,26:49]),start=1994,end=2017)
chn_bop_goods_services_exports_ts<-ts(as.double(chn_bop_goods_services_exports[,26:49]),start=1994,end=2017)
chn_bop_goods_services_net_pri_income_ts<-ts(as.double(chn_bop_goods_services_net_pri_income[,26:49]),start=1994,end=2017)

ind_bop_goods_services_imports_ts<-ts(as.double(ind_bop_goods_services_imports[,26:49]),start=1994,end=2017)
ind_bop_goods_services_exports_ts<-ts(as.double(ind_bop_goods_services_exports[,26:49]),start=1994,end=2017)
ind_bop_goods_services_net_pri_income_ts<-ts(as.double(ind_bop_goods_services_net_pri_income[,26:49]),start=1994,end=2017)

rus_bop_goods_services_imports_ts<-ts(as.double(rus_bop_goods_services_imports[,26:49]),start=1994,end=2017)
rus_bop_goods_services_exports_ts<-ts(as.double(rus_bop_goods_services_exports[,26:49]),start=1994,end=2017)
rus_bop_goods_services_net_pri_income_ts<-ts(as.double(rus_bop_goods_services_net_pri_income[,26:49]),start=1994,end=2017)

zaf_bop_goods_services_imports_ts<-ts(as.double(zaf_bop_goods_services_imports[,26:49]),start=1994,end=2017)
zaf_bop_goods_services_exports_ts<-ts(as.double(zaf_bop_goods_services_exports[,26:49]),start=1994,end=2017)
zaf_bop_goods_services_net_pri_income_ts<-ts(as.double(zaf_bop_goods_services_net_pri_income[,26:49]),start=1994,end=2017)



#BOP_FDI
bra_bop_fdi_net_ts<- ts(as.double(bra_bop_fdi_net[,26:49]),start=1994,end=2017)
bra_bop_fdi_net_inflow_ts<- ts(as.double(bra_bop_fdi_net_inflow[,26:49]),start=1994,end=2017)
bra_bop_fdi_net_outflow_ts<- ts(as.double(bra_bop_fdi_net_outflow[,26:49]),start=1994,end=2017)

chn_bop_fdi_net_ts<- ts(as.double(chn_bop_fdi_net[,26:49]),start=1994,end=2017)
chn_bop_fdi_net_inflow_ts<- ts(as.double(chn_bop_fdi_net_inflow[,26:49]),start=1994,end=2017)
chn_bop_fdi_net_outflow_ts<- ts(as.double(chn_bop_fdi_net_outflow[,26:49]),start=1994,end=2017)

ind_bop_fdi_net_ts<- ts(as.double(ind_bop_fdi_net[,26:49]),start=1994,end=2017)
ind_bop_fdi_net_inflow_ts<- ts(as.double(ind_bop_fdi_net_inflow[,26:49]),start=1994,end=2017)
ind_bop_fdi_net_outflow_ts<- ts(as.double(ind_bop_fdi_net_outflow[,26:49]),start=1994,end=2017)

rus_bop_fdi_net_ts<- ts(as.double(rus_bop_fdi_net[,26:49]),start=1994,end=2017)
rus_bop_fdi_net_inflow_ts<- ts(as.double(rus_bop_fdi_net_inflow[,26:49]),start=1994,end=2017)
rus_bop_fdi_net_outflow_ts<- ts(as.double(rus_bop_fdi_net_outflow[,26:49]),start=1994,end=2017)

zaf_bop_fdi_net_ts<- ts(as.double(zaf_bop_fdi_net[,26:49]),start=1994,end=2017)
zaf_bop_fdi_net_inflow_ts<- ts(as.double(zaf_bop_fdi_net_inflow[,26:49]),start=1994,end=2017)
zaf_bop_fdi_net_outflow_ts<- ts(as.double(zaf_bop_fdi_net_outflow[,26:49]),start=1994,end=2017)


#Population
bra_pop_female_ts<-ts(as.double(bra_pop_female[,22:49]),start=1990,end=2017)
bra_pop_male_ts<-ts(as.double(bra_pop_male[,22:49]),start=1990,end=2017)

chn_pop_female_ts<-ts(as.double(chn_pop_female[,22:49]),start=1990,end=2017)
chn_pop_male_ts<-ts(as.double(chn_pop_male[,22:49]),start=1990,end=2017)

ind_pop_female_ts<-ts(as.double(ind_pop_female[,22:49]),start=1990,end=2017)
ind_pop_male_ts<-ts(as.double(ind_pop_male[,22:49]),start=1990,end=2017)

rus_pop_female_ts<-ts(as.double(rus_pop_female[,22:49]),start=1990,end=2017)
rus_pop_male_ts<-ts(as.double(rus_pop_male[,22:49]),start=1990,end=2017)

zaf_pop_female_ts<-ts(as.double(zaf_pop_female[,22:49]),start=1990,end=2017)
zaf_pop_male_ts<-ts(as.double(zaf_pop_male[,22:49]),start=1990,end=2017)


#Inflation
bra_inflation_ts <- ts(as.double(bra_inflation[,22:49]),start=1990,end=2017)
chn_inflation_ts <- ts(as.double(chn_inflation[,22:49]),start=1990,end=2017)
ind_inflation_ts <- ts(as.double(ind_inflation[,22:49]),start=1990,end=2017)
rus_inflation_ts <- ts(as.double(rus_inflation[,22:49]),start=1990,end=2017)
zaf_inflation_ts <- ts(as.double(zaf_inflation[,22:49]),start=1990,end=2017)

#Currencies


#****************************-----------------------------------------***************************#


