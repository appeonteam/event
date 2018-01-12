$PBExportHeader$w_rtefunw18.srw
forward
global type w_rtefunw18 from w_templet
end type
type rte_1 from richtextedit within w_rtefunw18
end type
end forward

global type w_rtefunw18 from w_templet
string title = "Function 18"
rte_1 rte_1
end type
global w_rtefunw18 w_rtefunw18

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

on w_rtefunw18.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rtefunw18.destroy
call super::destroy
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 
将控件内容成功保存到一个文档后或新打开文档后，Modified属性值变为false
***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Functions\Function 18 
Pbl Name:     
Designer:     ouyangwu
Coder:        WuZhiJun(2005-06-28)
DocReviewer:  
CoderReviewer:
【功能描述】

【窗口对象】

【编码注意事项】

【测试注意事项】
 
***********************/

//公共变量定义
String	ls_Temp
Integer	li_RtnVal
Boolean	 lb_Bold,lb_UnderLine,lb_SubScript,lb_SuperScript,lb_Italic,lb_StrikeOut,lb_Flag

if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return

if Not ab_exe then
	rte_1.ShowHeadFoot(false)
	rte_1.Preview(false)
	rte_1.SelectTextAll(Detail!)
	rte_1.Clear()
	ClipBoard('Series1~t814~ttmiu~r~nSeries2~t756~tyvga~r~nSeries3~t839~thfsh~r~nSeries4~t881~tcxhu~r~nSeries1~t853~tyyht~r~nSeries2~t742~tdglf~r~nSeries3~t997~tiebd~r~nSeries4~t966~ttoeu~r~nSeries1~t339~tfhda~r~nSeries2~t461~tphbs~r~nSeries3~t722~twztp~r~nSeries4~t976~tjngj~r~nSeries1~t540~tcpxr~r~nSeries2~t591~tvbvc~r~nSeries3~t974~tefkb~r~nSeries4~t447~tmgsd~r~nSeries1~t712~tmzmm~r~nSeries2~t952~twdeh~r~nSeries3~t504~tkruq~r~nSeries4~t995~tyvec~r~nSeries1~t409~tpesr~r~nSeries2~t426~tmdxl~r~nSeries3~t573~tubry~r~nSeries4~t656~teshq~r~nSeries1~t938~tzmre~r~nSeries2~t530~tqnkq~r~nSeries3~t438~ttxgi~r~nSeries4~t959~tgqus~r~nSeries1~t834~twtcz~r~nSeries2~t346~tlter~r~nSeries3~t309~tbltz~r~nSeries4~t774~tdyzv~r~nSeries1~t539~thnki~r~nSeries2~t892~tjwzz~r~nSeries3~t855~tdjpq~r~nSeries4~t711~tuowk~r~nSeries1~t768~tfcco~r~nSeries2~t455~tkvrj~r~nSeries3~t425~tfrjp~r~nSeries4~t420~tgdjd~r~n ')
	rte_1.Paste()
end if

Choose Case as_testpoint
	Case 'RTEFUNW18P01'
	/*
	   【功能描述】
	    SetTextStyle,bold参数为NULL

		【编码描述】
		1、初始化控件
		2、bold参数为NULL，调用函数SetTextStyle
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(lb_Bold)
			li_RtnVal = rte_1.SetTextStyle(lb_Bold,lb_UnderLine,lb_SubScript,lb_SuperScript,lb_Italic,lb_StrikeOut)
			wf_OutPut("FunReturn: rte_1.SetTextStyle(lb_Bold,lb_UnderLine,lb_SubScript,lb_SuperScript,lb_Italic,lb_StrikeOut)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW18P02'
	/*
	   【功能描述】
	    SetTextStyle,underline参数为NULL

		【编码描述】
		1、初始化控件
		2、underline参数为NULL，调用函数SetTextStyle
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(lb_UnderLine)
			li_RtnVal = rte_1.SetTextStyle(lb_Bold,lb_UnderLine,lb_SubScript,lb_SuperScript,lb_Italic,lb_StrikeOut)
			wf_OutPut("FunReturn: rte_1.SetTextStyle(lb_Bold,lb_UnderLine,lb_SubScript,lb_SuperScript,lb_Italic,lb_StrikeOut)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW18P03'
	/*
	   【功能描述】
	    SetTextStyle,subscript参数为NULL

		【编码描述】
		1、初始化控件
		2、subscript参数为NULL，调用函数SetTextStyle
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(lb_SubScript)
			li_RtnVal = rte_1.SetTextStyle(lb_Bold,lb_UnderLine,lb_SubScript,lb_SuperScript,lb_Italic,lb_StrikeOut)
			wf_OutPut("FunReturn: rte_1.SetTextStyle(lb_Bold,lb_UnderLine,lb_SubScript,lb_SuperScript,lb_Italic,lb_StrikeOut)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW18P04'
	/*
	   【功能描述】
	    SetTextStyle,superscript参数为NULL

		【编码描述】
		1、初始化控件
		2、superscript参数为NULL，调用函数SetTextStyle
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(lb_SuperScript)
			li_RtnVal = rte_1.SetTextStyle(lb_Bold,lb_UnderLine,lb_SubScript,lb_SuperScript,lb_Italic,lb_StrikeOut)
			wf_OutPut("FunReturn: rte_1.SetTextStyle(lb_Bold,lb_UnderLine,lb_SubScript,lb_SuperScript,lb_Italic,lb_StrikeOut)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW18P05'
	/*
	   【功能描述】
	    SetTextStyle,italic参数为NULL

		【编码描述】
		1、初始化控件
		2、italic参数为NULL，调用函数SetTextStyle
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(lb_Italic)
			li_RtnVal = rte_1.SetTextStyle(lb_Bold,lb_UnderLine,lb_SubScript,lb_SuperScript,lb_Italic,lb_StrikeOut)
			wf_OutPut("FunReturn: rte_1.SetTextStyle(lb_Bold,lb_UnderLine,lb_SubScript,lb_SuperScript,lb_Italic,lb_StrikeOut)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW18P06'
	/*
	   【功能描述】
	    SetTextStyle,strikeout参数为NULL

		【编码描述】
		1、初始化控件
		2、strikeout参数为NULL，调用函数SetTextStyle
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(lb_StrikeOut)
			li_RtnVal = rte_1.SetTextStyle(lb_Bold,lb_UnderLine,lb_SubScript,lb_SuperScript,lb_Italic,lb_StrikeOut)
			wf_OutPut("FunReturn: rte_1.SetTextStyle(lb_Bold,lb_UnderLine,lb_SubScript,lb_SuperScript,lb_Italic,lb_StrikeOut)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW18P07'
	/*
	   【功能描述】
	    SetTextStyle,所有参数为true,没有选中数据

		【编码描述】
		1、初始化控件
		2、不选中数据，设置插入点，所有参数为true，调用函数SetTextStyle
		3、输出函数返回值
		4、调用GetTextStyle函数，输出六种textstyle的值

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			li_RtnVal = rte_1.SetTextStyle(true,true,true,true,true,true)
			wf_OutPut("FunReturn: rte_1.SetTextStyle(true,true,true,true,true,true)=" + String(li_RtnVal),true)
			
			lb_Bold = rte_1.GetTextStyle(Bold!)
			wf_OutPut("VarReturn: lb_Bold=" + String(lb_Bold),false)
			
			lb_UnderLine = rte_1.GetTextStyle(Underlined!)
			wf_OutPut("VarReturn: lb_UnderLine=" + String(lb_UnderLine),false)
			
			lb_SubScript = rte_1.GetTextStyle(Subscript!)
			wf_OutPut("VarReturn: lb_SubScript=" + String(lb_SubScript),false)
			
			lb_SuperScript = rte_1.GetTextStyle(Superscript!)
			wf_OutPut("VarReturn: lb_SuperScript=" + String(lb_SuperScript),false)
			
			lb_Italic = rte_1.GetTextStyle(Italic!)
			wf_OutPut("VarReturn: lb_Italic=" + String(lb_Italic),false)
			
			lb_StrikeOut = rte_1.GetTextStyle(Strikeout!)
			wf_OutPut("VarReturn: lb_StrikeOut=" + String(lb_StrikeOut),false)
		else
		end if
	Case 'RTEFUNW18P08'
	/*
	   【功能描述】
	    SetTextStyle,所有参数为true,选中Text和Inputfield的数据内容

		【编码描述】
		1、初始化控件，构建内容
		2、选中Text和Input field的数据内容，所有参数为true，调用函数SetTextStyle
		3、输出函数返回值
		4、调用GetTextStyle函数，输出六种textstyle的值

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			li_RtnVal = rte_1.SetTextStyle(true,true,true,true,true,true)
			wf_OutPut("FunReturn: rte_1.SetTextStyle(true,true,true,true,true,true)=" + String(li_RtnVal),true)
			
			lb_Bold = rte_1.GetTextStyle(Bold!)
			wf_OutPut("VarReturn: lb_Bold=" + String(lb_Bold),false)
			
			lb_UnderLine = rte_1.GetTextStyle(Underlined!)
			wf_OutPut("VarReturn: lb_UnderLine=" + String(lb_UnderLine),false)
			
			lb_SubScript = rte_1.GetTextStyle(Subscript!)
			wf_OutPut("VarReturn: lb_SubScript=" + String(lb_SubScript),false)
			
			lb_SuperScript = rte_1.GetTextStyle(Superscript!)
			wf_OutPut("VarReturn: lb_SuperScript=" + String(lb_SuperScript),false)
			
			lb_Italic = rte_1.GetTextStyle(Italic!)
			wf_OutPut("VarReturn: lb_Italic=" + String(lb_Italic),false)
			
			lb_StrikeOut = rte_1.GetTextStyle(Strikeout!)
			wf_OutPut("VarReturn: lb_StrikeOut=" + String(lb_StrikeOut),false)
		else
			rte_1.SelectText(1,1,1,1,Detail!)
			rte_1.InputFieldInsert('WuZhiJun')
			rte_1.SelectTextAll(Detail!)
		end if
	Case 'RTEFUNW18P09'
	/*
	   【功能描述】
	    SetTextStyle,所有参数为true,选中含图片的数据内容

		【编码描述】
		1、初始化控件，构建内容
		2、选中含图片的数据内容，所有参数为true，调用函数SetTextStyle
		3、输出函数返回值
		4、调用GetTextStyle函数，输出六种textstyle的值

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			li_RtnVal = rte_1.SetTextStyle(true,true,true,true,true,true)
			wf_OutPut("FunReturn: rte_1.SetTextStyle(true,true,true,true,true,true)=" + String(li_RtnVal),true)
			
			lb_Bold = rte_1.GetTextStyle(Bold!)
			wf_OutPut("VarReturn: lb_Bold=" + String(lb_Bold),false)
			
			lb_UnderLine = rte_1.GetTextStyle(Underlined!)
			wf_OutPut("VarReturn: lb_UnderLine=" + String(lb_UnderLine),false)
			
			lb_SubScript = rte_1.GetTextStyle(Subscript!)
			wf_OutPut("VarReturn: lb_SubScript=" + String(lb_SubScript),false)
			
			lb_SuperScript = rte_1.GetTextStyle(Superscript!)
			wf_OutPut("VarReturn: lb_SuperScript=" + String(lb_SuperScript),false)
			
			lb_Italic = rte_1.GetTextStyle(Italic!)
			wf_OutPut("VarReturn: lb_Italic=" + String(lb_Italic),false)
			
			lb_StrikeOut = rte_1.GetTextStyle(Strikeout!)
			wf_OutPut("VarReturn: lb_StrikeOut=" + String(lb_StrikeOut),false)
		else
			wf_data_init(rte_1,4)
			rte_1.SelectTextAll(Detail!)
		end if
	Case 'RTEFUNW18P10'
	/*
	   【功能描述】
	    SetTextStyle,所有参数为false,选中包括多种文字的数据内容

		【编码描述】
		1、初始化控件，构建内容
		2、选中包括多种文字的数据内容，所有参数为false，调用函数SetTextStyle
		3、输出函数返回值
		4、调用GetTextStyle函数，输出六种textstyle的值

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			li_RtnVal = rte_1.SetTextStyle(false,false,false,false,false,false)
			wf_OutPut("FunReturn: rte_1.SetTextStyle(false,false,false,false,false,false)=" + String(li_RtnVal),true)
			
			lb_Bold = rte_1.GetTextStyle(Bold!)
			wf_OutPut("VarReturn: lb_Bold=" + String(lb_Bold),false)
			
			lb_UnderLine = rte_1.GetTextStyle(Underlined!)
			wf_OutPut("VarReturn: lb_UnderLine=" + String(lb_UnderLine),false)
			
			lb_SubScript = rte_1.GetTextStyle(Subscript!)
			wf_OutPut("VarReturn: lb_SubScript=" + String(lb_SubScript),false)
			
			lb_SuperScript = rte_1.GetTextStyle(Superscript!)
			wf_OutPut("VarReturn: lb_SuperScript=" + String(lb_SuperScript),false)
			
			lb_Italic = rte_1.GetTextStyle(Italic!)
			wf_OutPut("VarReturn: lb_Italic=" + String(lb_Italic),false)
			
			lb_StrikeOut = rte_1.GetTextStyle(Strikeout!)
			wf_OutPut("VarReturn: lb_StrikeOut=" + String(lb_StrikeOut),false)
		else
			wf_data_init(rte_1,4)
			rte_1.SelectTextAll(Detail!)
		end if
	Case 'RTEFUNW18P11'
	/*
	   【功能描述】
	    SetTextStyle,参数值间隔,只选中某InputField

		【编码描述】
		1、初始化控件，构建内容
		2、只选中某InputField，指定一、二参数为true,三、四参数为false,五、六参数为true，调用函数SetTextStyle
		3、输出函数返回值
		4、调用GetTextStyle函数，输出六种textstyle的值

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			li_RtnVal = rte_1.SetTextStyle(true,true,false,false,true,true)
			wf_OutPut("FunReturn: rte_1.SetTextStyle(true,true,false,false,true,true)=" + String(li_RtnVal),true)
			
			lb_Bold = rte_1.GetTextStyle(Bold!)
			wf_OutPut("VarReturn: lb_Bold=" + String(lb_Bold),false)
			
			lb_UnderLine = rte_1.GetTextStyle(Underlined!)
			wf_OutPut("VarReturn: lb_UnderLine=" + String(lb_UnderLine),false)
			
			lb_SubScript = rte_1.GetTextStyle(Subscript!)
			wf_OutPut("VarReturn: lb_SubScript=" + String(lb_SubScript),false)
			
			lb_SuperScript = rte_1.GetTextStyle(Superscript!)
			wf_OutPut("VarReturn: lb_SuperScript=" + String(lb_SuperScript),false)
			
			lb_Italic = rte_1.GetTextStyle(Italic!)
			wf_OutPut("VarReturn: lb_Italic=" + String(lb_Italic),false)
			
			lb_StrikeOut = rte_1.GetTextStyle(Strikeout!)
			wf_OutPut("VarReturn: lb_StrikeOut=" + String(lb_StrikeOut),false)
		else
			rte_1.SelectText(1,1,1,1,Detail!)
			rte_1.InputFieldInsert('RuYu')
			rte_1.SelectText(1,1,1,1,Detail!)
		end if
	Case 'RTEFUNW18P12'
	/*
	   【功能描述】
	    visible属性被设置为false后调用show函数

		【编码描述】
		1、初始化控件，构建内容，设置visible属性为false
		2、调用Show函数
		3、输出函数返回值以及visible属性值
		

		【代码输出值描述】
		1，true
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			li_RtnVal = rte_1.Show()
			wf_OutPut("FunReturn: rte_1.Show()=" + String(li_RtnVal),true)
			wf_OutPut("VarReturn: rte_1.Visible=" + String(rte_1.Visible),false)
		else
			rte_1.Visible = false
		end if
	Case 'RTEFUNW18P13'
	/*
	   【功能描述】
	    调用Hide后调用show函数

		【编码描述】
		1、初始化控件，构建内容，调用Hide函数
		2、调用Show函数
		3、输出函数返回值以及visible属性值
		

		【代码输出值描述】
		1，true
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			li_RtnVal = rte_1.Show()
			wf_OutPut("FunReturn: rte_1.Show()=" + String(li_RtnVal),true)
			wf_OutPut("VarReturn: rte_1.Visible=" + String(rte_1.Visible),false)
		else
			rte_1.Hide()
		end if
	Case 'RTEFUNW18P14'
	/*
	   【功能描述】
	    HeaderFooter=false时测试ShowHeadFoot(true)

		【编码描述】
		1、初始化控件，静态设置HeaderFooter=true,构建内容
		2、动态设置HeaderFooter=false,调用ShowHeadFoot(true)
		3、输出函数返回值
		

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.HeaderFooter = false
			li_RtnVal = rte_1.ShowHeadFoot(true)
			wf_OutPut("FunReturn: rte_1.ShowHeadFoot(true)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW18P15'
	/*
	   【功能描述】
	    HeaderFooter=false时测试ShowHeadFoot(false)

		【编码描述】
		1、初始化控件，静态设置HeaderFooter=true,构建内容
		2、动态设置HeaderFooter=false，调用ShowHeadFoot(false)
		3、输出函数返回值
		

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.HeaderFooter = false
			li_RtnVal = rte_1.ShowHeadFoot(false)
			wf_OutPut("FunReturn: rte_1.ShowHeadFoot(false)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW18P16'
	/*
	   【功能描述】
	    HeaderFooter=true时测试ShowHeadFoot(true)

		【编码描述】
		1、初始化控件，静态设置HeaderFooter=true，构建内容
		2、动态设置HeaderFooter=true，调用ShowHeadFoot(true)
		3、输出函数返回值
		

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.HeaderFooter = true
			li_RtnVal = rte_1.ShowHeadFoot(true)
			wf_OutPut("FunReturn: rte_1.ShowHeadFoot(true)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW18P17'
	/*
	   【功能描述】
	    HeaderFooter=true时测试ShowHeadFoot(false)

		【编码描述】
		1、初始化控件，静态设置HeaderFooter=true，构建内容
		2、动态设置HeaderFooter=true，调用ShowHeadFoot(false)
		3、输出函数返回值
		

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.HeaderFooter = true
			li_RtnVal = rte_1.ShowHeadFoot(false)
			wf_OutPut("FunReturn: rte_1.ShowHeadFoot(false)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW18P18'
	/*
	   【功能描述】
	    在预览模式时测试ShowHeadFoot(true)

		【编码描述】
		1、初始化控件，静态设置HeaderFooter=true，构建内容
		2、动态设置HeaderFooter=true，Preview（true），调用ShowHeadFoot(true)
		3、输出函数返回值
		

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.HeaderFooter = true
			rte_1.Preview(true)
			li_RtnVal = rte_1.ShowHeadFoot(true)
			wf_OutPut("FunReturn: rte_1.ShowHeadFoot(true)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW18P19'
	/*
	   【功能描述】
	    在预览模式时测试ShowHeadFoot(false)

		【编码描述】
		1、初始化控件，静态设置HeaderFooter=true，构建内容
		2、动态设置HeaderFooter=true，Preview（true），调用ShowHeadFoot(false)
		3、输出函数返回值
		

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.HeaderFooter = true
			rte_1.Preview(true)
			li_RtnVal = rte_1.ShowHeadFoot(false)
			wf_OutPut("FunReturn: rte_1.ShowHeadFoot(false)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW18P20'
	/*
	   【功能描述】
	    测试ShowHeadFoot(NULL)

		【编码描述】
		1、初始化控件，静态设置HeaderFooter=true，构建内容
		2、调用ShowHeadFoot(NULL)
		3、输出函数返回值
		

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(lb_Flag)
			li_RtnVal = rte_1.ShowHeadFoot(lb_Flag)
			wf_OutPut("FunReturn: rte_1.ShowHeadFoot(lb_Flag)=" + String(li_RtnVal),true)
		else
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

event close;call super::close;
if FileExists("PUB_BMP_APB.bmp") then
	FileDelete("PUB_BMP_APB.bmp")
end if


end event

type mle_phenomena from w_templet`mle_phenomena within w_rtefunw18
end type

type cb_autoparse from w_templet`cb_autoparse within w_rtefunw18
end type

type cb_wrrun from w_templet`cb_wrrun within w_rtefunw18
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rtefunw18
end type

type dw_info from w_templet`dw_info within w_rtefunw18
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rtefunw18
end type

type pb_runnext from w_templet`pb_runnext within w_rtefunw18
end type

type pb_runall from w_templet`pb_runall within w_rtefunw18
end type

type pb_run from w_templet`pb_run within w_rtefunw18
end type

type pb_end from w_templet`pb_end within w_rtefunw18
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rtefunw18
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rtefunw18
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rtefunw18
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rtefunw18
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rtefunw18
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rtefunw18
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rtefunw18
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rtefunw18
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rtefunw18
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rtefunw18
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rtefunw18
end type

type rte_1 from richtextedit within w_rtefunw18
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

