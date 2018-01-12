$PBExportHeader$w_rtefunw16.srw
forward
global type w_rtefunw16 from w_templet
end type
type rte_1 from richtextedit within w_rtefunw16
end type
end forward

global type w_rtefunw16 from w_templet
string title = "Function 16"
rte_1 rte_1
end type
global w_rtefunw16 w_rtefunw16

type variables
Boolean	lb_IsDisplay
end variables

forward prototypes
public subroutine wf_data_init (richtextedit ar_rich, integer ai_sign)
end prototypes

public subroutine wf_data_init (richtextedit ar_rich, integer ai_sign);//==================================================================================
// Function: wf_data_init()
//--------------------------------------------------------------------------------------------------------------------------------------------------
// Arguments:  Richtextedit   ar_rich
//                        Integer  ai_sign  --  1为英文，2为中文，3中英文，4为英文图片，5中文图片，6中英文图片
//--------------------------------------------------------------------------------------------------------------------------------------------------
// Returns:       None
//--------------------------------------------------------------------------------------------------------------------------------------------------
// Author: 		zhouchaoqun 	Date: 2005/06/24
//--------------------------------------------------------------------------------------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//=================================================================================
string    ls_china,ls_english,ls_array[],ls_temp
integer  i,ll_num

choose case ai_sign
	case 1 //英文
		ls_array[] = {'1'}
	case 2 //中文
		ls_array[] = {'2'}
	case 3 //中英文
		ls_array[] = {'1','2'}
	case 4 //英文图片
		ls_array[] = {'1','3'}
	case 5 //中文图片
		ls_array[] = {'2','3'}
	case 6 //中英文图片
		ls_array[] = {'1','2','3'}
end choose

ar_rich.SelectTextAll (Detail! )
ar_rich.Clear( )
for ll_num = 1 to upperbound(ls_array[])
	i = integer(ls_array[ll_num])
	choose case i
		case 1 //英文
			ls_english = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'
			Clipboard(ls_english)
			ar_rich.paste()
		case 2 //中文
			ls_china   = "正阳软件是一家专门从事研发和营销企业级软件产品的公司，成立于美国硅谷，2001年12月在深圳建立研发中心。正阳软件在企业应用级软件的结构性变革中，一直占据技术上的领先地位，其申请的多项发明专利，解决了互联网软件的局限性，这些技术发明对企业开发与应用互联网软件产生深远的影响，也使正阳软件成为全球最早确认并解决了网络浏览器在访问企业软件方面局限性的公司。"
			Clipboard(ls_china)
			ar_rich.paste()
		case 3  //图片
			ar_rich.InsertPicture("PUB_BMP_APB.bmp")
	end choose
	Clipboard('')
next

ar_rich.SelectTextALL(Detail!)

ar_rich.Settextstyle( true, true, true, true, true, true)
ar_rich.SettextColor(rgb(0,0,255 ))

ar_rich.SelectText(1,1,1,5,Detail!)
ar_rich.SetAlignment ( Center!  )

ar_rich.SelectText(2,1,2,5,Detail!)
ar_rich.SetAlignment ( Right!   )

ar_rich.SelectText(3,1,3,5,Detail!)
ar_rich.SetAlignment (  Left!  )

ar_rich.SelectText(4,1,4,5,Detail!)
ar_rich.SetAlignment ( Justify!)

ar_rich.SelectText(ar_rich.LineCount(),1,0,0,Detail!)
ar_rich.SelectText(ar_rich.LineCount(),ar_rich.LineLength() + 1,0,0,Detail!)
end subroutine

on w_rtefunw16.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rtefunw16.destroy
call super::destroy
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 
将控件内容成功保存到一个文档后或新打开文档后，Modified属性值变为false
***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Functions\Function 16 
Pbl Name:     
Designer:     ouyangwu
Coder:        WuZhiJun(2005-06-27)
DocReviewer:  
CoderReviewer:
【功能描述】

【窗口对象】

【编码注意事项】

【测试注意事项】
 
***********************/

//公共变量定义
String		ls_Temp
Integer		li_RtnVal,li_Value
Alignment	la_Align

ParagraphSetting	lp_ParaSet

if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return

if Not ab_exe then
	rte_1.ShowHeadFoot(false)
	rte_1.SelectTextAll(Detail!)
	rte_1.Clear()
	ClipBoard('Series1~t814~ttmiu~r~nSeries2~t756~tyvga~r~nSeries3~t839~thfsh~r~nSeries4~t881~tcxhu~r~nSeries1~t853~tyyht~r~nSeries2~t742~tdglf~r~nSeries3~t997~tiebd~r~nSeries4~t966~ttoeu~r~nSeries1~t339~tfhda~r~nSeries2~t461~tphbs~r~nSeries3~t722~twztp~r~nSeries4~t976~tjngj~r~nSeries1~t540~tcpxr~r~nSeries2~t591~tvbvc~r~nSeries3~t974~tefkb~r~nSeries4~t447~tmgsd~r~nSeries1~t712~tmzmm~r~nSeries2~t952~twdeh~r~nSeries3~t504~tkruq~r~nSeries4~t995~tyvec~r~nSeries1~t409~tpesr~r~nSeries2~t426~tmdxl~r~nSeries3~t573~tubry~r~nSeries4~t656~teshq~r~nSeries1~t938~tzmre~r~nSeries2~t530~tqnkq~r~nSeries3~t438~ttxgi~r~nSeries4~t959~tgqus~r~nSeries1~t834~twtcz~r~nSeries2~t346~tlter~r~nSeries3~t309~tbltz~r~nSeries4~t774~tdyzv~r~nSeries1~t539~thnki~r~nSeries2~t892~tjwzz~r~nSeries3~t855~tdjpq~r~nSeries4~t711~tuowk~r~nSeries1~t768~tfcco~r~nSeries2~t455~tkvrj~r~nSeries3~t425~tfrjp~r~nSeries4~t420~tgdjd~r~n ')
	rte_1.Paste()
end if

Choose Case as_testpoint
	Case 'RTEFUNW16P01'
	/*
	   【功能描述】
	    SetAlignment,参数为NULL

		【编码描述】
		1、初始化控件
		2、设置align为NULL,调用函数
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(la_Align)
			li_RtnVal = rte_1.SetAlignment(la_Align)
			wf_OutPut("FunReturn: rte_1.SetAlignment(la_Align)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW16P02'
	/*
	   【功能描述】
	    SetAlignment,高亮选中段落，align为Left!

		【编码描述】
		1、初始化控件，构建控件内容
		2、从前向后高亮选中多行，align为Left!,调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		插入点所在行被设置为Left!
	*/
		
		if ab_exe then
			la_Align = Left!
			li_RtnVal = rte_1.SetAlignment(la_Align)
			wf_OutPut("FunReturn: rte_1.SetAlignment(la_Align)=" + String(li_RtnVal),true)
		else
			rte_1.SelectText(1,1,10,50,Detail!)
		end if
	Case 'RTEFUNW16P03'
	/*
	   【功能描述】
	    SetAlignment,高亮选中段落，align为Right!

		【编码描述】
		1、初始化控件，构建控件内容
		2、从后向前高亮选中多行，align为Right!,调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		插入点所在行被设置为Right!
	*/
		
		if ab_exe then
			la_Align = Right!
			li_RtnVal = rte_1.SetAlignment(la_Align)
			wf_OutPut("FunReturn: rte_1.SetAlignment(la_Align)=" + String(li_RtnVal),true)
		else
			rte_1.SelectText(10,1,1,1,Detail!)
		end if
	Case 'RTEFUNW16P04'
	/*
	   【功能描述】
	    SetAlignment,高亮选中段落，align为Center!

		【编码描述】
		1、初始化控件，构建控件内容
		2、高亮选中段落，align为Center! ,调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		插入点所在行被设置为Center!
	*/
		
		if ab_exe then
			la_Align = Center!
			li_RtnVal = rte_1.SetAlignment(la_Align)
			wf_OutPut("FunReturn: rte_1.SetAlignment(la_Align)=" + String(li_RtnVal),true)
		else
			rte_1.SelectText(1,1,10,1,Detail!)
		end if
	Case 'RTEFUNW16P05'
	/*
	   【功能描述】
	    SetAlignment,高亮选中段落，align为Justify!

		【编码描述】
		1、初始化控件，构建控件内容
		2、高亮选中段落，align为Justify! ,调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		插入点所在行被设置为Justify!
	*/
		
		if ab_exe then
			la_Align = Justify!
			li_RtnVal = rte_1.SetAlignment(la_Align)
			wf_OutPut("FunReturn: rte_1.SetAlignment(la_Align)=" + String(li_RtnVal),true)
		else
			rte_1.SelectText(1,1,10,1,Detail!)
		end if
	Case 'RTEFUNW16P06'
	/*
	   【功能描述】
	    SetAlignment,没有高亮选中内容，align为Center!

		【编码描述】
		1、初始化控件，构建控件内容
		2、没有高亮选中内容，设置插入点，align为Center! ,调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		将插入点所在行设置为Center!格式显示
	*/
		
		if ab_exe then
			la_Align = Center!
			li_RtnVal = rte_1.SetAlignment(la_Align)
			wf_OutPut("FunReturn: rte_1.SetAlignment(la_Align)=" + String(li_RtnVal),true)
		else
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW16P07'
	/*
	   【功能描述】
	    SetFocus

		【编码描述】
		1、初始化控件，构建控件内容，在控件GetFocus事件中写入信息输出代码
		2、调用SetFocus函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		焦点移到控件中并触发getfocus事件
	*/
		
		if ab_exe then
			lb_IsDisplay = true
			li_RtnVal = rte_1.SetFocus()
			lb_IsDisplay = false
			wf_OutPut("FunReturn: rte_1.SetFocus()=" + String(li_RtnVal),false)
		else
		end if
	Case 'RTEFUNW16P08'
	/*
	   【功能描述】
	    SetParagraphSetting，whichsetting为NULL

		【编码描述】
		1、初始化控件，构建控件内容
		2、whichsetting为NULL,调用函数
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(lp_ParaSet)
			li_RtnVal = rte_1.SetParagraphSetting(lp_ParaSet,li_Value)
			wf_OutPut("FunReturn: rte_1.SetParagraphSetting(lp_ParaSet,li_Value)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW16P09'
	/*
	   【功能描述】
	    SetParagraphSetting，value为NULL

		【编码描述】
		1、初始化控件，构建控件内容
		2、value为NULL,调用函数
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(li_Value)
			li_RtnVal = rte_1.SetParagraphSetting(lp_ParaSet,li_Value)
			wf_OutPut("FunReturn: rte_1.SetParagraphSetting(lp_ParaSet,li_Value)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW16P10'
	/*
	   【功能描述】
	    SetParagraphSetting，whichsetting为Indent!

		【编码描述】
		1、初始化控件，tabbar=true,构建控件内容
		2、设置插入点，whichsetting为Indent!,有效调用函数
		3、输出函数返回值，GetParagraphSetting输出段落格式

		【代码输出值描述】
		1，Indent!
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lp_ParaSet = Indent!
			li_Value = 10
			li_RtnVal = rte_1.SetParagraphSetting(lp_ParaSet,li_Value)
			wf_OutPut("FunReturn: rte_1.SetParagraphSetting(lp_ParaSet,li_Value)=" + String(li_RtnVal),true)
		else
			rte_1.TabBar = true
		end if
	Case 'RTEFUNW16P11'
	/*
	   【功能描述】
	    SetParagraphSetting，whichsetting为LeftMargin!

		【编码描述】
		1、初始化控件，tabbar=true,构建控件内容
		2、设置插入点，whichsetting为LeftMargin!,有效调用函数
		3、输出函数返回值，GetParagraphSetting输出段落格式

		【代码输出值描述】
		1，LeftMargin!
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lp_ParaSet = LeftMargin!
			li_Value = 100
			li_RtnVal = rte_1.SetParagraphSetting(lp_ParaSet,li_Value)
			wf_OutPut("FunReturn: rte_1.SetParagraphSetting(lp_ParaSet,li_Value)=" + String(li_RtnVal),true)
		else
			rte_1.TabBar = true
		end if
	Case 'RTEFUNW16P12'
	/*
	   【功能描述】
	    SetParagraphSetting，whichsetting为RightMargin!

		【编码描述】
		1、初始化控件，tabbar=true,构建控件内容
		2、设置插入点，whichsetting为RightMargin!,有效调用函数
		3、输出函数返回值，GetParagraphSetting输出段落格式

		【代码输出值描述】
		1，RightMargin!
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lp_ParaSet = RightMargin!
			li_Value = 100
			li_RtnVal = rte_1.SetParagraphSetting(lp_ParaSet,li_Value)
			wf_OutPut("FunReturn: rte_1.SetParagraphSetting(lp_ParaSet,li_Value)=" + String(li_RtnVal),true)
		else
			rte_1.TabBar = true
		end if
	Case 'RTEFUNW16P13'
	/*
	   【功能描述】
	    SetParagraphSetting，从前向后高亮选择多行，whichsetting为RightMargin!

		【编码描述】
		1、初始化控件，tabbar=true,构建控件内容
		2、从前向后高亮选择多行，whichsetting为RightMargin!,有效调用函数
		3、输出函数返回值，GetParagraphSetting输出段落格式

		【代码输出值描述】
		1，RightMargin!
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lp_ParaSet = RightMargin!
			li_Value = 100
			li_RtnVal = rte_1.SetParagraphSetting(lp_ParaSet,li_Value)
			wf_OutPut("FunReturn: rte_1.SetParagraphSetting(lp_ParaSet,li_Value)=" + String(li_RtnVal),true)
		else
			rte_1.TabBar = true
			rte_1.SelectText(1,1,10,1,Detail!)
		end if
	Case 'RTEFUNW16P14'
	/*
	   【功能描述】
	    SetParagraphSetting，从后向前高亮选择多行，whichsetting为RightMargin!

		【编码描述】
		1、初始化控件，tabbar=true,构建控件内容
		2、从后向前高亮选择多行，whichsetting为RightMargin!,有效调用函数
		3、输出函数返回值，GetParagraphSetting输出段落格式

		【代码输出值描述】
		1，RightMargin!
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lp_ParaSet = RightMargin!
			li_Value = 100
			li_RtnVal = rte_1.SetParagraphSetting(lp_ParaSet,li_Value)
			wf_OutPut("FunReturn: rte_1.SetParagraphSetting(lp_ParaSet,li_Value)=" + String(li_RtnVal),true)
		else
			rte_1.TabBar = true
			rte_1.SelectText(10,1,2,1,Detail!)
		end if
	Case 'RTEFUNW16P15'
	/*
	   【功能描述】
	    SetParagraphSetting，value参数为负数

		【编码描述】
		1、初始化控件，tabbar=true,构建控件内容
		2、设置插入点，value参数为负数,有效调用函数
		3、输出函数返回值，GetParagraphSetting输出段落格式

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lp_ParaSet = LeftMargin!
			li_Value = -100
			li_RtnVal = rte_1.SetParagraphSetting(lp_ParaSet,li_Value)
			wf_OutPut("FunReturn: rte_1.SetParagraphSetting(lp_ParaSet,li_Value)=" + String(li_RtnVal),true)
		else
			rte_1.TabBar = true
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW16P16'
	/*
	   【功能描述】
	    SetParagraphSetting，插入点所在行包括图片

		【编码描述】
		1、初始化控件，tabbar=true,构建控件内容
		2、设置插入点，插入点所在行包括图片，有效调用函数
		3、输出函数返回值，GetParagraphSetting输出段落格式

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lp_ParaSet = LeftMargin!
			li_Value = 100
			li_RtnVal = rte_1.SetParagraphSetting(lp_ParaSet,li_Value)
			wf_OutPut("FunReturn: rte_1.SetParagraphSetting(lp_ParaSet,li_Value)=" + String(li_RtnVal),true)
		else
			rte_1.TabBar = true
			wf_data_init(rte_1,4)
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW16P17'
	/*
	   【功能描述】
	    SetParagraphSetting，插入点所在行包括InputField

		【编码描述】
		1、初始化控件，tabbar=true,构建控件内容
		2、设置插入点，插入点所在行包括InputField，有效调用函数
		3、输出函数返回值，GetParagraphSetting输出段落格式

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lp_ParaSet = LeftMargin!
			li_Value = 100
			li_RtnVal = rte_1.SetParagraphSetting(lp_ParaSet,li_Value)
			wf_OutPut("FunReturn: rte_1.SetParagraphSetting(lp_ParaSet,li_Value)=" + String(li_RtnVal),true)
		else
			rte_1.TabBar = true
			wf_data_init(rte_1,4)
			rte_1.InputFieldInsert('WuZhiJun')
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
End Choose
if ab_exe then
	wf_postrun(al_row)
end if
end event

event open;call super::open;n_cst_config  lnv_res

if not lnv_res.of_createFile("PUB_BMP_APB.bmp",gtr_frame) then
	messagebox("提示信息","下载图片失败")
end if







end event

event close;call super::close;if FileExists("PUB_BMP_APB.bmp") then
	FileDelete("PUB_BMP_APB.bmp")
end if
end event

type mle_phenomena from w_templet`mle_phenomena within w_rtefunw16
end type

type cb_autoparse from w_templet`cb_autoparse within w_rtefunw16
end type

type cb_wrrun from w_templet`cb_wrrun within w_rtefunw16
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rtefunw16
end type

type dw_info from w_templet`dw_info within w_rtefunw16
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rtefunw16
end type

type pb_runnext from w_templet`pb_runnext within w_rtefunw16
end type

type pb_runall from w_templet`pb_runall within w_rtefunw16
end type

type pb_run from w_templet`pb_run within w_rtefunw16
end type

type pb_end from w_templet`pb_end within w_rtefunw16
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rtefunw16
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rtefunw16
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rtefunw16
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rtefunw16
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rtefunw16
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rtefunw16
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rtefunw16
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rtefunw16
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rtefunw16
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rtefunw16
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rtefunw16
end type

type rte_1 from richtextedit within w_rtefunw16
integer x = 27
integer y = 32
integer width = 2921
integer height = 1288
integer taborder = 10
boolean bringtotop = true
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_wordwrap = true
boolean init_headerfooter = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;if lb_IsDisplay then
	wf_OutPut("GetFocus event is trigger",true)
end if
end event

