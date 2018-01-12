$PBExportHeader$w_rteprow08_ole.srw
forward
global type w_rteprow08_ole from w_templet
end type
type rte_2 from richtextedit within w_rteprow08_ole
end type
type ole_1 from olecustomcontrol within w_rteprow08_ole
end type
end forward

global type w_rteprow08_ole from w_templet
string title = "StaticValue 8(OLE)"
rte_2 rte_2
ole_1 ole_1
end type
global w_rteprow08_ole w_rteprow08_ole

forward prototypes
public function string wf_getfontcharset (fontcharset abs_fontcharset)
public function STRING wf_getfontfamily (fontfamily abs_fontfamily)
public function STRING wf_getfontpitch (fontpitch abs_fontpitch)
public function string wf_getaccessiblerole (accessiblerole abs_accessiblerole)
end prototypes

public function string wf_getfontcharset (fontcharset abs_fontcharset);CHOOSE CASE abs_FontCharSet
	CASE ANSI!
		Return "ANSI!"
	CASE GB2312CHARSET!
		Return "GB2312CHARSET!"
END CHOOSE
end function

public function STRING wf_getfontfamily (fontfamily abs_fontfamily);CHOOSE CASE abs_FontFamily
	CASE SWISS!
		Return "SWISS!"
END CHOOSE
end function

public function STRING wf_getfontpitch (fontpitch abs_fontpitch);CHOOSE CASE abs_FontPitch
	CASE VARIABLE!
		Return "VARIABLE!"

END CHOOSE
end function

public function string wf_getaccessiblerole (accessiblerole abs_accessiblerole);CHOOSE CASE abs_accessiblerole
	CASE animationrole!
		Return "animationrole!"
	CASE defaultrole!
		Return "defaultrole!"
END CHOOSE
end function

on w_rteprow08_ole.create
int iCurrent
call super::create
this.rte_2=create rte_2
this.ole_1=create ole_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_2
this.Control[iCurrent+2]=this.ole_1
end on

on w_rteprow08_ole.destroy
call super::destroy
destroy(this.rte_2)
destroy(this.ole_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 

***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Properties\StaticValue 1 
Pbl Name:     
Designer:     ouyangwu
Coder:        ouyangwu at 2005-06-20
DocReviewer:  
CoderReviewer:
¡¾¹¦ÄÜÃèÊö¡¿
²âÊÔRichTextEditÊôÐÔµÄ¾²Ì¬Öµ
¡¾´°¿Ú¶ÔÏó¡¿

¡¾±àÂë×¢ÒâÊÂÏî¡¿

¡¾²âÊÔ×¢ÒâÊÂÏî¡¿
 
***********************/
if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return 
Choose Case as_testpoint
	Case 'RTEPROW08P01'
	/*
	   ¡¾¹¦ÄÜÃèÊö¡¿
	    Accelerator

		¡¾±àÂëÃèÊö¡¿
		1¡¢ÔÚPB»­°åÖÐÉèÖÃAcceleratorÊôÐÔ
		2¡¢²âÊÔµã´úÂëÊä³ö¸ÃÊôÐÔÖµ

		¡¾´úÂëÊä³öÖµÃèÊö¡¿
		Êä³öµÄÖµÎª»­°åÖÐËùÉèÖÃµÄÖµ
		
		
		¡¾ÆÚÍûUIÃèÊö¡¿
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:ole_1.object.AccessibleDescription='+String(ole_1.object.AccessibleDescription),true)
		else
		end if
	Case 'RTEPROW08P02'
	/*
	   ¡¾¹¦ÄÜÃèÊö¡¿
	    Backcolor

		¡¾±àÂëÃèÊö¡¿
		1¡¢ÔÚPB»­°åÖÐÉèÖÃBackcolorÊôÐÔ
		2¡¢²âÊÔµã´úÂëÊä³ö¸ÃÊôÐÔÖµ

		¡¾´úÂëÊä³öÖµÃèÊö¡¿
		Êä³öµÄÖµÎª»­°åÖÐËùÉèÖÃµÄÖµ
		
		
		¡¾ÆÚÍûUIÃèÊö¡¿
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:ole_1.object.AccessibleName='+String(ole_1.object.AccessibleName),true)
		else
		end if
	Case 'RTEPROW08P03'
	/*
	   ¡¾¹¦ÄÜÃèÊö¡¿
	    Border

		¡¾±àÂëÃèÊö¡¿
		1¡¢ÔÚPB»­°åÖÐÉèÖÃBorderÊôÐÔ
		2¡¢²âÊÔµã´úÂëÊä³ö¸ÃÊôÐÔÖµ

		¡¾´úÂëÊä³öÖµÃèÊö¡¿
		Êä³öµÄÖµÎª»­°åÖÐËùÉèÖÃµÄÖµ
		
		
		¡¾ÆÚÍûUIÃèÊö¡¿
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:ole_1.object.AccessibleRole='+wf_getaccessiblerole(ole_1.object.AccessibleRole),true)
		else
		end if
	Case 'RTEPROW08P04'
	/*
	   ¡¾¹¦ÄÜÃèÊö¡¿
	    Borderstyle

		¡¾±àÂëÃèÊö¡¿
		1¡¢ÔÚPB»­°åÖÐÉèÖÃBorderstyleÊôÐÔ
		2¡¢²âÊÔµã´úÂëÊä³ö¸ÃÊôÐÔÖµ

		¡¾´úÂëÊä³öÖµÃèÊö¡¿
		Êä³öµÄÖµÎª»­°åÖÐËùÉèÖÃµÄÖµ
		
		
		¡¾ÆÚÍûUIÃèÊö¡¿
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:ole_1.object.FaceName='+ole_1.object.FaceName,true)
		else
		end if
	Case 'RTEPROW08P05'
	/*
	   ¡¾¹¦ÄÜÃèÊö¡¿
	    Bottommargin

		¡¾±àÂëÃèÊö¡¿
		1¡¢ÔÚPB»­°åÖÐÉèÖÃBottommarginÊôÐÔ
		2¡¢²âÊÔµã´úÂëÊä³ö¸ÃÊôÐÔÖµ

		¡¾´úÂëÊä³öÖµÃèÊö¡¿
		Êä³öµÄÖµÎª»­°åÖÐËùÉèÖÃµÄÖµ
		
		
		¡¾ÆÚÍûUIÃèÊö¡¿
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:ole_1.object.FontCharSet='+wf_getFontCharSet(ole_1.object.FontCharSet),true)
		else
		end if
	Case 'RTEPROW08P06'
	/*
	   ¡¾¹¦ÄÜÃèÊö¡¿
	    Bringtotop

		¡¾±àÂëÃèÊö¡¿
		1¡¢ÔÚPB»­°åÖÐÉèÖÃBringtotopÊôÐÔ
		2¡¢²âÊÔµã´úÂëÊä³ö¸ÃÊôÐÔÖµ

		¡¾´úÂëÊä³öÖµÃèÊö¡¿
		Êä³öµÄÖµÎª»­°åÖÐËùÉèÖÃµÄÖµ
		
		
		¡¾ÆÚÍûUIÃèÊö¡¿
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:ole_1.object.FontFamily='+wf_getFontFamily(ole_1.object.FontFamily),true)
		else
		end if
	Case 'RTEPROW08P07'
	/*
	   ¡¾¹¦ÄÜÃèÊö¡¿
	    DisplayOnly

		¡¾±àÂëÃèÊö¡¿
		1¡¢ÔÚPB»­°åÖÐÉèÖÃDisplayOnlyÊôÐÔ
		2¡¢²âÊÔµã´úÂëÊä³ö¸ÃÊôÐÔÖµ

		¡¾´úÂëÊä³öÖµÃèÊö¡¿
		Êä³öµÄÖµÎª»­°åÖÐËùÉèÖÃµÄÖµ
		
		
		¡¾ÆÚÍûUIÃèÊö¡¿
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:ole_1.object.FontPitch='+wf_getFontPitch(ole_1.object.FontPitch),true)
		else
		end if
	Case 'RTEPROW08P08'
	/*
	   ¡¾¹¦ÄÜÃèÊö¡¿
	    DocumentName

		¡¾±àÂëÃèÊö¡¿
		1¡¢ÔÚPB»­°åÖÐÉèÖÃDocumentNameÊôÐÔ
		2¡¢²âÊÔµã´úÂëÊä³ö¸ÃÊôÐÔÖµ

		¡¾´úÂëÊä³öÖµÃèÊö¡¿
		Êä³öµÄÖµÎª»­°åÖÐËùÉèÖÃµÄÖµ
		
		
		¡¾ÆÚÍûUIÃèÊö¡¿
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:ole_1.object.Italic='+String(ole_1.object.Italic),true)
		else
		end if
	Case 'RTEPROW08P09'
	/*
	   ¡¾¹¦ÄÜÃèÊö¡¿
	    DragAuto

		¡¾±àÂëÃèÊö¡¿
		1¡¢ÔÚPB»­°åÖÐÉèÖÃDragAutoÊôÐÔ
		2¡¢²âÊÔµã´úÂëÊä³ö¸ÃÊôÐÔÖµ

		¡¾´úÂëÊä³öÖµÃèÊö¡¿
		Êä³öµÄÖµÎª»­°åÖÐËùÉèÖÃµÄÖµ
		
		
		¡¾ÆÚÍûUIÃèÊö¡¿
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:ole_1.object.LeftMargin='+String(ole_1.object.LeftMargin),true)
		else
		end if
	Case 'RTEPROW08P10'
	/*
	   ¡¾¹¦ÄÜÃèÊö¡¿
	    DragIcon

		¡¾±àÂëÃèÊö¡¿
		1¡¢ÔÚPB»­°åÖÐÉèÖÃDragIconÊôÐÔ
		2¡¢²âÊÔµã´úÂëÊä³ö¸ÃÊôÐÔÖµ

		¡¾´úÂëÊä³öÖµÃèÊö¡¿
		Êä³öµÄÖµÎª»­°åÖÐËùÉèÖÃµÄÖµ
		
		
		¡¾ÆÚÍûUIÃèÊö¡¿
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:ole_1.object.PaperHeight='+String(ole_1.object.PaperHeight),true)
		else
		end if
	Case 'RTEPROW08P11'
	/*
	   ¡¾¹¦ÄÜÃèÊö¡¿
	    Enabled

		¡¾±àÂëÃèÊö¡¿
		1¡¢ÔÚPB»­°åÖÐÉèÖÃEnabledÊôÐÔ
		2¡¢²âÊÔµã´úÂëÊä³ö¸ÃÊôÐÔÖµ

		¡¾´úÂëÊä³öÖµÃèÊö¡¿
		Êä³öµÄÖµÎª»­°åÖÐËùÉèÖÃµÄÖµ
		
		
		¡¾ÆÚÍûUIÃèÊö¡¿
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:ole_1.object.PaperOrientation='+String(ole_1.object.PaperOrientation),true)
		else
		end if
	Case 'RTEPROW08P12'
	/*
	   ¡¾¹¦ÄÜÃèÊö¡¿
	    HeaderFooter

		¡¾±àÂëÃèÊö¡¿
		1¡¢ÔÚPB»­°åÖÐÉèÖÃHeaderFooterÊôÐÔ
		2¡¢²âÊÔµã´úÂëÊä³ö¸ÃÊôÐÔÖµ

		¡¾´úÂëÊä³öÖµÃèÊö¡¿
		Êä³öµÄÖµÎª»­°åÖÐËùÉèÖÃµÄÖµ
		
		
		¡¾ÆÚÍûUIÃèÊö¡¿
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:ole_1.object.PaperWidth='+String(ole_1.object.PaperWidth),true)
		else
		end if
	Case 'RTEPROW08P13'
	/*
	   ¡¾¹¦ÄÜÃèÊö¡¿
	    Height

		¡¾±àÂëÃèÊö¡¿
		1¡¢ÔÚPB»­°åÖÐÉèÖÃHeightÊôÐÔ
		2¡¢²âÊÔµã´úÂëÊä³ö¸ÃÊôÐÔÖµ

		¡¾´úÂëÊä³öÖµÃèÊö¡¿
		Êä³öµÄÖµÎª»­°åÖÐËùÉèÖÃµÄÖµ
		
		
		¡¾ÆÚÍûUIÃèÊö¡¿
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:ole_1.object.SelectedStartPos='+String(ole_1.object.SelectedStartPos),true)
		else
		end if
	Case 'RTEPROW08P14'
	/*
	   ¡¾¹¦ÄÜÃèÊö¡¿
	    HscrollBar

		¡¾±àÂëÃèÊö¡¿
		1¡¢ÔÚPB»­°åÖÐÉèÖÃHscrollBarÊôÐÔ
		2¡¢²âÊÔµã´úÂëÊä³ö¸ÃÊôÐÔÖµ

		¡¾´úÂëÊä³öÖµÃèÊö¡¿
		Êä³öµÄÖµÎª»­°åÖÐËùÉèÖÃµÄÖµ
		
		
		¡¾ÆÚÍûUIÃèÊö¡¿
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:ole_1.object.SelectedTextLength='+String(ole_1.object.SelectedTextLength),true)
		else
		end if
	Case 'RTEPROW08P15'
	/*
	   ¡¾¹¦ÄÜÃèÊö¡¿
	    InputFieldBackColor

		¡¾±àÂëÃèÊö¡¿
		1¡¢ÔÚPB»­°åÖÐÉèÖÃInputFieldBackColorÊôÐÔ
		2¡¢²âÊÔµã´úÂëÊä³ö¸ÃÊôÐÔÖµ

		¡¾´úÂëÊä³öÖµÃèÊö¡¿
		Êä³öµÄÖµÎª»­°åÖÐËùÉèÖÃµÄÖµ
		
		
		¡¾ÆÚÍûUIÃèÊö¡¿
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:ole_1.object.StatusBar='+String(ole_1.object.StatusBar),true)
		else
		end if
	Case 'RTEPROW08P16'
	/*
	   ¡¾¹¦ÄÜÃèÊö¡¿
	    InputFieldNamesVisible

		¡¾±àÂëÃèÊö¡¿
		1¡¢ÔÚPB»­°åÖÐÉèÖÃInputFieldNamesVisibleÊôÐÔ
		2¡¢²âÊÔµã´úÂëÊä³ö¸ÃÊôÐÔÖµ

		¡¾´úÂëÊä³öÖµÃèÊö¡¿
		Êä³öµÄÖµÎª»­°åÖÐËùÉèÖÃµÄÖµ
		
		
		¡¾ÆÚÍûUIÃèÊö¡¿
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:ole_1.object.TextSize='+String(ole_1.object.TextSize),true)
		else
		end if
	Case 'RTEPROW08P17'
	/*
	   ¡¾¹¦ÄÜÃèÊö¡¿
	    InputFieldsVisible

		¡¾±àÂëÃèÊö¡¿
		1¡¢ÔÚPB»­°åÖÐÉèÖÃInputFieldsVisibleÊôÐÔ
		2¡¢²âÊÔµã´úÂëÊä³ö¸ÃÊôÐÔÖµ

		¡¾´úÂëÊä³öÖµÃèÊö¡¿
		Êä³öµÄÖµÎª»­°åÖÐËùÉèÖÃµÄÖµ
		
		
		¡¾ÆÚÍûUIÃèÊö¡¿
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:ole_1.object.Weight='+String(ole_1.object.Weight),true)
		else
		end if
	
End Choose
if ab_exe then
	wf_postrun(al_row)
end if
end event

type cb_update from w_templet`cb_update within w_rteprow08_ole
end type

type mle_phenomena from w_templet`mle_phenomena within w_rteprow08_ole
end type

type cb_autoparse from w_templet`cb_autoparse within w_rteprow08_ole
end type

type cb_wrrun from w_templet`cb_wrrun within w_rteprow08_ole
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rteprow08_ole
end type

type dw_info from w_templet`dw_info within w_rteprow08_ole
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rteprow08_ole
end type

type pb_runnext from w_templet`pb_runnext within w_rteprow08_ole
end type

type pb_runall from w_templet`pb_runall within w_rteprow08_ole
end type

type pb_run from w_templet`pb_run within w_rteprow08_ole
end type

type pb_end from w_templet`pb_end within w_rteprow08_ole
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rteprow08_ole
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rteprow08_ole
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rteprow08_ole
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rteprow08_ole
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rteprow08_ole
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rteprow08_ole
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rteprow08_ole
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rteprow08_ole
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rteprow08_ole
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rteprow08_ole
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rteprow08_ole
end type

type rte_2 from richtextedit within w_rteprow08_ole
integer x = 1915
integer y = 944
integer width = 457
integer height = 132
integer taborder = 80
boolean bringtotop = true
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
borderstyle borderstyle = stylelowered!
end type

type ole_1 from olecustomcontrol within w_rteprow08_ole
event fileexists ( string filename,  long presult )
event rbtnup ( long presult )
event rbtndown ( long presult )
event pictureselected ( long presult )
event modified ( long presult )
event key ( long keycode,  long keyflags,  long presult )
event dclicked ( long presult )
integer x = 9
integer y = 20
integer width = 2949
integer height = 1300
integer taborder = 70
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_rteprow08_ole.win"
integer textsize = -11
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@Dotum"
boolean italic = true
long textcolor = 33554432
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
07w_rteprow08_ole.bin 
2200001000e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000005fffffffe0000000400000006fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000ac55399001d121c700000003000004c00000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000033c00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003ca8b32274d04317f533962bbefa4474f00000000ac55399001d121c7ac55399001d121c7000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffff00000004ffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000d00000075000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a0000000b0000000cfffffffe0000000efffffffe000000100000001100000012fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
29ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000fffe00020006ca8b32274d04317f533962bbefa4474f00000001fb8f0821101b01640008ed8413c72e2b000000300000030c0000000d0000010000000070000001010000007800000102000000800000010300000088000001040000009000000105000001d800000106000001e800000107000001fc000001080000020800000109000002100000010a000002180000010b000002200000000000000228000000030001000000000003000042aa000000030000219700000003000000240000004b0000013d0000fffe000100060be3520311ce8f91aa00e39d51b84b0000000001fb8f0821101b01640008ed8413c72e2b000000300000010d0000000800000002000000480000000a00000058000000090000006000000004000000680000000700000074000000060000007c0000000800000084000000000000008c00000008000000054f535b8b0000000000000002000000860000000200000190000000060001d4c0000000000000000b000000000000000b000000000000000b00000000000000080000000000000005006f00660000086e00000e00740073006900720065006b000400740005000000730000007a0069000000000900000007006500770a670069080000006300000061006800070072000a0000007500000064006e0072006500000002000000050061006e0000066d000007000000690000006100740000006c000000410000000807eb000000000000000000410000000c4f535b8b0000000000001bc2000000060001d4c0000000000000000b000000000000000b000000000000000b000000000000000b000000000000000d00000000000000010001060000000900636166006d616e6501030065000c0000735f00006b636f74706f727001070073000900006f6600006973746e0100657a090000015f000000657478650078746e0000010a00000009746e6f66646c6f62000102000000090078655f00746e657401090079000a00006e7500006c72656400656e69000001050000000d75636f64746e656d656d616e00010800000012006e6f66007274737474656b69756f726804006867050000016600000000746e6f00000100000000097265765f6e6f697300010b0000000700617469000063696c0064006100010000000042aa0000219700000024e3520300ce8f910b00e39d11b84b00aa00860151c0019000040001d4e5cccecb010000000101010100000001000000000000000000000000000001000000000807eb00000000000000000c00535b8b000200004f001bc28001d4c00000000000000000000074000000730065006e0065ffffffff000000030000000400000001ffffffff000000020000000000000a560000052b00000092000900010049030000020000000000090004000001030000004f00020065006c007200500073006500300030000000300000000000000000000000000000000000000000000000000000000000000000000000000000000000020018ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000f000000d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050008020b000000000000000000050032020c00030064001e0000000000050000020b0007000002fc0000ffff0000000000ff000000040000012d000000090021061d003200f0000000640007000002fc0000ffff0000000000ff000000040001012d00000004000001f000000004ffff0127000000030000000000000000000000000000000000000000494e414e00000000006f0072006f007300740066004e002e005400450046005c006100720065006d006f0077006b00720076005c002e0032002e00300030003500320037003b0037003a00430050005c006f007200720067006d006100460020006c0069007300650054005c007200650064006100740061005c00610064005400740061004c005c00440050005c004500690062003b006e003a00430050005c006f007200720067006d006100460020006c0069007300650054005c007200650064006100740061005c0061006c0043006500690074006e0031005c002e0033005c00300068005300720061006400650049002000550043004c0020006200690061007200690072
2600730065006600200072006f00540020007200650064006100740061005c00610069006c005c00620043003b005c003a007200500067006f006100720020006d006900460065006c005c0073006500540061007200610064006100740062005c006e007900740065003b005c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17w_rteprow08_ole.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
