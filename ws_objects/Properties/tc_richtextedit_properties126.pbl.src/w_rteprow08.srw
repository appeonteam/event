$PBExportHeader$w_rteprow08.srw
forward
global type w_rteprow08 from w_templet
end type
type rte_1 from richtextedit within w_rteprow08
end type
type rte_2 from richtextedit within w_rteprow08
end type
end forward

global type w_rteprow08 from w_templet
string title = "StaticValue 8"
rte_1 rte_1
rte_2 rte_2
end type
global w_rteprow08 w_rteprow08

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

on w_rteprow08.create
int iCurrent
call super::create
this.rte_1=create rte_1
this.rte_2=create rte_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
this.Control[iCurrent+2]=this.rte_2
end on

on w_rteprow08.destroy
call super::destroy
destroy(this.rte_1)
destroy(this.rte_2)
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
			wf_output('ProReturn:rte_1.AccessibleDescription='+String(rte_1.AccessibleDescription),true)
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
			wf_output('ProReturn:rte_1.AccessibleName='+String(rte_1.AccessibleName),true)
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
			wf_output('ProReturn:rte_1.AccessibleRole='+wf_getaccessiblerole(rte_1.AccessibleRole),true)
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
			wf_output('ProReturn:rte_1.FaceName='+rte_1.FaceName,true)
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
			wf_output('ProReturn:rte_1.FontCharSet='+wf_getFontCharSet(rte_1.FontCharSet),true)
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
			wf_output('ProReturn:rte_1.FontFamily='+wf_getFontFamily(rte_1.FontFamily),true)
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
			wf_output('ProReturn:rte_1.FontPitch='+wf_getFontPitch(rte_1.FontPitch),true)
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
			wf_output('ProReturn:rte_1.Italic='+String(rte_1.Italic),true)
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
			wf_output('ProReturn:rte_1.LeftMargin='+String(rte_1.LeftMargin),true)
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
			wf_output('ProReturn:rte_1.PaperHeight='+String(rte_1.PaperHeight),true)
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
			wf_output('ProReturn:rte_1.PaperOrientation='+String(rte_1.PaperOrientation),true)
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
			wf_output('ProReturn:rte_1.PaperWidth='+String(rte_1.PaperWidth),true)
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
			wf_output('ProReturn:rte_1.SelectedStartPos='+String(rte_1.SelectedStartPos),true)
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
			wf_output('ProReturn:rte_1.SelectedTextLength='+String(rte_1.SelectedTextLength),true)
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
			wf_output('ProReturn:rte_1.StatusBar='+String(rte_1.StatusBar),true)
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
			wf_output('ProReturn:rte_1.TextSize='+String(rte_1.TextSize),true)
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
			wf_output('ProReturn:rte_1.Weight='+String(rte_1.Weight),true)
		else
		end if
	
End Choose
if ab_exe then
	wf_postrun(al_row)
end if
end event

type cb_update from w_templet`cb_update within w_rteprow08
end type

type mle_phenomena from w_templet`mle_phenomena within w_rteprow08
end type

type cb_autoparse from w_templet`cb_autoparse within w_rteprow08
end type

type cb_wrrun from w_templet`cb_wrrun within w_rteprow08
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rteprow08
end type

type dw_info from w_templet`dw_info within w_rteprow08
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rteprow08
end type

type pb_runnext from w_templet`pb_runnext within w_rteprow08
end type

type pb_runall from w_templet`pb_runall within w_rteprow08
end type

type pb_run from w_templet`pb_run within w_rteprow08
end type

type pb_end from w_templet`pb_end within w_rteprow08
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rteprow08
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rteprow08
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rteprow08
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rteprow08
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rteprow08
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rteprow08
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rteprow08
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rteprow08
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rteprow08
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rteprow08
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rteprow08
end type

type rte_1 from richtextedit within w_rteprow08
string accessiblename = "t"
string accessibledescription = "n"
integer x = 9
integer y = 20
integer width = 2949
integer height = 1300
integer taborder = 70
boolean bringtotop = true
integer textsize = -11
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@Dotum"
boolean italic = true
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_wordwrap = true
boolean init_pictureframe = true
boolean init_returnsvisible = true
boolean init_spacesvisible = true
boolean init_tabsvisible = true
long init_inputfieldbackcolor = 67108864
boolean init_inputfieldsvisible = true
boolean init_inputfieldnamesvisible = true
boolean init_rulerbar = true
boolean init_tabbar = true
boolean init_toolbar = true
boolean init_headerfooter = true
boolean init_popmenu = true
integer init_undodepth = 10
long init_leftmargin = 100
long init_topmargin = 100
long init_rightmargin = 100
long init_bottommargin = 500
integer accelerator = 114
borderstyle borderstyle = stylelowered!
end type

type rte_2 from richtextedit within w_rteprow08
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

