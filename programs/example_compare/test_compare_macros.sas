%LET root = /folders/myshortcuts/git;
%LET base = &root/SAS;

*filename mymacs "&base/tools/downloads/rowland_utilmacros";
*%include mymacs('*.sas');


filename mymacs "&root/SASScottBass/Macro";
%include mymacs('*.sas');