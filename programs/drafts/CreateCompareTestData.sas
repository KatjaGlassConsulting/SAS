%LET base = /folders/myshortcuts/git/SAS;


LIBNAME adam "&base/data/adam" ACCESS=readonly;
LIBNAME adam_mod "&base/data/adam/mod_01";

* Copy three original dataset;
PROC COPY IN=adam OUT=adam_mod;
	SELECT adsl adae advs;
RUN;

* Modify one dataset (add/remove observation, add/remove variable, change values of one observation);
DATA adam_mod.adtte;
	SET adam.adtte(DROP=saffl);
	ATTRIB newvar FORMAT=$10.;
	IF MOD(_N_,17)=0 THEN DELETE;
	IF _N_=20 
	THEN DO;
		OUTPUT; 
		usubjid = "01-705-1185";
		
		OUTPUT;
	END;
	IF _N_ = 11 
	THEN DO;
		CALL MISSING(race, aval);
		race = "white";
	END;
RUN;

*Create a new dataset;
DATA adam_mod.new;
	test = 1;
RUN;