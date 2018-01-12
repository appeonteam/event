$PBExportHeader$w_rteotherw03.srw
forward
global type w_rteotherw03 from w_templet
end type
type uo_1 from rteotherw03_uo_p1 within w_rteotherw03
end type
type rte_1 from rteotherw03_uo_p2 within w_rteotherw03
end type
end forward

global type w_rteotherw03 from w_templet
string title = "03-Other"
uo_1 uo_1
rte_1 rte_1
end type
global w_rteotherw03 w_rteotherw03

type variables

end variables

on w_rteotherw03.create
int iCurrent
call super::create
this.uo_1=create uo_1
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_1
this.Control[iCurrent+2]=this.rte_1
end on

on w_rteotherw03.destroy
call super::destroy
destroy(this.uo_1)
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 

***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Operation & PrintPreview\03-Other 
Pbl Name:     
Designer:     ouyangwu
Coder:        
DocReviewer:  
CoderReviewer:
【功能描述】

【窗口对象】

【编码注意事项】

【测试注意事项】
 
***********************/
if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return 

uo_1.rte_1.SelectTextAll()
uo_1.rte_1.Clear()
uo_1.rte_1.replacetext("Appeon RichTextEdit Control")
uo_1.rte_1.width = uo_1.ii_width
uo_1.rte_1.backcolor =16777215

rte_1.SelectTextAll()
rte_1.Clear()
rte_1.replacetext("Appeon RichTextEdit Control")
rte_1.width = rte_1.ii_width
rte_1.backcolor =16777215

uo_1.visible = true 
rte_1.visible = false
Choose Case as_testpoint
	Case 'RTEOTHERW03P01'
	/*
	   【功能描述】
	    测试RichTextEdit控件处于UserObject中的情况

		【编码描述】
		1、构建UserObject
		2、简单测试几个属性、事件、函数
		3、输出属性、事件信息、函数返回值

		【代码输出值描述】
		
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			uo_1.visible = true 
			rte_1.visible = false
			uo_1.rte_1.backcolor = 50000
			uo_1.rte_1.width  =  1000
			wf_output('ProReturn:'+String(uo_1.rte_1.backcolor),true)
			wf_output('ProReturn:'+String(uo_1.rte_1.width),false)
			uo_1.rte_1.event modified()
			uo_1.rte_1.event inputFieldselected("Field1")
			wf_output('FunReturn:SelectTextAll()='+String(uo_1.rte_1.SelectTextAll()),false)
			wf_output('FunReturn:Clear()='+String(uo_1.rte_1.Clear()),false)
			wf_output('FunReturn:replacetext()='+String(uo_1.rte_1.replacetext("Appeon RichTextEdit Control")),false)
		else
			uo_1.visible = true 
			rte_1.visible = false
		end if
	Case 'RTEOTHERW03P02'
	/*
	   【功能描述】
	    测试定制RichTextEdit控件的情况

		【编码描述】
		1、定制RichTextEdit的UserObject
		2、简单测试几个属性、事件、函数
		3、输出属性、事件信息、函数返回值

		【代码输出值描述】
		
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			uo_1.visible = false 
			rte_1.visible = true
			rte_1.backcolor = 50000
			rte_1.width  =  1000
			wf_output('ProReturn:'+String(rte_1.backcolor),true)
			wf_output('ProReturn:'+String(rte_1.width),false)
			rte_1.event modified()
			rte_1.event inputFieldselected("Field1")
			wf_output('FunReturn:SelectTextAll()='+String(rte_1.SelectTextAll()),false)
			wf_output('FunReturn:Clear()='+String(rte_1.Clear()),false)
			wf_output('FunReturn:replacetext()='+String(rte_1.replacetext("Appeon RichTextEdit Control")),false)
		else
			uo_1.visible = false 
			rte_1.visible = true
		end if
End Choose
if ab_exe then
	wf_postrun(al_row)
end if
end event

type pb_saveexpect from w_templet`pb_saveexpect within w_rteotherw03
end type

type pb_runnext from w_templet`pb_runnext within w_rteotherw03
end type

type pb_runall from w_templet`pb_runall within w_rteotherw03
end type

type pb_run from w_templet`pb_run within w_rteotherw03
end type

type pb_end from w_templet`pb_end within w_rteotherw03
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rteotherw03
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rteotherw03
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rteotherw03
integer x = 2999
integer y = 1808
integer width = 1595
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rteotherw03
integer x = 2999
integer y = 1392
integer width = 1595
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rteotherw03
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rteotherw03
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rteotherw03
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rteotherw03
integer x = 2981
integer y = 1324
integer width = 1632
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rteotherw03
integer x = 2981
integer y = 1736
integer width = 1632
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rteotherw03
integer y = 524
integer height = 796
end type

type uo_1 from rteotherw03_uo_p1 within w_rteotherw03
integer x = 14
integer width = 2939
integer height = 1324
integer taborder = 30
boolean bringtotop = true
end type

on uo_1.destroy
call rteotherw03_uo_p1::destroy
end on

type rte_1 from rteotherw03_uo_p2 within w_rteotherw03
integer x = 32
integer y = 40
integer width = 2921
integer height = 1264
integer taborder = 30
boolean bringtotop = true
end type

