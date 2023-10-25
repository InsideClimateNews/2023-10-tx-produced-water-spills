# Spills of produced water by the Texas oil and gas industry from 2013 to 2022

Data and [R](https://www.r-project.org/) code for the analysis underlying [this]() Inside Climate News article, analyzing a decade of spills in Texas of produced water -- which emerges from wells along with crude oil and gas during fossil fuel extraction.

### Notes on data cleaning/processing

Records of these spills are maintained by the Texas Railroad Commission, which regulates the state's oil and gas industry, in spreadsheets it calls “spill logs.” Through public records requests, we obtained logs held centrally by the Railroad Commission, and those held by the commission's individual district offices throughout the state.

The data required extensive cleaning in R, [OpenRefine](https://openrefine.org/), and Google Sheets to diagnose and fix problems including incorrectly entered dates, inconsistent units for volume, misaligned columns, duplicated entries, and multiple variants of company names, which we standardized for the largest operators. The centrally-held logs were maintained in spreadsheets with individual sheets or tabs named by month and year, allowing us to assign a month and year to any spills lacking a spill date.

Where volumes of produced water were given as greater than or less than a particular value, we used that value. Where a range was given, we used the midpoint of that range. In a small number of cases in which the volume of water recovered was shown as greater than the volume released, we corrected the volume recovered to equal the volume released. We multiplied all volumes given in barrels by 42 to give volumes in U.S. gallons, used for our analysis.

The spill logs documented releases of crude oil, condensates (hydrocarbons with a density less than that of crude oil), natural gas, and produced water, with some records involving spills of more than one substance simultaneously. For our analysis of spills of produced water, we filtered to remove records with no entry for the volume of produced water released, or with a value of zero, and to remove any spills that occured before or after the calendar years 2013 to 2022.

The cleaned and filtered data is in the two data input files described below.

### Analysis

Our analysis of the number and volume of releases of produced water based on the spill logs held centrally by the Railroad Commission is given [here](tx-spills-central.html) and in the file `tx-spills-central.Rmd`. A corresponding analysis for the logs held by commission's district offices is [here](htx-spills-district.html) and in the file `tx-spills-district.Rmd`.

### Other files/folders
* `data` Input data files:

    -  `central_cleaned.csv` Cleaned and filtered data on releases of produced water processed from the spill logs held centrally by the Texas Railroad Commission.
    -  `district_cleaned.csv` Cleaned and filtered data on releases of produced water processed from the spill logs held by individual Railroad Commission district offices.

* `discrepancies.R` Script used to find spills that seemed to be present in either the central- or district-level spill logs only, based on matching by Railroad Commission district and RRC job number/notification number. The largest of these spills were scrutinized manually against the original spreadsheet files to identify genuine mismatches between the two sets of logs.

### Questions/Feedback
Email Peter Aldhous at peter.aldhous@insideclimatenews.org.