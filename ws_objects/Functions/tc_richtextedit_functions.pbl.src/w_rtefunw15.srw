$PBExportHeader$w_rtefunw15.srw
forward
global type w_rtefunw15 from w_templet
end type
type rte_1 from richtextedit within w_rtefunw15
end type
end forward

global type w_rtefunw15 from w_templet
string title = "Function 15"
rte_1 rte_1
end type
global w_rtefunw15 w_rtefunw15

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
//ar_rich.SelectText(ar_rich.LineCount(),1,0,0,ab_band)
//ar_rich.SelectText(ar_rich.LineCount(),ar_rich.LineLength() + 1,0,0,ab_band)
end subroutine

on w_rtefunw15.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rtefunw15.destroy
call super::destroy
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 
将控件内容成功保存到一个文档后或新打开文档后，Modified属性值变为false
***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Functions\Function 15 
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
band  lb_band

if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return 
if not ab_exe then rte_1.ShowHeadFoot(False)

Choose Case as_testpoint
	Case 'RTEFUNW15P01'
	/*
	   【功能描述】
	    SelectTextAll,参数指定为NULL

		【编码描述】
		1、初始化控件
		2、band指定为NULL，调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(lb_band)
			wf_output("FunReturn:  SelectTextAll = " + wf_convert(rte_1.SelectTextAll(lb_band)),True)
		else
			wf_data_init(rte_1,1,Detail!,True)
		end if
	Case 'RTEFUNW15P02'
	/*
	   【功能描述】
	    SelectTextAll,控件中含InputField

		【编码描述】
		1、初始化控件,控件中含InputField
		2、不带参数有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回控件中所有字符个数
		
		【期望UI描述】
		选中所有内容
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextAll = " + wf_convert(rte_1.SelectTextAll()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)			
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData("Name", 'sybase')	
		end if
	Case 'RTEFUNW15P03'
	/*
	   【功能描述】
	    SelectTextAll,控件中含图片

		【编码描述】
		1、初始化控件,控件中含图片
		2、不带参数有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回控件中所有字符个数
		
		【期望UI描述】
		选中所有内容
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextAll = " + wf_convert(rte_1.SelectTextAll()),True)
		else
			wf_data_init(rte_1,4,Detail!,True)			
		end if
	Case 'RTEFUNW15P04'
	/*
	   【功能描述】
	    SelectTextAll,控件中含多字节字符

		【编码描述】
		1、初始化控件,控件中含多字节字符
		2、不带参数有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回控件中所有字符个数
		
		【期望UI描述】
		选中所有内容
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextAll = " + wf_convert(rte_1.SelectTextAll()),True)
		else
			wf_data_init(rte_1,2,Detail!,True)			
		end if
	Case 'RTEFUNW15P05'
	/*
	   【功能描述】
	    SelectTextAll,band为Detail!

		【编码描述】
		1、初始化控件,控件中含图片
		2、指定band为Detail,有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回控件中所有字符个数
		
		【期望UI描述】
		选中所有内容
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextAll = " + wf_convert(rte_1.SelectTextAll(Detail!)),True)
		else
			wf_data_init(rte_1,4,Detail!,True)			
		end if
	Case 'RTEFUNW15P06'
	/*
	   【功能描述】
	    SelectTextAll,band为Header!

		【编码描述】
		1、初始化控件,控件中含图片
		2、控件处于headfoot编辑界面，指定band为Header!,有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回控件中所有字符个数
		
		【期望UI描述】
		选中所有内容
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextAll = " + wf_convert(rte_1.SelectTextAll(Header!)),True)
		else
			wf_data_init(rte_1,4,Header!,True)			
			rte_1.ShowHeadFoot(True)
		end if
	Case 'RTEFUNW15P07'
	/*
	   【功能描述】
	    SelectTextAll,band为Footer!

		【编码描述】
		1、初始化控件,控件中含图片
		2、控件处于headfoot编辑界面，指定band为Footer!,有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回控件中所有字符个数
		
		【期望UI描述】
		选中所有内容
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextAll = " + wf_convert(rte_1.SelectTextAll(Footer!)),True)
		else
			wf_data_init(rte_1,4,Footer!,True)			
			rte_1.ShowHeadFoot(True)
		end if
	Case 'RTEFUNW15P08'
	/*
	   【功能描述】
	    SelectTextLine,控件内容为空

		【编码描述】
		1、初始化控件,控件内容为空
		2、有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回0
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextLine = " + wf_convert(rte_1.SelectTextLine()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
		end if
	Case 'RTEFUNW15P09'
	/*
	   【功能描述】
	    SelectTextLine,插入点所在行中包含InputField

		【编码描述】
		1、初始化控件,构建控件内容，设置插入点
		2、插入点所在行中包含InputField，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回该行字符数
		
		【期望UI描述】
		选中插入点所在行
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextLine = " + wf_convert(rte_1.SelectTextLine()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)	
			rte_1.selecttext(6,1,0,0,Detail!)
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData("Name",'sybase')	
		end if
	Case 'RTEFUNW15P10'
	/*
	   【功能描述】
	    SelectTextLine,插入点所在行中包含图片

		【编码描述】
		1、初始化控件,构建控件内容，设置插入点
		2、插入点所在行中包含图片，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回该行字符数
		
		【期望UI描述】
		选中插入点所在行
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextLine = " + wf_convert(rte_1.SelectTextLine()),True)
		else
			wf_data_init(rte_1,4,Detail!,True)	
			rte_1.selecttext(5,1,0,0,Detail!)
		end if
	Case 'RTEFUNW15P11'
	/*
	   【功能描述】
	    SelectTextLine,插入点所在行中包含多字节字符

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点所在行中包含多字节字符，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回该行字符数
		
		【期望UI描述】
		选中插入点所在行
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextLine = " + wf_convert(rte_1.SelectTextLine()),True)
		else
			wf_data_init(rte_1,2,Detail!,True)	
			rte_1.selecttext(5,1,0,0,Detail!)
		end if
	Case 'RTEFUNW15P12'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是字母，插入点前面是数字

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点后面是字母，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回被选中字串的长度
		
		【期望UI描述】
		选中插入点前后的字串
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			wf_data_init(rte_1,1,Detail!,True)	
			rte_1.selecttext(3,5,0,0,Detail!)
		end if
	Case 'RTEFUNW15P13'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是字母，插入点前面是不可选字符

		【编码描述】
		1、初始化控件,构建控件内容，含有数字字母标点#$@'"等特殊字符
		2、插入点后面是字母，插入点前面是不可选字符，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回被选中字串的长度
		
		【期望UI描述】
		选中插入点后的字串
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("ADFASDF##$%@#$ADFASDFFDGHDFGHDFGHD")
			rte_1.Paste()
			rte_1.Selecttext(1,15,0,0,Detail!)
		end if
	Case 'RTEFUNW15P14'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是","

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点后面是逗号，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		不选中任何字符
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("ADFASDdrsrg,DFASDFFDGHDFGHDFGHD")
			rte_1.Paste()
			rte_1.Selecttext(1,12,0,0,Detail!)
		end if
	Case 'RTEFUNW15P15'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是"."

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点后面是点号，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		不选中任何字符
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("ADFASDdrsrg.DFASDFFDGHDFGHDFGHD")
			rte_1.Paste()
			rte_1.Selecttext(1,12,0,0,Detail!)
		end if
	Case 'RTEFUNW15P16'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是"!"

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点后面是"!"，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		不选中任何字符
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("ADFASDdrsrg!DFASDFFDGHDFGHDFGHD")
			rte_1.Paste()
			rte_1.Selecttext(1,12,0,0,Detail!)
		end if
	Case 'RTEFUNW15P17'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是"@"

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点后面是"@"，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		不选中任何字符
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("ADFASDdrsrg@DFASDFFDGHDFGHDFGHD")
			rte_1.Paste()
			rte_1.Selecttext(1,12,0,0,Detail!)
		end if
	Case 'RTEFUNW15P18'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是"#"

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点后面是"#"，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		不选中任何字符
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("ADFASDdrsrg#DFASDFFDGHDFGHDFGHD")
			rte_1.Paste()
			rte_1.Selecttext(1,12,0,0,Detail!)
		end if
	Case 'RTEFUNW15P19'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是"$"

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点后面是"$"，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		不选中任何字符
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("ADFASDdrsrg$DFASDFFDGHDFGHDFGHD")
			rte_1.Paste()
			rte_1.Selecttext(1,12,0,0,Detail!)
		end if
	Case 'RTEFUNW15P20'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是"%"

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点后面是"%"，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		不选中任何字符
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("ADFASDdrsrg%DFASDFFDGHDFGHDFGHD")
			rte_1.Paste()
			rte_1.Selecttext(1,12,0,0,Detail!)
		end if
	Case 'RTEFUNW15P21'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是"^"

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点后面是"^"，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		不选中任何字符
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("ADFASDdrsrg^DFASDFFDGHDFGHDFGHD")
			rte_1.Paste()
			rte_1.Selecttext(1,12,0,0,Detail!)
		end if
	Case 'RTEFUNW15P22'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是"&"

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点后面是"&"，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		不选中任何字符
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("ADFASDdrsrg&DFASDFFDGHDFGHDFGHD")
			rte_1.Paste()
			rte_1.Selecttext(1,12,0,0,Detail!)
		end if
	Case 'RTEFUNW15P23'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是"*"

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点后面是"*"，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		不选中任何字符
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("ADFASDdrsrg*DFASDFFDGHDFGHDFGHD")
			rte_1.Paste()
			rte_1.Selecttext(1,12,0,0,Detail!)
		end if
	Case 'RTEFUNW15P24'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是"("

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点后面是"("，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		不选中任何字符
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("ADFASDdrsrg(DFASDFFDGHDFGHDFGHD")
			rte_1.Paste()
			rte_1.Selecttext(1,12,0,0,Detail!)
		end if
	Case 'RTEFUNW15P25'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是")"

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点后面是")"，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		不选中任何字符
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("ADFASDdrsrg)DFASDFFDGHDFGHDFGHD")
			rte_1.Paste()
			rte_1.Selecttext(1,12,0,0,Detail!)
		end if
	Case 'RTEFUNW15P26'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是"-"

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点后面是"-"，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		不选中任何字符
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("ADFASDdrsrg-DFASDFFDGHDFGHDFGHD")
			rte_1.Paste()
			rte_1.Selecttext(1,12,0,0,Detail!)
		end if
	Case 'RTEFUNW15P27'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是"+"

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点后面是"+"，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		不选中任何字符
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("ADFASDdrsrg+DFASDFFDGHDFGHDFGHD")
			rte_1.Paste()
			rte_1.Selecttext(1,12,0,0,Detail!)
		end if
	Case 'RTEFUNW15P28'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是"|"

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点后面是"|"，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		不选中任何字符
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("ADFASDdrsrg|DFASDFFDGHDFGHDFGHD")
			rte_1.Paste()
			rte_1.Selecttext(1,12,0,0,Detail!)
		end if
	Case 'RTEFUNW15P29'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是"<"

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点后面是"<"，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		不选中任何字符
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("ADFASDdrsrg<DFASDFFDGHDFGHDFGHD")
			rte_1.Paste()
			rte_1.Selecttext(1,12,0,0,Detail!)
		end if
	Case 'RTEFUNW15P30'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是">"

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点后面是">"，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		不选中任何字符
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("ADFASDdrsrg>DFASDFFDGHDFGHDFGHD")
			rte_1.Paste()
			rte_1.Selecttext(1,12,0,0,Detail!)
		end if
	Case 'RTEFUNW15P31'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是"?"

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点后面是"?"，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		不选中任何字符
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("ADFASDdrsrg?DFASDFFDGHDFGHDFGHD")
			rte_1.Paste()
			rte_1.Selecttext(1,12,0,0,Detail!)
		end if
	Case 'RTEFUNW15P32'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是空格

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点后面是空格，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		不选中任何字符
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("ADFASDdrsrg DFASDFFDGHDFGHDFGHD")
			rte_1.Paste()
			rte_1.Selecttext(1,12,0,0,Detail!)
		end if
	Case 'RTEFUNW15P33'
	/*
	   【功能描述】
	    SelectTextWord,插入点后面是回车符

		【编码描述】
		1、初始化控件,构建控件内容
		2、插入点后面是回车符，有效调用
		3、输出函数返回值

		【代码输出值描述】
		返回-1
		
		【期望UI描述】
		不选中任何字符
	*/
		
		if ab_exe then
			wf_output("FunReturn:  SelectTextWord = " + wf_convert(rte_1.SelectTextWord()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("ADFASDdrsrg~nDFASDFFDGHDFGHDFGHD")
			rte_1.Paste()
			rte_1.Selecttext(1,12,0,0,Detail!)
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

type mle_phenomena from w_templet`mle_phenomena within w_rtefunw15
end type

type cb_autoparse from w_templet`cb_autoparse within w_rtefunw15
end type

type cb_wrrun from w_templet`cb_wrrun within w_rtefunw15
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rtefunw15
end type

type dw_info from w_templet`dw_info within w_rtefunw15
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rtefunw15
end type

type pb_runnext from w_templet`pb_runnext within w_rtefunw15
end type

type pb_runall from w_templet`pb_runall within w_rtefunw15
end type

type pb_run from w_templet`pb_run within w_rtefunw15
end type

type pb_end from w_templet`pb_end within w_rtefunw15
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rtefunw15
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rtefunw15
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rtefunw15
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rtefunw15
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rtefunw15
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rtefunw15
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rtefunw15
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rtefunw15
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rtefunw15
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rtefunw15
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rtefunw15
end type

type rte_1 from richtextedit within w_rtefunw15
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

