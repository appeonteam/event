$PBExportHeader$w_rteprow09.srw
forward
global type w_rteprow09 from w_templet
end type
type rte_1 from richtextedit within w_rteprow09
end type
type cb_1 from commandbutton within w_rteprow09
end type
type cb_2 from commandbutton within w_rteprow09
end type
end forward

global type w_rteprow09 from w_templet
string title = "Dynamic Set 9"
rte_1 rte_1
cb_1 cb_1
cb_2 cb_2
end type
global w_rteprow09 w_rteprow09

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
rte_1.backcolor=16777215
rte_1.Border = true
rte_1.BorderStyle = StyleLowered!
rte_1.Displayonly = false
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

on w_rteprow09.create
int iCurrent
call super::create
this.rte_1=create rte_1
this.cb_1=create cb_1
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_2
end on

on w_rteprow09.destroy
call super::destroy
destroy(this.rte_1)
destroy(this.cb_1)
destroy(this.cb_2)
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
			rte_1.AccessibleDescription = 'ttt'
			wf_output('ProReturn:rte_1.AccessibleDescription='+String(rte_1.AccessibleDescription),true)
		else
		end if
	Case 'RTEPROW09P02'
		
		if ab_exe then
			rte_1.AccessibleName = 'nnn'
			wf_output('ProReturn:rte_1.AccessibleName='+String(rte_1.AccessibleName),true)
		else
		end if
	Case 'RTEPROW09P03'
		
		if ab_exe then
			rte_1.AccessibleRole = checkbuttonrole!
			wf_output('ProReturn:rte_1.AccessibleRole='+wf_getAccessibleRole(rte_1.AccessibleRole),true)
		else
		end if
	Case 'RTEPROW09P04'
	
		
		if ab_exe then
			rte_1.AccessibleRole = clientrole!
			wf_output('ProReturn:rte_1.AccessibleRole='+wf_getAccessibleRole(rte_1.AccessibleRole),true)
		else
		end if
	Case 'RTEPROW09P05'
		
		if ab_exe then
			rte_1.FaceName = '@Dotum'
			wf_output('ProReturn:rte_1.FaceName='+String(rte_1.FaceName),true)
		else
		end if
	Case 'RTEPROW09P06'
		if ab_exe then
			rte_1.FaceName = '@华文中宋'
			wf_output('ProReturn:rte_1.FaceName='+String(rte_1.FaceName),true)
		else
		end if
		
	Case 'RTEPROW09P07'

		
		if ab_exe then
			rte_1.FontCharSet = ANSI!
			wf_output('ProReturn:rte_1.FontCharSet='+wf_getFontCharSet(rte_1.FontCharSet),true)
		else
			rte_1.Border = false
		end if
	Case 'RTEPROW09P08'
			if ab_exe then
			rte_1.FontFamily = swiss!
			wf_output('ProReturn:rte_1.FontFamily='+wf_getFontFamily(rte_1.FontFamily),true)
		else
			rte_1.Border = false
		end if
		
	Case 'RTEPROW09P09'
			if ab_exe then
			rte_1.FontPitch = variable!
			wf_output('ProReturn:rte_1.FontPitch='+wf_getFontPitch(rte_1.FontPitch),true)
		else
			rte_1.Border = false
		end if
		
	Case 'RTEPROW09P10'

		
		if ab_exe then
			rte_1.Italic = true
			wf_output('ProReturn:rte_1.Italic='+string(rte_1.Italic),true)
		else
		end if
	Case 'RTEPROW09P11'
		if ab_exe then
			rte_1.Italic = false
			wf_output('ProReturn:rte_1.Italic='+string(rte_1.Italic),true)
		else
		end if
		
	Case 'RTEPROW09P12'
	
		if ab_exe then
			rte_1.PaperHeight = -100
			wf_output('ProReturn:rte_1.PaperHeight='+string(rte_1.PaperHeight),true)
			rte_1.PaperHeight = il_paperheight
		else
		end if
	Case 'RTEPROW09P13'
		if ab_exe then
			rte_1.PaperHeight = 0
			wf_output('ProReturn:rte_1.PaperHeight='+string(rte_1.PaperHeight),true)
			rte_1.PaperHeight = il_paperheight
		else
		end if
		
	Case 'RTEPROW09P14'
		if ab_exe then
			rte_1.PaperHeight = 8000
			wf_output('ProReturn:rte_1.PaperHeight='+string(rte_1.PaperHeight),true)
			rte_1.PaperHeight = il_paperheight
		else
		end if
		
	Case 'RTEPROW09P15'

		
		if ab_exe then
			rte_1.PaperOrientation = PaperLandscape!
			wf_output('ProReturn:rte_1.PaperOrientation='+String(rte_1.PaperOrientation),true)
		else
		end if
	Case 'RTEPROW09P16'
		if ab_exe then
			rte_1.PaperOrientation = PaperPortrait!
			wf_output('ProReturn:rte_1.PaperOrientation='+String(rte_1.PaperOrientation),true)
		else
		end if
		
	Case 'RTEPROW09P17'

		
		if ab_exe then
			rte_1.PaperWidth = -100
			wf_output('ProReturn:rte_1.PaperWidth='+String(rte_1.PaperWidth),true)
			rte_1.PaperWidth = il_PaperWidth
		end if
	Case 'RTEPROW09P18'
		if ab_exe then
			rte_1.PaperWidth = 0
			wf_output('ProReturn:rte_1.PaperWidth='+String(rte_1.PaperWidth),true)
			rte_1.PaperWidth = il_PaperWidth
		end if
		
	Case 'RTEPROW09P19'
		if ab_exe then
			rte_1.PaperWidth = 8000
			wf_output('ProReturn:rte_1.PaperWidth='+String(rte_1.PaperWidth),true)
			rte_1.PaperWidth = il_PaperWidth
		end if
		
	Case 'RTEPROW09P20'
		if ab_exe then
			rte_1.SelectedStartPos = -100
			wf_output('ProReturn:rte_1.SelectedStartPos='+String(rte_1.SelectedStartPos),true)
		end if
		
	Case 'RTEPROW09P21'
		if ab_exe then
			rte_1.SelectedStartPos = 0
			wf_output('ProReturn:rte_1.SelectedStartPos='+String(rte_1.SelectedStartPos),true)
		end if
		
	Case 'RTEPROW09P22'
		if ab_exe then
			rte_1.SelectedStartPos = 10
			wf_output('ProReturn:rte_1.SelectedStartPos='+String(rte_1.SelectedStartPos),true)
		end if
		
	Case 'RTEPROW09P23'
		if ab_exe then
			rte_1.SelectedTextLength = -100
			wf_output('ProReturn:rte_1.SelectedTextLength='+String(rte_1.SelectedTextLength),true)
		end if
		
	Case 'RTEPROW09P24'
		if ab_exe then
			rte_1.SelectedTextLength = 0
			wf_output('ProReturn:rte_1.SelectedTextLength='+String(rte_1.SelectedTextLength),true)
		end if
		
	Case 'RTEPROW09P25'
		if ab_exe then
			rte_1.SelectedTextLength = 10
			wf_output('ProReturn:rte_1.SelectedTextLength='+String(rte_1.SelectedTextLength),true)
		end if		
		
	Case 'RTEPROW09P26'
		if ab_exe then
			rte_1.StatusBar = false
			wf_output('ProReturn:rte_1.StatusBar='+String(rte_1.StatusBar),true)
		end if		
	Case 'RTEPROW09P27'
		if ab_exe then
			rte_1.StatusBar = true
			wf_output('ProReturn:rte_1.StatusBar='+String(rte_1.StatusBar),true)
		end if					
		
	Case 'RTEPROW09P28'
		if ab_exe then
			rte_1.TextSize = -100
			wf_output('ProReturn:rte_1.TextSize='+String(rte_1.TextSize),true)
		end if
		
	Case 'RTEPROW09P29'
		if ab_exe then
			rte_1.TextSize = 0
			wf_output('ProReturn:rte_1.TextSize='+String(rte_1.TextSize),true)
		end if
		
	Case 'RTEPROW09P30'
		if ab_exe then
			rte_1.TextSize = 10
			wf_output('ProReturn:rte_1.TextSize='+String(rte_1.TextSize),true)
		end if	
		
	Case 'RTEPROW09P31'
		if ab_exe then
			rte_1.Weight = -100
			wf_output('ProReturn:rte_1.Weight='+String(rte_1.Weight),true)
		end if	
		
	Case 'RTEPROW09P32'
		if ab_exe then
			rte_1.Weight = 0
			wf_output('ProReturn:rte_1.Weight='+String(rte_1.Weight),true)
		end if	
		
	Case 'RTEPROW09P33'
		if ab_exe then
			rte_1.Weight = 400
			wf_output('ProReturn:rte_1.Weight='+String(rte_1.Weight),true)
		end if	
	Case 'RTEPROW09P34'
		if ab_exe then
			rte_1.Weight = 700
			wf_output('ProReturn:rte_1.Weight='+String(rte_1.Weight),true)
		end if	
		
End Choose

if ab_exe then
	wf_postrun(al_row)
end if
end event

event open;call super::open;ClipBoard("asdgsdasadsdasdsdfsadfsdafsdafsdafsdafsdafsda")

rte_1.post Paste( )

il_paperheight = rte_1.paperheight
il_paperwidth =  rte_1.paperwidth


end event

type cb_update from w_templet`cb_update within w_rteprow09
end type

type mle_phenomena from w_templet`mle_phenomena within w_rteprow09
end type

type cb_autoparse from w_templet`cb_autoparse within w_rteprow09
end type

type cb_wrrun from w_templet`cb_wrrun within w_rteprow09
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rteprow09
end type

type dw_info from w_templet`dw_info within w_rteprow09
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rteprow09
end type

type pb_runnext from w_templet`pb_runnext within w_rteprow09
end type

type pb_runall from w_templet`pb_runall within w_rteprow09
end type

type pb_run from w_templet`pb_run within w_rteprow09
end type

type pb_end from w_templet`pb_end within w_rteprow09
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rteprow09
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rteprow09
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rteprow09
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rteprow09
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rteprow09
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rteprow09
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rteprow09
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rteprow09
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rteprow09
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rteprow09
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rteprow09
end type

type rte_1 from richtextedit within w_rteprow09
integer x = 14
integer y = 16
integer width = 2935
integer height = 1296
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_rulerbar = true
boolean init_tabbar = true
boolean init_toolbar = true
boolean init_popmenu = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_rteprow09
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

type cb_2 from commandbutton within w_rteprow09
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

