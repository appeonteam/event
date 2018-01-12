$PBExportHeader$rteotherw03_uo_p1.sru
forward
global type rteotherw03_uo_p1 from userobject
end type
type rte_1 from richtextedit within rteotherw03_uo_p1
end type
type gb_1 from groupbox within rteotherw03_uo_p1
end type
end forward

global type rteotherw03_uo_p1 from userobject
integer width = 2985
integer height = 1332
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
rte_1 rte_1
gb_1 gb_1
end type
global rteotherw03_uo_p1 rteotherw03_uo_p1

type variables
window iw_parent
integer ii_width
end variables

forward prototypes
public subroutine of_getparent (window aw_parent)
end prototypes

public subroutine of_getparent (window aw_parent);iw_parent = aw_parent

end subroutine

on rteotherw03_uo_p1.create
this.rte_1=create rte_1
this.gb_1=create gb_1
this.Control[]={this.rte_1,&
this.gb_1}
end on

on rteotherw03_uo_p1.destroy
destroy(this.rte_1)
destroy(this.gb_1)
end on

event constructor;iw_parent = getparent()

ii_width = rte_1.width

end event

type rte_1 from richtextedit within rteotherw03_uo_p1
integer x = 41
integer y = 84
integer width = 2857
integer height = 1200
integer taborder = 20
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_rulerbar = true
boolean init_tabbar = true
boolean init_toolbar = true
boolean init_headerfooter = true
boolean init_popmenu = true
borderstyle borderstyle = stylelowered!
end type

event modified;iw_parent.dynamic wf_output('EvtReturn:Modified be triggered',false)
end event

event inputfieldselected;iw_parent.dynamic wf_output('EvtReturn:inputfiledSelected be triggered('+fieldname+')',false)
end event

type gb_1 from groupbox within rteotherw03_uo_p1
integer x = 14
integer y = 16
integer width = 2926
integer height = 1288
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "宋体"
long textcolor = 33554432
long backcolor = 67108864
string text = "UserObject"
end type

