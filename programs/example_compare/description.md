# How to use Open Source SAS Macros? COMPARE as example!

## 1. Seach for related macros

Tool | Macro | Description
--- | --- | ---
SAS Macros by Scott Bass | compare | PROC COMPARE either two datasets or two libraries
Roland's SAS® Macros | complibs | To "proc compare" identically-named datasets in two libraries
Roland's SAS® Macros | compvars | To compare the differences in variables present in two datasets and report the results to global macro variables.


## 2. Download & Setup

- Download complete git repository from Scott Bass
- Download zip file for Roland's SAS® Macros and unzip
- Checkout required sub-macros
- Think about macro setup 
    - Options
        - Include of all macros / submacros
        - Using SASAUTOS
        - Creating macro catalog
    - What if the same names available?
        - Rename all macros? "Tool"-prefix? 
        - Set & Reset for every macro?
- Test environment
    - need data and libraries with differences

## 3. Prepare environment

- create example dataset(s)
- perform "include" of all macros

``` sas
    filename mymacs "<path>";
    %include mymacs('*.sas');
```

![caution](../../images/caution_40.png) | ONLY IF YOU ARE SURE THAT THESE ARE ONLY MACROS AND YOU TRUST THEM
--|--

**Issues in Roland's SAS® Macros**

- contains a "program" instad of macro
- remove this (datanulldemo.sas)