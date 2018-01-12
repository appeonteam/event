$PBExportHeader$w_simplecasemain.srw
forward
global type w_simplecasemain from window
end type
type mdi_1 from mdiclient within w_simplecasemain
end type
end forward

global type w_simplecasemain from window
integer width = 2533
integer height = 1472
boolean titlebar = true
string title = "Mdi Frame"
string menuname = "m_simplecasemain"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdi!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mdi_1 mdi_1
end type
global w_simplecasemain w_simplecasemain

on w_simplecasemain.create
if this.MenuName = "m_simplecasemain" then this.MenuID = create m_simplecasemain
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_simplecasemain.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

type mdi_1 from mdiclient within w_simplecasemain
long BackColor=268435456
end type

