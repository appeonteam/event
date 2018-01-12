$PBExportHeader$w_rtefunw13.srw
forward
global type w_rtefunw13 from w_templet
end type
type rte_1 from richtextedit within w_rtefunw13
end type
end forward

global type w_rtefunw13 from w_templet
integer width = 4686
integer height = 2576
string title = "Function 13"
rte_1 rte_1
end type
global w_rtefunw13 w_rtefunw13

forward prototypes
public function string wf_convert (boolean ab_boolean)
public function string wf_convert (long al_parm)
public function string wf_convert (string as_parm)
public subroutine wf_data_init (richtextedit ar_rich, integer ai_sign, band ab_band, boolean ab_clear)
end prototypes

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

public function string wf_convert (long al_parm);if isnull(al_parm) then
	return 'Null'
else
	return string(al_parm)
end if
end function

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

ar_rich.SelectText(ar_rich.LineCount(),1,0,0,ab_band)
ar_rich.SelectText(ar_rich.LineCount(),ar_rich.LineLength() + 1,0,0,ab_band)
end subroutine

on w_rtefunw13.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rtefunw13.destroy
call super::destroy
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 
将控件内容成功保存到一个文档后或新打开文档后，Modified属性值变为false
***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Functions\Function 13 
Pbl Name:     
Designer:     ouyangwu
Coder:        zhouchaoqun   Date: 2005-06-28
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
if not ab_exe then  
	rte_1.WordWrap = True
	rte_1.PreView(False)
end if

Choose Case as_testpoint
	Case 'RTEFUNW13P01'
	/*
	   【功能描述】
	    SelectedColumn，没有高亮选中内容

		【编码描述】
		1、初始化控件，构建数据
		2、设置插入点，调用SelectedColumn函数
		3、输出函数返回值

		【代码输出值描述】
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedColumn = " + wf_convert(rte_1.SelectedColumn()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			Rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW13P02'
	/*
	   【功能描述】
	    SelectedColumn，从前向后高亮选中InputField

		【编码描述】
		1、初始化控件，构建Header区数据
		2、在header区中从前向后高亮选中InputField,调用SelectedColumn函数
		3、输出函数返回值

		【代码输出值描述】
		返回插入点 后面一个字符的位置
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedColumn = " + wf_convert(rte_1.SelectedColumn()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')	
			rte_1.SelectTextAll(Detail!)
		end if
	Case 'RTEFUNW13P03'
	/*
	   【功能描述】
	    SelectedColumn，从后向前高亮选中图片

		【编码描述】
		1、初始化控件，构建Footer区数据
		2、在Footer区从后向前高亮选中图片,调用SelectedColumn函数
		3、输出函数返回值

		【代码输出值描述】
		返回插入点 后面一个字符的位置
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedColumn = " + wf_convert(rte_1.SelectedColumn()),True)
		else
			wf_data_init(rte_1,4,Detail!,True)
			rte_1.SelectTextAll(Detail!)
		end if
	Case 'RTEFUNW13P04'
	/*
	   【功能描述】
	    SelectedColumn，控件中无内容

		【编码描述】
		1、初始化控件
		2、调用SelectedColumn函数
		3、输出函数返回值

		【代码输出值描述】
		返回1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedColumn = " + wf_convert(rte_1.SelectedColumn()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear( )
		end if
	Case 'RTEFUNW13P05'
	/*
	   【功能描述】
	    SelectedColumn，插入点处于数据最后

		【编码描述】
		1、初始化控件，构建数据
		2、插入点处于最后一行数据最后，调用SelectedColumn函数
		3、输出函数返回值

		【代码输出值描述】
		返回最后一行数据长度再加1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedColumn = " + wf_convert(rte_1.SelectedColumn()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			rte_1.SelectText(5,89,0,0,Detail!)
		end if
	Case 'RTEFUNW13P06'
	/*
	   【功能描述】
	    SelectedLength，没有高亮选中内容

		【编码描述】
		1、初始化控件，构建数据
		2、设置插入点，调用SelectedLength函数
		3、输出函数返回值

		【代码输出值描述】
		0
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedLength = " + wf_convert(rte_1.SelectedLength()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW13P07'
	/*
	   【功能描述】
	    SelectedLength，高亮选中含InputField数据

		【编码描述】
		1、初始化控件，构建Header区数据
		2、在header区中高亮选中含InputField数据,调用SelectedLength函数
		3、输出函数返回值

		【代码输出值描述】
		返回高亮选中数据的字节数
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedLength = " + wf_convert(rte_1.SelectedLength()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')	
			rte_1.SelectTextAll(Detail!)
		end if
	Case 'RTEFUNW13P08'
	/*
	   【功能描述】
	    SelectedLength，高亮选中含图片的数据

		【编码描述】
		1、初始化控件，构建footer区数据
		2、在footer区中高亮选中含图片的数据,调用SelectedLength函数
		3、输出函数返回值

		【代码输出值描述】
		返回高亮选中数据的字节数
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedLength = " + wf_convert(rte_1.SelectedLength()),True)
		else
			wf_data_init(rte_1,4,Detail!,True)
			rte_1.SelectTextAll(Detail!)
		end if
	Case 'RTEFUNW13P09'
	/*
	   【功能描述】
	    SelectedLength，高亮选中含多字节字符的数据

		【编码描述】
		1、初始化控件，构建数据
		2、高亮选中含多字节字符的数据,调用SelectedLength函数
		3、输出函数返回值

		【代码输出值描述】
		返回高亮选中数据的字节数
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedLength = " + wf_convert(rte_1.SelectedLength()),True)
		else
			wf_data_init(rte_1,2,Detail!,True)
			rte_1.SelectTextAll(Detail!)
		end if
	Case 'RTEFUNW13P10'
	/*
	   【功能描述】
	    SelectedLength，WordWrap为true，高亮选择不含回车换行符的多行数据

		【编码描述】
		1、初始化控件，构建数据，WordWrap为true
		2、高亮选择不含回车换行符的多行数据,调用SelectedLength函数
		3、输出函数返回值

		【代码输出值描述】
		返回高亮选中数据的字节数
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedLength = " + wf_convert(rte_1.SelectedLength()),True)
		else
			rte_1.WordWrap = True
			wf_data_init(rte_1,1,Detail!,True)
			rte_1.SelectTextAll(Detail!)
		end if
	Case 'RTEFUNW13P11'
	/*
	   【功能描述】
	    SelectedLength，WordWrap为true，高亮选择含回车换行符的多行数据

		【编码描述】
		1、初始化控件，构建数据，WordWrap为true
		2、高亮选择含回车换行符的多行数据,调用SelectedLength函数
		3、输出函数返回值

		【代码输出值描述】
		返回高亮选中数据的字节数
		在Windows平台下回车换行符占两个字节
		而在其他有些平台则只占一个字节
		
		【期望UI描述】

		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedLength = " + wf_convert(rte_1.SelectedLength()),True)
		else
			rte_1.WordWrap = True
			wf_data_init(rte_1,1,Detail!,True)
			clipboard(' ~r~n ')
			rte_1.paste()
			wf_data_init(rte_1,1,Detail!,False)
			rte_1.SelectTextAll(Detail!)
		end if
	Case 'RTEFUNW13P12'
	/*
	   【功能描述】
	    SelectedLine，没有高亮选中内容

		【编码描述】
		1、初始化控件，构建数据
		2、设置插入点到第3行，调用SelectedLine函数
		3、输出函数返回值

		【代码输出值描述】
		返回插入点所在的行
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedLine = " + wf_convert(rte_1.SelectedLine()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			rte_1.SelectText(3,1,0,0,Detail!)
		end if
	Case 'RTEFUNW13P13'
	/*
	   【功能描述】
	    SelectedLine，从前向后高亮选中多行数据

		【编码描述】
		1、初始化控件，构建Header区数据
		2、在header区中从前向后高亮选中多行数据,调用SelectedLine函数
		3、输出函数返回值

		【代码输出值描述】
		返回插入点所在的行号
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedLine = " + wf_convert(rte_1.SelectedLine()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			rte_1.SelectText(1,1,3,15,Detail!)
		end if
	Case 'RTEFUNW13P14'
	/*
	   【功能描述】
	    SelectedLine，从后向前高亮选中多行数据

		【编码描述】
		1、初始化控件，构建Footer区数据
		2、在Footer区中从后向前高亮选中多行数据,调用SelectedLine函数
		3、输出函数返回值

		【代码输出值描述】
		返回插入点所在的行号
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedLine = " + wf_convert(rte_1.SelectedLine()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			rte_1.SelectText(5,60,3,15,Detail!)
		end if
	Case 'RTEFUNW13P15'
	/*
	   【功能描述】
	    SelectedPage，控件内容只有一页

		【编码描述】
		1、初始化控件，构建数据
		2、设置插入点，调用SelectedPage函数
		3、输出函数返回值

		【代码输出值描述】
		返回当前页号
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedPage = " + wf_convert(rte_1.SelectedPage()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW13P16'
	/*
	   【功能描述】
	    SelectedPage，控件内容多于一页

		【编码描述】
		1、初始化控件，构建控件内容多于一页
		2、设置插入点到第二页数据中，调用SelectedPage函数
		3、输出函数返回值

		【代码输出值描述】
		返回2
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedPage = " + wf_convert(rte_1.SelectedPage()),True)
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
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			rte_1.SelectText(100,1,0,0,Detail!)
		end if
	Case 'RTEFUNW13P17'
	/*
	   【功能描述】
	    SelectedPage，控件处于预览状态

		【编码描述】
		1、初始化控件，构建控件内容多于一页
		2、控件处于预览状态，调用SelectedPage函数
		3、输出函数返回值

		【代码输出值描述】
		返回当前页号
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedPage = " + wf_convert(rte_1.SelectedPage()),True)
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
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			wf_data_init(rte_1,1,Detail!,False)
			rte_1.SelectText(1,1,0,0,Detail!)
			rte_1.PreView(True)
		end if
	Case 'RTEFUNW13P18'
	/*
	   【功能描述】
	    SelectedPage，插入点位于Header区

		【编码描述】
		1、初始化控件，构建控件内容多于一页
		2、设置插入点位于Header区，调用SelectedPage函数
		3、输出函数返回值

		【代码输出值描述】
		返回当前页号
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedPage = " + wf_convert(rte_1.SelectedPage()),True)
		else
			wf_data_init(rte_1,1,Header!,True)
			wf_data_init(rte_1,1,Header!,False)
			wf_data_init(rte_1,1,Header!,False)
			wf_data_init(rte_1,1,Header!,False)
			wf_data_init(rte_1,1,Header!,False)
			wf_data_init(rte_1,1,Header!,False)
			wf_data_init(rte_1,1,Header!,False)
			wf_data_init(rte_1,1,Header!,False)
			wf_data_init(rte_1,1,Header!,False)
			wf_data_init(rte_1,1,Header!,False)
			wf_data_init(rte_1,1,Header!,False)
			wf_data_init(rte_1,1,Header!,False)
			wf_data_init(rte_1,1,Header!,False)
			wf_data_init(rte_1,1,Header!,False)
			wf_data_init(rte_1,1,Header!,False)
			wf_data_init(rte_1,1,Header!,False)
			
			rte_1.SelectText(1,1,0,0,Header!)
		end if
	Case 'RTEFUNW13P19'
	/*
	   【功能描述】
	    SelectedPage，插入点位于footer区

		【编码描述】
		1、初始化控件，构建控件内容多于一页
		2、设置插入点位于footer区，调用SelectedPage函数
		3、输出函数返回值

		【代码输出值描述】
		返回当前页号
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedPage = " + wf_convert(rte_1.SelectedPage()),True)
		else
			wf_data_init(rte_1,1,Footer!,True)
			wf_data_init(rte_1,1,Footer!,False)
			wf_data_init(rte_1,1,Footer!,False)
			wf_data_init(rte_1,1,Footer!,False)
			wf_data_init(rte_1,1,Footer!,False)
			wf_data_init(rte_1,1,Footer!,False)
			wf_data_init(rte_1,1,Footer!,False)
			wf_data_init(rte_1,1,Footer!,False)
			wf_data_init(rte_1,1,Footer!,False)
			wf_data_init(rte_1,1,Footer!,False)
			wf_data_init(rte_1,1,Footer!,False)
			wf_data_init(rte_1,1,Footer!,False)
			wf_data_init(rte_1,1,Footer!,False)
			
			rte_1.SelectText(1,1,0,0,Footer!)
		end if
	Case 'RTEFUNW13P20'
	/*
	   【功能描述】
	    SelectedStart，没有选中内容

		【编码描述】
		1、初始化控件，构建控件内容
		2、设置插入点，调用SelectedStart函数
		3、输出函数返回值

		【代码输出值描述】
		返回插入点下一个字符的位置
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedStart = " + wf_convert(rte_1.SelectedStart()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)			
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW13P21'
	/*
	   【功能描述】
	    SelectedStart，从前往后选中数据

		【编码描述】
		1、初始化控件，构建控件内容
		2、从前往后选中数据，调用SelectedStart函数
		3、输出函数返回值

		【代码输出值描述】
		所选文本的起始位置
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedStart = " + wf_convert(rte_1.SelectedStart()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)			
			rte_1.SelectText(1,1,4,48,Detail!)
		end if
	Case 'RTEFUNW13P22'
	/*
	   【功能描述】
	    SelectedStart，从后往前选中数据

		【编码描述】
		1、初始化控件，构建控件内容
		2、从后往前选中数据，调用SelectedStart函数
		3、输出函数返回值

		【代码输出值描述】
		所选文本的起始位置
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedStart = " + wf_convert(rte_1.SelectedStart()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)			
			rte_1.SelectText(5,50,3,20,Detail!)
		end if
	Case 'RTEFUNW13P23'
	/*
	   【功能描述】
	    SelectedStart，选中图片

		【编码描述】
		1、初始化控件，构建控件内容
		2、选中图片，调用SelectedStart函数
		3、输出函数返回值

		【代码输出值描述】
		返回对象的位置
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedStart = " + wf_convert(rte_1.SelectedStart()),True)
		else
			wf_data_init(rte_1,7,Detail!,True)			
			rte_1.SelectTextAll(Detail!)
		end if
	Case 'RTEFUNW13P24'
	/*
	   【功能描述】
	    SelectedStart，选中inputField

		【编码描述】
		1、初始化控件，构建控件内容
		2、选中inputField，调用SelectedStart函数
		3、输出函数返回值

		【代码输出值描述】
		返回对象的位置
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedStart = " + wf_convert(rte_1.SelectedStart()),True)
		else	
			rte_1.SelectTextAll(Detail!)
			rte_1.clear()
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')	
			rte_1.SelectTextAll(Detail!)
		end if
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

event close;call super::close;
if FileExists("PUB_BMP_BT_EMP.bmp") then
	FileDelete("PUB_BMP_BT_EMP.bmp")
end if

end event

type mle_phenomena from w_templet`mle_phenomena within w_rtefunw13
end type

type cb_autoparse from w_templet`cb_autoparse within w_rtefunw13
end type

type cb_wrrun from w_templet`cb_wrrun within w_rtefunw13
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rtefunw13
end type

type dw_info from w_templet`dw_info within w_rtefunw13
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rtefunw13
end type

type pb_runnext from w_templet`pb_runnext within w_rtefunw13
end type

type pb_runall from w_templet`pb_runall within w_rtefunw13
end type

type pb_run from w_templet`pb_run within w_rtefunw13
end type

type pb_end from w_templet`pb_end within w_rtefunw13
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rtefunw13
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rtefunw13
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rtefunw13
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rtefunw13
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rtefunw13
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rtefunw13
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rtefunw13
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rtefunw13
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rtefunw13
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rtefunw13
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rtefunw13
end type

type rte_1 from richtextedit within w_rtefunw13
integer x = 37
integer y = 32
integer width = 2889
integer height = 1280
integer taborder = 70
boolean bringtotop = true
boolean init_wordwrap = true
boolean init_popmenu = true
borderstyle borderstyle = stylelowered!
end type

