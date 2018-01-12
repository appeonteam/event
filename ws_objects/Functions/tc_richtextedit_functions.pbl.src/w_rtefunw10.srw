$PBExportHeader$w_rtefunw10.srw
forward
global type w_rtefunw10 from w_templet
end type
type rte_1 from richtextedit within w_rtefunw10
end type
end forward

global type w_rtefunw10 from w_templet
integer width = 4677
integer height = 2504
string title = "Function 10"
rte_1 rte_1
end type
global w_rtefunw10 w_rtefunw10

type variables
DataStore 	ids_dw
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

on w_rtefunw10.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rtefunw10.destroy
call super::destroy
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 
将控件内容成功保存到一个文档后或新打开文档后，Modified属性值变为false
***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Functions\Function 10 
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
String		ls_Temp,ls_PageRange,ls_Error
Integer		li_RtnVal,li_Copys
Boolean		lb_RtnVal,lb_PreviewSet,lb_Collate,lb_CancelDig
TrigEvent 	ltr_Event
Long			ll_RtnVal
String		ls_Sql,ls_Syntax

ls_Sql = "SELECT emp_id," + &
				"dep_id," + &
				"emp_code," + &
				"emp_name," + &
				"emp_sex," + &
				"emp_born," + &
				"emp_age," + &
				"emp_salary " + &
			"FROM PUB_T_RICHTEXTEDIT  ;"

if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return
if isnull(ab_exe) then return

if Not ab_exe then
	rte_1.ShowHeadFoot(false)
	wf_data_init(rte_1,4)
end if

Choose Case as_testpoint
	Case 'RTEFUNW10P01'
	/*
	   【功能描述】
	    PostEvent,参数event为NULL值

		【编码描述】
		1、初始化控件
		2、使用字符串NULL值参数,调用函数
		3、输出函数返回值
		

		【代码输出值描述】
		NULL
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(ltr_Event)
			lb_RtnVal = rte_1.PostEvent(ltr_Event)
			wf_OutPut("rte_1: Object.PostEvent(ltr_Event)=" + String(lb_RtnVal),true)
		else
		end if
	Case 'RTEFUNW10P02'
	/*
	   【功能描述】
	    PostEvent,参数使用枚举值

		【编码描述】
		1、初始化控件，所有APB支持的事件中写入信息输出代码
		2、使用枚举值参数PostEvent所有事件
		3、输出函数返回值
		

		【代码输出值描述】
		返回true
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			ltr_Event = RbuttonDown!
			lb_RtnVal = rte_1.PostEvent(ltr_Event)
			wf_OutPut("rte_1: Object.PostEvent(ltr_Event)=" + String(lb_RtnVal),true)
		else
		end if
	Case 'RTEFUNW10P03'
	/*
	   【功能描述】
	    PostEvent,参数使用字符串

		【编码描述】
		1、初始化控件，所有APB支持的事件中写入信息输出代码
		2、使用字符串参数，PostEvent所有事件
		3、输出函数返回值
		

		【代码输出值描述】
		返回true
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lb_RtnVal = rte_1.PostEvent('RbuttonDown')
			wf_OutPut("rte_1: Object.PostEvent('RbuttonDown')=" + String(lb_RtnVal),true)
		else
		end if
	Case 'RTEFUNW10P04'
	/*
	   【功能描述】
	    PostEvent,参数使用无效事件名

		【编码描述】
		1、初始化控件
		2、,参数使用无效事件名，调用PostEvent
		3、输出函数返回值
		

		【代码输出值描述】
		返回false
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lb_RtnVal = rte_1.PostEvent('NoValid')
			wf_OutPut("rte_1: Object.PostEvent('NoValid')=" + String(lb_RtnVal),true)
		else
		end if
	Case 'RTEFUNW10P05'
	/*
	   【功能描述】
	    Preview,参数为NULL

		【编码描述】
		1、初始化控件
		2、,参数为NULL，调用Preview
		3、输出函数返回值
		

		【代码输出值描述】
		返回NULL
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(lb_PreviewSet)
			li_RtnVal = rte_1.Preview(lb_PreviewSet)
			wf_OutPut("FunReturn: rte_1.Preview(lb_PreviewSet)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW10P06'
	/*
	   【功能描述】
	    Preview,参数为true,数据内容只有一页

		【编码描述】
		1、初始化控件，构建一页数据内容
		2、参数为true，调用Preview
		3、输出函数返回值
		

		【代码输出值描述】
		返回1
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lb_PreviewSet = true
			li_RtnVal = rte_1.Preview(lb_PreviewSet)
			wf_OutPut("FunReturn: rte_1.Preview(lb_PreviewSet)=" + String(li_RtnVal),true)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ClipBoard('Series1~t921~tlrzj~r~nSeries2~t600~txiog~r~nSeries3~t784~tliex~r~nSeries4~t569~tzuzo~r~nSeries1~t949~trkru~r~nSeries2~t333~tvojb~r~nSeries3~t527~tzmwz~r~nSeries4~t333~towkj~r~nSeries1~t556~tlefr~r~nSeries2~t744~tamdi~r~nSeries3~t372~tpnpu~r~nSeries4~t851~thgxp~r~nSeries1~t353~tnjwj~r~nSeries2~t402~twaxx~r~nSeries3~t977~tnsnh~r~nSeries4~t624~tlqqr~r~nSeries1~t324~tudlt~r~nSeries2~t399~tzotc~r~nSeries3~t572~ttnzx~r~nSeries4~t458~tglsd~r~nSeries1~t867~tmzcn~r~nSeries2~t860~tckvf~r~nSeries3~t658~tjfrm~r~nSeries4~t560~totho~r~nSeries1~t547~tkbjz~r~nSeries2~t695~tucwl~r~nSeries3~t368~tfrim~r~nSeries4~t331~tmyhc~r~nSeries1~t781~tzriw~r~nSeries2~t752~tbarx~r~nSeries3~t549~tgfcb~r~nSeries4~t572~teyhj~r~nSeries1~t402~tgixw~r~nSeries2~t621~tbvtr~r~nSeries3~t684~thbbc~r~nSeries4~t813~txifb~r~nSeries1~t978~tvfbc~r~nSeries2~t426~tkcfq~r~nSeries3~t812~tkcot~r~nSeries4~t525~tgkub~r~n ')
			rte_1.Paste()
		end if
	Case 'RTEFUNW10P07'
	/*
	   【功能描述】
	    Preview,参数为true,数据内容有多页

		【编码描述】
		1、初始化控件，构建一页数据内容
		2、参数为true，调用Preview
		3、输出函数返回值
		

		【代码输出值描述】
		返回1
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lb_PreviewSet = true
			li_RtnVal = rte_1.Preview(lb_PreviewSet)
			wf_OutPut("FunReturn: rte_1.Preview(lb_PreviewSet)=" + String(li_RtnVal),true)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ClipBoard('Series1~t490~tknfp~r~nSeries2~t843~tycgf~r~nSeries3~t631~teowq~r~nSeries4~t667~twwwp~r~nSeries1~t373~tsqme~r~nSeries2~t515~togep~r~nSeries3~t485~tpxnv~r~nSeries4~t352~tiupa~r~nSeries1~t678~tyynm~r~nSeries2~t604~tmnuv~r~nSeries3~t806~tlhse~r~nSeries4~t344~tdwra~r~nSeries1~t755~tgfmz~r~nSeries2~t792~tgipd~r~nSeries3~t357~todkj~r~nSeries4~t610~tjqwi~r~nSeries1~t407~tpuoq~r~nSeries2~t813~timvf~r~nSeries3~t727~tuzwy~r~nSeries4~t560~tijgf~r~nSeries1~t985~tllkj~r~nSeries2~t812~tuhsj~r~nSeries3~t395~tfbtl~r~nSeries4~t738~tmfqr~r~nSeries1~t977~tyjfj~r~nSeries2~t939~thhss~r~nSeries3~t943~tctyd~r~nSeries4~t858~teamd~r~nSeries1~t767~tjbpr~r~nSeries2~t772~ttneg~r~nSeries3~t442~tiwxg~r~nSeries4~t582~tjwlg~r~nSeries1~t847~tsmea~r~nSeries2~t418~tarwt~r~nSeries3~t446~tjsjb~r~nSeries4~t618~toioj~r~nSeries1~t426~twhyp~r~nSeries2~t808~tvrui~r~nSeries3~t422~toswk~r~nSeries4~t350~tfygt~r~nSeries1~t482~tdhac~r~nSeries2~t618~tyhsg~r~nSeries3~t599~twzmt~r~nSeries4~t498~tonzl~r~nSeries1~t584~tjhga~r~nSeries2~t805~thnih~r~nSeries3~t749~teqgj~r~nSeries4~t312~twkjs~r~nSeries1~t836~ttpjh~r~nSeries2~t931~tefqz~r~nSeries3~t458~tauld~r~nSeries4~t603~tchjc~r~nSeries1~t892~tdyrf~r~nSeries2~t464~tvriv~r~nSeries3~t807~tyeeg~r~nSeries4~t944~tivdr~r~nSeries1~t606~tygur~r~nSeries2~t694~tdred~r~nSeries3~t476~tkubn~r~nSeries4~t320~tgupr~r~nSeries1~t697~tqylo~r~nSeries2~t804~tcwqx~r~nSeries3~t689~tzmau~r~nSeries4~t694~tjgmh~r~nSeries1~t482~tmhgd~r~nSeries2~t318~tmphn~r~nSeries3~t586~tkamh~r~nSeries4~t823~trktr~r~nSeries1~t547~tfacl~r~nSeries2~t870~tgrzk~r~nSeries3~t864~tldac~r~nSeries4~t448~tlteo~r~nSeries1~t343~tomon~r~nSeries2~t880~trqyj~r~nSeries3~t347~tginr~r~nSeries4~t301~tnzwa~r~nSeries1~t536~txxae~r~nSeries2~t431~trwud~r~nSeries3~t561~tzrfu~r~nSeries4~t348~tewjt~r~n ')
			rte_1.Paste()
		end if
	Case 'RTEFUNW10P08'
	/*
	   【功能描述】
	    Preview,参数为false

		【编码描述】
		1、初始化控件，构建一页数据内容，Preview(true)设置控件为Preview状态。
		2、参数为false，调用Preview
		3、输出函数返回值
		

		【代码输出值描述】
		返回1
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lb_PreviewSet = false
			li_RtnVal = rte_1.Preview(lb_PreviewSet)
			wf_OutPut("FunReturn: rte_1.Preview(lb_PreviewSet)=" + String(li_RtnVal),true)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ClipBoard('Series1~t921~tlrzj~r~nSeries2~t600~txiog~r~nSeries3~t784~tliex~r~nSeries4~t569~tzuzo~r~nSeries1~t949~trkru~r~nSeries2~t333~tvojb~r~nSeries3~t527~tzmwz~r~nSeries4~t333~towkj~r~nSeries1~t556~tlefr~r~nSeries2~t744~tamdi~r~nSeries3~t372~tpnpu~r~nSeries4~t851~thgxp~r~nSeries1~t353~tnjwj~r~nSeries2~t402~twaxx~r~nSeries3~t977~tnsnh~r~nSeries4~t624~tlqqr~r~nSeries1~t324~tudlt~r~nSeries2~t399~tzotc~r~nSeries3~t572~ttnzx~r~nSeries4~t458~tglsd~r~nSeries1~t867~tmzcn~r~nSeries2~t860~tckvf~r~nSeries3~t658~tjfrm~r~nSeries4~t560~totho~r~nSeries1~t547~tkbjz~r~nSeries2~t695~tucwl~r~nSeries3~t368~tfrim~r~nSeries4~t331~tmyhc~r~nSeries1~t781~tzriw~r~nSeries2~t752~tbarx~r~nSeries3~t549~tgfcb~r~nSeries4~t572~teyhj~r~nSeries1~t402~tgixw~r~nSeries2~t621~tbvtr~r~nSeries3~t684~thbbc~r~nSeries4~t813~txifb~r~nSeries1~t978~tvfbc~r~nSeries2~t426~tkcfq~r~nSeries3~t812~tkcot~r~nSeries4~t525~tgkub~r~n ')
			rte_1.Paste()
		end if
	Case 'RTEFUNW10P09'
	/*
	   【功能描述】
	    Print,参数copies为NULL

		【编码描述】
		1、初始化控件，构建多页数据内容
		2、参数copies为NULL，其他参数有效，调用Print
		3、输出函数返回值
		

		【代码输出值描述】
		返回NULL
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(li_Copys)
			li_RtnVal = rte_1.Print(li_Copys,'',true,true)
			wf_OutPut("FunReturn: rte_1.Print(li_Copys,'',true,true)=" + String(li_RtnVal),true)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ClipBoard('Series1~t490~tknfp~r~nSeries2~t843~tycgf~r~nSeries3~t631~teowq~r~nSeries4~t667~twwwp~r~nSeries1~t373~tsqme~r~nSeries2~t515~togep~r~nSeries3~t485~tpxnv~r~nSeries4~t352~tiupa~r~nSeries1~t678~tyynm~r~nSeries2~t604~tmnuv~r~nSeries3~t806~tlhse~r~nSeries4~t344~tdwra~r~nSeries1~t755~tgfmz~r~nSeries2~t792~tgipd~r~nSeries3~t357~todkj~r~nSeries4~t610~tjqwi~r~nSeries1~t407~tpuoq~r~nSeries2~t813~timvf~r~nSeries3~t727~tuzwy~r~nSeries4~t560~tijgf~r~nSeries1~t985~tllkj~r~nSeries2~t812~tuhsj~r~nSeries3~t395~tfbtl~r~nSeries4~t738~tmfqr~r~nSeries1~t977~tyjfj~r~nSeries2~t939~thhss~r~nSeries3~t943~tctyd~r~nSeries4~t858~teamd~r~nSeries1~t767~tjbpr~r~nSeries2~t772~ttneg~r~nSeries3~t442~tiwxg~r~nSeries4~t582~tjwlg~r~nSeries1~t847~tsmea~r~nSeries2~t418~tarwt~r~nSeries3~t446~tjsjb~r~nSeries4~t618~toioj~r~nSeries1~t426~twhyp~r~nSeries2~t808~tvrui~r~nSeries3~t422~toswk~r~nSeries4~t350~tfygt~r~nSeries1~t482~tdhac~r~nSeries2~t618~tyhsg~r~nSeries3~t599~twzmt~r~nSeries4~t498~tonzl~r~nSeries1~t584~tjhga~r~nSeries2~t805~thnih~r~nSeries3~t749~teqgj~r~nSeries4~t312~twkjs~r~nSeries1~t836~ttpjh~r~nSeries2~t931~tefqz~r~nSeries3~t458~tauld~r~nSeries4~t603~tchjc~r~nSeries1~t892~tdyrf~r~nSeries2~t464~tvriv~r~nSeries3~t807~tyeeg~r~nSeries4~t944~tivdr~r~nSeries1~t606~tygur~r~nSeries2~t694~tdred~r~nSeries3~t476~tkubn~r~nSeries4~t320~tgupr~r~nSeries1~t697~tqylo~r~nSeries2~t804~tcwqx~r~nSeries3~t689~tzmau~r~nSeries4~t694~tjgmh~r~nSeries1~t482~tmhgd~r~nSeries2~t318~tmphn~r~nSeries3~t586~tkamh~r~nSeries4~t823~trktr~r~nSeries1~t547~tfacl~r~nSeries2~t870~tgrzk~r~nSeries3~t864~tldac~r~nSeries4~t448~tlteo~r~nSeries1~t343~tomon~r~nSeries2~t880~trqyj~r~nSeries3~t347~tginr~r~nSeries4~t301~tnzwa~r~nSeries1~t536~txxae~r~nSeries2~t431~trwud~r~nSeries3~t561~tzrfu~r~nSeries4~t348~tewjt~r~n ')
			rte_1.Paste()
		end if
	Case 'RTEFUNW10P10'
	/*
	   【功能描述】
	    Print,参数pagerange为NULL

		【编码描述】
		1、初始化控件，构建多页数据内容
		2、参数pagerange为NULL，其他参数有效，调用Print
		3、输出函数返回值
		

		【代码输出值描述】
		返回NULL
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(ls_PageRange)
			li_RtnVal = rte_1.Print(1,ls_PageRange,true,true)
			wf_OutPut("FunReturn: rte_1.Print(1,ls_PageRange,true,true)=" + String(li_RtnVal),true)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ClipBoard('Series1~t490~tknfp~r~nSeries2~t843~tycgf~r~nSeries3~t631~teowq~r~nSeries4~t667~twwwp~r~nSeries1~t373~tsqme~r~nSeries2~t515~togep~r~nSeries3~t485~tpxnv~r~nSeries4~t352~tiupa~r~nSeries1~t678~tyynm~r~nSeries2~t604~tmnuv~r~nSeries3~t806~tlhse~r~nSeries4~t344~tdwra~r~nSeries1~t755~tgfmz~r~nSeries2~t792~tgipd~r~nSeries3~t357~todkj~r~nSeries4~t610~tjqwi~r~nSeries1~t407~tpuoq~r~nSeries2~t813~timvf~r~nSeries3~t727~tuzwy~r~nSeries4~t560~tijgf~r~nSeries1~t985~tllkj~r~nSeries2~t812~tuhsj~r~nSeries3~t395~tfbtl~r~nSeries4~t738~tmfqr~r~nSeries1~t977~tyjfj~r~nSeries2~t939~thhss~r~nSeries3~t943~tctyd~r~nSeries4~t858~teamd~r~nSeries1~t767~tjbpr~r~nSeries2~t772~ttneg~r~nSeries3~t442~tiwxg~r~nSeries4~t582~tjwlg~r~nSeries1~t847~tsmea~r~nSeries2~t418~tarwt~r~nSeries3~t446~tjsjb~r~nSeries4~t618~toioj~r~nSeries1~t426~twhyp~r~nSeries2~t808~tvrui~r~nSeries3~t422~toswk~r~nSeries4~t350~tfygt~r~nSeries1~t482~tdhac~r~nSeries2~t618~tyhsg~r~nSeries3~t599~twzmt~r~nSeries4~t498~tonzl~r~nSeries1~t584~tjhga~r~nSeries2~t805~thnih~r~nSeries3~t749~teqgj~r~nSeries4~t312~twkjs~r~nSeries1~t836~ttpjh~r~nSeries2~t931~tefqz~r~nSeries3~t458~tauld~r~nSeries4~t603~tchjc~r~nSeries1~t892~tdyrf~r~nSeries2~t464~tvriv~r~nSeries3~t807~tyeeg~r~nSeries4~t944~tivdr~r~nSeries1~t606~tygur~r~nSeries2~t694~tdred~r~nSeries3~t476~tkubn~r~nSeries4~t320~tgupr~r~nSeries1~t697~tqylo~r~nSeries2~t804~tcwqx~r~nSeries3~t689~tzmau~r~nSeries4~t694~tjgmh~r~nSeries1~t482~tmhgd~r~nSeries2~t318~tmphn~r~nSeries3~t586~tkamh~r~nSeries4~t823~trktr~r~nSeries1~t547~tfacl~r~nSeries2~t870~tgrzk~r~nSeries3~t864~tldac~r~nSeries4~t448~tlteo~r~nSeries1~t343~tomon~r~nSeries2~t880~trqyj~r~nSeries3~t347~tginr~r~nSeries4~t301~tnzwa~r~nSeries1~t536~txxae~r~nSeries2~t431~trwud~r~nSeries3~t561~tzrfu~r~nSeries4~t348~tewjt~r~n ')
			rte_1.Paste()
		end if
	Case 'RTEFUNW10P11'
	/*
	   【功能描述】
	    Print,参数collate为NULL

		【编码描述】
		1、初始化控件，构建多页数据内容
		2、参数collate为NULL，其他参数有效，调用Print
		3、输出函数返回值
		

		【代码输出值描述】
		返回NULL
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(lb_Collate)
			li_RtnVal = rte_1.Print(1,'',lb_Collate,true)
			wf_OutPut("FunReturn: rte_1.Print(1,'',lb_Collate,true)=" + String(li_RtnVal),true)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ClipBoard('Series1~t490~tknfp~r~nSeries2~t843~tycgf~r~nSeries3~t631~teowq~r~nSeries4~t667~twwwp~r~nSeries1~t373~tsqme~r~nSeries2~t515~togep~r~nSeries3~t485~tpxnv~r~nSeries4~t352~tiupa~r~nSeries1~t678~tyynm~r~nSeries2~t604~tmnuv~r~nSeries3~t806~tlhse~r~nSeries4~t344~tdwra~r~nSeries1~t755~tgfmz~r~nSeries2~t792~tgipd~r~nSeries3~t357~todkj~r~nSeries4~t610~tjqwi~r~nSeries1~t407~tpuoq~r~nSeries2~t813~timvf~r~nSeries3~t727~tuzwy~r~nSeries4~t560~tijgf~r~nSeries1~t985~tllkj~r~nSeries2~t812~tuhsj~r~nSeries3~t395~tfbtl~r~nSeries4~t738~tmfqr~r~nSeries1~t977~tyjfj~r~nSeries2~t939~thhss~r~nSeries3~t943~tctyd~r~nSeries4~t858~teamd~r~nSeries1~t767~tjbpr~r~nSeries2~t772~ttneg~r~nSeries3~t442~tiwxg~r~nSeries4~t582~tjwlg~r~nSeries1~t847~tsmea~r~nSeries2~t418~tarwt~r~nSeries3~t446~tjsjb~r~nSeries4~t618~toioj~r~nSeries1~t426~twhyp~r~nSeries2~t808~tvrui~r~nSeries3~t422~toswk~r~nSeries4~t350~tfygt~r~nSeries1~t482~tdhac~r~nSeries2~t618~tyhsg~r~nSeries3~t599~twzmt~r~nSeries4~t498~tonzl~r~nSeries1~t584~tjhga~r~nSeries2~t805~thnih~r~nSeries3~t749~teqgj~r~nSeries4~t312~twkjs~r~nSeries1~t836~ttpjh~r~nSeries2~t931~tefqz~r~nSeries3~t458~tauld~r~nSeries4~t603~tchjc~r~nSeries1~t892~tdyrf~r~nSeries2~t464~tvriv~r~nSeries3~t807~tyeeg~r~nSeries4~t944~tivdr~r~nSeries1~t606~tygur~r~nSeries2~t694~tdred~r~nSeries3~t476~tkubn~r~nSeries4~t320~tgupr~r~nSeries1~t697~tqylo~r~nSeries2~t804~tcwqx~r~nSeries3~t689~tzmau~r~nSeries4~t694~tjgmh~r~nSeries1~t482~tmhgd~r~nSeries2~t318~tmphn~r~nSeries3~t586~tkamh~r~nSeries4~t823~trktr~r~nSeries1~t547~tfacl~r~nSeries2~t870~tgrzk~r~nSeries3~t864~tldac~r~nSeries4~t448~tlteo~r~nSeries1~t343~tomon~r~nSeries2~t880~trqyj~r~nSeries3~t347~tginr~r~nSeries4~t301~tnzwa~r~nSeries1~t536~txxae~r~nSeries2~t431~trwud~r~nSeries3~t561~tzrfu~r~nSeries4~t348~tewjt~r~n ')
			rte_1.Paste()
		end if
	Case 'RTEFUNW10P12'
	/*
	   【功能描述】
	    Print,参数canceldialog为NULL

		【编码描述】
		1、初始化控件，构建多页数据内容
		2、参数canceldialog为NULL，其他参数有效，调用Print
		3、输出函数返回值
		

		【代码输出值描述】
		返回NULL
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(lb_CancelDig)
			li_RtnVal = rte_1.Print(1,'',true,lb_CancelDig)
			wf_OutPut("FunReturn: rte_1.Print(1,'',true,lb_CancelDig)=" + String(li_RtnVal),true)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ClipBoard('Series1~t490~tknfp~r~nSeries2~t843~tycgf~r~nSeries3~t631~teowq~r~nSeries4~t667~twwwp~r~nSeries1~t373~tsqme~r~nSeries2~t515~togep~r~nSeries3~t485~tpxnv~r~nSeries4~t352~tiupa~r~nSeries1~t678~tyynm~r~nSeries2~t604~tmnuv~r~nSeries3~t806~tlhse~r~nSeries4~t344~tdwra~r~nSeries1~t755~tgfmz~r~nSeries2~t792~tgipd~r~nSeries3~t357~todkj~r~nSeries4~t610~tjqwi~r~nSeries1~t407~tpuoq~r~nSeries2~t813~timvf~r~nSeries3~t727~tuzwy~r~nSeries4~t560~tijgf~r~nSeries1~t985~tllkj~r~nSeries2~t812~tuhsj~r~nSeries3~t395~tfbtl~r~nSeries4~t738~tmfqr~r~nSeries1~t977~tyjfj~r~nSeries2~t939~thhss~r~nSeries3~t943~tctyd~r~nSeries4~t858~teamd~r~nSeries1~t767~tjbpr~r~nSeries2~t772~ttneg~r~nSeries3~t442~tiwxg~r~nSeries4~t582~tjwlg~r~nSeries1~t847~tsmea~r~nSeries2~t418~tarwt~r~nSeries3~t446~tjsjb~r~nSeries4~t618~toioj~r~nSeries1~t426~twhyp~r~nSeries2~t808~tvrui~r~nSeries3~t422~toswk~r~nSeries4~t350~tfygt~r~nSeries1~t482~tdhac~r~nSeries2~t618~tyhsg~r~nSeries3~t599~twzmt~r~nSeries4~t498~tonzl~r~nSeries1~t584~tjhga~r~nSeries2~t805~thnih~r~nSeries3~t749~teqgj~r~nSeries4~t312~twkjs~r~nSeries1~t836~ttpjh~r~nSeries2~t931~tefqz~r~nSeries3~t458~tauld~r~nSeries4~t603~tchjc~r~nSeries1~t892~tdyrf~r~nSeries2~t464~tvriv~r~nSeries3~t807~tyeeg~r~nSeries4~t944~tivdr~r~nSeries1~t606~tygur~r~nSeries2~t694~tdred~r~nSeries3~t476~tkubn~r~nSeries4~t320~tgupr~r~nSeries1~t697~tqylo~r~nSeries2~t804~tcwqx~r~nSeries3~t689~tzmau~r~nSeries4~t694~tjgmh~r~nSeries1~t482~tmhgd~r~nSeries2~t318~tmphn~r~nSeries3~t586~tkamh~r~nSeries4~t823~trktr~r~nSeries1~t547~tfacl~r~nSeries2~t870~tgrzk~r~nSeries3~t864~tldac~r~nSeries4~t448~tlteo~r~nSeries1~t343~tomon~r~nSeries2~t880~trqyj~r~nSeries3~t347~tginr~r~nSeries4~t301~tnzwa~r~nSeries1~t536~txxae~r~nSeries2~t431~trwud~r~nSeries3~t561~tzrfu~r~nSeries4~t348~tewjt~r~n ')
			rte_1.Paste()
		end if
	Case 'RTEFUNW10P13'
	/*
	   【功能描述】
	    Print,copies=2,Pagerange="1-3",collate=false,Canceldialog=false

		【编码描述】
		1、初始化控件，构建4页数据内容
		2、指定copies=2,Pagerange="1-3",collate=false,Canceldialog=false，调用Print
		3、输出函数返回值
		

		【代码输出值描述】
		返回1
		
		【期望UI描述】
		连续打印两份
	*/
		
		if ab_exe then
			li_RtnVal = rte_1.Print(2,'1-3',false,false)
			wf_OutPut("FunReturn: rte_1.Print(2,'1-3',false,false)=" + String(li_RtnVal),true)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ClipBoard('Series1~t452~tnbec~r~nSeries2~t845~tbcjp~r~nSeries3~t514~tyjli~r~nSeries4~t436~titll~r~nSeries1~t756~tlxel~r~nSeries2~t431~tdkex~r~nSeries3~t941~ttquv~r~nSeries4~t853~tttey~r~nSeries1~t632~ttlql~r~nSeries2~t711~tbbvo~r~nSeries3~t608~tozky~r~nSeries4~t358~tayyr~r~nSeries1~t303~taqmy~r~nSeries2~t581~thzxn~r~nSeries3~t749~tsiyf~r~nSeries4~t542~texwb~r~nSeries1~t433~toewq~r~nSeries2~t696~tqrtc~r~nSeries3~t344~tlpqm~r~nSeries4~t416~tjifv~r~nSeries1~t728~tymkg~r~nSeries2~t869~ttzjm~r~nSeries3~t749~tzqtm~r~nSeries4~t707~tpnde~r~nSeries1~t808~tnmth~r~nSeries2~t963~titss~r~nSeries3~t619~taqnj~r~nSeries4~t892~tdoyj~r~nSeries1~t491~tpyat~r~nSeries2~t320~tleyq~r~nSeries3~t771~tvkpa~r~nSeries4~t541~tsvbm~r~nSeries1~t593~txrll~r~nSeries2~t336~tvfed~r~nSeries3~t608~tjiga~r~nSeries4~t379~tyxjv~r~nSeries1~t500~tqvrb~r~nSeries2~t537~tcuig~r~nSeries3~t746~tipyh~r~nSeries4~t565~tbxip~r~nSeries1~t990~tzncw~r~nSeries2~t636~trbli~r~nSeries3~t929~tizxo~r~nSeries4~t742~tptqq~r~nSeries1~t815~teaaf~r~nSeries2~t324~teqio~r~nSeries3~t888~tpyfa~r~nSeries4~t414~tuqmv~r~nSeries1~t975~txkmn~r~nSeries2~t375~tmsya~r~nSeries3~t822~tptlz~r~nSeries4~t876~tnotl~r~nSeries1~t310~tlwuh~r~nSeries2~t744~tfqjr~r~nSeries3~t798~twbwh~r~nSeries4~t368~tqhzk~r~nSeries1~t861~tdkcr~r~nSeries2~t974~tvbei~r~nSeries3~t593~tipvf~r~nSeries4~t740~tpzhy~r~nSeries1~t336~tjabt~r~nSeries2~t562~twwtb~r~nSeries3~t648~tdogk~r~nSeries4~t657~tmhib~r~nSeries1~t635~txrnx~r~nSeries2~t955~txrzl~r~nSeries3~t501~ttbqe~r~nSeries4~t358~tkrqo~r~nSeries1~t495~terna~r~nSeries2~t384~tlqyj~r~nSeries3~t592~tqoub~r~nSeries4~t515~tjseb~r~nSeries1~t511~tlwnk~r~nSeries2~t515~tvloi~r~nSeries3~t689~tzfpi~r~nSeries4~t978~twycz~r~nSeries1~t492~twzzv~r~nSeries2~t881~twxot~r~nSeries3~t356~tkudk~r~nSeries4~t593~tedup~r~nSeries1~t429~tczlh~r~nSeries2~t950~tuskd~r~nSeries3~t735~tevdc~r~nSeries4~t704~tlbkl~r~nSeries1~t430~tjmpf~r~nSeries2~t900~tcyqt~r~nSeries3~t675~tcvvv~r~nSeries4~t374~trffv~r~nSeries1~t587~tekkq~r~nSeries2~t760~tcupr~r~nSeries3~t419~tjaut~r~nSeries4~t699~tuvcz~r~nSeries1~t692~ticth~r~nSeries2~t917~txsxc~r~nSeries3~t569~tprgd~r~nSeries4~t559~twxfa~r~nSeries1~t707~tgayr~r~nSeries2~t473~teicu~r~nSeries3~t812~tdiam~r~nSeries4~t945~ttkbx~r~nSeries1~t425~ttdir~r~nSeries2~t745~txgvz~r~nSeries3~t673~tmeyr~r~nSeries4~t611~tvfic~r~nSeries1~t699~tqniv~r~nSeries2~t630~tjzau~r~nSeries3~t784~tfdft~r~nSeries4~t451~tmops~r~nSeries1~t381~tgpug~r~nSeries2~t845~ttuhl~r~nSeries3~t817~tvspi~r~nSeries4~t914~tazrs~r~nSeries1~t592~tfszw~r~nSeries2~t952~tbqmu~r~nSeries3~t498~twmxc~r~nSeries4~t502~tbhum~r~nSeries1~t995~tgjqm~r~nSeries2~t877~tnkyr~r~nSeries3~t330~tnsjv~r~nSeries4~t980~tzxss~r~nSeries1~t616~txnjo~r~nSeries2~t566~tuyjn~r~nSeries3~t872~tuwrs~r~nSeries4~t608~txwqy~r~nSeries1~t794~txcsz~r~nSeries2~t946~toklw~r~nSeries3~t649~tdrlt~r~nSeries4~t870~tscie~r~nSeries1~t409~tpiwl~r~nSeries2~t628~tqige~r~nSeries3~t353~tjsqh~r~nSeries4~t310~tjlrg~r~nSeries1~t927~tmwan~r~nSeries2~t462~txrfn~r~nSeries3~t696~takzt~r~nSeries4~t917~tjhxa~r~nSeries1~t429~tnfqj~r~nSeries2~t309~txioh~r~nSeries3~t825~tjqrj~r~nSeries4~t350~thymd~r~nSeries1~t542~tvwge~r~nSeries2~t760~thjes~r~nSeries3~t826~thtiz~r~nSeries4~t666~tojlj~r~nSeries1~t613~tpmox~r~nSeries2~t941~tyuyo~r~nSeries3~t838~tqjkz~r~nSeries4~t755~tvjgk~r~nSeries1~t930~txkew~r~nSeries2~t414~tzhbj~r~nSeries3~t971~tuths~r~nSeries4~t483~toefj~r~nSeries1~t869~twwye~r~nSeries2~t381~tzluh~r~nSeries3~t756~tgabb~r~nSeries4~t906~tqrhc~r~nSeries1~t324~ttxmj~r~nSeries2~t590~tcaxx~r~nSeries3~t683~tufah~r~nSeries4~t593~tyayz~r~nSeries1~t899~thuhj~r~nSeries2~t980~tjsvo~r~nSeries3~t526~thtyd~r~nSeries4~t370~tpbsz~r~nSeries1~t628~tsbzi~r~nSeries2~t857~trvgq~r~nSeries3~t922~tlunw~r~nSeries4~t943~tcpir~r~nSeries1~t847~tfcbt~r~nSeries2~t563~teplk~r~nSeries3~t732~twfkh~r~nSeries4~t525~touoy~r~nSeries1~t963~trwmq~r~nSeries2~t485~tjahy~r~nSeries3~t550~tmfev~r~nSeries4~t867~tdcom~r~nSeries1~t872~tyhgd~r~nSeries2~t356~tlxuk~r~nSeries3~t314~tyzcp~r~nSeries4~t605~tskwg~r~nSeries1~t828~tulsu~r~nSeries2~t836~tkbse~r~nSeries3~t870~tjeis~r~nSeries4~t647~tsgce~r~nSeries1~t738~twapq~r~nSeries2~t836~tvlwi~r~nSeries3~t928~trovj~r~nSeries4~t853~tdzxx~r~nSeries1~t783~thqls~r~nSeries2~t675~tzihm~r~nSeries3~t334~tzrio~r~nSeries4~t997~trqet~r~nSeries1~t899~tzfbl~r~nSeries2~t669~tjiem~r~nSeries3~t748~tfzbh~r~nSeries4~t822~tfnwy~r~nSeries1~t508~tmxxg~r~nSeries2~t993~tpylr~r~nSeries3~t782~txglm~r~nSeries4~t865~tbiyl~r~nSeries1~t634~thcwh~r~nSeries2~t402~tsyoy~r~nSeries3~t897~tgmgo~r~nSeries4~t530~tprza~r~nSeries1~t471~tqmom~r~nSeries2~t588~tyhga~r~nSeries3~t893~tiupj~r~nSeries4~t916~tbzxt~r~nSeries1~t339~ttopo~r~nSeries2~t841~tmitn~r~nSeries3~t958~twtoe~r~nSeries4~t647~tonxw~r~nSeries1~t656~tghut~r~nSeries2~t507~tfklg~r~nSeries3~t616~tlrnu~r~nSeries4~t415~tkmsy~r~nSeries1~t830~tcpui~r~nSeries2~t904~tahqa~r~nSeries3~t617~tmsck~r~nSeries4~t834~taalk~r~nSeries1~t439~tcsnx~r~nSeries2~t302~tcovt~r~nSeries3~t700~tkrxa~r~nSeries4~t330~tzadj~r~nSeries1~t331~twxqm~r~nSeries2~t861~tdhld~r~nSeries3~t744~ttxsk~r~nSeries4~t724~txtez~r~nSeries1~t402~tjsqt~r~nSeries2~t996~tbccf~r~nSeries3~t800~tmwhb~r~nSeries4~t836~tssii~r~nSeries1~t402~tvijs~r~nSeries2~t521~txiic~r~nSeries3~t967~tahmk~r~nSeries4~t861~tywtt~r~nSeries1~t440~tzppk~r~nSeries2~t615~tlbmj~r~nSeries3~t882~thtpu~r~nSeries4~t371~tiebp~r~nSeries1~t784~tbmue~r~nSeries2~t460~tyrhl~r~nSeries3~t712~thxwg~r~nSeries4~t326~tprwv~r~nSeries1~t652~tshzy~r~nSeries2~t796~tvqye~r~nSeries3~t311~tztoz~r~nSeries4~t634~tabna~r~nSeries1~t704~thrrb~r~nSeries2~t540~tdndo~r~nSeries3~t928~txeui~r~nSeries4~t576~tzioi~r~nSeries1~t435~tozxq~r~nSeries2~t325~tihwa~r~nSeries3~t826~troqr~r~nSeries4~t325~tqwcv~r~nSeries1~t527~txzip~r~nSeries2~t560~tdiis~r~nSeries3~t878~tqnzo~r~nSeries4~t419~tcwva~r~n ')
			rte_1.Paste()
		end if
	Case 'RTEFUNW10P14'
	/*
	   【功能描述】
	    Print,copies=2,Pagerange="1,2-4",collate=true,Canceldialog=false

		【编码描述】
		1、初始化控件，构建4页数据内容
		2、指定copies=2,Pagerange="1,2-4",collate=true,Canceldialog=false，调用Print
		3、输出函数返回值
		

		【代码输出值描述】
		返回1
		
		【期望UI描述】
		逐份打印1,2-4页
	*/
		
		if ab_exe then
			li_RtnVal = rte_1.Print(2,'1,2-4',true,false)
			wf_OutPut("FunReturn: rte_1.Print(2,'1,2-4',true,false)=" + String(li_RtnVal),true)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ClipBoard('Series1~t452~tnbec~r~nSeries2~t845~tbcjp~r~nSeries3~t514~tyjli~r~nSeries4~t436~titll~r~nSeries1~t756~tlxel~r~nSeries2~t431~tdkex~r~nSeries3~t941~ttquv~r~nSeries4~t853~tttey~r~nSeries1~t632~ttlql~r~nSeries2~t711~tbbvo~r~nSeries3~t608~tozky~r~nSeries4~t358~tayyr~r~nSeries1~t303~taqmy~r~nSeries2~t581~thzxn~r~nSeries3~t749~tsiyf~r~nSeries4~t542~texwb~r~nSeries1~t433~toewq~r~nSeries2~t696~tqrtc~r~nSeries3~t344~tlpqm~r~nSeries4~t416~tjifv~r~nSeries1~t728~tymkg~r~nSeries2~t869~ttzjm~r~nSeries3~t749~tzqtm~r~nSeries4~t707~tpnde~r~nSeries1~t808~tnmth~r~nSeries2~t963~titss~r~nSeries3~t619~taqnj~r~nSeries4~t892~tdoyj~r~nSeries1~t491~tpyat~r~nSeries2~t320~tleyq~r~nSeries3~t771~tvkpa~r~nSeries4~t541~tsvbm~r~nSeries1~t593~txrll~r~nSeries2~t336~tvfed~r~nSeries3~t608~tjiga~r~nSeries4~t379~tyxjv~r~nSeries1~t500~tqvrb~r~nSeries2~t537~tcuig~r~nSeries3~t746~tipyh~r~nSeries4~t565~tbxip~r~nSeries1~t990~tzncw~r~nSeries2~t636~trbli~r~nSeries3~t929~tizxo~r~nSeries4~t742~tptqq~r~nSeries1~t815~teaaf~r~nSeries2~t324~teqio~r~nSeries3~t888~tpyfa~r~nSeries4~t414~tuqmv~r~nSeries1~t975~txkmn~r~nSeries2~t375~tmsya~r~nSeries3~t822~tptlz~r~nSeries4~t876~tnotl~r~nSeries1~t310~tlwuh~r~nSeries2~t744~tfqjr~r~nSeries3~t798~twbwh~r~nSeries4~t368~tqhzk~r~nSeries1~t861~tdkcr~r~nSeries2~t974~tvbei~r~nSeries3~t593~tipvf~r~nSeries4~t740~tpzhy~r~nSeries1~t336~tjabt~r~nSeries2~t562~twwtb~r~nSeries3~t648~tdogk~r~nSeries4~t657~tmhib~r~nSeries1~t635~txrnx~r~nSeries2~t955~txrzl~r~nSeries3~t501~ttbqe~r~nSeries4~t358~tkrqo~r~nSeries1~t495~terna~r~nSeries2~t384~tlqyj~r~nSeries3~t592~tqoub~r~nSeries4~t515~tjseb~r~nSeries1~t511~tlwnk~r~nSeries2~t515~tvloi~r~nSeries3~t689~tzfpi~r~nSeries4~t978~twycz~r~nSeries1~t492~twzzv~r~nSeries2~t881~twxot~r~nSeries3~t356~tkudk~r~nSeries4~t593~tedup~r~nSeries1~t429~tczlh~r~nSeries2~t950~tuskd~r~nSeries3~t735~tevdc~r~nSeries4~t704~tlbkl~r~nSeries1~t430~tjmpf~r~nSeries2~t900~tcyqt~r~nSeries3~t675~tcvvv~r~nSeries4~t374~trffv~r~nSeries1~t587~tekkq~r~nSeries2~t760~tcupr~r~nSeries3~t419~tjaut~r~nSeries4~t699~tuvcz~r~nSeries1~t692~ticth~r~nSeries2~t917~txsxc~r~nSeries3~t569~tprgd~r~nSeries4~t559~twxfa~r~nSeries1~t707~tgayr~r~nSeries2~t473~teicu~r~nSeries3~t812~tdiam~r~nSeries4~t945~ttkbx~r~nSeries1~t425~ttdir~r~nSeries2~t745~txgvz~r~nSeries3~t673~tmeyr~r~nSeries4~t611~tvfic~r~nSeries1~t699~tqniv~r~nSeries2~t630~tjzau~r~nSeries3~t784~tfdft~r~nSeries4~t451~tmops~r~nSeries1~t381~tgpug~r~nSeries2~t845~ttuhl~r~nSeries3~t817~tvspi~r~nSeries4~t914~tazrs~r~nSeries1~t592~tfszw~r~nSeries2~t952~tbqmu~r~nSeries3~t498~twmxc~r~nSeries4~t502~tbhum~r~nSeries1~t995~tgjqm~r~nSeries2~t877~tnkyr~r~nSeries3~t330~tnsjv~r~nSeries4~t980~tzxss~r~nSeries1~t616~txnjo~r~nSeries2~t566~tuyjn~r~nSeries3~t872~tuwrs~r~nSeries4~t608~txwqy~r~nSeries1~t794~txcsz~r~nSeries2~t946~toklw~r~nSeries3~t649~tdrlt~r~nSeries4~t870~tscie~r~nSeries1~t409~tpiwl~r~nSeries2~t628~tqige~r~nSeries3~t353~tjsqh~r~nSeries4~t310~tjlrg~r~nSeries1~t927~tmwan~r~nSeries2~t462~txrfn~r~nSeries3~t696~takzt~r~nSeries4~t917~tjhxa~r~nSeries1~t429~tnfqj~r~nSeries2~t309~txioh~r~nSeries3~t825~tjqrj~r~nSeries4~t350~thymd~r~nSeries1~t542~tvwge~r~nSeries2~t760~thjes~r~nSeries3~t826~thtiz~r~nSeries4~t666~tojlj~r~nSeries1~t613~tpmox~r~nSeries2~t941~tyuyo~r~nSeries3~t838~tqjkz~r~nSeries4~t755~tvjgk~r~nSeries1~t930~txkew~r~nSeries2~t414~tzhbj~r~nSeries3~t971~tuths~r~nSeries4~t483~toefj~r~nSeries1~t869~twwye~r~nSeries2~t381~tzluh~r~nSeries3~t756~tgabb~r~nSeries4~t906~tqrhc~r~nSeries1~t324~ttxmj~r~nSeries2~t590~tcaxx~r~nSeries3~t683~tufah~r~nSeries4~t593~tyayz~r~nSeries1~t899~thuhj~r~nSeries2~t980~tjsvo~r~nSeries3~t526~thtyd~r~nSeries4~t370~tpbsz~r~nSeries1~t628~tsbzi~r~nSeries2~t857~trvgq~r~nSeries3~t922~tlunw~r~nSeries4~t943~tcpir~r~nSeries1~t847~tfcbt~r~nSeries2~t563~teplk~r~nSeries3~t732~twfkh~r~nSeries4~t525~touoy~r~nSeries1~t963~trwmq~r~nSeries2~t485~tjahy~r~nSeries3~t550~tmfev~r~nSeries4~t867~tdcom~r~nSeries1~t872~tyhgd~r~nSeries2~t356~tlxuk~r~nSeries3~t314~tyzcp~r~nSeries4~t605~tskwg~r~nSeries1~t828~tulsu~r~nSeries2~t836~tkbse~r~nSeries3~t870~tjeis~r~nSeries4~t647~tsgce~r~nSeries1~t738~twapq~r~nSeries2~t836~tvlwi~r~nSeries3~t928~trovj~r~nSeries4~t853~tdzxx~r~nSeries1~t783~thqls~r~nSeries2~t675~tzihm~r~nSeries3~t334~tzrio~r~nSeries4~t997~trqet~r~nSeries1~t899~tzfbl~r~nSeries2~t669~tjiem~r~nSeries3~t748~tfzbh~r~nSeries4~t822~tfnwy~r~nSeries1~t508~tmxxg~r~nSeries2~t993~tpylr~r~nSeries3~t782~txglm~r~nSeries4~t865~tbiyl~r~nSeries1~t634~thcwh~r~nSeries2~t402~tsyoy~r~nSeries3~t897~tgmgo~r~nSeries4~t530~tprza~r~nSeries1~t471~tqmom~r~nSeries2~t588~tyhga~r~nSeries3~t893~tiupj~r~nSeries4~t916~tbzxt~r~nSeries1~t339~ttopo~r~nSeries2~t841~tmitn~r~nSeries3~t958~twtoe~r~nSeries4~t647~tonxw~r~nSeries1~t656~tghut~r~nSeries2~t507~tfklg~r~nSeries3~t616~tlrnu~r~nSeries4~t415~tkmsy~r~nSeries1~t830~tcpui~r~nSeries2~t904~tahqa~r~nSeries3~t617~tmsck~r~nSeries4~t834~taalk~r~nSeries1~t439~tcsnx~r~nSeries2~t302~tcovt~r~nSeries3~t700~tkrxa~r~nSeries4~t330~tzadj~r~nSeries1~t331~twxqm~r~nSeries2~t861~tdhld~r~nSeries3~t744~ttxsk~r~nSeries4~t724~txtez~r~nSeries1~t402~tjsqt~r~nSeries2~t996~tbccf~r~nSeries3~t800~tmwhb~r~nSeries4~t836~tssii~r~nSeries1~t402~tvijs~r~nSeries2~t521~txiic~r~nSeries3~t967~tahmk~r~nSeries4~t861~tywtt~r~nSeries1~t440~tzppk~r~nSeries2~t615~tlbmj~r~nSeries3~t882~thtpu~r~nSeries4~t371~tiebp~r~nSeries1~t784~tbmue~r~nSeries2~t460~tyrhl~r~nSeries3~t712~thxwg~r~nSeries4~t326~tprwv~r~nSeries1~t652~tshzy~r~nSeries2~t796~tvqye~r~nSeries3~t311~tztoz~r~nSeries4~t634~tabna~r~nSeries1~t704~thrrb~r~nSeries2~t540~tdndo~r~nSeries3~t928~txeui~r~nSeries4~t576~tzioi~r~nSeries1~t435~tozxq~r~nSeries2~t325~tihwa~r~nSeries3~t826~troqr~r~nSeries4~t325~tqwcv~r~nSeries1~t527~txzip~r~nSeries2~t560~tdiis~r~nSeries3~t878~tqnzo~r~nSeries4~t419~tcwva~r~n ')
			rte_1.Paste()
		end if
	Case 'RTEFUNW10P15'
	/*
	   【功能描述】
	    Print,copies=2,Pagerange="",collate=false,Canceldialog=true

		【编码描述】
		1、初始化控件，构建4页数据内容
		2、指定copies=2,Pagerange="",collate=false,Canceldialog=true，调用Print
		3、输出函数返回值
		

		【代码输出值描述】
		返回1
		
		【期望UI描述】
		显示一个取消打印操作对话框，不取消则打印所有页
	*/
		
		if ab_exe then
			li_RtnVal = rte_1.Print(2,'',false,true)
			wf_OutPut("FunReturn: rte_1.Print(2,'',false,true)=" + String(li_RtnVal),true)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ClipBoard('Series1~t452~tnbec~r~nSeries2~t845~tbcjp~r~nSeries3~t514~tyjli~r~nSeries4~t436~titll~r~nSeries1~t756~tlxel~r~nSeries2~t431~tdkex~r~nSeries3~t941~ttquv~r~nSeries4~t853~tttey~r~nSeries1~t632~ttlql~r~nSeries2~t711~tbbvo~r~nSeries3~t608~tozky~r~nSeries4~t358~tayyr~r~nSeries1~t303~taqmy~r~nSeries2~t581~thzxn~r~nSeries3~t749~tsiyf~r~nSeries4~t542~texwb~r~nSeries1~t433~toewq~r~nSeries2~t696~tqrtc~r~nSeries3~t344~tlpqm~r~nSeries4~t416~tjifv~r~nSeries1~t728~tymkg~r~nSeries2~t869~ttzjm~r~nSeries3~t749~tzqtm~r~nSeries4~t707~tpnde~r~nSeries1~t808~tnmth~r~nSeries2~t963~titss~r~nSeries3~t619~taqnj~r~nSeries4~t892~tdoyj~r~nSeries1~t491~tpyat~r~nSeries2~t320~tleyq~r~nSeries3~t771~tvkpa~r~nSeries4~t541~tsvbm~r~nSeries1~t593~txrll~r~nSeries2~t336~tvfed~r~nSeries3~t608~tjiga~r~nSeries4~t379~tyxjv~r~nSeries1~t500~tqvrb~r~nSeries2~t537~tcuig~r~nSeries3~t746~tipyh~r~nSeries4~t565~tbxip~r~nSeries1~t990~tzncw~r~nSeries2~t636~trbli~r~nSeries3~t929~tizxo~r~nSeries4~t742~tptqq~r~nSeries1~t815~teaaf~r~nSeries2~t324~teqio~r~nSeries3~t888~tpyfa~r~nSeries4~t414~tuqmv~r~nSeries1~t975~txkmn~r~nSeries2~t375~tmsya~r~nSeries3~t822~tptlz~r~nSeries4~t876~tnotl~r~nSeries1~t310~tlwuh~r~nSeries2~t744~tfqjr~r~nSeries3~t798~twbwh~r~nSeries4~t368~tqhzk~r~nSeries1~t861~tdkcr~r~nSeries2~t974~tvbei~r~nSeries3~t593~tipvf~r~nSeries4~t740~tpzhy~r~nSeries1~t336~tjabt~r~nSeries2~t562~twwtb~r~nSeries3~t648~tdogk~r~nSeries4~t657~tmhib~r~nSeries1~t635~txrnx~r~nSeries2~t955~txrzl~r~nSeries3~t501~ttbqe~r~nSeries4~t358~tkrqo~r~nSeries1~t495~terna~r~nSeries2~t384~tlqyj~r~nSeries3~t592~tqoub~r~nSeries4~t515~tjseb~r~nSeries1~t511~tlwnk~r~nSeries2~t515~tvloi~r~nSeries3~t689~tzfpi~r~nSeries4~t978~twycz~r~nSeries1~t492~twzzv~r~nSeries2~t881~twxot~r~nSeries3~t356~tkudk~r~nSeries4~t593~tedup~r~nSeries1~t429~tczlh~r~nSeries2~t950~tuskd~r~nSeries3~t735~tevdc~r~nSeries4~t704~tlbkl~r~nSeries1~t430~tjmpf~r~nSeries2~t900~tcyqt~r~nSeries3~t675~tcvvv~r~nSeries4~t374~trffv~r~nSeries1~t587~tekkq~r~nSeries2~t760~tcupr~r~nSeries3~t419~tjaut~r~nSeries4~t699~tuvcz~r~nSeries1~t692~ticth~r~nSeries2~t917~txsxc~r~nSeries3~t569~tprgd~r~nSeries4~t559~twxfa~r~nSeries1~t707~tgayr~r~nSeries2~t473~teicu~r~nSeries3~t812~tdiam~r~nSeries4~t945~ttkbx~r~nSeries1~t425~ttdir~r~nSeries2~t745~txgvz~r~nSeries3~t673~tmeyr~r~nSeries4~t611~tvfic~r~nSeries1~t699~tqniv~r~nSeries2~t630~tjzau~r~nSeries3~t784~tfdft~r~nSeries4~t451~tmops~r~nSeries1~t381~tgpug~r~nSeries2~t845~ttuhl~r~nSeries3~t817~tvspi~r~nSeries4~t914~tazrs~r~nSeries1~t592~tfszw~r~nSeries2~t952~tbqmu~r~nSeries3~t498~twmxc~r~nSeries4~t502~tbhum~r~nSeries1~t995~tgjqm~r~nSeries2~t877~tnkyr~r~nSeries3~t330~tnsjv~r~nSeries4~t980~tzxss~r~nSeries1~t616~txnjo~r~nSeries2~t566~tuyjn~r~nSeries3~t872~tuwrs~r~nSeries4~t608~txwqy~r~nSeries1~t794~txcsz~r~nSeries2~t946~toklw~r~nSeries3~t649~tdrlt~r~nSeries4~t870~tscie~r~nSeries1~t409~tpiwl~r~nSeries2~t628~tqige~r~nSeries3~t353~tjsqh~r~nSeries4~t310~tjlrg~r~nSeries1~t927~tmwan~r~nSeries2~t462~txrfn~r~nSeries3~t696~takzt~r~nSeries4~t917~tjhxa~r~nSeries1~t429~tnfqj~r~nSeries2~t309~txioh~r~nSeries3~t825~tjqrj~r~nSeries4~t350~thymd~r~nSeries1~t542~tvwge~r~nSeries2~t760~thjes~r~nSeries3~t826~thtiz~r~nSeries4~t666~tojlj~r~nSeries1~t613~tpmox~r~nSeries2~t941~tyuyo~r~nSeries3~t838~tqjkz~r~nSeries4~t755~tvjgk~r~nSeries1~t930~txkew~r~nSeries2~t414~tzhbj~r~nSeries3~t971~tuths~r~nSeries4~t483~toefj~r~nSeries1~t869~twwye~r~nSeries2~t381~tzluh~r~nSeries3~t756~tgabb~r~nSeries4~t906~tqrhc~r~nSeries1~t324~ttxmj~r~nSeries2~t590~tcaxx~r~nSeries3~t683~tufah~r~nSeries4~t593~tyayz~r~nSeries1~t899~thuhj~r~nSeries2~t980~tjsvo~r~nSeries3~t526~thtyd~r~nSeries4~t370~tpbsz~r~nSeries1~t628~tsbzi~r~nSeries2~t857~trvgq~r~nSeries3~t922~tlunw~r~nSeries4~t943~tcpir~r~nSeries1~t847~tfcbt~r~nSeries2~t563~teplk~r~nSeries3~t732~twfkh~r~nSeries4~t525~touoy~r~nSeries1~t963~trwmq~r~nSeries2~t485~tjahy~r~nSeries3~t550~tmfev~r~nSeries4~t867~tdcom~r~nSeries1~t872~tyhgd~r~nSeries2~t356~tlxuk~r~nSeries3~t314~tyzcp~r~nSeries4~t605~tskwg~r~nSeries1~t828~tulsu~r~nSeries2~t836~tkbse~r~nSeries3~t870~tjeis~r~nSeries4~t647~tsgce~r~nSeries1~t738~twapq~r~nSeries2~t836~tvlwi~r~nSeries3~t928~trovj~r~nSeries4~t853~tdzxx~r~nSeries1~t783~thqls~r~nSeries2~t675~tzihm~r~nSeries3~t334~tzrio~r~nSeries4~t997~trqet~r~nSeries1~t899~tzfbl~r~nSeries2~t669~tjiem~r~nSeries3~t748~tfzbh~r~nSeries4~t822~tfnwy~r~nSeries1~t508~tmxxg~r~nSeries2~t993~tpylr~r~nSeries3~t782~txglm~r~nSeries4~t865~tbiyl~r~nSeries1~t634~thcwh~r~nSeries2~t402~tsyoy~r~nSeries3~t897~tgmgo~r~nSeries4~t530~tprza~r~nSeries1~t471~tqmom~r~nSeries2~t588~tyhga~r~nSeries3~t893~tiupj~r~nSeries4~t916~tbzxt~r~nSeries1~t339~ttopo~r~nSeries2~t841~tmitn~r~nSeries3~t958~twtoe~r~nSeries4~t647~tonxw~r~nSeries1~t656~tghut~r~nSeries2~t507~tfklg~r~nSeries3~t616~tlrnu~r~nSeries4~t415~tkmsy~r~nSeries1~t830~tcpui~r~nSeries2~t904~tahqa~r~nSeries3~t617~tmsck~r~nSeries4~t834~taalk~r~nSeries1~t439~tcsnx~r~nSeries2~t302~tcovt~r~nSeries3~t700~tkrxa~r~nSeries4~t330~tzadj~r~nSeries1~t331~twxqm~r~nSeries2~t861~tdhld~r~nSeries3~t744~ttxsk~r~nSeries4~t724~txtez~r~nSeries1~t402~tjsqt~r~nSeries2~t996~tbccf~r~nSeries3~t800~tmwhb~r~nSeries4~t836~tssii~r~nSeries1~t402~tvijs~r~nSeries2~t521~txiic~r~nSeries3~t967~tahmk~r~nSeries4~t861~tywtt~r~nSeries1~t440~tzppk~r~nSeries2~t615~tlbmj~r~nSeries3~t882~thtpu~r~nSeries4~t371~tiebp~r~nSeries1~t784~tbmue~r~nSeries2~t460~tyrhl~r~nSeries3~t712~thxwg~r~nSeries4~t326~tprwv~r~nSeries1~t652~tshzy~r~nSeries2~t796~tvqye~r~nSeries3~t311~tztoz~r~nSeries4~t634~tabna~r~nSeries1~t704~thrrb~r~nSeries2~t540~tdndo~r~nSeries3~t928~txeui~r~nSeries4~t576~tzioi~r~nSeries1~t435~tozxq~r~nSeries2~t325~tihwa~r~nSeries3~t826~troqr~r~nSeries4~t325~tqwcv~r~nSeries1~t527~txzip~r~nSeries2~t560~tdiis~r~nSeries3~t878~tqnzo~r~nSeries4~t419~tcwva~r~n ')
			rte_1.Paste()
		end if
	Case 'RTEFUNW10P16'
	/*
	   【功能描述】
	    Print,控件与DataStore共享数据

		【编码描述】
		1、初始化控件，创建一个DataStore并检索大于一页的数据量与控件共享
		2、打印控件所有页内容。
		3、输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		打印编辑框中所有实例的总页数
	*/
		
		if ab_exe then
			li_RtnVal = rte_1.Print(1,'',false,true)
			wf_OutPut("FunReturn: rte_1.Print(1,'',false,true)=" + String(li_RtnVal),true)
		else
			ls_Syntax = Gtr_Sqlserver.SyntaxFromSQL(ls_SQL,'Style(Type=grid)',ls_Error)
			ids_dw.Create(ls_Syntax,ls_Error)
			ids_dw.SetTransObject(Gtr_Sqlserver)
			ids_dw.Retrieve()
			rte_1.DataSource(ids_dw)
		end if
	Case 'RTEFUNW10P17'
	/*
	   【功能描述】
	    ReplaceText,参数为NULL

		【编码描述】
		1、初始化控件，构建数据内容
		2、指定参数为NULL，调用ReplaceText
		3、输出函数返回值
		

		【代码输出值描述】
		返回NULL
		
		【期望UI描述】
		无UI变化
	*/
		
		if ab_exe then
			SetNull(ls_Temp)
			ll_RtnVal = rte_1.ReplaceText(ls_Temp)
			wf_OutPut("FunReturn: rte_1.ReplaceText(ls_Temp)=" + String(ll_RtnVal),true)
		else
		end if
	Case 'RTEFUNW10P18'
	/*
	   【功能描述】
	    ReplaceText,没有选中数据内容

		【编码描述】
		1、初始化控件，构建数据内容
		2、不高亮选中数据，设置插入点在Detail区，有效调用ReplaceText
		3、输出函数返回值
		

		【代码输出值描述】
		返回字符串长度
		
		【期望UI描述】
		在插入点插入含字符串
	*/
		
		if ab_exe then
			ls_Temp = "NoSelected"
			ll_RtnVal = rte_1.ReplaceText(ls_Temp)
			wf_OutPut("FunReturn: rte_1.ReplaceText(ls_Temp)=" + String(ll_RtnVal),true)
		else
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW10P19'
	/*
	   【功能描述】
	    ReplaceText,替换选中数据内容含图片及InputField

		【编码描述】
		1、初始化控件，构建数据内容
		2、高亮选中含图片及InputField的数据，有效调用ReplaceText
		3、输出函数返回值
		

		【代码输出值描述】
		返回字符串长度
		
		【期望UI描述】
		替换所选中的内容
	*/
		
		if ab_exe then
			ls_Temp = "Replace all text and picture"
			ll_RtnVal = rte_1.ReplaceText(ls_Temp)
			wf_OutPut("FunReturn: rte_1.ReplaceText(ls_Temp)=" + String(ll_RtnVal),true)
		else
			rte_1.InputFieldInsert('WuZhiJun')
			rte_1.SelectTextAll()
		end if
	Case 'RTEFUNW10P20'
	/*
	   【功能描述】
	    ReplaceText,参数为特殊字符

		【编码描述】
		1、初始化控件，构建数据内容
		2、指定参数为含Tab、回车换行符的字符串，设置插入点，调用ReplaceText
		3、输出函数返回值
		

		【代码输出值描述】
		返回字符串长度
		
		【期望UI描述】
		在插入点插入含特殊字符的字符串
	*/
		
		if ab_exe then
			ls_Temp = "Include ~t Tab key and ~r~n Enter key"
			ll_RtnVal = rte_1.ReplaceText(ls_Temp)
			wf_OutPut("FunReturn: rte_1.ReplaceText(ls_Temp)=" + String(ll_RtnVal),true)
		else
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW10P21'
	/*
	   【功能描述】
	    ReplaceText,在Header区替换

		【编码描述】
		1、初始化控件，构建数据内容
		2、高亮选中Header区的部分数据，有效调用ReplaceText
		3、输出函数返回值
		

		【代码输出值描述】
		返回字符串长度
		
		【期望UI描述】
		替换所选中的内容
	*/
		
		if ab_exe then
			ls_Temp = "Series1~t757~ttgrg~r~nSeries2~t478~tfnyy~r~nSeries3~t834~tkwwq~r~n "
			ll_RtnVal = rte_1.ReplaceText(ls_Temp)
			wf_OutPut("FunReturn: rte_1.ReplaceText(ls_Temp)=" + String(ll_RtnVal),true)
		else
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			rte_1.SelectText(1,1,10,0,Header!)
		end if
	Case 'RTEFUNW10P22'
	/*
	   【功能描述】
	    ReplaceText,在Footer区替换

		【编码描述】
		1、初始化控件，构建数据内容
		2、高亮选中Footer区的部分数据，有效调用ReplaceText
		3、输出函数返回值
		

		【代码输出值描述】
		返回字符串长度
		
		【期望UI描述】
		替换所选中的内容
	*/
		
		if ab_exe then
			ls_Temp = "Series1~t757~ttgrg~r~nSeries2~t478~tfnyy~r~nSeries3~t834~tkwwq~r~n "
			ll_RtnVal = rte_1.ReplaceText(ls_Temp)
			wf_OutPut("FunReturn: rte_1.ReplaceText(ls_Temp)=" + String(ll_RtnVal),true)
		else
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			rte_1.SelectText(1,1,10,0,Footer!)
		end if
End Choose
if ab_exe then
	wf_postrun(al_row)
end if
end event

event open;call super::open;ids_dw = Create DataStore
n_cst_config  lnv_res


if not lnv_res.of_createFile("PUB_BMP_APB.bmp",gtr_frame) then
	messagebox("提示信息","下载图片失败")
end if





end event

event close;call super::close;Destroy ids_dw

if FileExists("PUB_BMP_APB.bmp") then
	FileDelete("PUB_BMP_APB.bmp")
end if

end event

type mle_phenomena from w_templet`mle_phenomena within w_rtefunw10
end type

type cb_autoparse from w_templet`cb_autoparse within w_rtefunw10
end type

type cb_wrrun from w_templet`cb_wrrun within w_rtefunw10
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rtefunw10
end type

type dw_info from w_templet`dw_info within w_rtefunw10
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rtefunw10
end type

type pb_runnext from w_templet`pb_runnext within w_rtefunw10
end type

type pb_runall from w_templet`pb_runall within w_rtefunw10
end type

type pb_run from w_templet`pb_run within w_rtefunw10
end type

type pb_end from w_templet`pb_end within w_rtefunw10
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rtefunw10
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rtefunw10
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rtefunw10
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rtefunw10
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rtefunw10
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rtefunw10
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rtefunw10
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rtefunw10
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rtefunw10
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rtefunw10
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rtefunw10
end type

type rte_1 from richtextedit within w_rtefunw10
integer x = 27
integer y = 32
integer width = 2921
integer height = 1288
integer taborder = 10
boolean bringtotop = true
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_headerfooter = true
borderstyle borderstyle = stylelowered!
end type

