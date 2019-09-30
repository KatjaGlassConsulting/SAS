%LET root = /folders/myshortcuts/git;
%LET base = &root/SAS;

/*
filename mymacs "&base/tools/downloads/rowland_utilmacros";
%include mymacs('*.sas');

filename mymacs "&root/SASScottBass/Macro";
%include mymacs('*.sas');
*/


OPTIONS SASAUTOS = ("&base/tools/downloads/rowland_utilmacros", "&root/SASScottBass/Macro" , SASAUTOS);
OPTIONS MRECALL;


LIBNAME adam "&base/data/adam";
LIBNAME adam_mod "&base/data/adam/mod_01";

%PUT ************ DONE *********************;

OPTIONS NONOTES NOSOURCE;




















*************************** COMPVARS ********************************;

%* check the example;
%LET ds1 = adam.adtte;
%LET ds2 = adam_mod.addte;
%compvars(&ds1,&ds2);
%put NOTE: Variables found in &ds1 but not &ds2:;
%put &_left_;
%put NOTE: Variables found in &ds2 but not &ds1:;
%put &_right_;
%put NOTE: Variables found in both &ds1 and &ds2:;
%put &_both_;




















%* check with WORK library;
DATA addte; SET adam.adtte; RUN; 
DATA addte_mod; SET adam_mod.adtte; RUN;
%LET ds1 = addte;
%LET ds2 = addte_mod;
%compvars(&ds1,&ds2)
OPTIONS NONOTES NOSOURCE;
%put Variables found in &ds1 but not &ds2:;
%put &_left_;
%put Variables found in &ds2 but not &ds1:;
%put &_right_;
%put Variables found in both &ds1 and &ds2:;
%put &_both_;





















*************************** COMPLIB ********************************;
%complibs(adam,adam_mod);




















%complibs(adam,adam_mod, sortvars=usubjid);












*************************** COMPARE ********************************;
%compare(base=adam.adtte,compare=adam_mod.adtte,by=usubjid);



























%compare(base=adam,compare=adam_mod,by=usubjid);


