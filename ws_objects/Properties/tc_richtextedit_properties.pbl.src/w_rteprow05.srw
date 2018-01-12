$PBExportHeader$w_rteprow05.srw
forward
global type w_rteprow05 from w_templet
end type
type rte_1 from richtextedit within w_rteprow05
end type
type rte_2 from richtextedit within w_rteprow05
end type
end forward

global type w_rteprow05 from w_templet
string title = "Dynamic Set 3"
rte_1 rte_1
rte_2 rte_2
end type
global w_rteprow05 w_rteprow05

forward prototypes
public function string wf_getvalues (borderstyle abs_style)
end prototypes

public function string wf_getvalues (borderstyle abs_style);Choose Case abs_Style
	Case stylebox!
		Return 'stylebox!'
	Case stylelowered!
		Return 'stylelowered!'
	Case styleraised!
		Return 'styleraised!'
	Case styleshadowbox!
		Return 'styleshadowbox!'
End Choose
end function

on w_rteprow05.create
int iCurrent
call super::create
this.rte_1=create rte_1
this.rte_2=create rte_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
this.Control[iCurrent+2]=this.rte_2
end on

on w_rteprow05.destroy
call super::destroy
destroy(this.rte_1)
destroy(this.rte_2)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 

***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Properties\Dynamic Set 3 
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

if as_TestPoint = 'RTEPROW05P21' then
	rte_1.Hide()
	rte_2.Show()
else
	rte_1.Show()
	rte_2.Hide()
end if

Choose Case as_testpoint
	Case 'RTEPROW05P01'
	/*
	   【功能描述】
	    动态设置InputFieldNamesVisible由false变为true，没有inputfield存在

		【编码描述】
		1、初始时InputFieldNamesVisible为false,没有inputfield存在。
		2、动态改变InputFieldNamesVisible为true
		3、输出该属性值
		

		【代码输出值描述】
		true
		
		【期望UI描述】
		无UI效果
	*/
		
		if ab_exe then
			rte_1.InputFieldNamesVisible = true
			wf_OutPut("ProReturn: rte_1.InputFieldNamesVisible=" + String(rte_1.InputFieldNamesVisible),true)
		else
			rte_1.InputFieldNamesVisible = false
			rte_1.selecttextall( )
			rte_1.Clear()
		end if
	Case 'RTEPROW05P02'
	/*
	   【功能描述】
	    动态设置InputFieldNamesVisible由false变为true，有inputfield存在

		【编码描述】
		1、初始时InputFieldNamesVisible为false,调用InputFieldInsert函数增加inputfield。
		2、动态改变InputFieldNamesVisible为true
		3、输出该属性值
		

		【代码输出值描述】
		true
		
		【期望UI描述】
		inputfield不再显示问号，显示的是插入时指定的Name
	*/
		
		if ab_exe then
			rte_1.InputFieldNamesVisible = true
			wf_OutPut("ProReturn: rte_1.InputFieldNamesVisible=" + String(rte_1.InputFieldNamesVisible),true)
		else
			rte_1.InputFieldNamesVisible = false
			rte_1.InputFieldInsert("WuZhiJun")
		end if
	Case 'RTEPROW05P03'
	/*
	   【功能描述】
	    动态设置InputFieldNamesVisible由true变为false，有inputfield存在

		【编码描述】
		1、初始时InputFieldNamesVisible为true,调用InputFieldInsert函数增加inputfield。
		2、动态改变InputFieldNamesVisible为false
		3、输出该属性值
		

		【代码输出值描述】
		false
		
		【期望UI描述】
		每个inputfield显示的是两个问号
	*/
		
		if ab_exe then
			rte_1.InputFieldNamesVisible = false
			wf_OutPut("ProReturn: rte_1.InputFieldNamesVisible=" + String(rte_1.InputFieldNamesVisible),true)
		else
			rte_1.InputFieldNamesVisible = true
			rte_1.InputFieldInsert("YuRu")
		end if
	Case 'RTEPROW05P04'
	/*
	   【功能描述】
	    动态设置inputfieldsvisible由false变为true

		【编码描述】
		1、初始时inputfieldsvisible为false,调用InputFieldInsert函数增加inputfield。
		2、动态改变inputfieldsvisible为true
		3、输出该属性值
		

		【代码输出值描述】
		true
		
		【期望UI描述】
		无UI变化
		
		PB当前版本还不支持该属性
	*/
		
		if ab_exe then
			rte_1.InputFieldsVisible = true
			wf_OutPut("ProReturn: rte_1.InputFieldsVisible=" + String(rte_1.InputFieldsVisible),true)
		else
			rte_1.InputFieldsVisible = false
			rte_1.InputFieldInsert("LanSu")
		end if
	Case 'RTEPROW05P05'
	/*
	   【功能描述】
	    动态设置inputfieldsvisible由true变为false

		【编码描述】
		1、初始时inputfieldsvisible为true,调用InputFieldInsert函数增加inputfield。
		2、动态改变inputfieldsvisible为false
		3、输出该属性值
		

		【代码输出值描述】
		false
		
		【期望UI描述】
		无UI变化
		
		PB当前版本还不支持该属性
	*/
		
		if ab_exe then
			rte_1.InputFieldsVisible = false
			wf_OutPut("ProReturn: rte_1.InputFieldsVisible=" + String(rte_1.InputFieldsVisible),true)
		else
			rte_1.InputFieldsVisible = true
			rte_1.InputFieldInsert("YuXin")
		end if
	Case 'RTEPROW05P06'
	/*
	   【功能描述】
	    动态设置leftmargin为负数

		【编码描述】
		1、动态改变leftmargin为负数
		2、输出该属性值
		3、调用Print函数打印当前内容

		【代码输出值描述】
		负数
		
		【期望UI描述】
		无UI变化
		
	*/
		
		if ab_exe then
			rte_1.LeftMargin = -100
			wf_OutPut("ProReturn: rte_1.LeftMargin=" + String(rte_1.LeftMargin),true)
			rte_1.Print(1,'',true,true)
		else

		end if
	Case 'RTEPROW05P07'
	/*
	   【功能描述】
	    动态设置leftmargin为0

		【编码描述】
		1、动态改变leftmargin为0
		2、输出该属性值
		

		【代码输出值描述】
		0
		
		【期望UI描述】
		无UI变化
	*/
		
		if ab_exe then
			rte_1.LeftMargin = 0
			wf_OutPut("ProReturn: rte_1.LeftMargin=" + String(rte_1.LeftMargin),true)
		else

		end if
	Case 'RTEPROW05P08'
	/*
	   【功能描述】
	    动态设置leftmargin为正数

		【编码描述】
		1、动态改变leftmargin为正数
		2、输出该属性值
		

		【代码输出值描述】
		所设置的值
		
		【期望UI描述】
		无UI变化
		
	*/
		
		if ab_exe then
			rte_1.LeftMargin = 100
			wf_OutPut("ProReturn: rte_1.LeftMargin=" + String(rte_1.LeftMargin),true)
		else

		end if
	Case 'RTEPROW05P09'
	/*
	   【功能描述】
	    动态设置Modify由false变true

		【编码描述】
		1、初始时Modify为false,在Modified事件中写入信息输出代码
		2、动态改变Modify为true
		3、输出该属性值

		【代码输出值描述】
		true
		
		【期望UI描述】
		会触发Modified事件，UI无变化
		
	*/
		
		if ab_exe then
			rte_1.Modified = true
			wf_OutPut("ProReturn: rte_1.Modified=" + String(rte_1.Modified),true)
		else
			rte_1.Modified = false
		end if
	Case 'RTEPROW05P10'
	/*
	   【功能描述】
	    动态设置Modify由true变false

		【编码描述】
		1、初始时Modify为true,在Modified事件中写入信息输出代码
		2、动态改变Modify为false
		3、输出该属性值

		【代码输出值描述】
		false
		
		【期望UI描述】
		不触发Modified事件，UI无变化
		
	*/
		
		if ab_exe then
			rte_1.Modified = false
			wf_OutPut("ProReturn: rte_1.Modified=" + String(rte_1.Modified),true)
		else
			rte_1.Modified = true
		end if
	Case 'RTEPROW05P11'
	/*
	   【功能描述】
	    没有图片存在时动态设置picturesasframe由false变true

		【编码描述】
		1、初始时picturesasframe为false
		2、动态改变picturesasframe为true
		3、输出该属性值

		【代码输出值描述】
		true
		
		【期望UI描述】
		UI无变化
		
	*/
		
		if ab_exe then
			rte_1.PicturesAsFrame = true
			wf_OutPut("ProReturn: rte_1.PicturesAsFrame=" + String(rte_1.PicturesAsFrame),true)
		else
			rte_1.PicturesAsFrame = false
		end if
	Case 'RTEPROW05P12'
	/*
	   【功能描述】
	    有图片存在时动态设置picturesasframe由false变true

		【编码描述】
		1、初始时picturesasframe为false，InsertPicture插入图片
		2、动态改变picturesasframe为true
		3、输出该属性值

		【代码输出值描述】
		true
		
		【期望UI描述】
		图片区显示为空白框
		
	*/
		
		if ab_exe then
			rte_1.PicturesAsFrame = true
			wf_OutPut("ProReturn: rte_1.PicturesAsFrame=" + String(rte_1.PicturesAsFrame),true)
		else
			rte_1.SelectTextAll( )
			rte_1.Clear()
			rte_1.PicturesAsFrame = false
			rte_1.InsertPicture("PUB_BMP_APB.bmp")
		end if
	Case 'RTEPROW05P13'
	/*
	   【功能描述】
	    有图片存在时动态设置picturesasframe由true变false

		【编码描述】
		1、初始时picturesasframe为true，InsertPicture插入图片
		2、动态改变picturesasframe为false
		3、输出该属性值

		【代码输出值描述】
		false
		
		【期望UI描述】
		图片区由空白框显示为具体的图片
		
	*/
		
		if ab_exe then
			rte_1.PicturesAsFrame = false
			wf_OutPut("ProReturn: rte_1.PicturesAsFrame=" + String(rte_1.PicturesAsFrame),true)
		else
			rte_1.SelectTextAll( )
			rte_1.Clear()
			rte_1.PicturesAsFrame = true
			rte_1.InsertPicture("PUB_BMP_APB.bmp")
		end if
	Case 'RTEPROW05P14'
	/*
	   【功能描述】
	    动态设置pointer为无效Pointer

		【编码描述】
		1、动态设置pointer为无效Pointer
		2、输出该属性值

		【代码输出值描述】
		所设置的值
		
		【期望UI描述】
		Pointer无变化
	*/
		
		if ab_exe then
			rte_1.Pointer = 'NoValid'
			wf_OutPut("ProReturn: rte_1.Pointer=" + String(rte_1.Pointer),true)
		else

		end if
	Case 'RTEPROW05P15'
	/*
	   【功能描述】
	    动态设置pointer为有效Pointer

		【编码描述】
		1、动态改变pointer为有效Pointer
		2、输出该属性值

		【代码输出值描述】
		所设置的值
		
		【期望UI描述】
		Pointer变为设置后的形状
	*/
		
		if ab_exe then
			rte_1.Pointer = 'HyperLink!'
			wf_OutPut("ProReturn: rte_1.Pointer=" + String(rte_1.Pointer),true)
		else

		end if
	Case 'RTEPROW05P16'
	/*
	   【功能描述】
	    动态设置popmenu由false变为true

		【编码描述】
		1、初始时popmenu为false
		2、动态改变popmenu为true
		3、输出该属性值

		【代码输出值描述】
		true
		
		【期望UI描述】
		弹出快捷菜单
	*/
		
		if ab_exe then
			rte_1.PopMenu = true
			wf_OutPut("ProReturn: rte_1.PopMenu=" + String(rte_1.PopMenu),true)
		else
			rte_1.PopMenu = false
		end if
	Case 'RTEPROW05P17'
	/*
	   【功能描述】
	    动态设置popmenu由true变为false

		【编码描述】
		1、初始时popmenu为true
		2、动态改变popmenu为false
		3、输出该属性值

		【代码输出值描述】
		false
		
		【期望UI描述】
		不弹出快捷菜单
	*/
		
		if ab_exe then
			rte_1.PopMenu = false
			wf_OutPut("ProReturn: rte_1.PopMenu=" + String(rte_1.PopMenu),true)
		else
			rte_1.PopMenu = true
		end if
	Case 'RTEPROW05P18'
	/*
	   【功能描述】
	    Border被设置为false时动态设置resizable由false变为true

		【编码描述】
		1、初始时Border被设置为false，resizable为false
		2、动态改变resizable为true
		3、输出该属性值

		【代码输出值描述】
		true
		
		【期望UI描述】
		不能拖动边框改变控件大小
	*/
		
		if ab_exe then
			rte_1.Resizable = true
			wf_OutPut("ProReturn: rte_1.Resizable=" + String(rte_1.Resizable),true)
		else
			rte_1.Border = false
			rte_1.Resizable = false
		end if
	Case 'RTEPROW05P19'
	/*
	   【功能描述】
	    Border被设置为true时动态设置resizable由false变为true

		【编码描述】
		1、初始时Border被设置为true，resizable为false
		2、动态改变resizable为true
		3、输出该属性值

		【代码输出值描述】
		true
		
		【期望UI描述】
		能拖动边框改变控件大小
	*/
		
		if ab_exe then
			rte_1.Resizable = true
			wf_OutPut("ProReturn: rte_1.Resizable=" + String(rte_1.Resizable),true)
		else
			rte_1.Border = true
			rte_1.Resizable = false
		end if
	Case 'RTEPROW05P20'
	/*
	   【功能描述】
	    Border被设置为true时动态设置resizable由true变为false

		【编码描述】
		1、初始时Border被设置为true，resizable为true
		2、动态改变resizable为false
		3、输出该属性值

		【代码输出值描述】
		false
		
		【期望UI描述】
		不能拖动边框改变控件大小
	*/
		
		if ab_exe then
			rte_1.Resizable = false
			wf_OutPut("ProReturn: rte_1.Resizable=" + String(rte_1.Resizable),true)
		else
			rte_1.Border = true
			rte_1.Resizable = true
		end if
	Case 'RTEPROW05P21'
	/*
	   【功能描述】
	    Border被静态设置为false时动态设置resizable由false变为true

		【编码描述】
		1、放置另一个RTE控件，其初始时Border被静态设置为false（在PB画板中设置），resizable为false
		2、动态改变resizable为true
		3、输出该属性值

		【代码输出值描述】
		true
		
		【期望UI描述】
		能拖动边框改变控件大小
	*/
		
		if ab_exe then
			rte_2.Resizable = true
			wf_OutPut("ProReturn: rte_2.Resizable=" + String(rte_2.Resizable),true)
		else
			rte_2.Resizable = false
		end if
	Case 'RTEPROW05P22'
	/*
	   【功能描述】
	    Border被设置为false时动态改变Borderstyle

		【编码描述】
		1、初始时Border被设置为false，Borderstyle为StyleBox!
		2、动态改变Borderstyle为StyleRaised!
		3、输出该属性值

		【代码输出值描述】
		StyleRaised!
		
		【期望UI描述】
		控件边框无变化
	*/
		
		if ab_exe then
			rte_1.BorderStyle = StyleRaised!
			wf_OutPut("ProReturn: rte_1.BorderStyle=" + wf_GetValues(rte_1.BorderStyle),true)
		else
			rte_1.Border = false
			rte_1.BorderStyle = StyleBox!
		end if
	Case 'RTEPROW05P23'
	/*
	   【功能描述】
	    resizable被设置为true时动态改变Borderstyle

		【编码描述】
		1、初始时Border被设置为true，resizable设置为true,Borderstyle为StyleBox!
		2、动态改变Borderstyle为StyleShadowBox!
		3、输出该属性值

		【代码输出值描述】
		StyleShadowBox!
		
		【期望UI描述】
		控件边框无变化
	*/
		
		if ab_exe then
			rte_1.BorderStyle = StyleShadowBox!
			wf_OutPut("ProReturn: rte_1.BorderStyle=" + wf_GetValues(rte_1.BorderStyle),true)
		else
			rte_1.Border = true
			rte_1.Resizable = true
			rte_1.BorderStyle = StyleBox!
		end if
End Choose
if ab_exe then
	wf_postrun(al_row)
end if
end event

event open;call super::open;n_cst_config  lnv_res


if not lnv_res.of_createfile("PUB_BMP_APB.bmp",gtr_frame) then
	messagebox("Question","Download File Failed!")
end if





end event

event close;call super::close;
if FileExists("PUB_BMP_APB.bmp") then
	FileDelete("PUB_BMP_APB.bmp")
end if

end event

type mle_phenomena from w_templet`mle_phenomena within w_rteprow05
end type

type cb_autoparse from w_templet`cb_autoparse within w_rteprow05
end type

type cb_wrrun from w_templet`cb_wrrun within w_rteprow05
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rteprow05
end type

type dw_info from w_templet`dw_info within w_rteprow05
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rteprow05
end type

type pb_runnext from w_templet`pb_runnext within w_rteprow05
end type

type pb_runall from w_templet`pb_runall within w_rteprow05
end type

type pb_run from w_templet`pb_run within w_rteprow05
end type

type pb_end from w_templet`pb_end within w_rteprow05
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rteprow05
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rteprow05
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rteprow05
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rteprow05
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rteprow05
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rteprow05
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rteprow05
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rteprow05
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rteprow05
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rteprow05
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rteprow05
end type

type rte_1 from richtextedit within w_rteprow05
integer x = 27
integer y = 32
integer width = 2921
integer height = 1288
integer taborder = 70
boolean bringtotop = true
string init_pointer = "HyperLink!"
borderstyle borderstyle = stylelowered!
end type

event modified;wf_OutPut('Modified event is Trigger',false)
end event

type rte_2 from richtextedit within w_rteprow05
integer x = 27
integer y = 32
integer width = 2921
integer height = 1288
integer taborder = 80
boolean bringtotop = true
string init_pointer = "HyperLink!"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

