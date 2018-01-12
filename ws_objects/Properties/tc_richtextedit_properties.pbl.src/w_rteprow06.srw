$PBExportHeader$w_rteprow06.srw
forward
global type w_rteprow06 from w_templet
end type
type rte_1 from richtextedit within w_rteprow06
end type
end forward

global type w_rteprow06 from w_templet
string title = "Dynamic Set 4"
rte_1 rte_1
end type
global w_rteprow06 w_rteprow06

on w_rteprow06.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rteprow06.destroy
call super::destroy
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 

***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Properties\Dynamic Set 4 
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
if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return 
Choose Case as_testpoint
	Case 'RTEPROW06P01'
	/*
	   【功能描述】
	    动态设置returnsvisible由false变为true

		【编码描述】
		1、初始时returnsvisible为false，拷贝一段含有回车符的字符串到控件中
		2、动态设置returnsvisible为true
		3、输出改属性值

		【代码输出值描述】
		true
		
		
		【期望UI描述】
		回车符可见
	*/
		
		if ab_exe then
			rte_1.ReturnsVisible = true
			wf_OutPut("ProReturn: rte_1.ReturnsVisible=" + String(rte_1.ReturnsVisible),true)
		else
			rte_1.ReturnsVisible = false
			ClipBoard("Series1~tIBM~tzvsr~r~nSeries2~tSybase~ttkjp~r~nSeries3~tMicrosoft~trepg~r~nSeries4~tSun~tgxrp~r~nSeries1~tTCL~tnrvy~r~n ")
			rte_1.SelectTextAll()
			rte_1.Clear()
			rte_1.Paste()
		end if
	Case 'RTEPROW06P02'
	/*
	   【功能描述】
	    动态设置returnsvisible由true变为false

		【编码描述】
		1、初始时returnsvisible为true，拷贝一段含有回车符的字符串到控件中
		2、动态设置returnsvisible为false
		3、输出改属性值

		【代码输出值描述】
		true
		
		
		【期望UI描述】
		回车符变成不可见
	*/
		
		if ab_exe then
			rte_1.ReturnsVisible = false
			wf_OutPut("ProReturn: rte_1.ReturnsVisible=" + String(rte_1.ReturnsVisible),true)
		else
			rte_1.ReturnsVisible = true
			ClipBoard("Series1~tIBM~tzvsr~r~nSeries2~tSybase~ttkjp~r~nSeries3~tMicrosoft~trepg~r~nSeries4~tSun~tgxrp~r~nSeries1~tTCL~tnrvy~r~n ")
			rte_1.SelectTextAll()
			rte_1.Clear()
			rte_1.Paste()
		end if
	Case 'RTEPROW06P03'
	/*
	   【功能描述】
	    动态设置rightmargin小于0

		【编码描述】
		1、动态设置rightmargin小于0
		2、输出改属性值

		【代码输出值描述】
		属性值为所设置的值
		
		【期望UI描述】
		无UI变化
	*/
		
		if ab_exe then
			rte_1.RightMargin = -100
			wf_OutPut("ProReturn: rte_1.RightMargin=" + String(rte_1.RightMargin),true)
		else
			
		end if
	Case 'RTEPROW06P04'
	/*
	   【功能描述】
	    动态设置rightmargin等于0

		【编码描述】
		1、动态设置rightmargin等于0
		2、输出改属性值

		【代码输出值描述】
		0
		
		【期望UI描述】
		无UI变化
	*/
		
		if ab_exe then
			rte_1.RightMargin = 0
			wf_OutPut("ProReturn: rte_1.RightMargin=" + String(rte_1.RightMargin),true)
		else
			
		end if
	Case 'RTEPROW06P05'
	/*
	   【功能描述】
	    动态设置rightmargin等于一正数

		【编码描述】
		1、动态设置rightmargin等于一正数
		2、输出改属性值

		【代码输出值描述】
		属性值为所设置的值
		
		【期望UI描述】
		无UI变化
	*/
		
		if ab_exe then
			rte_1.RightMargin = 100
			wf_OutPut("ProReturn: rte_1.RightMargin=" + String(rte_1.RightMargin),true)
		else
			
		end if
	Case 'RTEPROW06P06'
	/*
	   【功能描述】
	    动态设置rulerbar由false变为true

		【编码描述】
		1、初始时rulerbar为false
		2、动态设置rulerbar为true
		3、输出改属性值

		【代码输出值描述】
		true
		
		【期望UI描述】
		rulerbar显示
	*/
		
		if ab_exe then
			rte_1.RulerBar = true
			wf_OutPut("ProReturn: rte_1.RulerBar=" + String(rte_1.RulerBar),true)
		else
			rte_1.RulerBar = false
		end if
	Case 'RTEPROW06P07'
	/*
	   【功能描述】
	    动态设置rulerbar由true变为false

		【编码描述】
		1、初始时rulerbar为true
		2、动态设置rulerbar为false
		3、输出改属性值

		【代码输出值描述】
		false
		
		【期望UI描述】
		rulerbar不显示
	*/
		
		if ab_exe then
			rte_1.RulerBar = false
			wf_OutPut("ProReturn: rte_1.RulerBar=" + String(rte_1.RulerBar),true)
		else
			rte_1.RulerBar = true
		end if
	Case 'RTEPROW06P08'
	/*
	   【功能描述】
	    区域设置为美国，动态设置rulerbar由false变为true

		【编码描述】
		1、初始时rulerbar为false,区域设置为美国
		2、动态设置rulerbar为true
		3、输出改属性值

		【代码输出值描述】
		true
		
		【期望UI描述】
		标尺单位为inch
	*/
		
		if ab_exe then
			rte_1.RulerBar = true
			wf_OutPut("ProReturn: rte_1.RulerBar=" + String(rte_1.RulerBar),true)
		else
			rte_1.RulerBar = false
		end if
	Case 'RTEPROW06P09'
	/*
	   【功能描述】
	    区域设置为加拿大，动态设置rulerbar由false变为true

		【编码描述】
		1、初始时rulerbar为false,区域设置为加拿大，
		2、动态设置rulerbar为true
		3、输出改属性值

		【代码输出值描述】
		true
		
		【期望UI描述】
		标尺单位为cm
	*/
		
		if ab_exe then
			rte_1.RulerBar = true
			wf_OutPut("ProReturn: rte_1.RulerBar=" + String(rte_1.RulerBar),true)
		else
			rte_1.RulerBar = false
		end if
	Case 'RTEPROW06P10'
	/*
	   【功能描述】
	    动态设置spacesvisible由false变为true

		【编码描述】
		1、初始时spacesvisible为false,拷贝含空格的字符串作为控件的内容
		2、动态设置spacesvisible为true
		3、输出改属性值

		【代码输出值描述】
		true
		
		【期望UI描述】
		空格被显示为点
	*/
		
		if ab_exe then
			rte_1.SpacesVisible = true
			wf_OutPut("ProReturn: rte_1.SpacesVisible=" + String(rte_1.SpacesVisible),true)
		else
			rte_1.SpacesVisible = false
			ClipBoard("I am a student,are you?")
			rte_1.SelectTextAll()
			rte_1.Clear()
			rte_1.Paste()
		end if
	Case 'RTEPROW06P11'
	/*
	   【功能描述】
	    动态设置spacesvisible由true变为false

		【编码描述】
		1、初始时spacesvisible为true,拷贝含空格的字符串作为控件的内容
		2、动态设置spacesvisible为false
		3、输出改属性值

		【代码输出值描述】
		false
		
		【期望UI描述】
		空格显示为空白
	*/
		
		if ab_exe then
			rte_1.SpacesVisible = false
			wf_OutPut("ProReturn: rte_1.SpacesVisible=" + String(rte_1.SpacesVisible),true)
		else
			rte_1.SpacesVisible = true
			ClipBoard("I am a student,are you?")
			rte_1.SelectTextAll()
			rte_1.Clear()
			rte_1.Paste()
		end if
	Case 'RTEPROW06P12'
	/*
	   【功能描述】
	    动态设置tabbar由false变为true

		【编码描述】
		1、初始时tabbar为false
		2、动态设置tabbar为true
		3、输出改属性值

		【代码输出值描述】
		true
		
		【期望UI描述】
		tabbar显示
	*/
		
		if ab_exe then
			rte_1.TabBar = true
			wf_OutPut("ProReturn: rte_1.TabBar=" + String(rte_1.TabBar),true)
		else
			rte_1.TabBar = false
		end if
	Case 'RTEPROW06P13'
	/*
	   【功能描述】
	    动态设置tabbar由true变为false

		【编码描述】
		1、初始时tabbar为true
		2、动态设置tabbar为false
		3、输出改属性值

		【代码输出值描述】
		false
		
		【期望UI描述】
		tabbar变为不显示
	*/
		
		if ab_exe then
			rte_1.TabBar = false
			wf_OutPut("ProReturn: rte_1.TabBar=" + String(rte_1.TabBar),true)
		else
			rte_1.TabBar = true
		end if
	Case 'RTEPROW06P14'
	/*
	   【功能描述】
	    动态设置TabOrder为负数

		【编码描述】
		1、动态设置TabOrder为负数
		2、输出改属性值

		【代码输出值描述】
		属性值为所设置的值
		
		【期望UI描述】
		能被切换到该控件
	*/
		
		if ab_exe then
			rte_1.TabOrder = -20
			wf_OutPut("ProReturn: rte_1.TabOrder=" + String(rte_1.TabOrder),true)
		else
			
		end if
	Case 'RTEPROW06P15'
	/*
	   【功能描述】
	    动态设置TabOrder为0

		【编码描述】
		1、动态设置TabOrder为0
		2、输出改属性值

		【代码输出值描述】
		0
		
		【期望UI描述】
		不能切换到该控件
	*/
		
		if ab_exe then
			rte_1.TabOrder = 0
			wf_OutPut("ProReturn: rte_1.TabOrder=" + String(rte_1.TabOrder),true)
		else
			
		end if
	Case 'RTEPROW06P16'
	/*
	   【功能描述】
	    动态设置TabOrder为正数

		【编码描述】
		1、动态设置TabOrder为正数
		2、输出改属性值

		【代码输出值描述】
		属性值为所设置的值
		
		【期望UI描述】
		焦点能被切换到该控件
	*/
		
		if ab_exe then
			rte_1.TabOrder = 20
			wf_OutPut("ProReturn: rte_1.TabOrder=" + String(rte_1.TabOrder),true)
		else
			
		end if
	Case 'RTEPROW06P17'
	/*
	   【功能描述】
	    动态设置tabsvisible由false变为true

		【编码描述】
		1、初始时tabsvisible为false,拷贝一含Tab符的字符串到控件中
		2、动态设置tabsvisible变为true
		3、输出改属性值

		【代码输出值描述】
		true
		
		【期望UI描述】
		tab符被显示为箭头符
	*/
		
		if ab_exe then
			rte_1.TabsVisible = true
			wf_OutPut("ProReturn: rte_1.TabsVisible=" + String(rte_1.TabsVisible),true)
		else
			rte_1.TabsVisible = false
			ClipBoard("Series1~tphqg~thume~t~tSeries2~tayln~tlfdx")
			rte_1.SelectTextAll()
			rte_1.Clear()
			rte_1.Paste()
		end if
	Case 'RTEPROW06P18'
	/*
	   【功能描述】
	    动态设置tabsvisible由true变为false

		【编码描述】
		1、初始时tabsvisible为true,拷贝一含Tab符的字符串到控件中
		2、动态设置tabsvisible变为false
		3、输出改属性值

		【代码输出值描述】
		false
		
		【期望UI描述】
		tab符显示为一段空白
	*/
		
		if ab_exe then
			rte_1.TabsVisible = false
			wf_OutPut("ProReturn: rte_1.TabsVisible=" + String(rte_1.TabsVisible),true)
		else
			rte_1.TabsVisible = true
			ClipBoard("Series1~tphqg~thume~t~tSeries2~tayln~tlfdx")
			rte_1.SelectTextAll()
			rte_1.Clear()
			rte_1.Paste()
		end if
	Case 'RTEPROW06P19'
	/*
	   【功能描述】
	    动态设置tag为任意字符串

		【编码描述】
		1、动态设置tag为任意字符串
		2、输出改属性值

		【代码输出值描述】
		输出值为所设置的值
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.Tag = 'WuZhiJun'
			wf_OutPut("ProReturn: rte_1.Tag=" + String(rte_1.Tag),true)
		else
			
		end if
	Case 'RTEPROW06P20'
	/*
	   【功能描述】
	    动态设置toolbar由false变为true

		【编码描述】
		1、初始时toolbar为false
		2、动态设置toolbar变为true
		3、输出改属性值

		【代码输出值描述】
		true
		
		【期望UI描述】
		toolbar显示
	*/
		
		if ab_exe then
			rte_1.ToolBar = true
			wf_OutPut("ProReturn: rte_1.ToolBar=" + String(rte_1.ToolBar),true)
		else
			rte_1.ToolBar = false
		end if
	Case 'RTEPROW06P21'
	/*
	   【功能描述】
	    动态设置toolbar由true变为false

		【编码描述】
		1、初始时toolbar为true
		2、动态设置toolbar变为false
		3、输出改属性值

		【代码输出值描述】
		false
		
		【期望UI描述】
		toolbar不显示
	*/
		
		if ab_exe then
			rte_1.ToolBar = false
			wf_OutPut("ProReturn: rte_1.ToolBar=" + String(rte_1.ToolBar),true)
		else
			rte_1.ToolBar = true
		end if
End Choose
if ab_exe then
	wf_postrun(al_row)
end if
end event

type pb_saveexpect from w_templet`pb_saveexpect within w_rteprow06
end type

type pb_runnext from w_templet`pb_runnext within w_rteprow06
end type

type pb_runall from w_templet`pb_runall within w_rteprow06
end type

type pb_run from w_templet`pb_run within w_rteprow06
end type

type pb_end from w_templet`pb_end within w_rteprow06
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rteprow06
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rteprow06
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rteprow06
integer x = 2999
integer y = 1808
integer width = 1595
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rteprow06
integer x = 2999
integer y = 1392
integer width = 1595
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rteprow06
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rteprow06
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rteprow06
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rteprow06
integer x = 2981
integer y = 1324
integer width = 1632
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rteprow06
integer x = 2981
integer y = 1736
integer width = 1632
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rteprow06
integer y = 524
integer height = 796
end type

type rte_1 from richtextedit within w_rteprow06
integer x = 27
integer y = 36
integer width = 2921
integer height = 1284
integer taborder = 70
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
end type

