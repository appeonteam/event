$PBExportHeader$w_rteprow01.srw
forward
global type w_rteprow01 from w_templet
end type
type rte_1 from richtextedit within w_rteprow01
end type
end forward

global type w_rteprow01 from w_templet
string title = "StaticValue 1"
rte_1 rte_1
end type
global w_rteprow01 w_rteprow01

forward prototypes
public function string wf_getborderstyle (borderstyle abs_borderstyle)
end prototypes

public function string wf_getborderstyle (borderstyle abs_borderstyle);CHOOSE CASE abs_borderstyle
	CASE StyleBox!
		Return "StyleBox!"
	CASE StyleLowered!
		Return "StyleLowered!"
	CASE StyleRaised!
		Return "StyleRaised!"
	CASE StyleShadowBox!
		Return "StyleShadowBox!"
END CHOOSE
end function

on w_rteprow01.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rteprow01.destroy
call super::destroy
destroy(this.rte_1)
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
【功能描述】
测试RichTextEdit属性的静态值
【窗口对象】

【编码注意事项】

【测试注意事项】
 
***********************/
if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return 
Choose Case as_testpoint
	Case 'RTEPROW01P01'
	/*
	   【功能描述】
	    Accelerator

		【编码描述】
		1、在PB画板中设置Accelerator属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.Accelerator='+String(rte_1.Accelerator),true)
		else
		end if
	Case 'RTEPROW01P02'
	/*
	   【功能描述】
	    Backcolor

		【编码描述】
		1、在PB画板中设置Backcolor属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.Backcolor='+String(rte_1.Backcolor),true)
		else
		end if
	Case 'RTEPROW01P03'
	/*
	   【功能描述】
	    Border

		【编码描述】
		1、在PB画板中设置Border属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.Border='+String(rte_1.Border),true)
		else
		end if
	Case 'RTEPROW01P04'
	/*
	   【功能描述】
	    Borderstyle

		【编码描述】
		1、在PB画板中设置Borderstyle属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.Borderstyle='+wf_getborderstyle(rte_1.Borderstyle),true)
		else
		end if
	Case 'RTEPROW01P05'
	/*
	   【功能描述】
	    Bottommargin

		【编码描述】
		1、在PB画板中设置Bottommargin属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.Bottommargin='+String(rte_1.Bottommargin),true)
		else
		end if
	Case 'RTEPROW01P06'
	/*
	   【功能描述】
	    Bringtotop

		【编码描述】
		1、在PB画板中设置Bringtotop属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.Bringtotop='+String(rte_1.Bringtotop),true)
		else
		end if
	Case 'RTEPROW01P07'
	/*
	   【功能描述】
	    DisplayOnly

		【编码描述】
		1、在PB画板中设置DisplayOnly属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.DisplayOnly='+String(rte_1.DisplayOnly),true)
		else
		end if
	Case 'RTEPROW01P08'
	/*
	   【功能描述】
	    DocumentName

		【编码描述】
		1、在PB画板中设置DocumentName属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.DocumentName='+String(rte_1.DocumentName),true)
		else
		end if
	Case 'RTEPROW01P09'
	/*
	   【功能描述】
	    DragAuto

		【编码描述】
		1、在PB画板中设置DragAuto属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.DragAuto='+String(rte_1.DragAuto),true)
		else
		end if
	Case 'RTEPROW01P10'
	/*
	   【功能描述】
	    DragIcon

		【编码描述】
		1、在PB画板中设置DragIcon属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.DragIcon='+String(rte_1.DragIcon),true)
		else
		end if
	Case 'RTEPROW01P11'
	/*
	   【功能描述】
	    Enabled

		【编码描述】
		1、在PB画板中设置Enabled属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.Enabled='+String(rte_1.Enabled),true)
		else
		end if
	Case 'RTEPROW01P12'
	/*
	   【功能描述】
	    HeaderFooter

		【编码描述】
		1、在PB画板中设置HeaderFooter属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.HeaderFooter='+String(rte_1.HeaderFooter),true)
		else
		end if
	Case 'RTEPROW01P13'
	/*
	   【功能描述】
	    Height

		【编码描述】
		1、在PB画板中设置Height属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.Height='+String(rte_1.Height),true)
		else
		end if
	Case 'RTEPROW01P14'
	/*
	   【功能描述】
	    HscrollBar

		【编码描述】
		1、在PB画板中设置HscrollBar属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.HscrollBar='+String(rte_1.HscrollBar),true)
		else
		end if
	Case 'RTEPROW01P15'
	/*
	   【功能描述】
	    InputFieldBackColor

		【编码描述】
		1、在PB画板中设置InputFieldBackColor属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.InputFieldBackColor='+String(rte_1.InputFieldBackColor),true)
		else
		end if
	Case 'RTEPROW01P16'
	/*
	   【功能描述】
	    InputFieldNamesVisible

		【编码描述】
		1、在PB画板中设置InputFieldNamesVisible属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.InputFieldNamesVisible='+String(rte_1.InputFieldNamesVisible),true)
		else
		end if
	Case 'RTEPROW01P17'
	/*
	   【功能描述】
	    InputFieldsVisible

		【编码描述】
		1、在PB画板中设置InputFieldsVisible属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.InputFieldsVisible='+String(rte_1.InputFieldsVisible),true)
		else
		end if
	Case 'RTEPROW01P18'
	/*
	   【功能描述】
	    leftmargin

		【编码描述】
		1、在PB画板中设置leftmargin属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.leftmargin='+String(rte_1.leftmargin),true)
		else
		end if
	Case 'RTEPROW01P19'
	/*
	   【功能描述】
	    modified

		【编码描述】
		1、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.modified='+String(rte_1.modified),true)
		else
		end if
End Choose
if ab_exe then
	wf_postrun(al_row)
end if
end event

type mle_phenomena from w_templet`mle_phenomena within w_rteprow01
end type

type dw_info from w_templet`dw_info within w_rteprow01
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rteprow01
end type

type pb_runnext from w_templet`pb_runnext within w_rteprow01
end type

type pb_runall from w_templet`pb_runall within w_rteprow01
end type

type pb_run from w_templet`pb_run within w_rteprow01
end type

type pb_end from w_templet`pb_end within w_rteprow01
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rteprow01
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rteprow01
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rteprow01
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rteprow01
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rteprow01
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rteprow01
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rteprow01
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rteprow01
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rteprow01
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rteprow01
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rteprow01
end type

type rte_1 from richtextedit within w_rteprow01
integer x = 9
integer y = 20
integer width = 2949
integer height = 1300
integer taborder = 70
boolean bringtotop = true
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

