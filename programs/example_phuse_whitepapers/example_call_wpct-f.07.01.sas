**********************************************************************;
* Project           : Example how to apply open source scripts
*
* Program name      : example_call_wpct-f.07.01
*
* Author            : Katja Glass
*
* Date created      : 20200117
*
* Purpose           : Show how to apply an open source script
*				      Run this initialization (update paths as required), then run "WPCT-F.07.01.sas" 
*
* Revision History  :
*
* Date				: 20200117
* Author      		: Katja Glass Consutling
* Description       : Only minor modification to comment code which causes errors or are for initilisation
*
* Reference:
* - This source was copied from https://github.com/phuse-org/phuse-scripts/blob/master/whitepapers/WPCT/WPCT-F.07.01.sas
*   on 20200117 using MIT license 
*
**********************************************************************;

%************************************************************************************************************************;
%**                                                                                                                    **;
%** License: MIT                                                                                                       **;
%**                                                                                                                    **;
%** Copyright (c) 2020 Katja Glass Consulting                                                                          **;
%**                                                                                                                    **;
%** Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated       **;
%** documentation files (the "Software"), to deal in the Software without restriction, including without limitation    **;
%** the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and   **;
%** to permit persons to whom the Software is furnished to do so, subject to the following conditions:                 **;
%**                                                                                                                    **;
%** The above copyright notice and this permission notice shall be included in all copies or substantial portions of   **;
%** the Software.                                                                                                      **;
%**                                                                                                                    **;
%** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO   **;
%** THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE     **;
%** AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,**;
%** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE     **;
%** SOFTWARE.                                                                                                          **;
%************************************************************************************************************************;

%LET root = /folders/myshortcuts/git;
%LET base = &root/SAS;
%LET phuse = &root/phuse-scripts;

OPTIONS SASAUTOS=("&phuse/whitepapers/utilities", SASAUTOS);
OPTIONS MRECALL MAUTOSOURCE;

%let ds = ADLBC;
%util_access_test_data(&ds, local=&phuse/data/adam/cdisc-split/) ;

%* program requires time point variables, so create dummy content as not available in test data;
DATA &ds;
	SET &ds;
	ATPTN = 1;
	ATPT = "TimePoint unknown";
RUN;

%let outputs_folder = &base/results;