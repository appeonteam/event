$PBExportHeader$w_rteprow02.srw
forward
global type w_rteprow02 from w_templet
end type
type rte_1 from richtextedit within w_rteprow02
end type
end forward

global type w_rteprow02 from w_templet
string title = "StaticValue 2"
rte_1 rte_1
end type
global w_rteprow02 w_rteprow02

on w_rteprow02.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rteprow02.destroy
call super::destroy
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 

***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Properties\StaticValue 2 
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
	Case 'RTEPROW02P01'
	/*
	   【功能描述】
	    picturesasframe

		【编码描述】
		1、在PB画板中设置picturesasframe属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.picturesasframe='+String(rte_1.picturesasframe),true)
		else
		end if
	Case 'RTEPROW02P02'
	/*
	   【功能描述】
	    pointer

		【编码描述】
		1、在PB画板中设置pointer属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.pointer='+String(rte_1.pointer),true)
		else
		end if
	Case 'RTEPROW02P03'
	/*
	   【功能描述】
	    popmenu

		【编码描述】
		1、在PB画板中设置popmenu属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.popmenu='+String(rte_1.popmenu),true)
		else
		end if
	Case 'RTEPROW02P04'
	/*
	   【功能描述】
	    resizable

		【编码描述】
		1、在PB画板中设置resizable属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.resizable='+String(rte_1.resizable),true)
		else
		end if
	Case 'RTEPROW02P05'
	/*
	   【功能描述】
	    returnsvisible

		【编码描述】
		1、在PB画板中设置returnsvisible属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.returnsvisible='+String(rte_1.returnsvisible),true)
		else
		end if
	Case 'RTEPROW02P06'
	/*
	   【功能描述】
	    rightmargin

		【编码描述】
		1、在PB画板中设置rightmargin属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.rightmargin='+String(rte_1.rightmargin),true)
		else
		end if
	Case 'RTEPROW02P07'
	/*
	   【功能描述】
	    RulerBar

		【编码描述】
		1、在PB画板中设置RulerBar属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.RulerBar='+String(rte_1.RulerBar),true)
		else
		end if
	Case 'RTEPROW02P08'
	/*
	   【功能描述】
	    SpacesVisible

		【编码描述】
		1、在PB画板中设置SpacesVisible属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.SpacesVisible='+String(rte_1.SpacesVisible),true)
		else
		end if
	Case 'RTEPROW02P09'
	/*
	   【功能描述】
	    TabBar

		【编码描述】
		1、在PB画板中设置TabBar属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.TabBar='+String(rte_1.TabBar),true)
		else
		end if
	Case 'RTEPROW02P10'
	/*
	   【功能描述】
	    TabOrder

		【编码描述】
		1、在PB画板中设置TabOrder属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.TabOrder='+String(rte_1.TabOrder),true)
		else
		end if
	Case 'RTEPROW02P11'
	/*
	   【功能描述】
	    TabsVisible

		【编码描述】
		1、在PB画板中设置TabsVisible属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.TabsVisible='+String(rte_1.TabsVisible),true)
		else
		end if
	Case 'RTEPROW02P12'
	/*
	   【功能描述】
	    Tag

		【编码描述】
		1、在PB画板中设置Tag属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.Tag='+String(rte_1.Tag),true)
		else
		end if
	Case 'RTEPROW02P13'
	/*
	   【功能描述】
	    ToolBar

		【编码描述】
		1、在PB画板中设置ToolBar属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.ToolBar='+String(rte_1.ToolBar),true)
		else
		end if
	Case 'RTEPROW02P14'
	/*
	   【功能描述】
	    TopMargin

		【编码描述】
		1、在PB画板中设置TopMargin属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.TopMargin='+String(rte_1.TopMargin),true)
		else
		end if
	Case 'RTEPROW02P15'
	/*
	   【功能描述】
	    UndoDepth

		【编码描述】
		1、在PB画板中设置UndoDepth属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.UndoDepth='+String(rte_1.UndoDepth),true)
		else
		end if
	Case 'RTEPROW02P16'
	/*
	   【功能描述】
	    Visible

		【编码描述】
		1、在PB画板中设置Visible属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.Visible='+String(rte_1.Visible),true)
		else
		end if
	Case 'RTEPROW02P17'
	/*
	   【功能描述】
	    VscrollBar

		【编码描述】
		1、在PB画板中设置VscrollBar属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.VscrollBar='+String(rte_1.VscrollBar),true)
		else
		end if
	Case 'RTEPROW02P18'
	/*
	   【功能描述】
	    Width

		【编码描述】
		1、在PB画板中设置Width属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.Width='+String(rte_1.Width),true)
		else
		end if
	Case 'RTEPROW02P19'
	/*
	   【功能描述】
	    WordWrap

		【编码描述】
		1、在PB画板中设置WordWrap属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.WordWrap='+String(rte_1.WordWrap),true)
		else
		end if
	Case 'RTEPROW02P20'
	/*
	   【功能描述】
	    X

		【编码描述】
		1、在PB画板中设置X属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.X='+String(rte_1.X),true)
		else
		end if
	Case 'RTEPROW02P21'
	/*
	   【功能描述】
	    Y

		【编码描述】
		1、在PB画板中设置Y属性
		2、测试点代码输出该属性值

		【代码输出值描述】
		输出的值为画板中所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output('ProReturn:rte_1.Y='+String(rte_1.Y),true)
		else
		end if
End Choose
if ab_exe then
	wf_postrun(al_row)
end if
end event

type pb_saveexpect from w_templet`pb_saveexpect within w_rteprow02
end type

type pb_runnext from w_templet`pb_runnext within w_rteprow02
end type

type pb_runall from w_templet`pb_runall within w_rteprow02
end type

type pb_run from w_templet`pb_run within w_rteprow02
end type

type pb_end from w_templet`pb_end within w_rteprow02
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rteprow02
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rteprow02
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rteprow02
integer x = 2999
integer y = 1808
integer width = 1595
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rteprow02
integer x = 2999
integer y = 1392
integer width = 1595
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rteprow02
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rteprow02
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rteprow02
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rteprow02
integer x = 2981
integer y = 1324
integer width = 1632
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rteprow02
integer x = 2981
integer y = 1736
integer width = 1632
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rteprow02
integer y = 524
integer height = 796
end type

type rte_1 from richtextedit within w_rteprow02
integer x = 9
integer y = 20
integer width = 2949
integer height = 1300
integer taborder = 10
boolean bringtotop = true
string init_pointer = "HyperLink!"
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
boolean resizable = true
end type

