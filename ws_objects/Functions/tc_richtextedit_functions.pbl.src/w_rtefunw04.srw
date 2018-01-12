$PBExportHeader$w_rtefunw04.srw
forward
global type w_rtefunw04 from w_templet
end type
type rte_1 from richtextedit within w_rtefunw04
end type
end forward

global type w_rtefunw04 from w_templet
string title = "Function 4"
rte_1 rte_1
end type
global w_rtefunw04 w_rtefunw04

forward prototypes
public subroutine wf_data_init (richtextedit ar_rich, integer ai_sign, band ab_band)
public function string wf_convert (string as_parm)
public function string wf_convert (long al_parm)
public function string wf_convert (boolean ab_boolean)
public subroutine wf_setparagraph (band ab_band)
public subroutine wf_settextformat (band ab_band)
end prototypes

public subroutine wf_data_init (richtextedit ar_rich, integer ai_sign, band ab_band);//==================================================================================
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

ar_rich.SelectTextAll (ab_band )
ar_rich.Clear( )
ar_rich.SelectText(1,1,0,0,ab_band)
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

rte_1.SelectTextALL(ab_band)
rte_1.SetParagraphSetting ( Indent! , 0 )
rte_1.SetParagraphSetting ( LeftMargin!  , 0 )
rte_1.SetParagraphSetting ( RightMargin!  , 0 )
rte_1.SelectTextALL(ab_band)
rte_1.SetParagraphSetting ( Indent! , 0 )
rte_1.SetParagraphSetting ( LeftMargin!  , 0 )
rte_1.SetParagraphSetting ( RightMargin!  , 0 )


ar_rich.SelectText(ar_rich.LineCount(),1,0,0,ab_band)
ar_rich.SelectText(ar_rich.LineCount(),ar_rich.LineLength()+1,0,0,ab_band)


end subroutine

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

public subroutine wf_setparagraph (band ab_band);//
//rte_1.SelectTextALL(ab_band)
//rte_1.SetParagraphSetting ( Indent! , 500 )
//rte_1.SetParagraphSetting ( LeftMargin!  , 500 )
//rte_1.SetParagraphSetting ( RightMargin!  , 800 )
//rte_1.selecttext(1,1,0,0,ab_band)
end subroutine

public subroutine wf_settextformat (band ab_band);//
rte_1.SelectTextALL(ab_band)

rte_1.SetParagraphSetting ( Indent! , 0 )
rte_1.SetParagraphSetting ( LeftMargin!  , 0 )
rte_1.SetParagraphSetting ( RightMargin!  , 0 )

rte_1.Settextstyle( true, true, true, true, true, true)
rte_1.SettextColor(rgb(0,0,255 ))

rte_1.SelectText(1,1,1,5,ab_band)
rte_1.SetAlignment ( Center!  )

rte_1.SelectText(2,1,2,5,ab_band)
rte_1.SetAlignment ( Right!   )

rte_1.SelectText(3,1,3,5,ab_band)
rte_1.SetAlignment (  Left!  )

rte_1.SelectText(4,1,4,5,ab_band)
rte_1.SetAlignment ( Justify!   )

rte_1.SelectText(1,1,0,0,ab_band)
end subroutine

on w_rtefunw04.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rtefunw04.destroy
call super::destroy
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 
将控件内容成功保存到一个文档后或新打开文档后，Modified属性值变为false
***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Functions\Function 4 
Pbl Name:     
Designer:     ouyangwu
Coder:          zhouchaoqun  Date: 2005-06-27
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
String  ls_temp
datastore  ldt_data

if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return 
if not ab_exe then 
	rte_1.Show()
	rte_1.InputFieldNamesVisible = False
end if

Choose Case as_testpoint
	Case 'RTEFUNW04P01'
	/*
	   【功能描述】
	    GetTextColor，没有选中字符

		【编码描述】
		1、初始化控件及内容
		2、设置插入点，调用GetTextColor函数得到插入点的颜色
		3、输出函数返回值

		【代码输出值描述】
		输出插入点所在位置的颜色值
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  GetTextColor = " + wf_convert(rte_1.GetTextColor()),True)
		else
			wf_data_init(rte_1,1,Detail!)
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW04P02'
	/*
	   【功能描述】
	    GetTextColor，选中单个字符

		【编码描述】
		1、初始化控件及内容
		2、设置插入点，选中单个字符，调用GetTextColor函数得到插入点的颜色
		3、输出函数返回值

		【代码输出值描述】
		输出所选字符的颜色值
		
		【期望UI描述】
		
	*/
		
		if ab_exe then			
			wf_output("FunReturn:  GetTextColor = " + wf_convert(rte_1.GetTextColor()),True)
		else
			wf_data_init(rte_1,1,Detail!)
			rte_1.SelectText(1,1,1,1,Detail!)
		end if
	Case 'RTEFUNW04P03'
	/*
	   【功能描述】
	    GetTextColor，选中多个字符，字符间颜色不同

		【编码描述】
		1、初始化控件及内容
		2、设置插入点，选中多个字符，第一个选中字符为多字节字符
		3、调用GetTextColor函数得到插入点的颜色
		4、输出函数返回值

		【代码输出值描述】
		输出所选第一个字符的颜色值
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  GetTextColor = " + wf_convert(rte_1.GetTextColor()),True)
		else
			Integer	li_RtnVal
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.')
			rte_1.Paste()
			rte_1.SelectText(1,1,1,5,Detail!)
			li_RtnVal = rte_1.SetTextColor(255)
			rte_1.SelectText(1,6,1,10,Detail!)
			li_RtnVal = rte_1.SetTextColor(370)
			rte_1.SelectText(1,1,1,10,Detail!)
		end if
	Case 'RTEFUNW04P04'
	/*
	   【功能描述】
	    GetTextStyle

		【编码描述】
		1、初始化控件及内容
		2、设置插入点，选中某字符
		3、分别使用六种参数值调用GetTextStyle函数
		4、输出函数返回值

		【代码输出值描述】
		输出是否是参数指定值的布尔值
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  GetTextStyle(Bold!) = " + wf_convert(rte_1.GetTextStyle(Bold!)),True)
			wf_output("FunReturn:  GetTextStyle(Italic!) = " + wf_convert(rte_1.GetTextStyle(Italic!)),False)
			wf_output("FunReturn:  GetTextStyle(Strikeout!) = " + wf_convert(rte_1.GetTextStyle(Strikeout!)),False)
			wf_output("FunReturn:  GetTextStyle(Subscript!) = " + wf_convert(rte_1.GetTextStyle(Subscript!)),False)
			wf_output("FunReturn:  GetTextStyle(Superscript!) = " + wf_convert(rte_1.GetTextStyle(Superscript!)),False)
			wf_output("FunReturn:  GetTextStyle(Underlined!) = " + wf_convert(rte_1.GetTextStyle(Underlined!)),False)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.')
			rte_1.Paste()
			rte_1.SelectText(1,8,1,8,Detail!)
		end if
	Case 'RTEFUNW04P05'
	/*
	   【功能描述】
	    Hide

		【编码描述】
		1、初始化控件及内容
		2、调用Hide函数
		3、输出函数返回值及Visible值

		【代码输出值描述】
		1,false
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn: Hide = " + String(rte_1.Hide()),True)
			wf_output("FunReturn: Visible = " + wf_convert(rte_1.Visible),False)
		else
			wf_data_init(rte_1,1,Detail!)
		end if
	Case 'RTEFUNW04P06'
	/*
	   【功能描述】
	    InputFieldChangeData,参数inputfieldname为NULL

		【编码描述】
		1、初始化控件，插入几个InputField，InputFieldNamesVisible设置为false
		2、指定参数inputfieldname为NULL，调用InputFieldChangeData函数
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(ls_temp)
			wf_output("FunReturn: InputFieldChangeData = " + wf_convert(rte_1.InputFieldChangeData(ls_temp,'Appeon')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'appeon')
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
		end if
	Case 'RTEFUNW04P07'
	/*
	   【功能描述】
	    InputFieldChangeData,参数inputfieldvalue为NULL

		【编码描述】
		1、初始化控件，插入几个InputField,InputFieldNamesVisible设置为false
		2、指定参数inputfieldvalue为NULL，调用InputFieldChangeData函数
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(ls_temp)
			wf_output("FunReturn: InputFieldChangeData = " + wf_convert(rte_1.InputFieldChangeData('Name',ls_temp)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'appeon')
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
		end if
	Case 'RTEFUNW04P08'
	/*
	   【功能描述】
	    InputFieldChangeData,两个参数都有效，InputFieldNamesVisible为false

		【编码描述】
		1、初始化控件，插入几个InputField,InputFieldNamesVisible设置为false
		2、指定有效参数，调用InputFieldChangeData函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		指定的InputField变为修改后数据
	*/
		
		if ab_exe then
			wf_output("FunReturn: InputFieldChangeData = " + wf_convert(rte_1.InputFieldChangeData('Name','Appeon')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
		end if
	Case 'RTEFUNW04P09'
	/*
	   【功能描述】
	    InputFieldChangeData,两个参数都有效，InputFieldNamesVisible为true

		【编码描述】
		1、初始化控件，插入几个InputField,InputFieldNamesVisible设置为true
		2、指定有效参数，调用InputFieldChangeData函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		UI无变化
	*/
		
		if ab_exe then			
			wf_output("FunReturn: InputFieldChangeData = " + wf_convert(rte_1.InputFieldChangeData('Name','Appeon')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
			rte_1.InputFieldNamesVisible = True
		end if
	Case 'RTEFUNW04P10'
	/*
	   【功能描述】
	    调用InputFieldChangeData后改变InputFieldNamesVisible为false

		【编码描述】
		1、初始化控件，插入几个InputField,InputFieldNamesVisible设置为true
		2、指定有效参数，调用InputFieldChangeData函数,改变InputFieldNamesVisible为false
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then			
			wf_output("FunReturn: InputFieldChangeData = " + wf_convert(rte_1.InputFieldChangeData('Name','Appeon')),True)
			rte_1.InputFieldNamesVisible = False
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
			rte_1.InputFieldNamesVisible = True
		end if
	Case 'RTEFUNW04P11'
	/*
	   【功能描述】
	    InputFieldChangeData,指定InputFieldName不存在

		【编码描述】
		1、初始化控件，插入几个InputField，InputFieldNamesVisible为false
		2、指定的InputFieldName不存在，调用InputFieldChangeData函数
		3、输出函数返回值

		【代码输出值描述】
		-1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then			
			wf_output("FunReturn: InputFieldChangeData = " + wf_convert(rte_1.InputFieldChangeData('Salary','Appeon')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
		end if
	Case 'RTEFUNW04P12'
	/*
	   【功能描述】
	    InputFieldChangeData,指定inputfieldvalue为Tab字符

		【编码描述】
		1、初始化控件，插入几个InputField，InputFieldNamesVisible为false
		2、指定inputfieldvalue为Tab字符，调用InputFieldChangeData函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then			
			wf_output("FunReturn: InputFieldChangeData = " + wf_convert(rte_1.InputFieldChangeData('Name','~t')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
		end if
	Case 'RTEFUNW04P13'
	/*
	   【功能描述】
	    InputFieldChangeData,指定inputfieldvalue为回车换行字符

		【编码描述】
		1、初始化控件，插入几个InputField，InputFieldNamesVisible为false
		2、指定inputfieldvalue为回车换行字符串，调用InputFieldChangeData函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then			
			wf_output("FunReturn: InputFieldChangeData = " + wf_convert(rte_1.InputFieldChangeData('Name',' ~r~n ')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
		end if
	Case 'RTEFUNW04P14'
	/*
	   【功能描述】
	    InputFieldChangeData,控件中包含多个相同的参数所指定的InputFieldName

		【编码描述】
		1、初始化控件，插入一些相同InputField，InputFieldNamesVisible为false
		2、指定那些存在多个的InputFieldName，调用InputFieldChangeData函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		控件中具有相同InputFieldName都被改变成相应数据
	*/
		
		if ab_exe then			
			wf_output("FunReturn: InputFieldChangeData = " + wf_convert(rte_1.InputFieldChangeData('Name','Appeon')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Name")
			wf_setparagraph(Detail!)
			wf_setTextFormat(Detail!)
			rte_1.InputFieldChangeData ("Name", 'M')
		end if
	Case 'RTEFUNW04P15'
	/*
	   【功能描述】
	    使用InputFieldChangeData修改数据不影响Datastore的共享数据

		【编码描述】
		1、初始化控件，建立一个DataStore，将其数据与RichTextEdit控件共享
		2、在控件中对第一行数据某列调用InputFieldChangeData函数改变值
		3、输出函数返回值
		4、GetItem得到DataStore相对应的数据值并输出
		
		【代码输出值描述】
		1
		Datastore中保持原来的数据不变
		
		【期望UI描述】
		
	*/
		ldt_data = create datastore
		ldt_data.dataobject = 'rtefunw04_d01_temp01'
		if ab_exe then			
			rte_1.DataSource(ldt_data)
			rte_1.InputFieldInsert('info_2')
			wf_output("FunReturn: InputFieldChangeData = " + wf_convert(rte_1.InputFieldChangeData('info_2','IBM')),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
		end if
		Destroy ldt_data
	Case 'RTEFUNW04P16'
	/*
	   【功能描述】
	    InputFieldCurrentName,插入点在InputField上

		【编码描述】
		1、初始化控件，插入一些InputField
		2、设置插入点至InputField，调用InputFieldCurrentName函数
		3、输出函数返回值

		【代码输出值描述】
		插入点所在InputField的名字
		
		【期望UI描述】
		
	*/
		
		if ab_exe then						
			wf_output("FunReturn: InputFieldCurrentName = " + wf_convert(rte_1.InputFieldCurrentName()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
			rte_1.SelectText(2,2,0,0,Detail!)
		end if
	Case 'RTEFUNW04P17'
	/*
	   【功能描述】
	    InputFieldCurrentName,插入点不在InputField上

		【编码描述】
		1、初始化控件，插入一些InputField
		2、设置插入点至非InputField，调用InputFieldCurrentName函数
		3、输出函数返回值

		【代码输出值描述】
		返回空字符串
		
		【期望UI描述】
		
	*/
		
		if ab_exe then						
			wf_output("FunReturn: InputFieldCurrentName = " + wf_convert(rte_1.InputFieldCurrentName()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
			wf_setparagraph(Detail!)
			wf_setTextFormat(Detail!)
			rte_1.SelectText(1,5,0,0,Detail!)
		end if
	Case 'RTEFUNW04P18'
	/*
	   【功能描述】
	    InputFieldDeleteCurrent,插入点在InputField上

		【编码描述】
		1、初始化控件，插入一些InputField，InputFieldNamesVisible为true
		2、设置插入点至两个相邻InputField中间，调用InputFieldDeleteCurrent函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then						
			wf_output("FunReturn: InputFieldDeleteCurrent = " + wf_convert(rte_1.InputFieldDeleteCurrent()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
			rte_1.InputFieldNamesVisible = True
			rte_1.SelectText(2,2,0,0,Detail!)
		end if
	Case 'RTEFUNW04P19'
	/*
	   【功能描述】
	    InputFieldDeleteCurrent,插入点不在InputField上

		【编码描述】
		1、初始化控件，插入一些InputField，InputFieldNamesVisible为true
		2、设置插入点至非InputField，调用InputFieldDeleteCurrent函数
		3、输出函数返回值

		【代码输出值描述】
		-1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then						
			wf_output("FunReturn: InputFieldDeleteCurrent = " + wf_convert(rte_1.InputFieldDeleteCurrent()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
			rte_1.InputFieldNamesVisible = True
			rte_1.SelectText(1,5,0,0,Detail!)
		end if
	Case 'RTEFUNW04P20'
	/*
	   【功能描述】
	    InputFieldDeleteCurrent,当前InputField正处于编辑状态

		【编码描述】
		1、初始化控件，插入一些InputField，InputFieldNamesVisible为false
		2、调用InputFieldDeleteCurrent函数
		3、输出函数返回值

		【代码输出值描述】
		-1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then						
			wf_output("FunReturn: InputFieldDeleteCurrent = " + wf_convert(rte_1.InputFieldDeleteCurrent()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
			wf_setparagraph(Detail!)
			wf_setTextFormat(Detail!)
			rte_1.SelectText(2,2,2,2,Detail!)
		end if
	Case 'RTEFUNW04P21'
	/*
	   【功能描述】
	    InputFieldDeleteCurrent,存在多个相同的InputField

		【编码描述】
		1、初始化控件，插入一些相同的InputField但彼此之间有间隔，InputFieldNamesVisible为true
		2、设置插入点到某InputField，调用InputFieldDeleteCurrent函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		插入点处的InputField被删除，其他相同的InputField仍然存在
	*/
		
		if ab_exe then						
			wf_output("FunReturn: InputFieldDeleteCurrent = " + wf_convert(rte_1.InputFieldDeleteCurrent()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			Clipboard('IBM~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			Clipboard('Sun.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
			rte_1.InputFieldNamesVisible = True
			wf_setparagraph(Detail!)
			wf_setTextFormat(Detail!)
			rte_1.SelectText(4,2,0,0,Detail!)
		end if
	Case 'RTEFUNW04P22'
	/*
	   【功能描述】
	    删除有数据值的InputField后，再插入相同的InputField

		【编码描述】
		1、初始化控件，插入InputField并改变其数据
		2、设置插入点到InputField，调用InputFieldDeleteCurrent函数
		3、输出函数返回值
		4、设置插入点再插入同样的InputField到控件中

		【代码输出值描述】
		1
		
		【期望UI描述】
		某与数据值的InputField被删除后，再插入相同InputField时，其数据使用删除前的数据
	*/
		
		if ab_exe then				
			wf_output("FunReturn: InputFieldDeleteCurrent = " + wf_convert(rte_1.InputFieldDeleteCurrent()),True)
			rte_1.InputFieldInsert("Name")
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
			wf_setparagraph(Detail!)
			wf_setTextFormat(Detail!)
			rte_1.SelectText(2,3,0,0,Detail!)
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

type mle_phenomena from w_templet`mle_phenomena within w_rtefunw04
end type

type cb_autoparse from w_templet`cb_autoparse within w_rtefunw04
end type

type cb_wrrun from w_templet`cb_wrrun within w_rtefunw04
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rtefunw04
end type

type dw_info from w_templet`dw_info within w_rtefunw04
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rtefunw04
end type

type pb_runnext from w_templet`pb_runnext within w_rtefunw04
end type

type pb_runall from w_templet`pb_runall within w_rtefunw04
end type

type pb_run from w_templet`pb_run within w_rtefunw04
end type

type pb_end from w_templet`pb_end within w_rtefunw04
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rtefunw04
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rtefunw04
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rtefunw04
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rtefunw04
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rtefunw04
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rtefunw04
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rtefunw04
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rtefunw04
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rtefunw04
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rtefunw04
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rtefunw04
end type

type rte_1 from richtextedit within w_rtefunw04
integer x = 27
integer y = 24
integer width = 2926
integer height = 1300
integer taborder = 70
boolean bringtotop = true
boolean init_wordwrap = true
boolean init_headerfooter = true
boolean init_popmenu = true
borderstyle borderstyle = stylelowered!
end type

