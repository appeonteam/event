$PBExportHeader$w_rteprow03.srw
forward
global type w_rteprow03 from w_templet
end type
type rte_1 from richtextedit within w_rteprow03
end type
type cb_1 from commandbutton within w_rteprow03
end type
end forward

global type w_rteprow03 from w_templet
string title = "Dynamic Set 1"
rte_1 rte_1
cb_1 cb_1
end type
global w_rteprow03 w_rteprow03

forward prototypes
public function string wf_getborderstyle (borderstyle abs_borderstyle)
public subroutine wf_reset ()
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

public subroutine wf_reset ();//
rte_1.backcolor=16777215
rte_1.Border = true
rte_1.BorderStyle = StyleLowered!
rte_1.Displayonly = false
end subroutine

on w_rteprow03.create
int iCurrent
call super::create
this.rte_1=create rte_1
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
this.Control[iCurrent+2]=this.cb_1
end on

on w_rteprow03.destroy
call super::destroy
destroy(this.rte_1)
destroy(this.cb_1)
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
cb_1.visible = false
wf_reset()
Choose Case as_testpoint
	Case 'RTEPROW03P01'
	/*
	   【功能描述】
	    动态设置Accelerator

		【编码描述】
		1、动态设置Accelerator属性为一字母
		2、输出该属性值

		【代码输出值描述】
		属性值为动态所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.Accelerator = asc('p')
			wf_output('ProReturn:rte_1.Accelerator='+String(rte_1.Accelerator),true)
		else
		end if
	Case 'RTEPROW03P02'
	/*
	   【功能描述】
	    动态设置BackColor为-3

		【编码描述】
		1、动态改变BackColor属性为-3
		2、输出该属性值

		【代码输出值描述】
		属性值为-3
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.BackColor = -3
			wf_output('ProReturn:rte_1.BackColor='+String(rte_1.BackColor),true)
		else
		end if
	Case 'RTEPROW03P03'
	/*
	   【功能描述】
	    动态设置BackColor为-2

		【编码描述】
		1、动态改变BackColor属性为-2
		2、输出该属性值

		【代码输出值描述】
		属性值为-2
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.BackColor = -2
			wf_output('ProReturn:rte_1.BackColor='+String(rte_1.BackColor),true)
		else
		end if
	Case 'RTEPROW03P04'
	/*
	   【功能描述】
	    动态设置BackColor为10000

		【编码描述】
		1、动态改变BackColor属性为10000
		2、输出该属性值

		【代码输出值描述】
		属性值为10000
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.BackColor = 10000
			wf_output('ProReturn:rte_1.BackColor='+String(rte_1.BackColor),true)
		else
		end if
	Case 'RTEPROW03P05'
	/*
	   【功能描述】
	    动态设置BackColor为16777215

		【编码描述】
		1、动态改变BackColor属性为16777215
		2、输出该属性值

		【代码输出值描述】
		属性值为16777215
		
		【期望UI描述】
		白色
	*/
		
		if ab_exe then
			rte_1.BackColor = 16777215
			wf_output('ProReturn:rte_1.BackColor='+String(rte_1.BackColor),true)
		else
		end if
	Case 'RTEPROW03P06'
	/*
	   【功能描述】
	    动态设置BackColor为16777216

		【编码描述】
		1、动态改变BackColor属性为16777216
		2、输出该属性值

		【代码输出值描述】
		属性值为16777216
		
		【期望UI描述】
		黑色
	*/
		
		if ab_exe then
			rte_1.BackColor = 16777216
			wf_output('ProReturn:rte_1.BackColor='+String(rte_1.BackColor),true)
		else
		end if
	Case 'RTEPROW03P07'
	/*
	   【功能描述】
	    动态设置Border从false到true

		【编码描述】
		1、Border属性初始值为false
		2、动态改变Border属性为true
		3、输出该属性值

		【代码输出值描述】
		属性值为true
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.Border = true
			wf_output('ProReturn:rte_1.Border='+String(rte_1.Border),true)
		else
			rte_1.Border = false
		end if
	Case 'RTEPROW03P08'
	/*
	   【功能描述】
	    动态设置Border从true到false

		【编码描述】
		1、Border属性初始值为true
		2、动态改变Border属性为false
		3、输出该属性值

		【代码输出值描述】
		属性值为动态所设置的值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.Border = false
			wf_output('ProReturn:rte_1.Border='+String(rte_1.Border),true)
		else
			rte_1.Border = true
		end if
	Case 'RTEPROW03P09'
	/*
	   【功能描述】
	    动态设置BorderStyle为styleBox!

		【编码描述】
		1、动态改变BorderStyle属性为styleBox!
		2、输出该属性值

		【代码输出值描述】
		styleBox!
		
		
		【期望UI描述】
		边框变为Box!
	*/
		
		if ab_exe then
			rte_1.BorderStyle = styleBox!
			wf_output('ProReturn:rte_1.BorderStyle='+wf_getborderstyle(rte_1.BorderStyle),true)
		else
		end if
	Case 'RTEPROW03P10'
	/*
	   【功能描述】
	    动态设置BorderStyle为styleLowered!

		【编码描述】
		1、动态改变BorderStyle属性为styleLowered!
		2、输出该属性值

		【代码输出值描述】
		styleLowered!
		
		
		【期望UI描述】
		边框变为Lowered!
	*/
		
		if ab_exe then
			rte_1.BorderStyle = styleLowered!
			wf_output('ProReturn:rte_1.BorderStyle='+wf_getborderstyle(rte_1.BorderStyle),true)
		else
		end if
	Case 'RTEPROW03P11'
	/*
	   【功能描述】
	    动态设置BorderStyle为styleRaised!

		【编码描述】
		1、动态改变BorderStyle属性为styleRaised!
		2、输出该属性值

		【代码输出值描述】
		styleRaised!
		
		
		【期望UI描述】
		边框变为Raised!
	*/
		
		if ab_exe then
			rte_1.BorderStyle = styleRaised!
			wf_output('ProReturn:rte_1.BorderStyle='+wf_getborderstyle(rte_1.BorderStyle),true)
		else
		end if
	Case 'RTEPROW03P12'
	/*
	   【功能描述】
	    动态设置BorderStyle为styleShadowBox!

		【编码描述】
		1、动态改变BorderStyle属性为styleShadowBox!
		2、输出该属性值

		【代码输出值描述】
		styleShadowBox!
		
		
		【期望UI描述】
		边框变为ShadowBox!
	*/
		
		if ab_exe then
			rte_1.BorderStyle = styleShadowBox!
			wf_output('ProReturn:rte_1.BorderStyle='+wf_getborderstyle(rte_1.BorderStyle),true)
		else
		end if
	Case 'RTEPROW03P13'
	/*
	   【功能描述】
	    动态设置BottomMargin为负数

		【编码描述】
		1、动态设置BottomMargin为负数
		2、输出该属性值

		【代码输出值描述】
		输出的属性值为所设置的值
		
		
		【期望UI描述】
		无变化
	*/
		
		if ab_exe then
			rte_1.BottomMargin = -100
			wf_output('ProReturn:rte_1.BottomMargin='+String(rte_1.BottomMargin),true)
		else
		end if
	Case 'RTEPROW03P14'
	/*
	   【功能描述】
	    动态设置BottomMargin为0

		【编码描述】
		1、动态设置BottomMargin为0
		2、输出该属性值

		【代码输出值描述】
		输出的属性值为0
		
		
		【期望UI描述】
		无变化
	*/
		
		if ab_exe then
			rte_1.BottomMargin = 0
			wf_output('ProReturn:rte_1.BottomMargin='+String(rte_1.BottomMargin),true)
		else
		end if
	Case 'RTEPROW03P15'
	/*
	   【功能描述】
	    动态设置BottomMargin为正数

		【编码描述】
		1、动态设置BottomMargin为正数
		2、输出该属性值

		【代码输出值描述】
		输出的属性值为所设置的值
		
		
		【期望UI描述】
		无变化
	*/
		
		if ab_exe then
			rte_1.BottomMargin = 500
			wf_output('ProReturn:rte_1.BottomMargin='+String(rte_1.BottomMargin),true)
		else
		end if
	Case 'RTEPROW03P16'
	/*
	   【功能描述】
	    动态设置Bringtotop由false变为true

		【编码描述】
		1、在RichTextEdit控件上方任意放置一个其他控件
		1、动态设置Bringtotop由false变为true
		2、输出该属性值

		【代码输出值描述】
		true
		
		
		【期望UI描述】
		RichTextEdit控件将处于最前方显示
	*/
		
		if ab_exe then
			cb_1.visible = true
			rte_1.Bringtotop = true
			wf_output('ProReturn:rte_1.Bringtotop='+String(rte_1.Bringtotop),true)
		else
			cb_1.visible = true
			rte_1.Bringtotop = false
		end if
	Case 'RTEPROW03P17'
	/*
	   【功能描述】
	    动态设置Bringtotop由true变为false

		【编码描述】
		1、在RichTextEdit控件上方任意放置一个其他控件,且RichTextEdit控件的Bringtotop初始值为true
		2、动态设置Bringtotop由true变为false
		3、输出该属性值

		【代码输出值描述】
		false
		
		
		【期望UI描述】
		RichTextEdit控件将处于所放置的另一个控件的后面显示
	*/
		
		if ab_exe then
			cb_1.visible = true
			rte_1.Bringtotop = false
			wf_output('ProReturn:rte_1.Bringtotop='+String(rte_1.Bringtotop),true)
		else
			cb_1.visible = true
			rte_1.Bringtotop = true
		end if
	Case 'RTEPROW03P18'
	/*
	   【功能描述】
	    动态设置Displayonly由false变为true

		【编码描述】
		1、RichTextEdit控件的Displayonly初始值为false
		2、动态设置Displayonly由false变为true
		3、输出该属性值

		【代码输出值描述】
		true
		
		
		【期望UI描述】
		控件输入区将不能输入
	*/
		
		if ab_exe then
			rte_1.Displayonly = true
			wf_output('ProReturn:rte_1.Displayonly='+String(rte_1.Displayonly),true)
		else
			rte_1.Displayonly = false
		end if
	Case 'RTEPROW03P19'
	/*
	   【功能描述】
	    动态设置Displayonly由true变为false

		【编码描述】
		1、RichTextEdit控件的Displayonly初始值为true
		2、动态设置Displayonly由true变为false
		3、输出该属性值

		【代码输出值描述】
		false
		
		【期望UI描述】
		控件输入区变成能输入
	*/
		
		if ab_exe then
			rte_1.Displayonly = false
			wf_output('ProReturn:rte_1.Displayonly='+String(rte_1.Displayonly),true)
		else
			rte_1.Displayonly = true
		end if
	Case 'RTEPROW03P20'
	/*
	   【功能描述】
	    动态设置Documentname为任意字符串

		【编码描述】
		1、动态设置Documentname为任意字符串
		2、输出该属性值
		3、调用Print函数进行打印

		【代码输出值描述】
		为所设置的字符串
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.Documentname = "Appeon RichTextEdit"
			wf_output('ProReturn:rte_1.Documentname='+String(rte_1.Documentname),true)
			rte_1.Print(1,"",true,true)
		else
		end if
End Choose
if ab_exe then
	wf_postrun(al_row)
end if
end event

type pb_saveexpect from w_templet`pb_saveexpect within w_rteprow03
end type

type pb_runnext from w_templet`pb_runnext within w_rteprow03
end type

type pb_runall from w_templet`pb_runall within w_rteprow03
end type

type pb_run from w_templet`pb_run within w_rteprow03
end type

type pb_end from w_templet`pb_end within w_rteprow03
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rteprow03
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rteprow03
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rteprow03
integer x = 2999
integer y = 1808
integer width = 1595
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rteprow03
integer x = 2999
integer y = 1392
integer width = 1595
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rteprow03
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rteprow03
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rteprow03
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rteprow03
integer x = 2981
integer y = 1324
integer width = 1632
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rteprow03
integer x = 2981
integer y = 1736
integer width = 1632
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rteprow03
integer y = 524
integer height = 796
end type

type rte_1 from richtextedit within w_rteprow03
integer x = 14
integer y = 16
integer width = 2935
integer height = 1296
integer taborder = 70
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
end event

type cb_1 from commandbutton within w_rteprow03
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
string facename = "宋体"
string text = "none"
end type

