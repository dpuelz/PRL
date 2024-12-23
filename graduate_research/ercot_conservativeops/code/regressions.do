
// this is a do file to run a simple linear regression

use "/Users/josephwilliams/Desktop/Github_Repos/PRL/new_energy/code/artifacts/var_table11.13.dta", clear


// Generate a binary variable for Winter Storm Uri (set date according to the event date, e.g., Feb 13, 2021)
gen winter_storm_uri = Date_Time >= tc(13feb2021 00:00:00)

// Generate an ECRS indicator variable that is 1 if ECRS_MW has a valid numeric value, 0 otherwise
gen ECRS = !missing(ECRS_MW)

//Full regression //really just a mess
regr ERCHUBAvgSettlePrice_Avg_Price ERCActualSystemDemand_Avg_Load__ Henry_Hub_Henry_Hub_Natural_Gas_ ERCNuclear_MW ERCRenewables_w_s__MW ECRS_MW ECRS winter_storm_uri

//with just ECRS //clearly some conserv. ops from winter storm uri responsible for ECRS 
regr ERCHUBAvgSettlePrice_Avg_Price ERCActualSystemDemand_Avg_Load__ Henry_Hub_Henry_Hub_Natural_Gas_ ERCNuclear_MW ERCRenewables_w_s__MW ECRS

//with ECRSrate + uri.  Uri dropped for collinearity
regr ERCHUBAvgSettlePrice_Avg_Price ERCActualSystemDemand_Avg_Load__ Henry_Hub_Henry_Hub_Natural_Gas_ ERCNuclear_MW ERCRenewables_w_s__MW ECRS_MW winter_storm_uri

corr Henry_Hub_Henry_Hub_Natural_Gas_ ECRS_MW

//with just the indicator vars
regr ERCHUBAvgSettlePrice_Avg_Price ERCActualSystemDemand_Avg_Load__ Henry_Hub_Henry_Hub_Natural_Gas_ ERCNuclear_MW ERCRenewables_w_s__MW ECRS winter_storm_uri


