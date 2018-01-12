$PBExportHeader$w_templet.srw
forward
global type w_templet from window
end type
type cb_update from commandbutton within w_templet
end type
type mle_phenomena from uo_multilineedit within w_templet
end type
type cb_autoparse from commandbutton within w_templet
end type
type cb_wrrun from commandbutton within w_templet
end type
type cb_genconfigfile from commandbutton within w_templet
end type
type dw_info from datawindow within w_templet
end type
type pb_saveexpect from picturebutton within w_templet
end type
type pb_runnext from picturebutton within w_templet
end type
type pb_runall from picturebutton within w_templet
end type
type pb_run from picturebutton within w_templet
end type
type pb_end from picturebutton within w_templet
end type
type mle_expectdesc from uo_multilineedit within w_templet
end type
type mle_describe from uo_multilineedit within w_templet
end type
type mle_factual from uo_multilineedit within w_templet
end type
type mle_expect from uo_multilineedit within w_templet
end type
type dw_testpoint from datawindow within w_templet
end type
type gb_1 from groupbox within w_templet
end type
type gb_2 from groupbox within w_templet
end type
type gb_3 from groupbox within w_templet
end type
type gb_4 from groupbox within w_templet
end type
type gb_5 from groupbox within w_templet
end type
type gb_phenomena from groupbox within w_templet
end type
end forward

global type w_templet from window
string tag = "//@@# replace title @@#"
integer width = 4654
integer height = 2736
boolean titlebar = true
string title = "templet"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_runscript ( string as_testpoint,  long al_row,  boolean ab_exe )
event ue_init ( )
event ue_autorun ( )
event ue_saveexpect ( )
event ue_runnext ( )
event ue_setall ( boolean ab_result )
event ue_viewscript ( )
event ue_reconnectbug ( )
cb_update cb_update
mle_phenomena mle_phenomena
cb_autoparse cb_autoparse
cb_wrrun cb_wrrun
cb_genconfigfile cb_genconfigfile
dw_info dw_info
pb_saveexpect pb_saveexpect
pb_runnext pb_runnext
pb_runall pb_runall
pb_run pb_run
pb_end pb_end
mle_expectdesc mle_expectdesc
mle_describe mle_describe
mle_factual mle_factual
mle_expect mle_expect
dw_testpoint dw_testpoint
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
gb_5 gb_5
gb_phenomena gb_phenomena
end type
global w_templet w_templet

type variables
integer ii_Index = 0
nvo_runwindow_parameter in_para
//nvo_autorun	inv_autorun
//n_cst_sendmail	inv_sendmail

end variables

forward prototypes
public subroutine wf_saveexpect ()
public function integer wf_postrun (string as_result, long al_row)
public function string wf_getstatus ()
public function integer wf_postrun (long al_row)
public subroutine wf_output (any aa_message, boolean ab_clear)
public function boolean wf_iscs ()
public function integer wf_setvalue (ref datastore ads)
public function integer wf_setvalue (ref datastore ads, integer currentrow)
public function integer wf_updatehaveinfo (long al_insertrow)
public function integer wf_saveresult_detail ()
public function integer wf_checkwremark ()
end prototypes

event ue_init();//if the test control(object) need to init , Execute this event


end event

event ue_autorun();//
Long ll_cnt,  ll_runtimes , i, j
string ls_point

ll_cnt = dw_testpoint.rowcount()

if ll_cnt < 1 then return 
for i = 1 to ll_cnt
	dw_testpoint.setrow(i)
	ls_point = dw_testpoint.getitemstring(i, 'TpNo')
	// how many times will run 
	ll_runtimes = dw_testpoint.getitemnumber(i, 'runtimes')
	if ll_runtimes > 1 then
		for j = 1 to ll_runtimes
			//wf_scriptexe(ls_point, i)
			trigger event ue_runscript(ls_point, i, true)
		next
	else
		//wf_scriptexe(ls_point, i)
		trigger event ue_runscript(ls_point, i, true)
	end if
next

end event

event ue_saveexpect();//
wf_saveexpect()
end event

event ue_runnext();//
// Execute the next point

long ll_row, ll_nextrow, ll_cnt, ll_exerow
string ls_testpoint

ll_row = dw_testpoint.getrow()
if ll_row < 1 then return
dw_testpoint.setredraw(false)
dw_testpoint.selectrow(0, false)
ll_cnt = dw_testpoint.rowcount()
ll_nextrow = ll_row + 1

if ll_nextrow > ll_cnt then
	ll_exerow = 1
else
	ll_exerow = ll_nextrow
end if

dw_testpoint.scrolltorow(ll_exerow)
dw_testpoint.selectrow(ll_exerow, true)
ls_testpoint = dw_testpoint.getitemstring(ll_exerow, 'TpNo')
//wf_scriptexe(ls_testpoint, ll_exerow)
trigger event ue_runscript(ls_testpoint, ll_exerow, true)
dw_testpoint.setredraw(true)
end event

event ue_setall(boolean ab_result);//
long   ll_cnt, i
string ls_status, ls_pstatus
if isnull(ab_result) then return

if ab_result then
	ls_status = '1'
	ls_pstatus = '.\res\passed.jpg'
else
	ls_status = '0'
	ls_pstatus = '.\res\failed.jpg'
end if
ll_cnt = dw_testpoint.rowcount()
if ll_cnt > 0 then
	for i = 1 to ll_cnt
		dw_testpoint.setitem(i, 'status', ls_status)
		dw_testpoint.setitem(i, 'pstatus', ls_pstatus)
	next
end if

			
end event

event ue_viewscript();//
string ls_tpno
long   ll_row
ll_row = dw_testpoint.getrow()
if ll_row < 1 then return

ls_tpno = dw_testpoint.getitemstring(ll_row, 'tpno')
openwithparm(w_pop_viewscript, ls_tpno)
end event

public subroutine wf_saveexpect ();//update expect value
long ll_cnt, i
string ls_run, ls_expectvalue
//if in_para.ib_administrator then
	ll_cnt = dw_testpoint.rowcount()
	if ll_cnt > 0 then 
		for i = 1 to ll_cnt
			ls_run = dw_testpoint.getitemstring(i, 'is_run')
			if ls_run = '1' then
				ls_expectvalue = dw_testpoint.getitemstring(i, 'truevalue')
				dw_testpoint.setitem(i, 'expectvalue', ls_expectvalue)
			end if
		next
		dw_testpoint.accepttext()
		if dw_testpoint.update() = 1 then
			commit using Gtr_Frame;
		else
			messagebox("Update Error", "Update testpoint Info Error: " + gtr_frame.sqlerrtext)
			rollback using Gtr_Frame;
		end if
	end if
//end if
end subroutine

public function integer wf_postrun (string as_result, long al_row);//
string ls_expect
if al_row < 1 or isnull(al_row) then return -1
//output factual value
dw_testpoint.setitem(al_row, 'truevalue', as_result)
mle_factual.text = as_result

//Modified is run tag, the tag is prepare to update test result
dw_testpoint.setitem(al_row, 'is_run', '1')



ls_expect = dw_testpoint.getitemstring(al_row, 'expectvalue')

//output expect value
mle_expect.text = ls_expect
if ls_expect = as_result then
	mle_factual.textcolor = rgb(0, 0, 0)
else
	mle_factual.textcolor = rgb(255, 0, 0)
end if

//Is run success?
 
if not isvalid(in_para) then return -1
if not isnull(ls_expect)  then
	if ls_expect = as_result then
		if  in_para.is_auto = '1' then  // auto run
			dw_testpoint.setitem(al_row, 'status', '1')
			dw_testpoint.setitem(al_row, 'pstatus', '.\res\passed.jpg')
		elseif in_para.is_auto = '0' or in_para.is_auto = '2' then   //test point is manual run, we don't estimate whether test point is run success,  if 2 test point after auto run must be manual run
			dw_testpoint.setitem(al_row, 'status', '4') 
			dw_testpoint.setitem(al_row, 'pstatus', '.\res\notcompl.jpg')
		end if
	else
		dw_testpoint.setitem(al_row, 'status', '0')
		dw_testpoint.setitem(al_row, 'pstatus', '.\res\failed.jpg')
	end if
else   // Null value 
	if isnull(as_result) then
		if in_para.is_auto = '1' then // auto run
			dw_testpoint.setitem(al_row, 'status', '1')
			dw_testpoint.setitem(al_row, 'pstatus', '.\res\passed.jpg')
		elseif in_para.is_auto = '0' or in_para.is_auto = '2' then   //test point is manual run, we don't estimate whether test point is run success,  if 2 test point after auto run must be manual run
			dw_testpoint.setitem(al_row, 'status', '4') 
			dw_testpoint.setitem(al_row, 'pstatus', '.\res\notcompl.jpg')
		end if 
	else
		dw_testpoint.setitem(al_row, 'status', '0')
		dw_testpoint.setitem(al_row, 'pstatus', '.\res\failed.jpg')
	end if
end if




return 1

									

end function

public function string wf_getstatus ();//
string ls_status 
long ll_cnt, ll_rowcount

dw_testpoint.setfilter("")
dw_testpoint.filter()
ll_rowcount = dw_testpoint.rowcount()
//dw_testpoint.setredraw(false)
//if have testpoint failed, we return failer
dw_testpoint.setfilter("status = '0'")
dw_testpoint.filter()
ll_cnt = dw_testpoint.rowcount()
if ll_cnt > 0 then
	
	return '0'
end if 

//if have testpoit not completed, we return not completed
dw_testpoint.setfilter("status = '4'")
dw_testpoint.filter()
ll_cnt = dw_testpoint.rowcount()
if ll_cnt > 0 then
	return '4'
end if

//if all testpoint not run, we return not run
dw_testpoint.setfilter("status = '3'")
dw_testpoint.filter()
ll_cnt = dw_testpoint.rowcount()
if ll_cnt = ll_rowcount then
	return '3'
end if

//if all testpoint passed, we return passed
dw_testpoint.setfilter("status = '1'")
dw_testpoint.filter()
ll_cnt = dw_testpoint.rowcount()
if ll_cnt = ll_rowcount then
	return '1'
end if

//if all testpoint not need run, we return not need run
dw_testpoint.setfilter("status = '2'")
dw_testpoint.filter()
ll_cnt = dw_testpoint.rowcount()
if ll_cnt = ll_rowcount then
	return '2'
end if

return '4'
//dw_testpoint.setredraw(true)
end function

public function integer wf_postrun (long al_row);//
string ls_expect, ls_factual
if al_row < 1 or isnull(al_row) then return -1

//output factual value
ls_factual = mle_factual.text
dw_testpoint.setitem(al_row, 'truevalue', ls_factual)

//Modified is run tag, the tag is prepare to update test result
dw_testpoint.setitem(al_row, 'is_run', '1')


//output expect value
ls_expect = dw_testpoint.getitemstring(al_row, 'expectvalue')
mle_expect.text = ls_expect
if ls_expect = ls_factual then
	mle_factual.textcolor = rgb(0, 0, 0)
else
	mle_factual.textcolor = rgb(255, 0, 0)
end if

//Is run success?
 
if not isvalid(in_para) then return -1
if not isnull(ls_expect)  then
	if ls_expect = ls_factual then
		if  in_para.is_auto = '1' then  // auto run
			dw_testpoint.setitem(al_row, 'status', '1')
			dw_testpoint.setitem(al_row, 'pstatus', '.\res\passed.jpg')
		elseif in_para.is_auto = '0' or in_para.is_auto = '2' then   //test point is manual run, we don't estimate whether test point is run success,  if 2 test point after auto run must be manual run
			dw_testpoint.setitem(al_row, 'status', '4') 
			dw_testpoint.setitem(al_row, 'pstatus', '.\res\notcompl.jpg')
		end if
	else
		dw_testpoint.setitem(al_row, 'status', '0')
		dw_testpoint.setitem(al_row, 'pstatus', '.\res\failed.jpg')
	end if
else   // Null value 
	if isnull(ls_factual) then
		if in_para.is_auto = '1' then // auto run
			dw_testpoint.setitem(al_row, 'status', '1')
			dw_testpoint.setitem(al_row, 'pstatus', '.\res\passed.jpg')
		elseif in_para.is_auto = '0' or in_para.is_auto = '2' then   //test point is manual run, we don't estimate whether test point is run success,  if 2 test point after auto run must be manual run
			dw_testpoint.setitem(al_row, 'status', '4') 
			dw_testpoint.setitem(al_row, 'pstatus', '.\res\notcompl.jpg')
		end if 
	else
		dw_testpoint.setitem(al_row, 'status', '0')
		dw_testpoint.setitem(al_row, 'pstatus', '.\res\failed.jpg')
	end if
end if




return 1

									

end function

public subroutine wf_output (any aa_message, boolean ab_clear);////////////////////////////////////////////////////////////////
//Function : Wf_OutPut
//Argument : Any    aa_message;  The Message you will output 
//				 Boolean  ab_clear;  Clear Flag
//Output   : None
//Designer : 
//Date     :
////////////////////////////////////////////////////////////////
long   ll_CurrentRow
string ls_TestPoint

ll_CurrentRow = dw_testpoint.GetRow()

If ab_Clear Then	
	ii_Index = 0
	mle_factual.Text = "【" + dw_testpoint.GetItemString(ll_CurrentRow,"tpno") + "】"	
End IF	

ii_Index ++
mle_factual.Text += "~r~n" + String(ii_Index,'00') + "." + String(aa_Message)
dw_testpoint.SetItem(ll_CurrentRow, 'truevalue', mle_factual.Text)
end subroutine

public function boolean wf_iscs ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_iscs
//
//	Access:  		public
//
//
//	Returns:  boolean
//	 True = Run in C/S environment
//	 False = Run in B/S environment
//
//	Description:  	If the application run in C/S environment
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
// 
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 2003-2004 Appeon, Inc.   All rights reserved.
//	
//////////////////////////////////////////////////////////////////////////////

String ls_compare1,ls_compare2

setnull(ls_compare1)
setnull(ls_compare2)

// In C/S environment and B/S environment, the null string compare result is different
if ls_compare1=ls_compare2 then
	Return False
end if

Return True

end function

public function integer wf_setvalue (ref datastore ads);//
long ll_cnt , ll_newrow, i
long ll_testpointid, ll_versionid
datetime ldt_save
string ls_expectvalue, ls_truevalue,ls_status,ls_testlevel, ls_Phenomena

//ldt_save = datetime(today(), now())
ll_cnt = dw_testpoint.rowcount()
if ll_cnt < 1 then return -1
//select Version into :ll_versionid FROM UserDefEnv  where UserDefEnv.EnvType = 3 and  UserDefEnv.userid = :gi_user using gtr_frame; 
for i = 1 to ll_cnt 
	ll_testpointid = dw_testpoint.getitemnumber(i, 'testpointid')
	ls_expectvalue = dw_testpoint.getitemstring(i, 'expectvalue')
	ls_truevalue   = dw_testpoint.getitemstring(i, 'truevalue')
	ls_status      = dw_testpoint.getitemstring(i, 'status')
	ls_testlevel   = dw_testpoint.getitemstring(i, 'testlevel')
	ls_Phenomena   = dw_testpoint.getitemstring(i, 'Phenomena')
	if isnull(ls_phenomena) then ls_phenomena = ''
	if isnull(ls_status)  then ls_status = '3' // not run
	
	ll_newrow = ads.insertrow(0)
//	ads.SetItem(ll_newrow, "savetime", gf_getsysdate())
	ads.SetItem(ll_newrow, "resultmasterid", in_para.il_resultmasterid)
	ads.setitem(ll_newrow, "testpointid", ll_testpointid)
	ads.setitem(ll_newrow, "expectvalue", ls_expectvalue)
	ads.setitem(ll_newrow, "truevalue", ls_truevalue)
	ads.setitem(ll_newrow, "status", ls_status)
	ads.setitem(ll_newrow, "testlevel", ls_testlevel)
	ads.setitem(ll_newrow, "remark", ls_Phenomena)
	ads.setitem(ll_newrow, "versionid", ll_versionid)
next

return 1
end function

public function integer wf_setvalue (ref datastore ads, integer currentrow);//
long ll_cnt , ll_newrow, i
long ll_testpointid, ll_versionid
datetime ldt_save
string ls_expectvalue, ls_truevalue,ls_status,ls_testlevel, ls_Phenomena

//ldt_save = datetime(today(), now())
if currentrow < 1 then return -1
//select Version into :ll_versionid FROM UserDefEnv  where UserDefEnv.EnvType = 3 and  UserDefEnv.userid = :gi_user using gtr_frame; 
ll_testpointid = dw_testpoint.getitemnumber(currentrow, 'testpointid')
ls_expectvalue = dw_testpoint.getitemstring(currentrow, 'expectvalue')
ls_truevalue   = dw_testpoint.getitemstring(currentrow, 'truevalue')
ls_status      = dw_testpoint.getitemstring(currentrow, 'status')
ls_testlevel   = dw_testpoint.getitemstring(currentrow, 'testlevel')
ls_Phenomena   = dw_testpoint.getitemstring(currentrow, 'Phenomena')
if isnull(ls_phenomena) then ls_phenomena = ''
if isnull(ls_status)  then ls_status = '3' // not run

ll_newrow = ads.insertrow(0)
//ads.SetItem(ll_newrow, "savetime", gf_getsysdate())
ads.SetItem(ll_newrow, "resultmasterid", in_para.il_resultmasterid)
ads.setitem(ll_newrow, "testpointid", ll_testpointid)
ads.setitem(ll_newrow, "expectvalue", ls_expectvalue)
ads.setitem(ll_newrow, "truevalue", ls_truevalue)
ads.setitem(ll_newrow, "status", ls_status)
ads.setitem(ll_newrow, "testlevel", ls_testlevel)	
ads.setitem(ll_newrow, "remark", ls_Phenomena)
ads.setitem(ll_newrow, "versionid", ll_versionid)

return 1
end function

public function integer wf_updatehaveinfo (long al_insertrow);Long		ll_bugcnt, ll_row

if al_insertrow >0 then
	ll_row = dw_testpoint.GetRow()
	if not ll_row > 0 then return -1
	ll_bugcnt = dw_testpoint.getitemnumber(ll_row, "haveinfo")
	dw_testpoint.setitem(ll_row, "haveinfo", ll_bugcnt + al_insertrow)
	Return al_insertrow
end if

Return 0
end function

public function integer wf_saveresult_detail ();//
//
//
long ll_count, ll_cnt,    i
long ll_testpointid, ll_find , ll_versionid
string  ls_truevalue, ls_status,  ls_find
string  ls_Phenomena
dwitemstatus ldwstatus
datastore lds

if not isvalid(in_para) then return 0
if in_para.il_resultmasterid < 1 then return 0  // 

lds = create datastore
lds.dataobject = 'd_resultdetail_update'
lds.settransobject(gtr_frame)



ll_cnt = dw_testpoint.rowcount()
if ll_cnt < 1 then 
	return 0
end if

if in_para.ib_newtest then
	wf_setvalue(lds)
else
	
	ll_count = lds.retrieve(in_para.il_resultmasterid)

	if ll_count > 0 then
//		select Version into :ll_versionid FROM UserDefEnv  where UserDefEnv.EnvType = 3 and  UserDefEnv.userid = :gi_user using gtr_frame; 
		for i = 1 to ll_cnt
			ll_testpointid = dw_testpoint.getitemnumber(i, 'testpointid')
			ls_truevalue   = dw_testpoint.getitemstring(i, 'truevalue')
			ls_status      = dw_testpoint.getitemstring(i, 'status')
			ls_Phenomena   = dw_testpoint.getitemstring(i, 'Phenomena')
			ldwstatus      = dw_testpoint.getitemstatus(i, 0, primary!)
			if ldwstatus = DataModified!	then
				ls_find =  " testpointid = " + string(ll_testpointid) + " and versionid = " + string(ll_versionid)
				ll_find = lds.find(ls_find, 1, ll_count)
				if ll_find > 0 then
					lds.setitem(ll_find, 'truevalue', ls_truevalue)
					lds.setitem(ll_find, 'status', ls_status)
					lds.setitem(ll_find, 'remark', ls_Phenomena)
//					lds.setitem(ll_find, "versionid", ll_versionid)
				else
					wf_setvalue(lds, i)
				end if
			end if
		next
	else
		wf_setvalue(lds)
	end if
end if

if lds.update() = 1 then
	commit using gtr_frame;
else
	rollback using gtr_frame;
	messagebox("Test Result", "Save Failer! " + gtr_frame.sqlerrtext)
end if
if isvalid(lds) then destroy lds


return 0



end function

public function integer wf_checkwremark ();//
long ll_cnt, ll_testpointid, ll_mastercnt,ll_masterfind, i
string ls_status
datastore lds_resultmaster



ll_cnt = dw_testpoint.rowcount()
if ll_cnt < 1 then return 0

lds_resultmaster = create datastore
lds_resultmaster.dataobject = 'd_getid_testinfo'
lds_resultmaster.settransobject(gtr_frame)
ll_mastercnt = lds_resultmaster.retrieve(in_para.il_resultmasterid)


for i = 1 to ll_cnt
	ll_testpointid = dw_testpoint.getitemnumber(i, 'testpointid')
	ls_status      = dw_testpoint.getitemstring(i, 'status')
	if ls_status = '0' or ls_status = '2' then
		if ll_mastercnt > 0 then
			ll_masterfind = lds_resultmaster.find("testpointid = " + string(ll_testpointid), 1, ll_mastercnt)
			if ll_masterfind < 1 then
				messagebox("Information", "The status is Failed(Not Need Run) and haven't any remark, You must add remark info!")
				dw_testpoint.scrolltorow(i)
				return 1
			end if
		else
			messagebox("Information", "The status is Failed(Not Need Run) and haven't any remark, You must add remark info!")
			dw_testpoint.scrolltorow(i)
			return 1
		end if
	end if
next
if isvalid(lds_resultmaster) then destroy lds_resultmaster
return 0
end function

on w_templet.create
this.cb_update=create cb_update
this.mle_phenomena=create mle_phenomena
this.cb_autoparse=create cb_autoparse
this.cb_wrrun=create cb_wrrun
this.cb_genconfigfile=create cb_genconfigfile
this.dw_info=create dw_info
this.pb_saveexpect=create pb_saveexpect
this.pb_runnext=create pb_runnext
this.pb_runall=create pb_runall
this.pb_run=create pb_run
this.pb_end=create pb_end
this.mle_expectdesc=create mle_expectdesc
this.mle_describe=create mle_describe
this.mle_factual=create mle_factual
this.mle_expect=create mle_expect
this.dw_testpoint=create dw_testpoint
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_5=create gb_5
this.gb_phenomena=create gb_phenomena
this.Control[]={this.cb_update,&
this.mle_phenomena,&
this.cb_autoparse,&
this.cb_wrrun,&
this.cb_genconfigfile,&
this.dw_info,&
this.pb_saveexpect,&
this.pb_runnext,&
this.pb_runall,&
this.pb_run,&
this.pb_end,&
this.mle_expectdesc,&
this.mle_describe,&
this.mle_factual,&
this.mle_expect,&
this.dw_testpoint,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.gb_4,&
this.gb_5,&
this.gb_phenomena}
end on

on w_templet.destroy
destroy(this.cb_update)
destroy(this.mle_phenomena)
destroy(this.cb_autoparse)
destroy(this.cb_wrrun)
destroy(this.cb_genconfigfile)
destroy(this.dw_info)
destroy(this.pb_saveexpect)
destroy(this.pb_runnext)
destroy(this.pb_runall)
destroy(this.pb_run)
destroy(this.pb_end)
destroy(this.mle_expectdesc)
destroy(this.mle_describe)
destroy(this.mle_factual)
destroy(this.mle_expect)
destroy(this.dw_testpoint)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.gb_phenomena)
end on

event open;
string ls_wname, ls_auto, ls_where, ls_sql, ls_temp
long   ll_cnt, ll_testpointid

ll_testpointid = message.doubleparm


ls_wname = this.classname()

ls_wname =left(ls_wname, 11)

in_para = message.powerobjectparm
if isvalid(in_para) and (not isnull(in_para)) then
	if in_para.is_auto = '0' then
		pb_runall.visible = false
	end if
	//If administrator or code login, can save expect value
	//if gb_administrator or gi_work = 3 then
//		pb_saveexpect.visible = true
//		mle_describe.displayonly = false
//		mle_expectdesc.displayonly = false
//	end if
else   //simple templet use
	in_para = create nvo_runwindow_parameter
	select windowid, is_auto into :in_para.il_windowid, :ls_auto from testwindow where wname = :ls_wname using gtr_frame;
	if ls_auto = '0'  then //manual run
		in_para.is_auto = '0'
	elseif  ls_auto = '1' or ls_auto = '2' then //auto run or can auto run
		in_para.is_auto = '1'
	else
		in_para.is_auto = '0'
	end if
//	in_para.ib_environment = false
end if
dw_testpoint.triggerevent("ue_retrieve")

if in_para.ib_filter then
	dw_testpoint.setfilter(in_para.is_filter)
	dw_testpoint.filter()
end if

	

	
	

end event

event closequery;long   ll_rtn
string ls_status


//if cs , whether update dw_info
if dw_info.modifiedcount() > 0 then
	if wf_iscs() then 
		ll_rtn = messagebox("Save Result", "Do You Want To Save Current Result?", Information! , YesNoCancel!, 1)
		if ll_rtn = 2 then return 0
		if ll_rtn = 3 then return 1
		dw_info.triggerevent("ue_update")
	end if
end if

//update test result
if wf_iscs() then return 0
if not isvalid(in_para) then return 0
if in_para.il_resultmasterid < 1 then return 0
if in_para.il_assignid < 1 then return
if in_para.il_windowid < 1 then return
ll_rtn = messagebox("Save Result", "Do You Want To Save Current Result?", Information! , YesNoCancel!, 1)
if ll_rtn = 2 then return 0
if ll_rtn = 3 then return 1
////wheter  is write remark, when status is failed, not need run
if wf_checkwremark() = 1 then 
	return 1
end if

if wf_saveresult_detail() = 1 then
	return 1
end if
if dw_info.modifiedcount() > 0 then
	dw_info.triggerevent("ue_update")
end if

ls_status = wf_getstatus()
in_para.is_status = ls_status

update taskwindow set status = :ls_status where assignid = :in_para.il_assignid and windowid = :in_para.il_windowid using gtr_frame;
if gtr_frame.sqlcode <> -1 then
	update resultmaster set status = :ls_status where resultmasterid = :in_para.il_resultmasterid using gtr_frame;
	if gtr_frame.sqlcode <> -1 then
		commit using gtr_frame;
	else
		rollback using gtr_frame;
		messagebox("", "Save test status failed!  " + gtr_frame.sqlerrtext)
		return 0
	end if
else
	rollback using gtr_frame;
	messagebox("", "Save test status failed!  " + gtr_frame.sqlerrtext)
	return 0
end if

end event

event resize;//
long   ll_ypoint
string ls_type

//command button
pb_saveexpect.y = newheight - 220
pb_run.y = pb_saveexpect.y
pb_runnext.y = pb_saveexpect.y
pb_runall.y = pb_saveexpect.y
cb_genconfigfile.y = pb_saveexpect.y
cb_wrrun.y = pb_saveexpect.y
cb_autoparse.y = pb_saveexpect.y
pb_end.y = pb_saveexpect.y

//gb_5
gb_5.x = 2981
gb_5.y = 0
gb_5.width = 1632
gb_5.height = 360

//mle_describe
mle_describe.x = 2999
mle_describe.y = 72
mle_describe.width = 1595
mle_describe.height = 272

//gb_3
gb_3.x = 2981
gb_3.y = 360
gb_3.width = 1632
gb_3.height = 320

//mle_expect
mle_expect.x = 2999
mle_expect.y = 428
mle_expect.width = 1595
mle_expect.height = 240

//gb_4
gb_4.x = 2981
gb_4.y = 676
gb_4.width = 1632
gb_4.height = 320

//mle_factual
mle_factual.x = 2999
mle_factual.y = 744
mle_factual.width = 1595
mle_factual.height = 240

//gb_2
gb_2.x = 2981
gb_2.y = 1000
gb_2.width = 1632
gb_2.height = 376

//mle_expectdesc
mle_expectdesc.x = 2999
mle_expectdesc.y = 1076
mle_expectdesc.width = 1595
mle_expectdesc.height = 284

//gb_phenomena
gb_phenomena.x = 2981
gb_phenomena.y = 1376
gb_phenomena.width = 1632
gb_phenomena.height = 376

//mle_phenomena
mle_phenomena.x = 2999
mle_phenomena.y = 1456
mle_phenomena.width = 1595
mle_phenomena.height = 284

//dw_info
dw_info.x =2981
dw_info.y =1768
dw_info.width =1632 
dw_info.height =pb_saveexpect.y - dw_info.y - 50

//gb_1
//gb_1.x = 
//gb_1.y = 
//gb_1.width =
gb_1.height = pb_saveexpect.y - gb_1.y - 50

//dw_testpoint
//dw_testpoint.x = 
//dw_testpoint.y = 
//dw_testpoint.width = 
dw_testpoint.height = pb_saveexpect.y - dw_testpoint.y - 62


















end event

type cb_update from commandbutton within w_templet
integer x = 3296
integer y = 2460
integer width = 581
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Update expect value"
end type

event clicked;
string ls_tpno
string ls_value
long ll_pos

ls_tpno = dw_testpoint.getitemstring(dw_testpoint.getrow(),"tpno")
ls_value = mle_factual.text

update testpoint 
set ExpectValue = :ls_value
where tpno = :ls_tpno using Gtr_Frame;

if Gtr_Frame.sqlcode <> 0 then
	messagebox('',Gtr_Frame.sqlerrtext)
	rollback using  Gtr_Frame;
else
	commit using Gtr_Frame;
end if



end event

type mle_phenomena from uo_multilineedit within w_templet
integer x = 2999
integer y = 1460
integer width = 1595
integer height = 284
integer taborder = 70
integer textsize = -9
fontcharset fontcharset = ansi!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
boolean displayonly = true
end type

event constructor;call super::constructor;of_setgroupbox(gb_phenomena)
of_settarget(2999, 72, 1595, 1672)
post of_setorigin()
end event

event modified;long ll_row
string ls_isrun
ll_row = dw_testpoint.getrow()

if ll_row > 0 then
//	ls_isrun = dw_testpoint.getitemstring(ll_row, 'is_run')
//	if ls_isrun = '1' then
//	end if
	dw_testpoint.setitem(ll_row, 'Phenomena', text)
	dw_testpoint.accepttext()
end if

end event

type cb_autoparse from commandbutton within w_templet
boolean visible = false
integer x = 2555
integer y = 2444
integer width = 384
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "ËÎÌå"
string text = "AutoParse"
end type

event clicked;
//inv_autorun.of_autoparse()
end event

type cb_wrrun from commandbutton within w_templet
boolean visible = false
integer x = 2167
integer y = 2444
integer width = 384
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "ËÎÌå"
string text = "WRRun"
end type

event clicked;
//inv_autorun.of_autorun()
end event

type cb_genconfigfile from commandbutton within w_templet
boolean visible = false
integer x = 1682
integer y = 2444
integer width = 480
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "ËÎÌå"
string text = "GenConfigFile"
end type

event clicked;
//inv_autorun.of_GenerateConfigFile(in_para.il_windowid)
end event

type dw_info from datawindow within w_templet
event ue_insertrow ( )
event ue_search ( )
event ue_modify ( )
event ue_setmodify ( boolean ab_modify )
event type integer ue_update ( )
integer x = 2981
integer y = 1768
integer width = 1632
integer height = 656
integer taborder = 70
string title = "none"
string dataobject = "d_testinfo"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_insertrow();DateTime		ldt_time

long        ll_newrow, ll_getrow, ll_testpointid, ll_cnt, ll_version
dwitemstatus litem

if (not isvalid(in_para)) then return
ll_getrow = dw_testpoint.getrow()
if ll_getrow < 1 then return 
ll_testpointid = dw_testpoint.getitemnumber(ll_getrow, 'testpointid')
ll_cnt = this.rowcount()

//if have new row , we return
if ll_cnt > 0 then
	litem = getitemstatus(ll_cnt, 0, primary!)
	if litem = New! or litem = NewModified! then 
		this.scrolltorow(ll_cnt)
		return
	end if
end if

ll_newrow = insertrow(0)
//ldt_time = gf_getsysdate()
//ll_version = profilestring("config.ini", "CurrentVersion", "Version", "")
//select Version into :ll_version FROM UserDefEnv  where UserDefEnv.EnvType = 3 and  UserDefEnv.userid = :gi_user using gtr_frame; 

setitem(ll_newrow, "testpointid", ll_testpointid)
//setitem(ll_newrow, 'reviewman', gi_user)
setitem(ll_newrow, 'reviewtime', ldt_time)
setitem(ll_newrow, 'versionid', ll_version)
setitem(ll_newrow, 'reviewstate', 'N')
setitem(ll_newrow, 'assignid', in_para.il_assignid)
setitem(ll_newrow, 'windowid', in_para.il_windowid)
setitem(ll_newrow, 'resultmasterid', in_para.il_resultmasterid)
setitem(ll_newrow, 'categoryid', in_para.il_categoryid)
setitemstatus(ll_newrow, 0, primary!, notmodified!)
scrolltorow(ll_newrow)
end event

event ue_modify();//
long ll_categoryid, ll_getrow

ll_getrow = getrow()
if ll_getrow < 1 then return

//openwithparm(w_pop_select_category, in_para.il_categoryid)
//ll_categoryid = message.doubleparm
//if ll_categoryid > 0 then
//	setitem(ll_getrow, 'categoryid', ll_categoryid)
//end if
end event

event ue_setmodify(boolean ab_modify);//
if isnull(ab_modify) then return

if ab_modify then
	modify("infotype.TabSequence = 20")
	modify("bugid.TabSequence = 30")
	modify("remark.Edit.DisplayOnly = no")
	modify("b_search.visible = true")
	modify("b_modify.visible = true")
else
	modify("infotype.TabSequence = 0")
	modify("bugid.TabSequence = 0")
	modify("remark.Edit.DisplayOnly = yes")
	modify("b_search.visible = false")
	modify("b_modify.visible = false")
end if
end event

event type integer ue_update();//
if this.update(true, false) = 1 then
	//wf_newbug()
	this.resetupdate()
	commit using gtr_frame;
	//of_sendmail()
	wf_updatehaveinfo(1)
else
	rollback using gtr_frame;
	messagebox("Update Failed", Gtr_frame.sqlerrtext)
	return -1
end if

return 1
end event

event constructor;settransobject(gtr_frame)
end event

event buttonclicked;if dwo.name = 'b_new' then
	this.triggerevent("ue_insertrow")
elseif dwo.name = 'b_modify' then
	this.triggerevent("ue_modify")
elseif dwo.name = 'b_search' then 
	this.triggerevent("ue_search")
elseif dwo.name = 'b_update' then
	this.triggerevent("ue_update")
end if
	
end event

event rowfocuschanged;//
string ls_status
long   ll_user
if currentrow > 0 then
	ll_user = getitemnumber(currentrow, 'reviewman')
	ls_status = getitemstring(currentrow, 'reviewstate')
	if isnull(ll_user) and isnull(ls_status) then 
		this.trigger event ue_setmodify(true)
		return
	end if
//	if (ll_user = gi_user) and ls_status = 'N' then
//		this.trigger event ue_setmodify(true)
//	else
//		this.trigger event ue_setmodify(false)
//	end if
end if
end event

event buttonclicking;//
long ll_user
string ls_status
if row > 0 then
	if dwo.name = 'b_modify' or dwo.name = 'b_search' then
		ll_user = getitemnumber(row, 'reviewman')
		ls_status = getitemstring(row, 'reviewstate')
		
		if isnull(ll_user) and isnull(ls_status) then return 0
//		if (ll_user = gi_user) and ls_status = 'N' then
//		else
//			return 1
//		end if
	end if
end if
end event

event updatestart;//
long ll_row, ll_bugid, ll_cnt
string ls_type

ll_row = getrow()
if ll_row < 1 then return 1

ls_type = getitemstring(ll_row, 'infotype')
ll_bugid = getitemnumber(ll_row, 'bugid')
if ls_type = '2'  then // apb bug
	if isnull(ll_bugid) or ll_bugid < 1 then
		messagebox("Alert", "This is Apb Bug, You must input bugid!")
		setcolumn ("bugid")
		return 1
	else
//		select count(bugid) into :ll_cnt from bugrecord where bugid = :ll_bugid using gtr_frame;
//		if ll_cnt < 1 then
//			messagebox("Alert", "The Bugid is not valid!")
//			setcolumn("bugid")
//			return 1
//		end if
	end if
end if




return 0
end event

event losefocus;accepttext()
end event

type pb_saveexpect from picturebutton within w_templet
string tag = ".\res\Genrprtsa2.gif"
boolean visible = false
integer x = 14
integer y = 2444
integer width = 384
integer height = 108
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "ËÎÌå"
string text = "&Save"
vtextalign vtextalign = vcenter!
string powertiptext = "Save Expect"
end type

event clicked;parent.triggerevent("ue_saveexpect")
end event

type pb_runnext from picturebutton within w_templet
string tag = ".\res\Rnmanualnext.gif"
integer x = 905
integer y = 2444
integer width = 384
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "ËÎÌå"
string text = "Run &Next"
vtextalign vtextalign = vcenter!
string powertiptext = "Run Next"
end type

event clicked;parent.triggerevent("ue_runnext")
end event

type pb_runall from picturebutton within w_templet
string tag = ".\res\Rnmanualall.gif"
integer x = 1294
integer y = 2444
integer width = 384
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "ËÎÌå"
string text = "Run &All"
vtextalign vtextalign = vcenter!
string powertiptext = "Run All"
end type

event clicked;parent.triggerevent("ue_autorun")
end event

type pb_run from picturebutton within w_templet
string tag = ".\res\Rnmanual11.gif"
integer x = 517
integer y = 2444
integer width = 384
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "ËÎÌå"
string text = "&Run"
vtextalign vtextalign = vcenter!
string powertiptext = "Run"
end type

event clicked;long ll_row
string ls_testpoint
ll_row = dw_testpoint.getrow()
if ll_row < 1 then return
ls_testpoint = dw_testpoint.getitemstring(ll_row, 'TpNo')
//wf_scriptexe(ls_testpoint, ll_row)
parent.trigger event ue_runscript(ls_testpoint, ll_row, true)

end event

type pb_end from picturebutton within w_templet
string tag = ".\res\Buildtsta4.gif"
integer x = 4128
integer y = 2444
integer width = 384
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "ËÎÌå"
string text = "&Close"
boolean cancel = true
vtextalign vtextalign = vcenter!
string powertiptext = "End Run"
end type

event clicked;
close(parent)
end event

type mle_expectdesc from uo_multilineedit within w_templet
integer x = 2999
integer y = 1076
integer width = 1595
integer height = 284
integer taborder = 60
integer textsize = -9
fontcharset fontcharset = ansi!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
boolean displayonly = true
end type

event modified;//
long ll_row

ll_row = dw_testpoint.getrow()
if ll_row < 1 then return
dw_testpoint.setitem(ll_row, 'expectdesc', text)
end event

event constructor;call super::constructor;of_setgroupbox(gb_2)
of_settarget(2999, 72, 1595, 1672)
post of_setorigin()
end event

type mle_describe from uo_multilineedit within w_templet
integer x = 2999
integer y = 72
integer width = 1595
integer height = 272
integer taborder = 70
integer textsize = -9
fontcharset fontcharset = ansi!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
boolean displayonly = true
end type

event modified;//
long ll_row

ll_row = dw_testpoint.getrow()
if ll_row < 1 then return
dw_testpoint.setitem(ll_row, 'teststep', text)
end event

event constructor;call super::constructor;of_setgroupbox(gb_5)
of_settarget(2999, 72, 1595, 1672)
post of_setorigin()
end event

type mle_factual from uo_multilineedit within w_templet
integer x = 2999
integer y = 744
integer width = 1595
integer height = 240
integer taborder = 80
integer textsize = -9
fontcharset fontcharset = ansi!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
boolean displayonly = true
end type

event modified;long ll_row
string ls_isrun
ll_row = dw_testpoint.getrow()

if ll_row > 0 then
	ls_isrun = dw_testpoint.getitemstring(ll_row, 'is_run')
	if ls_isrun = '1' then
	end if
end if
dw_testpoint.setitem(ll_row, 'truevalue', text)
dw_testpoint.accepttext()
end event

event constructor;call super::constructor;of_setgroupbox(gb_4)
of_settarget(2999, 72, 1595, 1672)
post of_setorigin()
end event

type mle_expect from uo_multilineedit within w_templet
integer x = 2999
integer y = 428
integer width = 1595
integer height = 240
integer taborder = 90
integer textsize = -9
fontcharset fontcharset = ansi!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
boolean displayonly = true
end type

event constructor;call super::constructor;of_setgroupbox(gb_3)
of_settarget(2999, 72, 1595, 1672)
post of_setorigin()
end event

type dw_testpoint from datawindow within w_templet
event ue_retrieve ( )
event ue_setitem ( )
event key pbm_dwnkey
integer x = 27
integer y = 72
integer width = 2921
integer height = 2340
integer taborder = 50
string title = "none"
string dataobject = "d_testpoint_templet"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_retrieve();//
string ls_sql, ls_temp,  ls_isvalid, ls_setstatus, ls_phenomena, ls_version
long   ll_cnt, ll_find, ll_len

//only the testpoint that is valid
ls_isvalid = " and (testpoint.is_valid = '1')"

//set the status
ls_setstatus = "status = (select a.status from resultdetail a where a.resultdetailid = (select max(b.resultdetailid) from resultdetail b where b.resultmasterid = " + string(in_para.il_resultmasterid) +  " and b.testpointid = TestPoint.TestPointId ))"
//set phenomena
ls_phenomena = "phenomena = (select a.remark from resultdetail a where a.resultdetailid = (select max(b.resultdetailid) from resultdetail b where  b.resultmasterid = "+string (in_para.il_resultmasterid)+ " and b.testpointid = testpoint.testpointid ))"
//set version
ls_version = "version = (select versionno from version where versionid = (select a.versionid from resultdetail a  where a.resultdetailid = (select max(b.resultdetailid) from resultdetail b where b.resultmasterid = " + string(in_para.il_resultmasterid) + " and b.testpointid = testpoint.testpointid)))"

ls_sql = getsqlselect()
ls_temp = ls_sql

if in_para.is_fpoint = '1' then
	ls_sql += "  where (testpoint.windowid = " +  string(in_para.il_windowid) +" )  and (testpoint.testpointid not in " +  " (select testpointid from taskpoint where taskwindowid =" + string(in_para.il_taskwindowid) + "))"
else                //Normal task
	ls_sql += "  where windowid = " + string(in_para.il_windowid)
end if



//whether use valid environment
if  in_para.il_envidefineid > 0 then
	ls_sql += " and (testpoint.testpointid not in (select tpunenvi.testpointid from tpunenvi where envilistid in (select envilistid from envidetail where envidefineid = "+ string(in_para.il_envidefineid) + ")))"
else
end if

//if not new test, set status, set phenomena
if (not in_para.ib_newtest) and in_para.il_resultmasterid > 0 then 
	//set status
	ll_find = pos(ls_sql, "status = '3'", 1)
	ll_len = len("status = '3'")
	ls_sql = replace(ls_sql, ll_find, ll_len, ls_setstatus)
	//set phenomena
	ll_find = pos(ls_sql, "Phenomena = space(4099)", 1)
	ll_len = len ("Phenomena = space(4099)")
	ls_sql = replace(ls_sql, ll_find, ll_len, ls_phenomena)
	
	//set version
	ll_find = pos(ls_sql , "version = space(20)", 1)
	ll_len = len("version = space(20)")
	ls_sql = replace(ls_sql,ll_find, ll_len, ls_version)
end if

ls_sql += ls_isvalid
setsqlselect(ls_sql)
//clipboard(ls_sql)
ll_cnt = retrieve()
if (not in_para.ib_newtest) and in_para.il_resultmasterid > 0  then
	this.triggerevent("ue_setitem")
end if
if ll_cnt > 0 then
	selectrow(0, false)
	selectrow(1, true)
end if
setsqlselect(ls_temp) 
end event

event ue_setitem();//
long ll_cnt , i
string ls_status
ll_cnt = this.rowcount()
if ll_cnt > 0 then
	for i = 1 to ll_cnt
		ls_status = getitemstring(i, 'status')
		choose case ls_status
			case '0'
				setitem(i, 'pstatus', '.\res\failed.jpg')
			case '1'
				setitem(i, 'pstatus', '.\res\passed.jpg')
			case '2'
				setitem(i, 'pstatus', '')
			case '3'
				setitem(i, 'pstatus', '.\res\arr2.jpg')
			case '4'
				setitem(i, 'pstatus', '.\res\notcompl.jpg')
		end choose
		accepttext()
		setitemstatus(i, 0, primary!, notmodified!)
	next
	
end if

end event

event key;if keyflags = 2 then
	choose case key
		case KeyB!
			Parent.triggerEvent("ue_showbug")
	end choose
end if
end event

event constructor;
//
settransobject(Gtr_Frame)

end event

event rowfocuschanged;//
long   ll_testpointid, ll_cnt
string ls_remark, ls_expect, ls_truevalue, ls_expectdesc
string ls_testpoint, ls_teststep, ls_phenomena

if currentrow > 0 then
	selectrow(0, false)
	selectrow(currentrow, true)
	ls_teststep    = getitemstring(currentrow, 'teststep')
	ls_remark      = getitemstring(currentrow, 'remark')
	ls_expect      = getitemstring(currentrow, 'expectvalue')
	ls_truevalue   = getitemstring(currentrow, 'truevalue')
	ls_expectdesc  = getitemstring(currentrow, 'expectdesc')
	ls_testpoint   = getitemstring(currentrow, 'tpno')
	ls_phenomena   = getitemstring(currentrow, 'phenomena')
	ll_testpointid = getitemnumber(currentrow, 'testpointid')
	if isnull(ls_phenomena) then ls_phenomena = ''
	mle_describe.text   = ls_teststep
	mle_expect.text     = ls_expect
	mle_factual.text    = ls_truevalue
	mle_expectdesc.text = ls_expectdesc
	mle_phenomena.text  = ls_phenomena
	if ls_expect = ls_truevalue then
		mle_factual.textcolor = rgb(0, 0, 0)
	else
		mle_factual.textcolor = rgb(255, 0, 0)
	end if
	dw_info.setredraw(false)
	ll_cnt = dw_info.retrieve(ll_testpointid)
	if ll_cnt < 1 then
		dw_info.triggerevent("ue_insertrow")
	else
		dw_info.trigger event rowfocuschanged(1)
	end if
	dw_info.setredraw(true)
	parent.trigger event ue_runscript(ls_testpoint, currentrow, false)
end if
end event

event doubleclicked;//
string ls_testpoint
if row > 0 then
	ls_testpoint = dw_testpoint.getitemstring(row, 'TpNo')
//	wf_scriptexe(ls_testpoint, row)
	parent.trigger event ue_runscript(ls_testpoint, row, true)
end if
end event

event itemchanged;//
if dwo.name = 'status' then
	choose case data
		case '0'
			setitem(row, 'pstatus', '.\res\failed.jpg')
		case '1'
			setitem(row, 'pstatus', '.\res\passed.jpg')
		case '2'
			setitem(row, 'pstatus', '')
		case '3'
			setitem(row, 'pstatus', '.\res\arr2.jpg')
		case '4'
			setitem(row, 'pstatus', '.\res\notcompl.jpg')
	end choose
end if


//when '0' then '.\res\failed.jpg'
//when '1' then '.\res\passed.jpg'  
//when '2' then ''
//when '3' then '.\res\arr2.jpg'
//when '4' then '.\res\notcompl.jpg'
end event

event rbuttondown;//
m_templet m_menu
if row > 0 then
	scrolltorow(row)
	m_menu = create m_templet
	m_templet.popmenu( parent.PointerX(), parent.Pointery())
//	if isvalid(m_menu)  then destroy m_menu
end if
end event

event clicked;string ls_testpoint

if row > 0 then
	setrow(row)
end if

if (row > 0) and (getrow() = row) then
	if dwo.name = 'status' then return 0
	ls_testpoint = getitemstring(row, 'tpno')
	parent.trigger event ue_runscript(ls_testpoint, row, false)
end if




end event

event rowfocuschanging;long ll_getrow
integer li_rtn, li_update
dwitemstatus litem

ll_getrow = dw_info.getrow()
if ll_getrow > 0 then
	litem = dw_info.getitemstatus(ll_getrow, 0, primary!)	
	if litem = Newmodified! or litem = datamodified! then
		li_rtn = messagebox("Save", "Data is changed, Do You Want To Save?", information!, YesNoCancel!, 1)
		if li_rtn = 1 then
			li_update = dw_info.trigger event ue_update()
			if li_update < 0 then
				return 1
			end if
		elseif li_rtn = 2 then
			return 0
		elseif li_rtn = 3 then
			return 1
		end if
	end if
end if
end event

type gb_1 from groupbox within w_templet
integer x = 9
integer width = 2958
integer height = 2424
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Test Items"
end type

type gb_2 from groupbox within w_templet
integer x = 2981
integer y = 1000
integer width = 1632
integer height = 376
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Expect Value Describe"
end type

type gb_3 from groupbox within w_templet
integer x = 2981
integer y = 360
integer width = 1632
integer height = 320
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Expect Return Value"
end type

type gb_4 from groupbox within w_templet
integer x = 2981
integer y = 676
integer width = 1632
integer height = 320
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Factual Return Value"
end type

type gb_5 from groupbox within w_templet
integer x = 2981
integer width = 1632
integer height = 360
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Test Step"
end type

type gb_phenomena from groupbox within w_templet
integer x = 2981
integer y = 1384
integer width = 1632
integer height = 376
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Factual Phenomena"
end type

