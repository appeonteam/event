$PBExportHeader$w_rteprow09_ole.srw
forward
global type w_rteprow09_ole from w_templet
end type
type cb_1 from commandbutton within w_rteprow09_ole
end type
type cb_2 from commandbutton within w_rteprow09_ole
end type
type ole_1 from olecustomcontrol within w_rteprow09_ole
end type
end forward

global type w_rteprow09_ole from w_templet
string title = "Dynamic Set 9(OLE)"
cb_1 cb_1
cb_2 cb_2
ole_1 ole_1
end type
global w_rteprow09_ole w_rteprow09_ole

type variables
long il_paperheight
long il_paperwidth
end variables

forward prototypes
public subroutine wf_reset ()
public function string wf_getaccessiblerole (accessiblerole abs_accessiblerole)
public function string wf_getfontcharset (fontcharset abs_fontcharset)
public function string wf_getfontfamily (fontfamily abs_fontfamily)
public function string wf_getfontpitch (fontpitch abs_fontpitch)
end prototypes

public subroutine wf_reset ();//
ole_1.object.backcolor=16777215
ole_1.object.Border = true
ole_1.object.BorderStyle = StyleLowered!
ole_1.object.Displayonly = false
end subroutine

public function string wf_getaccessiblerole (accessiblerole abs_accessiblerole);CHOOSE CASE abs_accessiblerole
	CASE checkbuttonrole!
		Return "checkbuttonrole!"
	CASE clientrole!
		Return "clientrole!"
END CHOOSE
end function

public function string wf_getfontcharset (fontcharset abs_fontcharset);CHOOSE CASE abs_FontCharSet
	CASE ANSI!
		Return "ANSI!"
	CASE GB2312CHARSET!
		Return "GB2312CHARSET!"
END CHOOSE
end function

public function string wf_getfontfamily (fontfamily abs_fontfamily);CHOOSE CASE abs_FontFamily
	CASE SWISS!
		Return "SWISS!"
END CHOOSE
end function

public function string wf_getfontpitch (fontpitch abs_fontpitch);CHOOSE CASE abs_FontPitch
	CASE VARIABLE!
		Return "VARIABLE!"

END CHOOSE
end function

on w_rteprow09_ole.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_2=create cb_2
this.ole_1=create ole_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.ole_1
end on

on w_rteprow09_ole.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.ole_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 

***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Properties\Dynamic Set 1 
Pbl Name:     
Designer:     ouyangwu
Coder:        ouyangwu at 2005-06-20
DocReviewer:  
CoderReviewer:
¡¾¹¦ÄÜÃèÊö¡¿
²âÊÔ¶¯Ì¬ÉèÖÃÊôÐÔÒÔ¼°ÊôÐÔµÄ¹¦ÄÜ±íÏÖ
¡¾´°¿Ú¶ÔÏó¡¿

¡¾±àÂë×¢ÒâÊÂÏî¡¿
1¡¢Ä¬ÈÏÇé¿öÇë½«RulerBar¡¢TabBar¡¢ToolBarÉèÖÃÎªTure
2¡¢Ä¬ÈÏ¿½±´Ò»¶ÎÎÄ×Ö×÷Îª¸Ã¿Ø¼þÖÐµÄÄÚÈÝ

¡¾²âÊÔ×¢ÒâÊÂÏî¡¿
 
***********************/
if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return 
cb_1.visible = false
wf_reset()
Choose Case as_testpoint
	Case 'RTEPROW09P01'
		
		if ab_exe then
			ole_1.object.AccessibleDescription = 'ttt'
			wf_output('ProReturn:ole_1.object.AccessibleDescription='+String(ole_1.object.AccessibleDescription),true)
		else
		end if
	Case 'RTEPROW09P02'
		
		if ab_exe then
			ole_1.object.AccessibleName = 'nnn'
			wf_output('ProReturn:ole_1.object.AccessibleName='+String(ole_1.object.AccessibleName),true)
		else
		end if
	Case 'RTEPROW09P03'
		
		if ab_exe then
			ole_1.object.AccessibleRole = checkbuttonrole!
			wf_output('ProReturn:ole_1.object.AccessibleRole='+wf_getAccessibleRole(ole_1.object.AccessibleRole),true)
		else
		end if
	Case 'RTEPROW09P04'
	
		
		if ab_exe then
			ole_1.object.AccessibleRole = clientrole!
			wf_output('ProReturn:ole_1.object.AccessibleRole='+wf_getAccessibleRole(ole_1.object.AccessibleRole),true)
		else
		end if
	Case 'RTEPROW09P05'
		
		if ab_exe then
			ole_1.object.FaceName = '@Dotum'
			wf_output('ProReturn:ole_1.object.FaceName='+String(ole_1.object.FaceName),true)
		else
		end if
	Case 'RTEPROW09P06'
		if ab_exe then
			ole_1.object.FaceName = '@华文中宋'
			wf_output('ProReturn:ole_1.object.FaceName='+String(ole_1.object.FaceName),true)
		else
		end if
		
	Case 'RTEPROW09P07'

		
		if ab_exe then
			ole_1.object.FontCharSet = ANSI!
			wf_output('ProReturn:ole_1.object.FontCharSet='+wf_getFontCharSet(ole_1.object.FontCharSet),true)
		else
			ole_1.object.Border = false
		end if
	Case 'RTEPROW09P08'
			if ab_exe then
			ole_1.object.FontFamily = swiss!
			wf_output('ProReturn:ole_1.object.FontFamily='+wf_getFontFamily(ole_1.object.FontFamily),true)
		else
			ole_1.object.Border = false
		end if
		
	Case 'RTEPROW09P09'
			if ab_exe then
			ole_1.object.FontPitch = variable!
			wf_output('ProReturn:ole_1.object.FontPitch='+wf_getFontPitch(ole_1.object.FontPitch),true)
		else
			ole_1.object.Border = false
		end if
		
	Case 'RTEPROW09P10'

		
		if ab_exe then
			ole_1.object.Italic = true
			wf_output('ProReturn:ole_1.object.Italic='+string(ole_1.object.Italic),true)
		else
		end if
	Case 'RTEPROW09P11'
		if ab_exe then
			ole_1.object.Italic = false
			wf_output('ProReturn:ole_1.object.Italic='+string(ole_1.object.Italic),true)
		else
		end if
		
	Case 'RTEPROW09P12'
	
		if ab_exe then
			ole_1.object.PaperHeight = -100
			wf_output('ProReturn:ole_1.object.PaperHeight='+string(ole_1.object.PaperHeight),true)
			ole_1.object.PaperHeight = il_paperheight
		else
		end if
	Case 'RTEPROW09P13'
		if ab_exe then
			ole_1.object.PaperHeight = 0
			wf_output('ProReturn:ole_1.object.PaperHeight='+string(ole_1.object.PaperHeight),true)
			ole_1.object.PaperHeight = il_paperheight
		else
		end if
		
	Case 'RTEPROW09P14'
		if ab_exe then
			ole_1.object.PaperHeight = 8000
			wf_output('ProReturn:ole_1.object.PaperHeight='+string(ole_1.object.PaperHeight),true)
			ole_1.object.PaperHeight = il_paperheight
		else
		end if
		
	Case 'RTEPROW09P15'

		
		if ab_exe then
			ole_1.object.PaperOrientation = PaperLandscape!
			wf_output('ProReturn:ole_1.object.PaperOrientation='+String(ole_1.object.PaperOrientation),true)
		else
		end if
	Case 'RTEPROW09P16'
		if ab_exe then
			ole_1.object.PaperOrientation = PaperPortrait!
			wf_output('ProReturn:ole_1.object.PaperOrientation='+String(ole_1.object.PaperOrientation),true)
		else
		end if
		
	Case 'RTEPROW09P17'

		
		if ab_exe then
			ole_1.object.PaperWidth = -100
			wf_output('ProReturn:ole_1.object.PaperWidth='+String(ole_1.object.PaperWidth),true)
			ole_1.object.PaperWidth = il_PaperWidth
		end if
	Case 'RTEPROW09P18'
		if ab_exe then
			ole_1.object.PaperWidth = 0
			wf_output('ProReturn:ole_1.object.PaperWidth='+String(ole_1.object.PaperWidth),true)
			ole_1.object.PaperWidth = il_PaperWidth
		end if
		
	Case 'RTEPROW09P19'
		if ab_exe then
			ole_1.object.PaperWidth = 8000
			wf_output('ProReturn:ole_1.object.PaperWidth='+String(ole_1.object.PaperWidth),true)
			ole_1.object.PaperWidth = il_PaperWidth
		end if
		
	Case 'RTEPROW09P20'
		if ab_exe then
			ole_1.object.SelectedStartPos = -100
			wf_output('ProReturn:ole_1.object.SelectedStartPos='+String(ole_1.object.SelectedStartPos),true)
		end if
		
	Case 'RTEPROW09P21'
		if ab_exe then
			ole_1.object.SelectedStartPos = 0
			wf_output('ProReturn:ole_1.object.SelectedStartPos='+String(ole_1.object.SelectedStartPos),true)
		end if
		
	Case 'RTEPROW09P22'
		if ab_exe then
			ole_1.object.SelectedStartPos = 10
			wf_output('ProReturn:ole_1.object.SelectedStartPos='+String(ole_1.object.SelectedStartPos),true)
		end if
		
	Case 'RTEPROW09P23'
		if ab_exe then
			ole_1.object.SelectedTextLength = -100
			wf_output('ProReturn:ole_1.object.SelectedTextLength='+String(ole_1.object.SelectedTextLength),true)
		end if
		
	Case 'RTEPROW09P24'
		if ab_exe then
			ole_1.object.SelectedTextLength = 0
			wf_output('ProReturn:ole_1.object.SelectedTextLength='+String(ole_1.object.SelectedTextLength),true)
		end if
		
	Case 'RTEPROW09P25'
		if ab_exe then
			ole_1.object.SelectedTextLength = 10
			wf_output('ProReturn:ole_1.object.SelectedTextLength='+String(ole_1.object.SelectedTextLength),true)
		end if		
		
	Case 'RTEPROW09P26'
		if ab_exe then
			ole_1.object.StatusBar = false
			wf_output('ProReturn:ole_1.object.StatusBar='+String(ole_1.object.StatusBar),true)
		end if		
	Case 'RTEPROW09P27'
		if ab_exe then
			ole_1.object.StatusBar = true
			wf_output('ProReturn:ole_1.object.StatusBar='+String(ole_1.object.StatusBar),true)
		end if					
		
	Case 'RTEPROW09P28'
		if ab_exe then
			ole_1.object.TextSize = -100
			wf_output('ProReturn:ole_1.object.TextSize='+String(ole_1.object.TextSize),true)
		end if
		
	Case 'RTEPROW09P29'
		if ab_exe then
			ole_1.object.TextSize = 0
			wf_output('ProReturn:ole_1.object.TextSize='+String(ole_1.object.TextSize),true)
		end if
		
	Case 'RTEPROW09P30'
		if ab_exe then
			ole_1.object.TextSize = 10
			wf_output('ProReturn:ole_1.object.TextSize='+String(ole_1.object.TextSize),true)
		end if	
		
	Case 'RTEPROW09P31'
		if ab_exe then
			ole_1.object.Weight = -100
			wf_output('ProReturn:ole_1.object.Weight='+String(ole_1.object.Weight),true)
		end if	
		
	Case 'RTEPROW09P32'
		if ab_exe then
			ole_1.object.Weight = 0
			wf_output('ProReturn:ole_1.object.Weight='+String(ole_1.object.Weight),true)
		end if	
		
	Case 'RTEPROW09P33'
		if ab_exe then
			ole_1.object.Weight = 400
			wf_output('ProReturn:ole_1.object.Weight='+String(ole_1.object.Weight),true)
		end if	
	Case 'RTEPROW09P34'
		if ab_exe then
			ole_1.object.Weight = 700
			wf_output('ProReturn:ole_1.object.Weight='+String(ole_1.object.Weight),true)
		end if	
		
End Choose

if ab_exe then
	wf_postrun(al_row)
end if
end event

event open;call super::open;ClipBoard("asdgsdasadsdasdsdfsadfsdafsdafsdafsdafsdafsda")

ole_1.object.post Paste( )

il_paperheight = ole_1.object.paperheight
il_paperwidth =  ole_1.object.paperwidth


end event

type cb_update from w_templet`cb_update within w_rteprow09_ole
end type

type mle_phenomena from w_templet`mle_phenomena within w_rteprow09_ole
end type

type cb_autoparse from w_templet`cb_autoparse within w_rteprow09_ole
end type

type cb_wrrun from w_templet`cb_wrrun within w_rteprow09_ole
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rteprow09_ole
end type

type dw_info from w_templet`dw_info within w_rteprow09_ole
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rteprow09_ole
end type

type pb_runnext from w_templet`pb_runnext within w_rteprow09_ole
end type

type pb_runall from w_templet`pb_runall within w_rteprow09_ole
end type

type pb_run from w_templet`pb_run within w_rteprow09_ole
end type

type pb_end from w_templet`pb_end within w_rteprow09_ole
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rteprow09_ole
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rteprow09_ole
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rteprow09_ole
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rteprow09_ole
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rteprow09_ole
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rteprow09_ole
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rteprow09_ole
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rteprow09_ole
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rteprow09_ole
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rteprow09_ole
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rteprow09_ole
end type

type cb_1 from commandbutton within w_rteprow09_ole
boolean visible = false
integer x = 2610
integer y = 444
integer width = 457
integer height = 196
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "ËÎÌå"
string text = "none"
end type

type cb_2 from commandbutton within w_rteprow09_ole
integer x = 2030
integer y = 2332
integer width = 457
integer height = 132
integer taborder = 90
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

type ole_1 from olecustomcontrol within w_rteprow09_ole
event fileexists ( string filename,  long presult )
event rbtnup ( long presult )
event rbtndown ( long presult )
event pictureselected ( long presult )
event modified ( long presult )
event key ( long keycode,  long keyflags,  long presult )
event dclicked ( long presult )
integer x = 14
integer y = 16
integer width = 2935
integer height = 1294
integer taborder = 70
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_rteprow09_ole.win"
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
08w_rteprow09_ole.bin 
2200001000e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000005fffffffe0000000400000006fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000f4b13e0001d121c700000003000004c00000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000033c00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003ca8b32274d04317f533962bbefa4474f00000000f4b13e0001d121c7f4b13e0001d121c7000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffff00000004ffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000d00000075000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a0000000b0000000cfffffffe0000000efffffffe000000100000001100000012fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
23ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000fffe00020006ca8b32274d04317f533962bbefa4474f00000001fb8f0821101b01640008ed8413c72e2b000000300000030c0000000d0000010000000070000001010000007800000102000000800000010300000088000001040000009000000105000001d800000106000001e800000107000001fc000001080000020800000109000002100000010a000002180000010b0000022000000000000002280000000300010000000000030000425a000000030000217d00000003000000240000004b0000013d0000fffe000100060be3520311ce8f91aa00e39d51b84b0000000001fb8f0821101b01640008ed8413c72e2b000000300000010d0000000800000002000000480000000a00000058000000090000006000000004000000680000000700000074000000060000007c0000000800000084000000000000008c00000008000000054f535b8b0000000000000002000000860000000200000190000000060001d4c0000000000000000b000000000000000b000000000000000b00000000000000080000000000000005006f00660000086e00000e00740073006900720065006b000400740005000000730000007a0069000000000900000007006500770a670069080000006300000061006800070072000a0000007500000064006e0072006500000002000000050061006e0000066d000007000000690000006100740000006c000000410000000805ca000000000000000000410000000c4f535b8b0000000001d501dc000000060001d4c0000000000000000b000000000000000b000000000000000b000000000000000b000000000000000d00000000000000010001060000000900636166006d616e6501030065000c0000735f00006b636f74706f727001070073000900006f6600006973746e0100657a090000015f000000657478650078746e0000010a00000009746e6f66646c6f62000102000000090078655f00746e657401090079000a00006e7500006c72656400656e69000001050000000d75636f64746e656d656d616e00010800000012006e6f66007274737474656b69756f726804006867050000016600000000746e6f00000100000000097265765f6e6f697300010b0000000700617469000063696c00640061000100000000425a0000217d00000024e3520300ce8f910b00e39d11b84b00aa00860151c0019000040001d4e5cccecb010000000101010100000001000000000000000000000000000001000000000805ca00000000000000000c00535b8b000200004fd501dc8001d4c00100000000000000000074000000730065006e0065ffffffff000000030000000400000001ffffffff000000020000000000000a560000052b00000092000900010049030000020000000000090004000001030000004f00020065006c007200500073006500300030000000300000000000000000000000000000000000000000000000000000000000000000000000000000000000020018ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000f000000d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050008020b000000000000000000050032020c00030064001e0000000000050000020b0007000002fc0000ffff0000000000ff000000040000012d000000090021061d003200f0000000640007000002fc0000ffff0000000000ff000000040001012d00000004000001f000000004ffff0127000000030000000000000000000000000000000000000000494e414e00000000006100720020006d006900460065006c005c00730079005300610062006500730053005c0061006800650072005c0064006f00500065007700420072006900750064006c007200650043003b005c003a007200500067006f006100720020006d006900460065006c005c00730079005300610062006500730050005c0077006f0072006500750042006c00690065006400200072003100310035002e0043003b005c003a006900570064006e0077006f005c00730069004d007200630073006f0066006f002e00740045004e005c005400720046006d0061007700650072006f005c006b003200760030002e0035002e00370030003700320043003b005c003a
22007200500067006f006100720020006d006900460065006c005c0073006500540061007200610064006100740054005c00610064005c00740050004c004500440062005c006e00690043003b005c003a007200500067006f006100720020006d006900460065006c005c007300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
18w_rteprow09_ole.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
