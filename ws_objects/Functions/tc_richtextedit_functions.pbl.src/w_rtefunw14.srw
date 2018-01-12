$PBExportHeader$w_rtefunw14.srw
forward
global type w_rtefunw14 from w_templet
end type
type rte_1 from richtextedit within w_rtefunw14
end type
end forward

global type w_rtefunw14 from w_templet
string title = "Function 14"
rte_1 rte_1
end type
global w_rtefunw14 w_rtefunw14

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
elseif as_parm = ' ' then
	as_parm = "One Space"
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

//ar_rich.SelectTextALL(ab_band)
//
//ar_rich.Settextstyle( true, true, true, true, true, true)
//ar_rich.SettextColor(rgb(0,0,255 ))
//
//ar_rich.SelectText(1,1,1,5,ab_band)
//ar_rich.SetAlignment ( Center!  )
//
//ar_rich.SelectText(2,1,2,5,ab_band)
//ar_rich.SetAlignment ( Right!   )
//
//ar_rich.SelectText(3,1,3,5,ab_band)
//ar_rich.SetAlignment (  Left!  )
//
//ar_rich.SelectText(4,1,4,5,ab_band)
//ar_rich.SetAlignment ( Justify!)
//
//
//ar_rich.SelectText(ar_rich.LineCount(),1,0,0,ab_band)
//ar_rich.SelectText(ar_rich.LineCount(),ar_rich.LineLength() + 1,0,0,ab_band)
end subroutine

on w_rtefunw14.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rtefunw14.destroy
call super::destroy
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 
将控件内容成功保存到一个文档后或新打开文档后，Modified属性值变为false
***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Functions\Function 14 
Pbl Name:     
Designer:     ouyangwu
Coder:        zhouchaoqun  Date: 2005-06-28
DocReviewer:  
CoderReviewer:
【功能描述】

【窗口对象】

【编码注意事项】
1、SelectText函数中，控件包括Picture或Input Field对象时，该对象相对于函数参数来说将做为一个位置符

【测试注意事项】
 
***********************/
long  ll_num

if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return 

Choose Case as_testpoint
	Case 'RTEFUNW14P01'
	/*
	   【功能描述】
	    SelectedText,没有选中内容

		【编码描述】
		1、初始化控件，构建数据
		2、调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回空字符串
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedText = " + wf_convert(rte_1.SelectedText()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
		end if
	Case 'RTEFUNW14P02'
	/*
	   【功能描述】
	    SelectedText，选中含InputField的数据

		【编码描述】
		1、初始化控件，构建数据
		2、选中含InputField的数据,调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回选中的字符串，InputField则返回InputFieldName
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedText = " + wf_convert(rte_1.SelectedText()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')	
			wf_data_init(rte_1,1,Detail!,False)
			rte_1.SelectText(1,1,1,1,Detail!)
		end if
	Case 'RTEFUNW14P03'
	/*
	   【功能描述】
	    SelectedText，选中含图片的数据

		【编码描述】
		1、初始化控件，构建数据
		2、选中含图片的数据,调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回选中的字符串
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedText = " + wf_convert(rte_1.SelectedText()),True)
		else
			wf_data_init(rte_1,7,Detail!,True)
			wf_data_init(rte_1,1,Detail!,False)
			rte_1.SelectText(1,1,1,1,Detail!)
		end if
	Case 'RTEFUNW14P04'
	/*
	   【功能描述】
	    SelectedText，选中含多字节的数据

		【编码描述】
		1、初始化控件，构建数据
		2、选中含多字节的数据,调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回选中的字符串
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedText = " + wf_convert(rte_1.SelectedText()),True)
		else
			wf_data_init(rte_1,2,Detail!,True)
			rte_1.SelectText(1,1,2,10,Detail!)
		end if
	Case 'RTEFUNW14P05'
	/*
	   【功能描述】
	    SelectedText，在Header区选中数据

		【编码描述】
		1、初始化控件，构建数据
		2、在Header区选中数据,调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回选中的字符串
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedText = " + wf_convert(rte_1.SelectedText()),True)
		else
			wf_data_init(rte_1,1,Header!,True)
			rte_1.SelectText(1,1,2,10,Header!)
		end if
	Case 'RTEFUNW14P06'
	/*
	   【功能描述】
	    SelectedText，在footer区选中数据

		【编码描述】
		1、初始化控件，构建数据
		2、在Footer区选中数据,调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回选中的字符串
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectedText = " + wf_convert(rte_1.SelectedText()),True)
		else
			wf_data_init(rte_1,1,Footer!,True)
			rte_1.SelectText(1,1,2,10,Footer!)
		end if
	Case 'RTEFUNW14P07'
	/*
	   【功能描述】
	    SelectText，fromline为NULL

		【编码描述】
		1、初始化控件，构建数据
		2、fromline为NULL,调用函数
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(ll_num)
			wf_output("FunReturn:  SelectText = " + wf_convert(rte_1.SelectText(ll_Num,1,2,10)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
		end if
	Case 'RTEFUNW14P08'
	/*
	   【功能描述】
	    SelectText，fromchar为NULL

		【编码描述】
		1、初始化控件，构建数据
		2、fromchar为NULL,调用函数
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(ll_num)
			wf_output("FunReturn:  SelectText = " + wf_convert(rte_1.SelectText(1,ll_Num,2,10)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
		end if
	Case 'RTEFUNW14P09'
	/*
	   【功能描述】
	    SelectText，toline为NULL

		【编码描述】
		1、初始化控件，构建数据
		2、toline为NULL,调用函数
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(ll_num)
			wf_output("FunReturn:  SelectText = " + wf_convert(rte_1.SelectText(1,1,ll_Num,10)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
		end if
	Case 'RTEFUNW14P10'
	/*
	   【功能描述】
	    SelectText，tochar为NULL

		【编码描述】
		1、初始化控件，构建数据
		2、tochar为NULL,调用函数
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(ll_num)
			wf_output("FunReturn:  SelectText = " + wf_convert(rte_1.SelectText(1,1,2,ll_Num)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
		end if
	Case 'RTEFUNW14P11'
	/*
	   【功能描述】
	    SelectText，band为NULL

		【编码描述】
		1、初始化控件，构建数据
		2、band为NULL,调用函数
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			band lb_band
			SetNull(lb_band)
			wf_output("FunReturn:  SelectText = " + wf_convert(rte_1.SelectText(1,1,2,10,lb_band)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
		end if
	Case 'RTEFUNW14P12'
	/*
	   【功能描述】
	    SelectText，定位插入点

		【编码描述】
		1、初始化控件，构建数据
		2、Toline、tochar指定为0,其他参数有效，带4个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		0
		
		
		【期望UI描述】
		插入点被设置为fromline、fromchar指定的位置
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectText = " + wf_convert(rte_1.SelectText(1,2,0,0)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
		end if
	Case 'RTEFUNW14P13'
	/*
	   【功能描述】
	    SelectText，与起始位置同一行的前面存在InputFiled

		【编码描述】
		1、初始化控件，构建数据
		2、某行含有InputFiled,将起始位置指定为InputFiled后面，其他参数有效，带4个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回所选中的字符数
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectText = " + wf_convert(rte_1.SelectText(1,1,1,5)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')	
			wf_data_init(rte_1,1,Detail!,False)
		end if
	Case 'RTEFUNW14P14'
	/*
	   【功能描述】
	    SelectText，与起始位置同一行的前面存在图片

		【编码描述】
		1、初始化控件，构建数据
		2、某行含有图片,将起始位置指定为图片的后面，其他参数有效，带4个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回所选中的字符数
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectText = " + wf_convert(rte_1.SelectText(1,1,1,5)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			rte_1.InsertPicture("PUB_BMP_BT_EMP.bmp")		
			wf_data_init(rte_1,1,Detail!,False)
		end if
	Case 'RTEFUNW14P15'
	/*
	   【功能描述】
	    SelectText，选中的数据包含InputField

		【编码描述】
		1、初始化控件，构建数据
		2、带4个参数，选中的数据包含InputField，调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回所选中的字符数
		计算InputField的字节数为InputFieldName字节数 + 2
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectText = " + wf_convert(rte_1.SelectText(1,1,2,10)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')	
			wf_data_init(rte_1,1,Detail!,False)
		end if
	Case 'RTEFUNW14P16'
	/*
	   【功能描述】
	    SelectText，选中的数据包含图片

		【编码描述】
		1、初始化控件，构建数据
		2、带4个参数，选中的数据包含图片，调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回所选中的字符数，图片计算其所占多少字符宽度
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectText = " + wf_convert(rte_1.SelectText(1,1,2,10)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			rte_1.InsertPicture("PUB_BMP_BT_EMP.bmp")		
			wf_data_init(rte_1,1,Detail!,False)			
		end if
	Case 'RTEFUNW14P17'
	/*
	   【功能描述】
	    SelectText，从前往后选择多行数据

		【编码描述】
		1、初始化控件，构建数据
		2、带4个参数，从前往后选择多行数据，调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回所选中的字符数
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectText = " + wf_convert(rte_1.SelectText(1,1,3,10)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)			
		end if
	Case 'RTEFUNW14P18'
	/*
	   【功能描述】
	    SelectText，从后往前选择多行数据

		【编码描述】
		1、初始化控件，构建数据
		2、带4个参数，从后往前选择多行数据，调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回所选中的字符数
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectText = " + wf_convert(rte_1.SelectText(5,20,3,5)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
		end if
	Case 'RTEFUNW14P19'
	/*
	   【功能描述】
	    SelectText，在一行内选择，tochar列位置超出了当前列的范围

		【编码描述】
		1、初始化控件，构建数据
		2、带4个参数，在一行内选择，tochar列位置超出了当前列的范围，调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回0
		
		
		【期望UI描述】
		插入点转到该行第一个字符位置
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectText = " + wf_convert(rte_1.SelectText(1,1,1,1000)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)			
		end if
	Case 'RTEFUNW14P20'
	/*
	   【功能描述】
	    SelectText，选择多行，tochar列位置超出了当前列的范围

		【编码描述】
		1、初始化控件，构建数据
		2、带4个参数，选择多行，tochar列位置超出了当前列的范围，调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回所选中的字符数
		
		
		【期望UI描述】
		插入点转到该行第一个字符位置
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectText = " + wf_convert(rte_1.SelectText(1,1,3,1000)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)			
		end if
	Case 'RTEFUNW14P21'
	/*
	   【功能描述】
	    SelectText，4个参数为无效值

		【编码描述】
		1、初始化控件，构建数据
		2、带4个参数，4个参数为无效值，调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			setNull(ll_num)
			wf_output("FunReturn:  SelectText = " + wf_convert(rte_1.SelectText(ll_num,ll_num,ll_num,ll_num)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)			
		end if
	Case 'RTEFUNW14P22'
	/*
	   【功能描述】
	    SelectText，band为Detail!

		【编码描述】
		1、初始化控件，构建数据
		2、带5个参数，band为Detail!，其他参数都有效，调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回所选中的字符数
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectText = " + wf_convert(rte_1.SelectText(1,1,3,20,Detail!)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)			
		end if
	Case 'RTEFUNW14P23'
	/*
	   【功能描述】
	    SelectText，band为Header!

		【编码描述】
		1、初始化控件，构建数据
		2、带5个参数，band为Header!，其他参数都有效，在headfoot编辑状态调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回所选中的字符数
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectText = " + wf_convert(rte_1.SelectText(1,1,3,20,Header!)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)			
		end if
	Case 'RTEFUNW14P24'
	/*
	   【功能描述】
	    SelectText，band为Footer!

		【编码描述】
		1、初始化控件，构建数据
		2、带5个参数，band为Footer!，其他参数都有效，在headfoot编辑状态调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回所选中的字符数
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectText = " + wf_convert(rte_1.SelectText(1,1,3,20,Footer!)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)			
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

event close;call super::close;if FileExists("PUB_BMP_BT_EMP.bmp") then
	FileDelete("PUB_BMP_BT_EMP.bmp")
end if

end event

type mle_phenomena from w_templet`mle_phenomena within w_rtefunw14
end type

type cb_autoparse from w_templet`cb_autoparse within w_rtefunw14
end type

type cb_wrrun from w_templet`cb_wrrun within w_rtefunw14
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rtefunw14
end type

type dw_info from w_templet`dw_info within w_rtefunw14
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rtefunw14
end type

type pb_runnext from w_templet`pb_runnext within w_rtefunw14
end type

type pb_runall from w_templet`pb_runall within w_rtefunw14
end type

type pb_run from w_templet`pb_run within w_rtefunw14
end type

type pb_end from w_templet`pb_end within w_rtefunw14
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rtefunw14
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rtefunw14
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rtefunw14
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rtefunw14
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rtefunw14
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rtefunw14
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rtefunw14
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rtefunw14
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rtefunw14
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rtefunw14
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rtefunw14
end type

type rte_1 from richtextedit within w_rtefunw14
integer x = 37
integer y = 32
integer width = 2889
integer height = 1280
integer taborder = 70
boolean bringtotop = true
boolean init_wordwrap = true
boolean init_headerfooter = true
boolean init_popmenu = true
borderstyle borderstyle = stylelowered!
end type

