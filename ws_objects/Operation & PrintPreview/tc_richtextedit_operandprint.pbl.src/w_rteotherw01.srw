$PBExportHeader$w_rteotherw01.srw
forward
global type w_rteotherw01 from w_templet
end type
type rte_1 from richtextedit within w_rteotherw01
end type
type cb_1 from commandbutton within w_rteotherw01
end type
end forward

global type w_rteotherw01 from w_templet
string title = "01-UI Operation"
rte_1 rte_1
cb_1 cb_1
end type
global w_rteotherw01 w_rteotherw01

type variables
integer k = 1

end variables

on w_rteotherw01.create
int iCurrent
call super::create
this.rte_1=create rte_1
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
this.Control[iCurrent+2]=this.cb_1
end on

on w_rteotherw01.destroy
call super::destroy
destroy(this.rte_1)
destroy(this.cb_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 

***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Operation & PrintPreview\01-UI Operation 
Pbl Name:     
Designer:     ouyangwu
Coder:        ouyangwu 2005-06-28
DocReviewer:  
CoderReviewer:
【功能描述】
测试相关界面操作

【窗口对象】

【编码注意事项】

【测试注意事项】
测试前请了解RichTextEdit控件的一些编辑操作
参见：192.0.0.99机器的PBVSS：$/APBDvlp/AnalyseTeam/Analyse3.x/PB Analyse/Controls & Objects/SA-APB3.X-RichText Analyses.doc中 [2.5 界面分析]一节 
***********************/
if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return 
Choose Case as_testpoint
	Case 'RTEOTHERW01P01'
	/*
	   【功能描述】
	    编辑界面的操作

		【编码描述】
		

		【代码输出值描述】
		
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			
		else
		end if
	Case 'RTEOTHERW01P02'
	/*
	   【功能描述】
	    右键弹出菜单操作

		【编码描述】
		

		【代码输出值描述】
		
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			
		else
		end if
	Case 'RTEOTHERW01P03'
	/*
	   【功能描述】
	    工具条操作

		【编码描述】
		

		【代码输出值描述】
		
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			
		else
		end if
	Case 'RTEOTHERW01P04'
	/*
	   【功能描述】
	    Tab标尺操作

		【编码描述】
		

		【代码输出值描述】
		
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			
		else
		end if
	Case 'RTEOTHERW01P05'
	/*
	   【功能描述】
	    滚动条操作

		【编码描述】
		

		【代码输出值描述】
		
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			
		else
		end if
End Choose
if ab_exe then
	wf_postrun(al_row)
end if
end event

event open;call super::open;rte_1.Replacetext( "Appeon  RichText Control~r~n ")
rte_1.insertpicture( Gs_ApplicationPath+"\resource\PUB_BMP_APB.bmp" )

rte_1.inputfieldinsert( "Field"+String(k) )
rte_1.inputfieldchangedata( "Field1", "This is InputField")
k ++
end event

type pb_saveexpect from w_templet`pb_saveexpect within w_rteotherw01
end type

type pb_runnext from w_templet`pb_runnext within w_rteotherw01
end type

type pb_runall from w_templet`pb_runall within w_rteotherw01
end type

type pb_run from w_templet`pb_run within w_rteotherw01
end type

type pb_end from w_templet`pb_end within w_rteotherw01
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rteotherw01
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rteotherw01
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rteotherw01
integer x = 2999
integer y = 1808
integer width = 1595
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rteotherw01
integer x = 2999
integer y = 1392
integer width = 1595
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rteotherw01
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rteotherw01
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rteotherw01
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rteotherw01
integer x = 2981
integer y = 1324
integer width = 1632
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rteotherw01
integer x = 2981
integer y = 1736
integer width = 1632
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rteotherw01
integer y = 524
integer height = 796
end type

type rte_1 from richtextedit within w_rteotherw01
integer x = 18
integer y = 16
integer width = 2939
integer height = 1304
integer taborder = 70
boolean bringtotop = true
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_rulerbar = true
boolean init_tabbar = true
boolean init_toolbar = true
boolean init_popmenu = true
long init_leftmargin = 500
long init_topmargin = 500
long init_rightmargin = 500
long init_bottommargin = 500
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_rteotherw01
integer x = 1760
integer y = 2160
integer width = 512
integer height = 108
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "宋体"
string text = "Add InputField"
end type

event clicked;rte_1.inputfieldinsert( "Field"+String(k) )

k ++
end event

