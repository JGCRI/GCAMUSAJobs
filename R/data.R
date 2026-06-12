#' SCurve
#'
#' @description
#' This data provides the shut-down assumptions by fuel and technology at the state level
#'
#' @details
#' Follow package plutus to gather the assumptions
#'
#' @source
#' GCAM assumptions used in GCAM-USA 7.1; see scripts for details
#'
#' @examples
#' data(SCurve)
"SCurve"


#' hydro_cf
#'
#' @description
#' This data provides a state-level annual capacity factor of hydro power
#'
#' @format
#' A data frame with `49` rows and `3` variables:
#'
#' @source
#' Hall et al., 2003. Table 8, exported as GODEEP/Assumptions/hydro_CF_USA.csv
#' state level monthly capacity factor
#'
#' @examples
#' data(hydro_cf)
"hydro_cf"


#' OM_cost
#'
#' @description
#' This data technology level OM fixed and variable cost information
#'
#' @source
#' GCAM data
#'
#' @examples
#' data(OM_cost)
"OM_cost"


#' mapUS52Compact
#'
#' @description
#' This data presents the spatial information of USA states
#'
#' @source
#' https://github.com/JGCRI/rmap/tree/main/data
#'
#' @examples
#' data(mapUS52Compact[, 1:6])
"mapUS52Compact"



#' colors
#'
#' @description
#' specify the fill color by job type fr plot functions
"colors"


#' theme0
#'
#' @description
#' specify plot theme0
"theme0"

#' theme1
#'
#' @description
#' specify plot theme1
"theme1"

#' theme_leg
#'
#' @description
#' specify plot theme_leg
"theme_leg"

#' Conversion factor from exajoules to kilowatt-hours
#'
#' A numeric conversion factor used to convert energy values from EJ to kWh.
#'
#' @format A numeric value.
#' @keywords datasets
"CONV_EJ_KWH"

#' Conversion factor from gigawatt-hours to exajoules
#'
#' A numeric conversion factor used to convert energy values from GWh to EJ.
#'
#' @format A numeric value.
#' @keywords datasets
"CONV_GWH_EJ"

#' Raw JEDI employment factors
#'
#' Raw employment factor data used in GCAM-USA jobs calculations.
#'
#' @format A data frame.
#' @keywords datasets
"EF.JEDI.RAW"

#' Processed JEDI employment factors
#'
#' Processed employment factor data used in GCAM-USA jobs calculations.
#'
#' @format A data frame.
#' @keywords datasets
"EF.JEDI"

#' GCAM future start year
#'
#' Starting year used for future GCAM model periods.
#'
#' @format A numeric value.
#' @keywords datasets
"GCAM_futr_start"

#' GCAM future end year
#'
#' Ending year used for future GCAM model periods.
#'
#' @format A numeric value.
#' @keywords datasets
"GCAM_futr_end"

#' GCAM model time step
#'
#' Time step used between GCAM model years.
#'
#' @format A numeric value.
#' @keywords datasets
"GCAM_model_step"

#' Conversion factor from gigawatts to megawatts
#'
#' A numeric conversion factor used to convert GW to MW.
#'
#' @format A numeric value.
#' @keywords datasets
"convGW_MW"

#' Conversion factor from megawatts to kilowatts
#'
#' A numeric conversion factor used to convert MW to kW.
#'
#' @format A numeric value.
#' @keywords datasets
"convMW_kW"

#' GCAM-USA states
#'
#' State-level identifiers used by GCAM-USA jobs calculations.
#'
#' @format A character vector or data frame.
#' @keywords datasets
"gcamusa.STATES"

#' Geographic capacity factor data
#'
#' Geographic capacity factor data used in GCAM-USA jobs calculations.
#'
#' @format A data frame.
#' @keywords datasets
"geo_cf"

#' Example trial data
#'
#' Example data used for testing or demonstration.
#'
#' @format A data frame.
#' @keywords datasets
"trial_data"

#' GCAM year mapping data
#'
#' Mapping between GCAM model years and related time periods.
#'
#' @format A data frame.
#' @keywords datasets
"years_mapping"
