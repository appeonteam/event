$PBExportHeader$w_rteprow07.srw
forward
global type w_rteprow07 from w_templet
end type
type rte_1 from richtextedit within w_rteprow07
end type
end forward

global type w_rteprow07 from w_templet
string title = "Dynamic Set 5"
rte_1 rte_1
end type
global w_rteprow07 w_rteprow07

on w_rteprow07.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rteprow07.destroy
call super::destroy
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 

***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Properties\Dynamic Set 5 
Pbl Name:     
Designer:     ouyangwu
Coder:        WuZhiJun(2005-06-23)
DocReviewer:  
CoderReviewer:
【功能描述】
测试动态设置属性以及属性的功能表现
【窗口对象】

【编码注意事项】
1、默认情况请将RulerBar、TabBar、ToolBar设置为Ture
2、默认拷贝一段文字作为该控件中的内容

【测试注意事项】
 
***********************/

if Not ab_exe then
	rte_1.RulerBar = true
	rte_1.TabBar = true
	rte_1.ToolBar = true
	rte_1.SelectTextAll()
	rte_1.Clear()
	ClipBoard("About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents")
	rte_1.Paste()
end if

if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return 
Choose Case as_testpoint
	Case 'RTEPROW07P01'
	/*
	   【功能描述】
	    动态设置topmargin为负数

		【编码描述】
		1、动态设置topmargin为负数
		2、输出属性值
		

		【代码输出值描述】
		输出值为所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.TopMargin = -100
			wf_OutPut("ProReturn: rte_1.TopMargin=" + String(rte_1.TopMargin),true)
		else
			
		end if
	Case 'RTEPROW07P02'
	/*
	   【功能描述】
	    动态设置topmargin为0

		【编码描述】
		1、动态设置topmargin为0
		2、输出属性值
		

		【代码输出值描述】
		0
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.TopMargin = 0
			wf_OutPut("ProReturn: rte_1.TopMargin=" + String(rte_1.TopMargin),true)
		else
			
		end if
	Case 'RTEPROW07P03'
	/*
	   【功能描述】
	    动态设置topmargin为正数

		【编码描述】
		1、动态设置topmargin为正数
		2、输出属性值
		

		【代码输出值描述】
		输出值为所设置的值
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.TopMargin = 100
			wf_OutPut("ProReturn: rte_1.TopMargin=" + String(rte_1.TopMargin),true)
		else
			
		end if
	Case 'RTEPROW07P04'
	/*
	   【功能描述】
	    动态设置undodepth为负数

		【编码描述】
		1、动态设置undodepth为负数
		2、输出属性值
		

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.UndoDepth = -20
			wf_OutPut("ProReturn: rte_1.UndoDepth=" + String(rte_1.UndoDepth),true)
		else
			
		end if
	Case 'RTEPROW07P05'
	/*
	   【功能描述】
	    动态设置undodepth为0

		【编码描述】
		1、动态设置undodepth为0
		2、输出属性值
		

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.UndoDepth = 0
			wf_OutPut("ProReturn: rte_1.UndoDepth=" + String(rte_1.UndoDepth),true)
		else
			
		end if
	Case 'RTEPROW07P06'
	/*
	   【功能描述】
	    动态设置undodepth为32767

		【编码描述】
		1、动态设置undodepth为32767
		2、输出属性值
		

		【代码输出值描述】
		32767
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.UndoDepth = 32767
			wf_OutPut("ProReturn: rte_1.UndoDepth=" + String(rte_1.UndoDepth),true)
		else
			
		end if
	Case 'RTEPROW07P07'
	/*
	   【功能描述】
	    动态设置undodepth为32768

		【编码描述】
		1、动态设置undodepth为32768
		2、输出属性值
		

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.UndoDepth = 32768
			wf_OutPut("ProReturn: rte_1.UndoDepth=" + String(rte_1.UndoDepth),true)
		else
			
		end if
	Case 'RTEPROW07P08'
	/*
	   【功能描述】
	    动态设置visible由false变为true

		【编码描述】
		1、初始时visible为false
		2、动态设置visible为true
		3、输出属性值
		

		【代码输出值描述】
		true
		
		【期望UI描述】
		控件可见
	*/
		
		if ab_exe then
			rte_1.Visible = true
			wf_OutPut("ProReturn: rte_1.Visible=" + String(rte_1.Visible),true)
		else
			rte_1.Visible = false
		end if
	Case 'RTEPROW07P09'
	/*
	   【功能描述】
	    动态设置visible由true变为false

		【编码描述】
		1、初始时visible为true
		2、动态设置visible为false
		3、输出属性值
		

		【代码输出值描述】
		false
		
		【期望UI描述】
		控件不可见
	*/
		
		if ab_exe then
			rte_1.Visible = false
			wf_OutPut("ProReturn: rte_1.Visible=" + String(rte_1.Visible),true)
		else
			rte_1.Visible = true
		end if
	Case 'RTEPROW07P10'
	/*
	   【功能描述】
	    动态设置vscrollbar由false变为true

		【编码描述】
		1、初始时vscrollbar为false
		2、动态设置visible为true
		3、输出属性值
		

		【代码输出值描述】
		true
		
		【期望UI描述】
		垂直滚动条可见
	*/
		
		if ab_exe then
			rte_1.VScrollBar = true
			wf_OutPut("ProReturn: rte_1.VScrollBar=" + String(rte_1.VScrollBar),true)
		else
			rte_1.VScrollBar = false
		end if
	Case 'RTEPROW07P11'
	/*
	   【功能描述】
	    动态设置vscrollbar由true变为false

		【编码描述】
		1、初始时vscrollbar为true
		2、动态设置visible为false
		3、输出属性值
		

		【代码输出值描述】
		false
		
		【期望UI描述】
		垂直滚动条不可见
	*/
		
		if ab_exe then
			rte_1.VScrollBar = false
			wf_OutPut("ProReturn: rte_1.VScrollBar=" + String(rte_1.VScrollBar),true)
		else
			rte_1.VScrollBar = true
		end if
	Case 'RTEPROW07P12'
	/*
	   【功能描述】
	    动态设置Width为负数

		【编码描述】
		1、动态设置Width为负数
		2、输出属性值
		

		【代码输出值描述】
		0
		
		【期望UI描述】
		PB下重复设置两次为负数的话，则属性值变为负数
	*/
		
		if ab_exe then
			rte_1.Width = -2800
			wf_OutPut("ProReturn: rte_1.Width=" + String(rte_1.Width),true)
		else
			
		end if
	Case 'RTEPROW07P13'
	/*
	   【功能描述】
	    动态设置Width为0

		【编码描述】
		1、动态设置Width为0
		2、输出属性值
		

		【代码输出值描述】
		属性值为所设置的值
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.Width = 0
			wf_OutPut("ProReturn: rte_1.Width=" + String(rte_1.Width),true)
		else
			
		end if
	Case 'RTEPROW07P14'
	/*
	   【功能描述】
	    动态设置Width为1000

		【编码描述】
		1、动态设置Width为1000
		2、输出属性值
		

		【代码输出值描述】
		1001
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.Width = 1000
			wf_OutPut("ProReturn: rte_1.Width=" + String(rte_1.Width),true)
		else
			
		end if
	Case 'RTEPROW07P15'
	/*
	   【功能描述】
	    动态设置Width为32767

		【编码描述】
		1、动态设置Width为32767
		2、输出属性值
		

		【代码输出值描述】
		-32768
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.Width = 32767
			wf_OutPut("ProReturn: rte_1.Width=" + String(rte_1.Width),true)
		else
			
		end if
	Case 'RTEPROW07P16'
	/*
	   【功能描述】
	    HScrollBar为False时动态设置wordwrap由false变为true

		【编码描述】
		1、初始时wordwra为false，HScrollBar为False,拷贝一段较长的不含回车符字符串到控件中，超过控件右边界
		2、动态设置wordwra为true
		3、输出属性值
		

		【代码输出值描述】
		true
		
		【期望UI描述】
		输入的数据达到右边界时会自动回绕到下一行
		而之前拷贝的数据超过边界也不回绕
	*/
		
		if ab_exe then
			rte_1.WordWrap = true
			wf_OutPut("ProReturn: rte_1.WordWrap=" + String(rte_1.WordWrap),true)
		else
			rte_1.WordWrap = false
			rte_1.HScrollBar = false
			rte_1.SelectTextAll()
			rte_1.Clear()
			ClipBoard("About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents")
			rte_1.Paste()
		end if
	Case 'RTEPROW07P17'
	/*
	   【功能描述】
	    HScrollBar为true时动态设置wordwrap由false变为true

		【编码描述】
		1、初始时wordwra为false，HScrollBar为true,拷贝一段较长的不含回车符字符串到控件中，超过控件右边界
		2、动态设置wordwra为true
		3、输出属性值
		

		【代码输出值描述】
		true
		
		【期望UI描述】
		输入的数据达到右边界时会自动回绕到下一行
		而之前拷贝的数据超过边界也不回绕
	*/
		
		if ab_exe then
			rte_1.WordWrap = true
			wf_OutPut("ProReturn: rte_1.WordWrap=" + String(rte_1.WordWrap),true)
		else
			rte_1.WordWrap = false
			rte_1.HScrollBar = true
			rte_1.SelectTextAll()
			rte_1.Clear()
			ClipBoard("About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents")
			rte_1.Paste()
		end if
	Case 'RTEPROW07P18'
	/*
	   【功能描述】
	    wordwrap为true时动态设置width

		【编码描述】
		1、初始时wordwra为true，HScrollBar为false,拷贝一段较长的不含回车符字符串到控件中，超过控件右边界
		2、动态改变width为500
		3、输出属性值
		

		【代码输出值描述】
		true
		
		【期望UI描述】
		根据宽度自动回绕
	*/
		
		if ab_exe then
			rte_1.Width = 500
			wf_OutPut("ProReturn: rte_1.WordWrap=" + String(rte_1.WordWrap),true)
		else
			rte_1.WordWrap = true
			rte_1.HScrollBar = false
			rte_1.SelectTextAll()
			rte_1.Clear()
			ClipBoard("About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents")
			rte_1.Paste()
		end if
	Case 'RTEPROW07P19'
	/*
	   【功能描述】
	    wordwrap为true时resize控件宽度

		【编码描述】
		1、初始时wordwra为true，border为true,HScrollBar为false,拷贝一段较长的不含回车符字符串到控件中，超过控件右边界
		2、动态改变resizable为true
		3、输出属性值
		

		【代码输出值描述】
		true
		
		【期望UI描述】
		根据宽度自动回绕
	*/
		
		if ab_exe then
			rte_1.Resizable = true
			wf_OutPut("ProReturn: rte_1.WordWrap=" + String(rte_1.WordWrap),true)
		else
			rte_1.WordWrap = true
			rte_1.Border = true
			rte_1.HScrollBar = false
			rte_1.SelectTextAll()
			rte_1.Clear()
			ClipBoard("About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents")
			rte_1.Paste()
		end if
	Case 'RTEPROW07P20'
	/*
	   【功能描述】
	    动态设置wordwrap由true变为false

		【编码描述】
		1、初始时wordwra为true，拷贝一段较长的不含回车符字符串到控件中
		2、动态设置wordwra为false
		3、输出属性值
		

		【代码输出值描述】
		false
		
		【期望UI描述】
		输入的数据达到右边界时 不会 自动回绕到下一行
		
		而之前拷贝的数据超过边界已经回绕换行的保持不变
	*/
		
		if ab_exe then
			rte_1.WordWrap = false
			wf_OutPut("ProReturn: rte_1.WordWrap=" + String(rte_1.WordWrap),true)
		else
			rte_1.WordWrap = true
			rte_1.SelectTextAll()
			rte_1.Clear()
			ClipBoard("About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents")
			rte_1.Paste()
		end if
	Case 'RTEPROW07P21'
	/*
	   【功能描述】
	    动态设置x为-100

		【编码描述】
		1、动态设置x为-100
		2、输出属性值
		

		【代码输出值描述】
		-101
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.x = -100
			wf_OutPut("ProReturn: rte_1.x=" + String(rte_1.x),true)
		else
			
		end if
	Case 'RTEPROW07P22'
	/*
	   【功能描述】
	    动态设置x为0

		【编码描述】
		1、动态设置x为0
		2、输出属性值
		

		【代码输出值描述】
		0
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.x = 0
			wf_OutPut("ProReturn: rte_1.x=" + String(rte_1.x),true)
		else
			
		end if
	Case 'RTEPROW07P23'
	/*
	   【功能描述】
	    动态设置x为32767

		【编码描述】
		1、动态设置x为32767
		2、输出属性值
		

		【代码输出值描述】
		-32768
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.x = 32767
			wf_OutPut("ProReturn: rte_1.x=" + String(rte_1.x),true)
		else
			
		end if
	Case 'RTEPROW07P24'
	/*
	   【功能描述】
	    动态设置Y为-100

		【编码描述】
		1、动态设置Y为-100
		2、输出属性值
		

		【代码输出值描述】
		-101
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.y = -100
			wf_OutPut("ProReturn: rte_1.y=" + String(rte_1.y),true)
		else
			
		end if
	Case 'RTEPROW07P25'
	/*
	   【功能描述】
	    动态设置Y为0

		【编码描述】
		1、动态设置Y为0
		2、输出属性值
		

		【代码输出值描述】
		0
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.y = 0
			wf_OutPut("ProReturn: rte_1.y=" + String(rte_1.y),true)
		else
			
		end if
	Case 'RTEPROW07P26'
	/*
	   【功能描述】
	    动态设置Y为32767

		【编码描述】
		1、动态设置Y为32767
		2、输出属性值
		

		【代码输出值描述】
		-32768
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.y = 32767
			wf_OutPut("ProReturn: rte_1.y=" + String(rte_1.y),true)
		else
			
		end if
End Choose
if ab_exe then
	wf_postrun(al_row)
end if
end event

type pb_saveexpect from w_templet`pb_saveexpect within w_rteprow07
end type

type pb_runnext from w_templet`pb_runnext within w_rteprow07
end type

type pb_runall from w_templet`pb_runall within w_rteprow07
end type

type pb_run from w_templet`pb_run within w_rteprow07
end type

type pb_end from w_templet`pb_end within w_rteprow07
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rteprow07
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rteprow07
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rteprow07
integer x = 2999
integer y = 1808
integer width = 1595
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rteprow07
integer x = 2999
integer y = 1392
integer width = 1595
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rteprow07
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rteprow07
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rteprow07
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rteprow07
integer x = 2981
integer y = 1324
integer width = 1632
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rteprow07
integer x = 2981
integer y = 1736
integer width = 1632
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rteprow07
integer y = 524
integer height = 796
end type

type rte_1 from richtextedit within w_rteprow07
integer x = 27
integer y = 32
integer width = 2921
integer height = 1288
integer taborder = 70
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
end type

