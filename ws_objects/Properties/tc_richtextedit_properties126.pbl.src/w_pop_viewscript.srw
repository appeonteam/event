$PBExportHeader$w_pop_viewscript.srw
forward
global type w_pop_viewscript from window
end type
type cb_1 from commandbutton within w_pop_viewscript
end type
type mle_script from multilineedit within w_pop_viewscript
end type
end forward

global type w_pop_viewscript from window
integer width = 3616
integer height = 2100
boolean titlebar = true
string title = "View Script"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 134217739
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
mle_script mle_script
end type
global w_pop_viewscript w_pop_viewscript

forward prototypes
public function long of_findbeginpos (string as_script, string as_tpno, long al_beginpos)
public function string of_removecomment (string as_text)
public function long of_findendpos (string as_script, long al_beginpos, string as_first, string as_second)
public function long of_findendpos (string as_script, string as_tpno, long al_beginpos)
public function integer of_selectscripts (string as_tpno)
public function long of_findbeginpos (string as_script, string as_tpno)
end prototypes

public function long of_findbeginpos (string as_script, string as_tpno, long al_beginpos);long		ll_begin, ll_end
boolean	lb_rc
string	ls_matchstr, ls_findstr

as_tpno = lower(as_tpno)
as_script = lower(as_script)
ls_matchstr = "^case[ ~t]+['~"]"  + as_tpno
ll_begin = Pos(as_script, "case", al_beginpos + 1)
do while ll_begin > 0
	ll_end = Pos(as_script, as_tpno, ll_begin + 1)
	if not ll_end > 0 then return 0
	ls_findstr = mid(as_script, ll_begin, ll_end - ll_begin + len(as_tpno))
	ls_findstr = of_removecomment(ls_findstr)
	lb_rc = match(ls_findstr, ls_matchstr)
	if lb_rc then Return ll_begin
	ll_begin = Pos(as_script, "case", ll_begin + 5)
loop

Return 0
end function

public function string of_removecomment (string as_text);long		ll_begin, ll_end

ll_begin = Pos(as_text, "/*")
ll_end = Pos(as_text, "*/")
if ll_begin > 0 and ll_end > 0 then
	as_text = replace(as_text, ll_begin, ll_end - ll_begin + 2, " ")
end if

Return as_text
end function

public function long of_findendpos (string as_script, long al_beginpos, string as_first, string as_second);long		ll_begin, ll_end
boolean	lb_rc
string	ls_matchstr, ls_findstr

ls_matchstr = "^" + as_first + "[ ~t]+"+ as_second + "$"
ll_begin = Pos(as_script, as_first, al_beginpos + 1)
do while ll_begin > 0
	ll_end = Pos(as_script, as_second, ll_begin + 1)
	if not ll_end > 0 then return 0
	ls_findstr = mid(as_script, ll_begin, ll_end - ll_begin + len(as_second))
	ls_findstr = of_removecomment(ls_findstr)
	lb_rc = match(ls_findstr, ls_matchstr)
	if lb_rc then Return ll_begin
	ll_begin = Pos(as_script, as_first, ll_begin + len(as_first) + 1)
loop

Return 0
end function

public function long of_findendpos (string as_script, string as_tpno, long al_beginpos);long		ll_begin, ll_end
boolean	lb_rc
string	ls_matchstr, ls_findstr

as_script = lower(as_script)
ll_begin = of_findbeginpos(as_script, as_tpno, al_beginpos)
if ll_begin > 0 then return ll_begin - 2

ll_begin = of_findendpos(as_script, al_beginpos, "case", "else")
if ll_begin > 0 then return ll_begin - 2

ll_begin = of_findendpos(as_script, al_beginpos, "end", "choose")
if ll_begin > 0 then return ll_begin

//ls_matchstr = "^case[ ~t]+else$"
//ll_begin = Pos(as_script, "case", al_beginpos + 1)
//do while ll_begin > 0
//	ll_end = Pos(as_script, "else", ll_begin + 1)
//	if not ll_end > 0 then return 0
//	ls_findstr = mid(as_script, ll_begin, ll_end - ll_begin + 4)
//	ls_findstr = of_removecomment(ls_findstr)
//	lb_rc = match(ls_findstr, ls_matchstr)
//	if lb_rc then Return ll_begin - 2
//	ll_begin = Pos(as_script, "case", ll_begin + 5)
//loop
//
//ls_matchstr = "^end[ ~t]+choose$"
//ll_begin = Pos(as_script, "end", al_beginpos + 1)
//do while ll_begin > 0
//	ll_end = Pos(as_script, "choose", ll_begin + 1)
//	if not ll_end > 0 then return 0
//	ls_findstr = mid(as_script, ll_begin, ll_end - ll_begin + 6)
//	ls_findstr = of_removecomment(ls_findstr)
//	lb_rc = match(ls_findstr, ls_matchstr)
//	if lb_rc then Return ll_begin
//	ll_begin = Pos(as_script, "end", ll_begin + 4)
//loop

Return 0
end function

public function integer of_selectscripts (string as_tpno);long		ll_begin, ll_end
string	ls_begin, ls_script, ls_tpnoprefix

ls_script = lower(mle_script.text)
ls_begin = "case '" + lower(as_tpno) + "'"
//ll_begin = pos(ls_script, ls_begin, 1)
ll_begin = of_findbeginpos(ls_script, as_tpno)
if ll_begin > 0 then
//	ll_end = pos(ls_script, "case", ll_begin + 1)
//	ll_end -= 2	//	remove ~r~n before case
//	if not ll_end > 0 then
//		ll_end = pos(ls_script, "end choose", ll_begin + 1)
//	end if
	ls_tpnoprefix = left(as_tpno, len(as_tpno) - 2)
	ll_end = of_findendpos(ls_script, ls_tpnoprefix, ll_begin)
end if
if ll_begin > 0 and ll_end > 0 then
	ll_begin -= 1	//	Remove ~t before case
	mle_script.setfocus()
	mle_script.selecttext(ll_begin, ll_end - ll_begin - 1)
	mle_script.Scroll ( mle_script.Selectedline ( ))
else
	mle_script.selecttext(0, 0)
end if

Return 1
end function

public function long of_findbeginpos (string as_script, string as_tpno);Return of_findbeginpos(as_script, as_tpno, 0)
end function

on w_pop_viewscript.create
this.cb_1=create cb_1
this.mle_script=create mle_script
this.Control[]={this.cb_1,&
this.mle_script}
end on

on w_pop_viewscript.destroy
destroy(this.cb_1)
destroy(this.mle_script)
end on

event open;ClassDefinition		lcd_Object
ScriptDefinition		lsd_Scripts[]
Integer					li_Cnt, li_Limit
string               ls_tpno, ls_script, ls_wname

ls_tpno = message.stringparm
if isnull(ls_tpno) then return
ls_wname = 'w_' + left(ls_tpno, len(ls_tpno) - 3)
ls_script = ""
lcd_Object = FindClassDefinition(ls_wname)
if isnull(lcd_object) or (not isvalid(lcd_object)) then
	//messagebox("", "Object is null")
	return
end if
lsd_Scripts = lcd_Object.ScriptList

li_Limit = UpperBound(lsd_Scripts)

For li_Cnt = 1 To li_Limit
	If (lsd_Scripts[li_Cnt].islocallyscripted) And ((lsd_Scripts[li_Cnt].name <> "create") And (lsd_Scripts[li_Cnt].name <> "destroy")) Then
		If lsd_Scripts[li_Cnt].kind = Scriptevent! Then
			if lsd_Scripts[li_Cnt].name = 'ue_runscript' then
				ls_script = lsd_Scripts[li_Cnt].source
			end if
		End If
	End If
Next

mle_script.text = ls_script
of_selectscripts(ls_tpno)

end event

type cb_1 from commandbutton within w_pop_viewscript
integer x = 3090
integer y = 1900
integer width = 357
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "ËÎÌå"
string text = "Close"
end type

event clicked;close(parent)
end event

type mle_script from multilineedit within w_pop_viewscript
integer x = 37
integer y = 36
integer width = 3538
integer height = 1848
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "ËÎÌå"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

