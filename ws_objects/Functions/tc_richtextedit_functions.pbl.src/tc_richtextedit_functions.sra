$PBExportHeader$tc_richtextedit_functions.sra
forward
global type tc_richtextedit_functions from application
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

global type tc_richtextedit_functions from application
string appname = "tc_richtextedit_functions"
end type
global tc_richtextedit_functions tc_richtextedit_functions

forward prototypes
public function integer of_connect ()
end prototypes

public function integer of_connect ();//
string ls_dbms
n_cst_config ln_connect

//Create transaction
Gtr_frame     = create nvo_transaction
//Gtr_BTMS      = create nvo_transaction
Gtr_sqlserver = create nvo_transaction
//Gtr_oracle    = create nvo_transaction
//Gtr_asa       = create nvo_transaction
//Gtr_ase       = create nvo_transaction

//get global source path
Gs_ApplicationPath = profilestring("config.ini", "Path", "ApplicationPath", "")
ln_connect.of_connect(Gtr_frame, 'GTR_FRAME')

if gtr_frame.sqlcode = 0 then
	ln_connect.of_connect(Gtr_sqlserver, "EN_SQL2000")
	if Gtr_sqlserver.sqlcode <> 0 then
		messagebox("Connect EN_SQL2000 Error!", Gtr_sqlserver.sqlerrtext)
		halt close
	end if
else
	messagebox("Connect FrameWork Db Error!", gtr_frame.sqlerrtext)
	halt close
end if

return 1
end function

on tc_richtextedit_functions.create
appname="tc_richtextedit_functions"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on tc_richtextedit_functions.destroy
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

