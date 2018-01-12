$PBExportHeader$w_rteprow04.srw
forward
global type w_rteprow04 from w_templet
end type
type rte_1 from richtextedit within w_rteprow04
end type
end forward

global type w_rteprow04 from w_templet
string title = "Dynamic Set 2"
rte_1 rte_1
end type
global w_rteprow04 w_rteprow04

type variables
String is_path
integer ii_height
end variables

on w_rteprow04.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rteprow04.destroy
call super::destroy
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 

***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Properties\Dynamic Set 2 
Pbl Name:     
Designer:     ouyangwu
Coder:        ouyangwu at 2005-06-21
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
do while true
if len(rte_1.InputFieldLocate(First!))<> 0 THEN
	rte_1.InputFieldDeleteCurrent()
ELSE
	exit
END IF
LOOP
rte_1.height = ii_height
rte_1.Dragauto = false
rte_1.Enabled = true
rte_1.hscrollbar= true
rte_1.inputfieldbackcolor = 16777215
rte_1.headerfooter = false
Choose Case as_testpoint
	Case 'RTEPROW04P01'
	/*
	   【功能描述】
	    动态设置Dragauto由false变true

		【编码描述】
		1、初始时Dragauto为false
		2、动态改变Dragauto为true
		3、输出该属性值
		

		【代码输出值描述】
		true
		
		
		【期望UI描述】
		不能被拖动
	*/
		
		if ab_exe then
			rte_1.Dragauto = true
			wf_output('ProReturn:rte_1.Dragauto = '+String(rte_1.Dragauto),true)
		else
			rte_1.Dragauto = false
		end if
	Case 'RTEPROW04P02'
	/*
	   【功能描述】
	    动态设置Dragauto由true变false

		【编码描述】
		1、初始时Dragauto为true
		2、动态改变Dragauto为false
		3、输出该属性值
		

		【代码输出值描述】
		false
		
		
		【期望UI描述】
		不能被拖动
	*/
		
		if ab_exe then
			rte_1.Dragauto = false
			wf_output('ProReturn:rte_1.Dragauto = '+String(rte_1.Dragauto),true)
		else
			rte_1.Dragauto = true
		end if
	Case 'RTEPROW04P03'
	/*
	   【功能描述】
	    动态设置DragIcon为pb内部图标

		【编码描述】
		1、动态设置Dragauto为true
		2、动态设置DragIcon为pb内部图标
		3、输出该属性值
		

		【代码输出值描述】
		属性值为所设置的DragIcon名
		
		
		【期望UI描述】
	*/
		
		if ab_exe then
			rte_1.DragIcon = "Form!"
			wf_output('ProReturn:rte_1.DragIcon = '+String(rte_1.DragIcon),true)
			rte_1.Drag(begin!)
		else
		end if
	Case 'RTEPROW04P04'
	/*
	   【功能描述】
	    动态设置DragIcon为外部ICO图标

		【编码描述】
		1、动态设置Dragauto为true
		2、动态设置DragIcon为外部ICO图标
		3、输出该属性值
		

		【代码输出值描述】
		属性值为所设置的图标名
		
		
		【期望UI描述】
	*/
		
		if ab_exe then
			rte_1.DragIcon = "PUB_ICO_DRAG.ico"
			wf_output('ProReturn:rte_1.DragIcon = '+String(rte_1.DragIcon),true)
			rte_1.Drag(begin!)
		else
			
		end if
	Case 'RTEPROW04P05'
	/*
	   【功能描述】
	    动态设置Enabled由false变true

		【编码描述】
		1、初始时Enabled为false
		2、动态改变Enabled为true
		3、输出该属性值
		

		【代码输出值描述】
		true
		
		
		【期望UI描述】
		都能够进行操作
	*/
		
		if ab_exe then
			rte_1.Enabled = true
			wf_output('ProReturn:rte_1.Enabled = '+String(rte_1.Enabled),true)
		else
			rte_1.Enabled = false
		end if
	Case 'RTEPROW04P06'
	/*
	   【功能描述】
	    动态设置Enabled由true变false

		【编码描述】
		1、初始时Enabled为true
		2、动态改变Enabled为false
		3、输出该属性值
		

		【代码输出值描述】
		false
		
		
		【期望UI描述】
		都不能够进行操作
	*/
		
		if ab_exe then
			rte_1.Enabled = false
			wf_output('ProReturn:rte_1.Enabled = '+String(rte_1.Enabled),true)
		else
			rte_1.Enabled = true
		end if
	Case 'RTEPROW04P07'
	/*
	   【功能描述】
	    动态设置headerfooter由false变true

		【编码描述】
		1、初始时headerfooter为false
		2、动态改变headerfooter为true
		3、输出该属性值
		

		【代码输出值描述】
		true
		
		
		【期望UI描述】
		无UI效果
	*/
		
		if ab_exe then
			rte_1.headerfooter = true
			wf_output('ProReturn:rte_1.headerfooter = '+String(rte_1.headerfooter),true)
		else
			rte_1.headerfooter = false
		end if
	Case 'RTEPROW04P08'
	/*
	   【功能描述】
	    动态设置headerfooter由true变false

		【编码描述】
		1、初始时headerfooter为true
		2、动态改变headerfooter为false
		3、输出该属性值
		

		【代码输出值描述】
		false
		
		
		【期望UI描述】
		无UI效果
	*/
		
		if ab_exe then
			rte_1.headerfooter = false
			wf_output('ProReturn:rte_1.headerfooter = '+String(rte_1.headerfooter),true)
		else
			rte_1.headerfooter = true
		end if
	Case 'RTEPROW04P09'
	/*
	   【功能描述】
	    动态设置Height为负数

		【编码描述】
		1、动态改变Height为负数
		2、输出该属性值
		

		【代码输出值描述】
		0
		若是动态改变为负数两次，则其值变为所设置的负数值
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.Height = -10
			wf_output('ProReturn:rte_1.Height = '+String(rte_1.Height),true)
		else
		end if
	Case 'RTEPROW04P10'
	/*
	   【功能描述】
	    动态设置Height为0

		【编码描述】
		1、动态改变Height为0
		2、输出该属性值
		

		【代码输出值描述】
		0
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.Height = 0
			wf_output('ProReturn:rte_1.Height = '+String(rte_1.Height),true)
		else
		end if
	Case 'RTEPROW04P11'
	/*
	   【功能描述】
	    动态设置Height为32765

		【编码描述】
		1、动态改变Height为32765
		2、输出该属性值
		

		【代码输出值描述】
		32764
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.Height = 32765
			wf_output('ProReturn:rte_1.Height = '+String(rte_1.Height),true)
		else
		end if
	Case 'RTEPROW04P12'
	/*
	   【功能描述】
	    动态设置Height为32767

		【编码描述】
		1、动态改变Height为32767
		2、输出该属性值
		

		【代码输出值描述】
		-32768
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.Height = 32767
			wf_output('ProReturn:rte_1.Height = '+String(rte_1.Height),true)
		else
		end if
	Case 'RTEPROW04P13'
	/*
	   【功能描述】
	    动态设置hscrollbar由false变true

		【编码描述】
		1、初始时hscrollbar为false，Rulerbar为true
		2、动态改变headerfooter为true
		3、输出该属性值
		

		【代码输出值描述】
		true
		
		
		【期望UI描述】
		多了个水平滚动条
	*/
		
		if ab_exe then
			rte_1.Rulerbar =true
			rte_1.hscrollbar = true
			wf_output('ProReturn:rte_1.hscrollbar = '+String(rte_1.hscrollbar),true)
		else
			rte_1.hscrollbar = false
		end if
	Case 'RTEPROW04P14'
	/*
	   【功能描述】
	    动态设置hscrollbar由true变false

		【编码描述】
		1、初始时hscrollbar为true，Rulerbar为true
		2、动态改变headerfooter为false
		3、输出该属性值
		

		【代码输出值描述】
		false
		
		【期望UI描述】
		水平滚动条消失
	*/
		
		if ab_exe then
			rte_1.Rulerbar =true
			rte_1.hscrollbar = false
			wf_output('ProReturn:rte_1.hscrollbar = '+String(rte_1.hscrollbar),true)
		else
			rte_1.hscrollbar = true
		end if
	Case 'RTEPROW04P15'
	/*
	   【功能描述】
	    动态设置inputfieldbackcolor为有效值，但没有inputfield存在

		【编码描述】
		1、初始时没有inputfield存在
		2、动态改变inputfieldbackcolor为有效值
		3、输出该属性值
		

		【代码输出值描述】
		所设置的值
		
		【期望UI描述】
		无UI效果
	*/
		
		if ab_exe then
			rte_1.inputfieldbackcolor = 56665
			wf_output('ProReturn:rte_1.inputfieldbackcolor = '+String(rte_1.inputfieldbackcolor),true)
		else
		end if
	Case 'RTEPROW04P16'
	/*
	   【功能描述】
	    动态设置inputfieldbackcolor为有效值，有inputfield存在

		【编码描述】
		1、初始时调用InputFieldInsert函数增加inputfield。
		2、动态改变inputfieldbackcolor为有效值
		3、输出该属性值
		

		【代码输出值描述】
		所设置的值
		
		【期望UI描述】
		inputfield背景色变为所设置的颜色
	*/
		
		if ab_exe then
			rte_1.InputFieldInsert("FirstName")
			rte_1.InputFieldInsert("LastName")
			rte_1.inputfieldbackcolor = 56665
			wf_output('ProReturn:rte_1.inputfieldbackcolor = '+String(rte_1.inputfieldbackcolor),true)
		else
		end if
	Case 'RTEPROW04P17'
	/*
	   【功能描述】
	    动态设置inputfieldbackcolor为-3，有inputfield存在

		【编码描述】
		1、初始时调用InputFieldInsert函数增加inputfield。
		2、动态改变inputfieldbackcolor为-3
		3、输出该属性值
		

		【代码输出值描述】
		0
		
		【期望UI描述】
		inputfield背景色变为黑色
	*/
		
		if ab_exe then
			rte_1.InputFieldInsert("FirstName")
			rte_1.InputFieldInsert("LastName")
			rte_1.inputfieldbackcolor = -3
			wf_output('ProReturn:rte_1.inputfieldbackcolor = '+String(rte_1.inputfieldbackcolor),true)
		else
		end if
	Case 'RTEPROW04P18'
	/*
	   【功能描述】
	    动态设置inputfieldbackcolor为-2，有inputfield存在

		【编码描述】
		1、初始时调用InputFieldInsert函数增加inputfield。
		2、动态改变inputfieldbackcolor为-2
		3、输出该属性值
		

		【代码输出值描述】
		0
		
		【期望UI描述】
		inputfield背景色变为黑色
	*/
		
		if ab_exe then
			rte_1.InputFieldInsert("FirstName")
			rte_1.InputFieldInsert("LastName")
			rte_1.inputfieldbackcolor = -2
			wf_output('ProReturn:rte_1.inputfieldbackcolor = '+String(rte_1.inputfieldbackcolor),true)
		else
		end if
	Case 'RTEPROW04P19'
	/*
	   【功能描述】
	    动态设置inputfieldbackcolor为0，有inputfield存在

		【编码描述】
		1、初始时调用InputFieldInsert函数增加inputfield。
		2、动态改变inputfieldbackcolor为0
		3、输出该属性值
		

		【代码输出值描述】
		0
		
		【期望UI描述】
		inputfield背景色变为黑色
	*/
		
		if ab_exe then
			rte_1.InputFieldInsert("FirstName")
			rte_1.InputFieldInsert("LastName")
			rte_1.inputfieldbackcolor = 0
			wf_output('ProReturn:rte_1.inputfieldbackcolor = '+String(rte_1.inputfieldbackcolor),true)
		else
		end if
	Case 'RTEPROW04P20'
	/*
	   【功能描述】
	    动态设置inputfieldbackcolor为16777215，有inputfield存在

		【编码描述】
		1、初始时调用InputFieldInsert函数增加inputfield。
		2、动态改变inputfieldbackcolor为16777215
		3、输出该属性值
		

		【代码输出值描述】
		16777215
		
		【期望UI描述】
		inputfield背景色变为白色
	*/
		
		if ab_exe then
			rte_1.InputFieldInsert("FirstName")
			rte_1.InputFieldInsert("LastName")
			rte_1.inputfieldbackcolor = 16777215
			wf_output('ProReturn:rte_1.inputfieldbackcolor = '+String(rte_1.inputfieldbackcolor),true)
		else
		end if
	Case 'RTEPROW04P21'
	/*
	   【功能描述】
	    动态设置inputfieldbackcolor为16777216，有inputfield存在

		【编码描述】
		1、初始时调用InputFieldInsert函数增加inputfield。
		2、动态改变inputfieldbackcolor为16777216
		3、输出该属性值
		

		【代码输出值描述】
		0
		
		【期望UI描述】
		inputfield背景色变为黑色
	*/
		
		if ab_exe then
			rte_1.InputFieldInsert("FirstName")
			rte_1.InputFieldInsert("LastName")
			rte_1.inputfieldbackcolor = 16777216
			wf_output('ProReturn:rte_1.inputfieldbackcolor = '+String(rte_1.inputfieldbackcolor),true)
		else
		end if
End Choose
if ab_exe then
	wf_postrun(al_row)
end if
end event

event open;call super::open;is_path = ''
n_cst_config  lnv_res


if not lnv_res.of_createfile("PUB_ICO_DRAG.ico",gtr_frame) then
	messagebox("Question","Download File Failed!")
end if

end event

event close;call super::close;if FileExists("PUB_ICO_DRAG.ico") then
	FileDelete("PUB_ICO_DRAG.ico")
end if
end event

type mle_phenomena from w_templet`mle_phenomena within w_rteprow04
end type

type cb_autoparse from w_templet`cb_autoparse within w_rteprow04
end type

type cb_wrrun from w_templet`cb_wrrun within w_rteprow04
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rteprow04
end type

type dw_info from w_templet`dw_info within w_rteprow04
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rteprow04
end type

type pb_runnext from w_templet`pb_runnext within w_rteprow04
end type

type pb_runall from w_templet`pb_runall within w_rteprow04
end type

type pb_run from w_templet`pb_run within w_rteprow04
end type

type pb_end from w_templet`pb_end within w_rteprow04
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rteprow04
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rteprow04
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rteprow04
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rteprow04
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rteprow04
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rteprow04
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rteprow04
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rteprow04
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rteprow04
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rteprow04
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rteprow04
end type

type rte_1 from richtextedit within w_rteprow04
integer x = 14
integer y = 16
integer width = 2839
integer height = 1296
integer taborder = 10
boolean bringtotop = true
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_rulerbar = true
boolean init_tabbar = true
boolean init_toolbar = true
boolean init_popmenu = true
borderstyle borderstyle = stylelowered!
end type

event constructor;ClipBoard("这是正阳软件（深圳）有限公司 RichTextEdit测试控件")
THIS.Paste( )
ii_height = THIS.height
end event

