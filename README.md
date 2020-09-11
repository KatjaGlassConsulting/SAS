# SAS Scripts Repository for Open Source

This repository supports the work by Katja Glass Consuting which is specialized on Open Source Solutions for Pharma. 


## Structure

The folling structure is used for this repository

| Path | Description |
| --- | --- |
| \SAS\data | data area |
| \SAS\data\adam | ADAM example data (from [PhUSE GitHub](https://github.com/phuse-org/phuse-scripts/tree/master/data/adam/TDF_ADaM_v1.0) on 2019-09-23) |
| \SAS\data\sdtm | SDTM example data (from [PhUSE GitHub](https://github.com/phuse-org/phuse-scripts/tree/master/data/sdtm/TDF_SDTM_v1.0) on 2019-09-23) |
| \SAS\programs | program area |
| \SAS\programs\drafts | program area for one-time programs and drafts |
| \SAS\results | results area |
| \SAS\results\FDAJumpstartExampleOutputs | outputs running modified FDA Jumpstart scripts on SDTM data provided by PhUSE in SAS University edition |
| \SAS\tools\downloads | contains downloads with no changes |
| \SAS\tools\downloads\rowland_utilmacros | Rowland's Utility Macros ([link](http://www.datasavantconsulting.com/roland/Spectre/download.html))


## External Tool Access

Not all source codes are copied into this repository, especially when the original source code is available in a different GitHub repository. The programs referencing other repositories using /git/XXX, where XXX is the download folder for the specific external tool. 

## FDA Jumpstart Scripts

This SAS Macro toolset has been provided to PhUSE under the MIT license. I updated the macros to be able to run this under a Unix environment. Next to the Excel file output (but in XLSX format) also PROC REPORT output for HTML and RTF is created. The example outputs are available in this repository (\SAS\results\FDAJumpstartExampleOutputs). The modified programs are currently not made available as I am searching for sponsorship for an open source project making an update to the FDA Jumstartscript toolset.

## Remark

Not all code is created by me. Especially the source from downloads is created by different people. The link to the original source is provided in this readme file.