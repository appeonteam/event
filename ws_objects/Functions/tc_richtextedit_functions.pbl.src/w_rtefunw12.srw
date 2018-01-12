$PBExportHeader$w_rtefunw12.srw
forward
global type w_rtefunw12 from w_templet
end type
type rte_1 from richtextedit within w_rtefunw12
end type
end forward

global type w_rtefunw12 from w_templet
integer width = 4677
integer height = 2504
string title = "Function 12"
rte_1 rte_1
end type
global w_rtefunw12 w_rtefunw12

forward prototypes
public function string wf_convert (string as_parm)
public function string wf_convert (long al_parm)
public function string wf_convert (boolean ab_boolean)
public subroutine wf_data_init (richtextedit ar_rich, integer ai_sign, band ab_band, boolean ab_clear)
end prototypes

public function string wf_convert (string as_parm);//====================================================================
// Function: wf_convertnull()
//--------------------------------------------------------------------
// Arguments:  string  as_parm
//--------------------------------------------------------------------
// Returns:    String
//--------------------------------------------------------------------
// Author: 		zhouchaoqun 	Date: 2005/06/24
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
if isnull(as_parm) then
	as_parm = 'NULL'
elseif as_parm = '' then
	as_parm = "Returns the empty string ('')"	
end if

return as_parm
end function

public function string wf_convert (long al_parm);if isnull(al_parm) then
	return 'Null'
else
	return string(al_parm)
end if
end function

public function string wf_convert (boolean ab_boolean);string  ls_temp

if isnull(ab_boolean) then
	ls_temp = 'True'
elseif ab_boolean then
	ls_temp = 'True'
else
	ls_temp = 'False' 
end if

return ls_temp
end function

public subroutine wf_data_init (richtextedit ar_rich, integer ai_sign, band ab_band, boolean ab_clear);//==================================================================================
// Function: wf_data_init()
//--------------------------------------------------------------------------------------------------------------------------------------------------
// Arguments:  Richtextedit   ar_rich
//                        Integer  ai_sign  --  1为英文，2为中文，3中英文，4为英文图片，5中文图片，6中英文图片，7图片
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
	case 7 //图片
		ls_array[] = {'3'}
end choose

if ab_clear then
	ar_rich.SelectTextAll (ab_band)
	ar_rich.Clear( )
	ar_rich.SelectText(1,1,0,0,ab_band)
end if
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
//			ar_rich.InsertPicture(Gs_ApplicationPath + "\Resource\PUB_BMP_APB.bmp")
			ar_rich.InsertPicture("PUB_BMP_BT_EMP.bmp")			
	end choose
next

Clipboard(' ~r~n ')
ar_rich.paste()

ar_rich.SelectTextALL(ab_band)

ar_rich.Settextstyle( true, true, true, true, true, true)
ar_rich.SettextColor(rgb(0,0,255 ))

ar_rich.SelectText(1,1,1,5,ab_band)
ar_rich.SetAlignment ( Center!  )

ar_rich.SelectText(2,1,2,5,ab_band)
ar_rich.SetAlignment ( Right!   )

ar_rich.SelectText(3,1,3,5,ab_band)
ar_rich.SetAlignment (  Left!  )

ar_rich.SelectText(4,1,4,5,ab_band)
ar_rich.SetAlignment ( Justify!)

ar_rich.SelectText(1,1,0,0,ab_band)

ar_rich.SelectText(ar_rich.LineCount(),1,0,0,ab_band)
ar_rich.SelectText(ar_rich.LineCount(),ar_rich.LineLength() + 1,0,0,ab_band)
end subroutine

on w_rtefunw12.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rtefunw12.destroy
call super::destroy
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 
将控件内容成功保存到一个文档后或新打开文档后，Modified属性值变为false
***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Functions\Function 12 
Pbl Name:     
Designer:     ouyangwu
Coder:        zhouchaoqun  Date: 2005-06-28
DocReviewer:  
CoderReviewer:
【功能描述】

【窗口对象】

【编码注意事项】

【测试注意事项】
 
***********************/
long  ll_num
datastore  ld_data

if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return 
if not ab_exe then rte_1.VscrollBar = False

Choose Case as_testpoint
	Case 'RTEFUNW12P01'
	/*
	   【功能描述】
	    Scroll,参数为NULL

		【编码描述】
		1、初始化控件
		2、指定参数为NULL，调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(ll_num)
			wf_output("FunReturn:  Scroll = " + wf_convert(rte_1.Scroll(ll_Num)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
		end if
	Case 'RTEFUNW12P02'
	/*
	   【功能描述】
	    Scroll,控件内容全部在可见区

		【编码描述】
		1、初始化控件
		2、指定参数为任意值，调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  Scroll = " + wf_convert(rte_1.Scroll(5)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
		end if
	Case 'RTEFUNW12P03'
	/*
	   【功能描述】
	    Scroll,控件内容多于可见区范围，参数指定为不可见区范围的行数,VscrollBar为false

		【编码描述】
		1、初始化控件，控件内容多于可见区范围，VscrollBar为false
		2、参数指定为不可见区范围的行数，调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回1
		
		【期望UI描述】
		滚动到指定的行
	*/
		
		if ab_exe then
			wf_output("FunReturn:  Scroll = " + wf_convert(rte_1.Scroll(6)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			rte_1.VscrollBar = False
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW12P04'
	/*
	   【功能描述】
	    Scroll,控件内容多于可见区范围，参数指定为不可见区范围的行数,VscrollBar为true

		【编码描述】
		1、初始化控件，控件内容多于可见区范围，VscrollBar为true
		2、参数指定为不可见区范围的行数，调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回1
		
		【期望UI描述】
		滚动到指定的行，滚动条也随之滚动
	*/
		
		if ab_exe then
			wf_output("FunReturn:  Scroll = " + wf_convert(rte_1.Scroll(6)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			rte_1.VscrollBar = True
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW12P05'
	/*
	   【功能描述】
	    Scroll,控件内容多于可见区范围，参数指定为负数，VscrollBar为false

		【编码描述】
		1、初始化控件，控件内容多于可见区范围，VscrollBar为false,当前控件数据内容已经滚动到最下面。
		2、参数指定为负数，调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回1
		
		【期望UI描述】
		向上滚，滚动到指定的行
	*/
		
		if ab_exe then
			wf_output("FunReturn:  Scroll = " + wf_convert(rte_1.Scroll(-6)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			rte_1.VscrollBar = False
		end if
	Case 'RTEFUNW12P06'
	/*
	   【功能描述】
	    Scroll,控件内容多于可见区范围，参数指定为负数，VscrollBar为true

		【编码描述】
		1、初始化控件，控件内容多于可见区范围，VscrollBar为true,当前控件数据内容已经滚动到最下面。
		2、参数指定为负数，调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回1
		
		【期望UI描述】
		向上滚，滚动到指定的行，滚动条也随之滚动
	*/
		
		if ab_exe then
			wf_output("FunReturn:  Scroll = " + wf_convert(rte_1.Scroll(-6)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			rte_1.VscrollBar = True
		end if
	Case 'RTEFUNW12P07'
	/*
	   【功能描述】
	    Scroll,控件内容多于可见区范围，参数值指定为大于控件内容的总行数

		【编码描述】
		1、初始化控件，控件内容多于可见区范围，VscrollBar为true
		2、参数值指定为大于控件内容的总行数，调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回1
		
		【期望UI描述】
		滚动到最后，滚动条也随之滚动
	*/
		
		if ab_exe then
			wf_output("FunReturn:  Scroll = " + wf_convert(rte_1.Scroll(100)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			rte_1.VscrollBar = True
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW12P08'
	/*
	   【功能描述】
	    ScrollNextPage,控件内容只有一页

		【编码描述】
		1、初始化控件，控件内容只有一页
		2、调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回1
		
		【期望UI描述】
		无变化
	*/
		
		if ab_exe then
			wf_output("FunReturn:  ScrollNextPage = " + wf_convert(rte_1.ScrollNextPage()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			wf_data_init(rte_1,1,Detail!,False)
			rte_1.VscrollBar = True
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW12P09'
	/*
	   【功能描述】
	    ScrollNextPage,控件内容多于一页

		【编码描述】
		1、初始化控件，控件内容多于一页
		2、调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回1
		
		【期望UI描述】
		滚动到下一页，具体位置由当前使用打印机设置纸张高度确定的
	*/
		
		if ab_exe then
			wf_output("FunReturn:  ScrollNextPage = " + wf_convert(rte_1.ScrollNextPage()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			rte_1.VscrollBar = True
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW12P10'
	/*
	   【功能描述】
	    ScrollNextPage,控件内容与DataStore共享

		【编码描述】
		1、初始化控件，控件内容与DataStore共享，在控件中存在两个实例，既重复插入了两行 InputField
		2、调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回实例对应的Datawindow行号
		
		【期望UI描述】
		滚动到实例的下一页
	*/
		ld_data = Create Datastore
		ld_data.dataobject = 'rtefunw12_d01_temp01'
		rte_1.DataSource(ld_data)
		if ab_exe then
			wf_output("FunReturn:  ScrollNextPage = " + wf_convert(rte_1.ScrollNextPage()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			rte_1.InputFieldInsert('info_2')
			rte_1.InputFieldInsert('info_2')
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
		Destroy  ld_data
	Case 'RTEFUNW12P11'
	/*
	   【功能描述】
	    ScrollNextPage,控件内容与DataStore共享

		【编码描述】
		1、初始化控件，控件内容与DataStore共享，在控件中存在两个实例，既重复插入了两行 InputField，插入点处于第二个实例位置
		2、调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回实例对应的Datawindow行号
		
		【期望UI描述】
		不滚动
	*/
		
		ld_data = Create Datastore
		ld_data.dataobject = 'rtefunw12_d01_temp01'
		rte_1.DataSource(ld_data)
		if ab_exe then
			wf_output("FunReturn:  ScrollNextPage = " + wf_convert(rte_1.ScrollNextPage()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert('info_2')
			rte_1.InputFieldInsert('info_2')
			rte_1.SelectText(2,2,0,0,Detail!)
		end if
		Destroy  ld_data
	Case 'RTEFUNW12P12'
	/*
	   【功能描述】
	    ScrollNextRow,控件没有与DataStore共享数据

		【编码描述】
		1、初始化控件，控件没有与DataStore共享数据
		2、调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		无变化
	*/
				
		if ab_exe then
			wf_output("FunReturn:  ScrollNextRow = " + wf_convert(rte_1.ScrollNextRow()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW12P13'
	/*
	   【功能描述】
	    ScrollNextRow,控件与DataStore共享数据

		【编码描述】
		1、初始化控件，控件与DataStore共享数据
		2、调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回1
		
		【期望UI描述】
		滚动到下一行
	*/
		
		ld_data = Create Datastore
		ld_data.dataobject = 'rtefunw12_d01_temp01'
		rte_1.DataSource(ld_data)
		if ab_exe then
			wf_output("FunReturn:  ScrollNextRow = " + wf_convert(rte_1.ScrollNextRow()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert('info_2')
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
		Destroy  ld_data
	Case 'RTEFUNW12P14'
	/*
	   【功能描述】
	    Scrollpriorpage,控件内容只有一页

		【编码描述】
		1、初始化控件，控件内容只有一页
		2、调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回1
		
		【期望UI描述】
		无变化
	*/
		
		if ab_exe then
			wf_output("FunReturn:  Scrollpriorpage = " + wf_convert(rte_1.Scrollpriorpage()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW12P15'
	/*
	   【功能描述】
	    Scrollpriorpage,控件内容多于一页

		【编码描述】
		1、初始化控件，控件内容多于一页，当前页在第二页
		2、调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回1
		
		【期望UI描述】
		滚动到上一页，具体位置由当前使用打印机设置纸张高度确定的
	*/
		ld_data = Create Datastore
		ld_data.dataobject = 'rtefunw12_d01_temp01'
		rte_1.DataSource(ld_data)
		if ab_exe then
			wf_output("FunReturn:  Scrollpriorpage = " + wf_convert(rte_1.Scrollpriorpage()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)			
			rte_1.SelectText(100,1,0,0,Detail!)
		end if
		destroy ld_data
	Case 'RTEFUNW12P16'
	/*
	   【功能描述】
	    Scrollpriorpage,控件内容与DataStore共享

		【编码描述】
		1、初始化控件，控件内容与DataStore共享，在控件中存在两个实例，既重复插入了两行 InputField，当前实例处于第2页
		2、调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回实例对应的Datawindow行号
		
		【期望UI描述】
		滚动到实例的上一页
	*/
		
		ld_data = Create Datastore
		ld_data.dataobject = 'rtefunw12_d01_temp01'
		rte_1.DataSource(ld_data)
		if ab_exe then
			wf_output("FunReturn:  Scrollpriorpage = " + wf_convert(rte_1.Scrollpriorpage()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			rte_1.InputFieldInsert('info_2')
			rte_1.InputFieldInsert('info_2')
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
		Destroy  ld_data
	Case 'RTEFUNW12P17'
	/*
	   【功能描述】
	    Scrollpriorpage,控件内容与DataStore共享

		【编码描述】
		1、初始化控件，控件内容与DataStore共享，在控件中存在两个实例，既重复插入了两行 InputField，当前实例处于第2页，插入点处于第二个实例位置
		2、调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回实例对应的Datawindow行号
		
		【期望UI描述】
		不滚动
	*/
		
		ld_data = Create Datastore
		ld_data.dataobject = 'rtefunw12_d01_temp01'
		rte_1.DataSource(ld_data)
		if ab_exe then
			wf_output("FunReturn:  Scrollpriorpage = " + wf_convert(rte_1.Scrollpriorpage()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			rte_1.InputFieldInsert('info_2')
			rte_1.InputFieldInsert('info_2')
			rte_1.SelectText(62,2,0,0,Detail!)
		end if
		Destroy  ld_data
	Case 'RTEFUNW12P18'
	/*
	   【功能描述】
	    ScrollPriorRow,控件没有与DataStore共享数据

		【编码描述】
		1、初始化控件，控件没有与DataStore共享数据
		2、调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		无变化
	*/
		
		if ab_exe then
			wf_output("FunReturn:  ScrollPriorRow = " + wf_convert(rte_1.ScrollPriorRow()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW12P19'
	/*
	   【功能描述】
	    ScrollPriorRow,控件与DataStore共享数据

		【编码描述】
		1、初始化控件，控件与DataStore共享数据，当前行处于第二行以后
		2、调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回1
		
		【期望UI描述】
		滚动到上一行
	*/
		
		ld_data = Create Datastore
		ld_data.dataobject = 'rtefunw12_d01_temp01'
		rte_1.DataSource(ld_data)
		if ab_exe then
			wf_output("FunReturn:  ScrollPriorRow = " + wf_convert(rte_1.ScrollPriorRow()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			rte_1.InputFieldInsert('info_2')
			rte_1.InputFieldInsert('info_2')
			rte_1.SelectText(60,1,0,0,Detail!)
		end if
		Destroy  ld_data
	Case 'RTEFUNW12P20'
	/*
	   【功能描述】
	    ScrollToRow,参数为NULL

		【编码描述】
		1、初始化控件，控件没有与DataStore共享数据
		2、指定有效参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(ll_num)
			wf_output("FunReturn:  ScrollToRow = " + wf_convert(rte_1.ScrollToRow(ll_num)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			rte_1.InputFieldInsert('info_2')
			rte_1.InputFieldInsert('info_2')
			rte_1.SelectText(60,1,0,0,Detail!)
		end if
	Case 'RTEFUNW12P21'
	/*
	   【功能描述】
	    ScrollToRow,控件没有与DataStore共享数据

		【编码描述】
		1、初始化控件，控件没有与DataStore共享数据
		2、指定有效参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		无变化
	*/
		
		if ab_exe then
			wf_output("FunReturn:  ScrollToRow = " + wf_convert(rte_1.ScrollToRow(5)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			rte_1.SelectText(60,1,0,0,Detail!)
		end if
	Case 'RTEFUNW12P22'
	/*
	   【功能描述】
	    ScrollToRow,控件与DataStore共享数据，参数小于0

		【编码描述】
		1、初始化控件，控件与DataStore共享数据
		2、参数小于0，调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		
	*/
		
		ld_data = Create Datastore
		ld_data.dataobject = 'rtefunw12_d01_temp01'
		rte_1.DataSource(ld_data)
		if ab_exe then
			wf_output("FunReturn:  ScrollToRow = " + wf_convert(rte_1.ScrollToRow(-5)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			rte_1.SelectText(60,1,0,0,Detail!)
		end if
		Destroy  ld_data
	Case 'RTEFUNW12P23'
	/*
	   【功能描述】
	    ScrollToRow,控件与DataStore共享数据，参数等于0

		【编码描述】
		1、初始化控件，控件与DataStore共享数据
		2、参数等于0，调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回1
		
		【期望UI描述】
		滚动到第一行
	*/
		
		ld_data = Create Datastore
		ld_data.dataobject = 'rtefunw12_d01_temp01'
		rte_1.DataSource(ld_data)
		if ab_exe then
			wf_output("FunReturn:  ScrollToRow = " + wf_convert(rte_1.ScrollToRow(0)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			rte_1.SelectText(60,1,0,0,Detail!)
		end if
		Destroy  ld_data
	Case 'RTEFUNW12P24'
	/*
	   【功能描述】
	    ScrollToRow,控件与DataStore共享数据，参数有效

		【编码描述】
		1、初始化控件，控件与DataStore共享数据
		2、参数有效，调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回1
		
		【期望UI描述】
		滚动到对应行
	*/
		
		ld_data = Create Datastore
		ld_data.dataobject = 'rtefunw12_d01_temp01'
		rte_1.DataSource(ld_data)
		if ab_exe then
			wf_output("FunReturn:  ScrollToRow = " + wf_convert(rte_1.ScrollToRow(6)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			rte_1.SelectText(60,1,0,0,Detail!)
		end if
		Destroy  ld_data
	Case 'RTEFUNW12P25'
	/*
	   【功能描述】
	    ScrollToRow,控件与DataStore共享数据，参数大于最大行数

		【编码描述】
		1、初始化控件，控件与DataStore共享数据
		2、参数大于最大行数，调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回1
		
		【期望UI描述】
		滚动到最后一行
	*/
		
		ld_data = Create Datastore
		ld_data.dataobject = 'rtefunw12_d01_temp01'
		rte_1.DataSource(ld_data)
		if ab_exe then
			wf_output("FunReturn:  ScrollToRow = " + wf_convert(rte_1.ScrollToRow(1000)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			rte_1.SelectText(60,1,0,0,Detail!)
		end if
		Destroy  ld_data
End Choose
if ab_exe then
	wf_postrun(al_row)
end if
end event

event open;call super::open;n_cst_config  lnv_res

if not lnv_res.of_createFile("PUB_BMP_BT_EMP.bmp",gtr_frame) then
	messagebox("提示信息","下载图片失败")
end if







end event

event close;call super::close;if FileExists("PUB_BMP_BT_EMP.bmp") then
	FileDelete("PUB_BMP_BT_EMP.bmp")
end if

end event

type mle_phenomena from w_templet`mle_phenomena within w_rtefunw12
end type

type cb_autoparse from w_templet`cb_autoparse within w_rtefunw12
end type

type cb_wrrun from w_templet`cb_wrrun within w_rtefunw12
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rtefunw12
end type

type dw_info from w_templet`dw_info within w_rtefunw12
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rtefunw12
end type

type pb_runnext from w_templet`pb_runnext within w_rtefunw12
end type

type pb_runall from w_templet`pb_runall within w_rtefunw12
end type

type pb_run from w_templet`pb_run within w_rtefunw12
end type

type pb_end from w_templet`pb_end within w_rtefunw12
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rtefunw12
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rtefunw12
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rtefunw12
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rtefunw12
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rtefunw12
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rtefunw12
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rtefunw12
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rtefunw12
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rtefunw12
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rtefunw12
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rtefunw12
end type

type rte_1 from richtextedit within w_rtefunw12
integer x = 37
integer y = 32
integer width = 2926
integer height = 1280
integer taborder = 70
boolean bringtotop = true
boolean init_wordwrap = true
boolean init_headerfooter = true
boolean init_popmenu = true
borderstyle borderstyle = stylelowered!
end type

