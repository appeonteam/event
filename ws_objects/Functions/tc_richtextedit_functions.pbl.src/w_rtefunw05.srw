$PBExportHeader$w_rtefunw05.srw
forward
global type w_rtefunw05 from w_templet
end type
type rte_1 from richtextedit within w_rtefunw05
end type
end forward

global type w_rtefunw05 from w_templet
string title = "Function 5"
rte_1 rte_1
end type
global w_rtefunw05 w_rtefunw05

forward prototypes
public function string wf_convert (string as_parm)
public function string wf_convert (long al_parm)
public function string wf_convert (boolean ab_boolean)
public function string wf_convert (location al_parm)
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

public function string wf_convert (location al_parm);string  ls_temp

choose case al_parm
	case first!
		ls_temp = 'First'
	case last!
		ls_temp = 'Last'
	case next!
		ls_temp = 'Next'
	case prior!
		ls_temp = 'Prior'
end choose


return  ls_temp
end function

on w_rtefunw05.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rtefunw05.destroy
call super::destroy
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 
将控件内容成功保存到一个文档后或新打开文档后，Modified属性值变为false
***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Functions\Function 5 
Pbl Name:     
Designer:     ouyangwu
Coder:        zhouchaoqun  Date: 2005-06-27
DocReviewer:  
CoderReviewer:
【功能描述】
测试控件的相关函数
【窗口对象】

【编码注意事项】
1、注意使用SelectText函数来定位光标位置
2、如何将插入点定位到Header或Footer区：
先切换到Header/Footer编辑界面
rte_1.headerFooter = true
rte_1.showheadfoot(true)
再定位
rte_1.SelectText（long ，long ，0，0，Header! /  Footer!）long处为指定的需要定位的位置
若要再切换回Detail区(主输入区) 的话，再rte_1.showheadfoot(false)即可

【测试注意事项】
 
***********************/
string 		ls_temp
location    ll_location

if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return 
if not ab_exe then 
	rte_1.ShowHeadFoot(False)
	rte_1.InputFieldNamesVisible = False
end if

Choose Case as_testpoint
	Case 'RTEFUNW05P01'
	/*
	   【功能描述】
	    InputFieldGetData，参数为NULL

		【编码描述】
		1、初始化控件
		2、指定参数为NULL，调用InputFieldGetData
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			Setnull(ls_temp)
			wf_output("FunReturn: InputFieldGetData = " + Wf_convert(rte_1.InputFieldGetData(ls_temp)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(1,1,0,0)
		end if
	Case 'RTEFUNW05P02'
	/*
	   【功能描述】
	    InputFieldGetData，参数为不存在的InputField

		【编码描述】
		1、初始化控件,插入一些InputField
		2、指定参数为不存在的InputField，调用InputFieldGetData
		3、输出函数返回值

		【代码输出值描述】
		空字符串
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn: InputFieldGetData = " + Wf_convert(rte_1.InputFieldGetData('Id')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(1,1,0,0)
		end if
	Case 'RTEFUNW05P03'
	/*
	   【功能描述】
	    InputFieldGetData，参数为没有数据的InputField

		【编码描述】
		1、初始化控件,插入一些InputField
		2、指定参数为存在的InputField的，但其没有数据，调用InputFieldGetData
		3、输出函数返回值

		【代码输出值描述】
		空字符串
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn: InputFieldGetData = " + Wf_convert(rte_1.InputFieldGetData('APPEON')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("APPEON")
//			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(1,1,0,0)
		end if
	Case 'RTEFUNW05P04'
	/*
	   【功能描述】
	    InputFieldGetData，参数有数据的InputField

		【编码描述】
		1、初始化控件,插入一些InputField，并设置数据值
		2、指定参数为存在的InputField的，调用InputFieldGetData
		3、输出函数返回值

		【代码输出值描述】
		返回指定InputField的数据值
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn: InputFieldGetData = " + Wf_convert(rte_1.InputFieldGetData('Name')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(1,1,0,0)
		end if
	Case 'RTEFUNW05P05'
	/*
	   【功能描述】
	    InputFieldInsert，参数为NULL

		【编码描述】
		1、初始化控件,插入一些InputField，并设置数据值
		2、指定参数为NULL，调用InputFieldInsert
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			Setnull(ls_temp)
			wf_output("FunReturn: InputFieldInsert = " + Wf_convert(rte_1.InputFieldInsert(ls_temp)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(1,1,0,0)
		end if
	Case 'RTEFUNW05P06'
	/*
	   【功能描述】
	    插入控件中不存在的InputField，InputFieldNamesVisible为false

		【编码描述】
		1、初始化控件,输入区为Detail，InputFieldNamesVisible为false
		2、指定参数为控件中不存在的InputField，调用InputFieldInsert
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn: InputFieldInsert = " + Wf_convert(rte_1.InputFieldInsert('CHINA')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(1,1,0,0)
		end if
	Case 'RTEFUNW05P07'
	/*
	   【功能描述】
	    插入与控件中相同的InputField,InputFieldNamesVisible为false

		【编码描述】
		1、初始化控件,输入区为header，插入一些InputField，并设置数据值,InputFieldNamesVisible为false
		2、指定参数为控件中相同的InputField，调用InputFieldInsert
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		新插入的InputField数据值与控件已有相同InputField数据值一样
	*/
		
		if ab_exe then
			wf_output("FunReturn: InputFieldInsert = " + Wf_convert(rte_1.InputFieldInsert('Name')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW05P08'
	/*
	   【功能描述】
	    插入与控件中相同的InputField,InputFieldNamesVisible为true

		【编码描述】
		1、初始化控件,输入区为Footer，插入一些InputField，并设置数据值,InputFieldNamesVisible为true
		2、指定参数为控件中相同的InputField，调用InputFieldInsert
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		InputField显示为InputFieldName
	*/
		
		if ab_exe then
			wf_output("FunReturn: InputFieldInsert = " + Wf_convert(rte_1.InputFieldInsert('Name')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldNamesVisible = True
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW05P09'
	/*
	   【功能描述】
	    插入在Active状态InputField之前

		【编码描述】
		1、初始化控件,插入一些InputField,InputFieldNamesVisible为true
		2、调用InputFieldInsert
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		在Active状态InputField的之前插入新的InputField
	*/
		
		if ab_exe then
			wf_output("FunReturn: InputFieldInsert = " + Wf_convert(rte_1.InputFieldInsert('Sex')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldNamesVisible = True
		end if
	Case 'RTEFUNW05P10'
	/*
	   【功能描述】
	    高亮选中一部分控件内容，调用函数插入InputField

		【编码描述】
		1、初始化控件,插入一些InputField,InputFieldNamesVisible为true
		2、高亮选中一部分控件内容，有效调用InputFieldInsert
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		新插入的InputField替换被高亮选中的内容
	*/
		
		if ab_exe then
			wf_output("FunReturn: InputFieldInsert = " + Wf_convert(rte_1.InputFieldInsert('Sex')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldNamesVisible = True
			rte_1.SelectText(1,1,1,20,Detail!)
		end if
	Case 'RTEFUNW05P11'
	/*
	   【功能描述】
	    InputFieldLocate，location参数为NULL，只带第一个参数

		【编码描述】
		1、初始化控件,插入一些InputField
		2、只带第一个参数，location参数为NULL，调用InputFieldLocate
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(ll_location)
			wf_output("FunReturn: InputFieldLocate = " + Wf_convert(rte_1.InputFieldLocate(ll_location)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW05P12'
	/*
	   【功能描述】
	    InputFieldLocate，location参数为NULL,带两个参数

		【编码描述】
		1、初始化控件,插入一些InputField
		2、带两个参数，location参数为NULL，调用InputFieldLocate
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(ll_location)
			wf_output("FunReturn: InputFieldLocate = " + Wf_convert(rte_1.InputFieldLocate(ll_location,'Name')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW05P13'
	/*
	   【功能描述】
	    InputFieldLocate，inputfieldname参数为NULL,带两个参数

		【编码描述】
		1、初始化控件,插入一些InputField
		2、带两个参数，inputfieldname参数为NULL，调用InputFieldLocate
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(ls_temp)
			wf_output("FunReturn: InputFieldLocate = " + Wf_convert(rte_1.InputFieldLocate(First!,ls_temp)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW05P14'
	/*
	   【功能描述】
	    InputFieldLocate，location参数为First!，只带第一个参数

		【编码描述】
		1、初始化控件,输入区为Detail,插入一些InputField
		2、只带第一个参数，location参数为First!，有效调用InputFieldLocate
		3、输出函数返回值

		【代码输出值描述】
		返回第一个输入域的名称
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn: InputFieldLocate = " + Wf_convert(rte_1.InputFieldLocate(First!)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(2,2,0,0,Detail!)
		end if
	Case 'RTEFUNW05P15'
	/*
	   【功能描述】
	    InputFieldLocate，location参数为Last!，只带第一个参数

		【编码描述】
		1、初始化控件,输入区为Header,插入一些InputField
		2、只带第一个参数，location参数为Last!，调用InputFieldLocate
		3、输出函数返回值

		【代码输出值描述】
		返回最后一个输入域的名称
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn: InputFieldLocate = " + Wf_convert(rte_1.InputFieldLocate(Last!)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW05P16'
	/*
	   【功能描述】
	    InputFieldLocate，location参数为Next!，只带第一个参数

		【编码描述】
		1、初始化控件,输入区为Footer,插入一些InputField
		2、设置插入点，只带第一个参数，location参数为Next!，调用InputFieldLocate
		3、输出函数返回值

		【代码输出值描述】
		返回插入点处下一个输入域的名称
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn: InputFieldLocate = " + Wf_convert(rte_1.InputFieldLocate(Next!)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW05P17'
	/*
	   【功能描述】
	    InputFieldLocate，location参数为Prior!，只带第一个参数

		【编码描述】
		1、初始化控件,输入区为Detail,插入一些InputField
		2、设置插入点，只带第一个参数，location参数为Prior!，调用InputFieldLocate
		3、输出函数返回值

		【代码输出值描述】
		返回插入点处前一个输入域的名称
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn: InputFieldLocate = " + Wf_convert(rte_1.InputFieldLocate(Prior!)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(2,2,0,0,Detail!)
		end if
	Case 'RTEFUNW05P18'
	/*
	   【功能描述】
	    InputFieldLocate，只带一个参数，测试函数返回空字符串

		【编码描述】
		1、初始化控件,输入区为Detail,插入一些InputField
		2、设置插入点，该插入点前没有InputField存在，只带第一个参数，location参数为Prior!，调用InputFieldLocate
		3、输出函数返回值

		【代码输出值描述】
		空字符串
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn: InputFieldLocate = " + Wf_convert(rte_1.InputFieldLocate(Prior!)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW05P19'
	/*
	   【功能描述】
	    InputFieldLocate，location参数为First!，带两个参数

		【编码描述】
		1、初始化控件,输入区为Detail,插入一些InputField
		2、带两个参数，location参数为First!，有效调用InputFieldLocate
		3、输出函数返回值

		【代码输出值描述】
		返回指定输入域的名称
		
		【期望UI描述】
		插入点设置到指定输入域的第一次出现的地方
	*/
		
		if ab_exe then
			wf_output("FunReturn: InputFieldLocate = " + Wf_convert(rte_1.InputFieldLocate(First!,'Name')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW05P20'
	/*
	   【功能描述】
	    InputFieldLocate，location参数为Last!，带两个参数

		【编码描述】
		1、初始化控件,输入区为Header,插入一些InputField
		2、带两个参数，location参数为Last!，调用InputFieldLocate
		3、输出函数返回值

		【代码输出值描述】
		返回指定输入域的名称
		
		【期望UI描述】
		插入点设置到指定输入域的最后一次出现的地方
	*/
		
		if ab_exe then
			wf_output("FunReturn: InputFieldLocate = " + Wf_convert(rte_1.InputFieldLocate(Last!,'Name')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW05P21'
	/*
	   【功能描述】
	    InputFieldLocate，location参数为Next!，带两个参数

		【编码描述】
		1、初始化控件,输入区为Footer,插入一些InputField,且有相同的InputField存在
		2、设置插入点，带两个参数，location参数为Next!，调用InputFieldLocate
		3、输出函数返回值

		【代码输出值描述】
		返回指定输入域的名称
		
		【期望UI描述】
		插入点设置到指定输入域在执行前的插入点的下一次出现的地方
	*/
		
		if ab_exe then
			wf_output("FunReturn: InputFieldLocate = " + Wf_convert(rte_1.InputFieldLocate(Next!,'Name')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'Appeon')
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW05P22'
	/*
	   【功能描述】
	    InputFieldLocate，location参数为Prior!，带两个参数

		【编码描述】
		1、初始化控件,输入区为Detail,插入一些InputField,且有相同的InputField存在
		2、设置插入点，带两个参数，location参数为Prior!，调用InputFieldLocate
		3、输出函数返回值

		【代码输出值描述】
		返回指定输入域的名称
		
		【期望UI描述】
		插入点设置到指定输入域在执行前的插入点的前一次出现的地方
	*/
		
		if ab_exe then
			wf_output("FunReturn: InputFieldLocate = " + Wf_convert(rte_1.InputFieldLocate(Prior!,'Name')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'Appeon')
			rte_1.SelectText(2,3,0,0,Detail!)
		end if
	Case 'RTEFUNW05P23'
	/*
	   【功能描述】
	    InputFieldLocate，带两个参数，测试函数返回空字符串

		【编码描述】
		1、初始化控件,输入区为Detail,插入一些InputField
		2、设置插入点，该插入点前没有InputField存在，带两个参数，location参数为Prior!，调用InputFieldLocate
		3、输出函数返回值

		【代码输出值描述】
		空字符串
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn: InputFieldLocate = " + Wf_convert(rte_1.InputFieldLocate(Prior!,'Name')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(1,1,1,1,Detail!)
		end if
End Choose
if ab_exe then
	wf_postrun(al_row)
end if
end event

type pb_saveexpect from w_templet`pb_saveexpect within w_rtefunw05
end type

type pb_runnext from w_templet`pb_runnext within w_rtefunw05
end type

type pb_runall from w_templet`pb_runall within w_rtefunw05
end type

type pb_run from w_templet`pb_run within w_rtefunw05
end type

type pb_end from w_templet`pb_end within w_rtefunw05
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rtefunw05
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rtefunw05
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rtefunw05
integer x = 2999
integer y = 1808
integer width = 1595
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rtefunw05
integer x = 2999
integer y = 1392
integer width = 1595
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rtefunw05
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rtefunw05
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rtefunw05
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rtefunw05
integer x = 2981
integer y = 1324
integer width = 1632
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rtefunw05
integer x = 2981
integer y = 1736
integer width = 1632
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rtefunw05
integer y = 524
integer height = 796
end type

type rte_1 from richtextedit within w_rtefunw05
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

