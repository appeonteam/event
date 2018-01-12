$PBExportHeader$rteotherw03_uo_p2.sru
forward
global type rteotherw03_uo_p2 from richtextedit
end type
end forward

global type rteotherw03_uo_p2 from richtextedit
integer width = 2885
integer height = 1308
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_rulerbar = true
boolean init_tabbar = true
boolean init_toolbar = true
boolean init_headerfooter = true
boolean init_popmenu = true
borderstyle borderstyle = stylelowered!
end type
global rteotherw03_uo_p2 rteotherw03_uo_p2

type variables
integer ii_width
end variables

on rteotherw03_uo_p2.create
end on

on rteotherw03_uo_p2.destroy
end on

event constructor;ii_width = THIS.width
end event

event inputfieldselected;parent.dynamic wf_output('EvtReturn:inputfiledSelected be triggered('+fieldname+')',false)
end event

event modified;parent.dynamic wf_output('EvtReturn:Modified be triggered',false)
end event

