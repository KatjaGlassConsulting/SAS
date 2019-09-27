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

## 4. Checkout Macro "compvars"

- checkout the header for example / usage

```
/ Usage     : %let ds1=dataset1;
/             %let ds2=dataset2;
/             %compvars(&ds1,&ds2)
/             options nosource;
/             %put NOTE: Variables found in &ds1 but not &ds2:;
/             %put &_left_;
/             %put NOTE: Variables found in &ds2 but not &ds1:;
/             %put &_right_;
/             %put NOTE: Variables found in both &ds1 and &ds2:;
/             %put &_both_;
```

- using prepared example data for the datasets 
    - `%let ds1=adam.adtte;`
    - `%let ds1=adam_mod.adtte;`

Now the fun starts:

```
 ERROR: File ADAM_MOD.ADDTE.DATA does not exist.
```

- either checkout the source or
- check to modify the call

Copy the datasets to the work library: 

- `%let ds1=adtte;`
- `%let ds1=adtte_mod;`

The result is now as expected:

```
Variables found in addte but not addte_mod:
SAFFL
Variables found in addte_mod but not addte:
newvar
Variables found in both addte and addte_mod:
ADT AGE AGEGR1 AGEGR1N AVAL CNSR EVNTDESC PARAM PARAMCD RACE RACEN SEX SITEID SRCDOM SRCSEQ SRCVAR STARTDT STUDYID TRTA TRTAN TRTDUR TRTEDT TRTP TRTSDT USUBJID
```

## 5. Checkout Macro "complibs"

- checkout the header for example / usage

```
/ Usage     : %complibs(base,comp)
/
/===============================================================================
/ PARAMETERS:
/-------name------- -------------------------description------------------------
/ libold            (pos) Libref of old library or path name enclosed in quotes.
/ libnew            (pos) Libref of new library or path name enclosed in quotes.
/ sortvars          (optional) List of variables separated by spaces that you
/                   would use to sort the datasets to obtain uniqueness. If left
/                   blank then the current sort order is used.
/ dfsortvars        (options) Default sort variables to use if none defined to
/                   sortvars= and no current sort variables detected for a
/                   dataset.
/ direct=no         By default, do not do a one to one obs comparison. Overrides
/                   sort variable parameters if set to yes. Use this is your
/                   datasets should be exactly the same.
/ options           Options for "proc compare". "listall" is the default.
/ chardiff=no       (unquoted) By default, do not show detailed character field
/                   differences.
/ dslist            Optional list of datasets to compare that you know exist in
/                   both libraries.
/ titlenum=1        Start title number
```

- using prepared example data for the datasets 
    - `%complibs(adam,adam_mod);`