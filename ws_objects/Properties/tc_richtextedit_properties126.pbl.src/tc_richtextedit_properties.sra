$PBExportHeader$tc_richtextedit_properties.sra
forward
global type tc_richtextedit_properties from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
//@@ Global Parameter @@

nvo_transaction Gtr_Frame        // frame work  transaction
nvo_transaction Gtr_Sqlserver    //sqlserver test db transaction
nvo_transaction Gtr_Oracle       //Oracle test db transaction
nvo_transaction Gtr_Asa          //Asa test db transaction
nvo_transaction Gtr_Ase          //Ase test db transaction
nvo_transaction Gtr_Btms         //Btms db transaction
string Gs_ApplicationPath




end variables

global type tc_richtextedit_properties from application
string appname = "tc_richtextedit_properties"
end type
global tc_richtextedit_properties tc_richtextedit_properties

forward prototypes
public function integer of_connect ()
end prototypes

public function integer of_connect ();//
string ls_dbms
n_cst_config ln_connect

//Create transaction
Gtr_frame     = create nvo_transaction
Gtr_BTMS      = create nvo_transaction
Gtr_sqlserver = create nvo_transaction
Gtr_oracle    = create nvo_transaction
Gtr_asa       = create nvo_transaction
Gtr_ase       = create nvo_transaction

//get global source path
Gs_ApplicationPath = profilestring("config.ini", "Path", "ApplicationPath", "")
ln_connect.of_connect(Gtr_frame, 'GTR_FRAME')

if gtr_frame.sqlcode = 0 then

	//set BTMS Transaction
	ls_dbms  =  profilestring("config.ini", "DBMS", "BTMS", "false")
	if upper(ls_dbms) = 'TRUE' then
		ln_connect.of_connect(Gtr_btms, 'BTMS')
	end if

	//set sqlserver transaction
	ls_dbms  =  profilestring("config.ini", "DBMS", "SQLSERVER", "false")
	if upper(ls_dbms) = 'TRUE' then
		ln_connect.of_connect(Gtr_sqlserver, "EN_SQL2000")
	end if

	//set oracle transaction
	ls_dbms  =  profilestring("config.ini", "DBMS", "ORACLE", "false")
	if upper(ls_dbms) = 'TRUE' then
		ln_connect.of_connect(Gtr_oracle, "EN_ORA9I")
	end if
	
	//set asa transaction
	ls_dbms  =  profilestring("config.ini", "DBMS", "ASA", "false")
	if upper(ls_dbms) = 'TRUE' then
		ln_connect.of_connect(Gtr_asa, "EN_ASA80")
	end if
	
	//set ase transaction
	ls_dbms  =  profilestring("config.ini", "DBMS", "ASE", "false")
	if upper(ls_dbms) = 'TRUE' then
		ln_connect.of_connect(Gtr_ase, 'EN_ASE1253')
	end if
else
	messagebox("Connect FrameWork Db Error!", gtr_frame.sqlerrtext)
	halt
end if

return 1
end function

on tc_richtextedit_properties.create
appname="tc_richtextedit_properties"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on tc_richtextedit_properties.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;if of_connect() = 1 then
	open(w_simplecasemain)
end if
end event

event close;if isvalid(Gtr_frame) then
	disconnect using Gtr_frame;
	destroy Gtr_frame
end if

if isvalid(Gtr_sqlserver) then
	disconnect using Gtr_sqlserver;
	destroy Gtr_sqlserver
end if

if isvalid(Gtr_oracle) then
	disconnect using Gtr_oracle;
	destroy Gtr_oracle
end if

if isvalid(Gtr_asa) then
	disconnect using Gtr_asa;
	destroy Gtr_asa
end if


if isvalid(Gtr_ase) then
	disconnect using Gtr_ase;
	destroy Gtr_ase
end if
end event

