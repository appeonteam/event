$PBExportHeader$w_rtefunw03.srw
forward
global type w_rtefunw03 from w_templet
end type
type rte_1 from richtextedit within w_rtefunw03
end type
end forward

global type w_rtefunw03 from w_templet
string title = "Function 3"
rte_1 rte_1
end type
global w_rtefunw03 w_rtefunw03

forward prototypes
public function string wf_convert (boolean ab_boolean)
public function string wf_convert (string as_parm)
public subroutine wf_data_init (richtextedit ar_rich, integer ai_sign, band ab_band)
public function string wf_convert (long al_parm)
public function string wf_convert (alignment aa_parm)
public function string wf_convert (paragraphsetting ap_parm)
public function string wf_convert (integer ai_parm)
public function string wf_convert (spacing as_parm)
public subroutine wf_setparagraph (band ab_band)
public subroutine wf_settextformat (band ab_band)
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
ar_rich.SelectText(ar_rich.LineCount(),ar_rich.LineLength()+1,0,0,ab_band)

end subroutine

public function string wf_convert (long al_parm);if isnull(al_parm) then
	return 'Null'
else
	return string(al_parm)
end if
end function

public function string wf_convert (alignment aa_parm);String  ls_temp

choose  case aa_parm
	case Center!
		ls_temp = 'Center'
	case Justify!
		ls_temp = 'Justify'
	Case Left!
		ls_temp = 'Left'
	case Right!
		ls_temp = 'Right'
end choose

return  ls_temp
end function

public function string wf_convert (paragraphsetting ap_parm);string  ls_temp

choose case ap_parm
	case indent!
		ls_temp = 'Indent'
	case leftmargin!
		ls_temp = 'Leftmargin'
	case rightmargin!
		ls_temp = 'Rightmargin'
	case else
		ls_temp = 'NULL'
end choose

return ls_temp
end function

public function string wf_convert (integer ai_parm);if isnull(ai_parm) then
	return 'Null'
else
	return string(ai_parm)
end if
end function

public function string wf_convert (spacing as_parm);string  ls_temp

choose case as_parm
	case spacing1!
		ls_temp = 'Spacing1'
	case spacing15!
		ls_temp = 'Spacing15'
	case spacing2!
		ls_temp = 'Spacing2'
end choose

return ls_temp
end function

public subroutine wf_setparagraph (band ab_band);//
rte_1.SelectTextALL(ab_band)
rte_1.SetParagraphSetting ( Indent! , 500 )
rte_1.SetParagraphSetting ( LeftMargin!  , 500 )
rte_1.SetParagraphSetting ( RightMargin!  , 800 )
rte_1.selecttext(1,1,0,0,ab_band)
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

on w_rtefunw03.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rtefunw03.destroy
call super::destroy
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 
将控件内容成功保存到一个文档后或新打开文档后，Modified属性值变为false
***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Functions\Function 3 
Pbl Name:     
Designer:     ouyangwu
Coder:           zhouchaoqun   Date: 2005-06-25
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
ParagraphSetting   lp_set
string ls_temp

if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return 
Choose Case as_testpoint
	Case 'RTEFUNW03P01'
	/*
	   【功能描述】
	    测试FindNext函数，存在下一个查找内容

		【编码描述】
		1、初始化控件及内容
		2、使用Find函数查找字符串，存在下一个查找内容
		3、调用FindNext函数查找下一个
		4、输出函数返回值

		【代码输出值描述】
		返回查找匹配的字符数量
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  FindNext = " + wf_convert(rte_1.FindNext()),True)
		else
			wf_data_init(rte_1,1,Detail!)
			rte_1.SelectText(1,1,0,0,Detail!)
			rte_1.Find('Appeon',True,True,False,True)
		end if
	Case 'RTEFUNW03P02'
	/*
	   【功能描述】
	    测试FindNext函数，不存在下一个查找内容

		【编码描述】
		1、初始化控件及内容
		2、使用Find函数查找字符串，不存在下一个查找内容
		3、调用FindNext函数查找下一个
		4、输出函数返回值

		【代码输出值描述】
		返回查找匹配的字符数量
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:  FindNext = " + wf_convert(rte_1.FindNext()),True)
		else
			wf_data_init(rte_1,1,Detail!)
			rte_1.SelectText(1,1,0,0,Detail!)
			rte_1.Find('About',True,True,False,True)
		end if
	Case 'RTEFUNW03P03'
	/*
	   【功能描述】
	    测试GetAlignment函数，插入点段落对齐方式为center!

		【编码描述】
		1、初始化控件及内容
		2、构造插入点的段落对齐方式为center!
		3、设置插入点，调用GetAlignment函数得到插入点所在段落的对齐方式
		4、输出函数返回值

		【代码输出值描述】
		center!
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:   GetAlignment = " + wf_convert(rte_1.GetAlignment()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help~r~tThis HTML help contains the HTML version of several Appeon 3.0 user documents')
			rte_1.Paste()
			rte_1.SelectText(1,1,1,50,Detail!)
			rte_1.SetAlignment(Center! )
		end if
	Case 'RTEFUNW03P04'
	/*
	   【功能描述】
	    测试GetAlignment函数，插入点段落对齐方式为left!

		【编码描述】
		1、初始化控件及内容
		2、构造插入点的段落对齐方式为left!
		3、设置插入点，调用GetAlignment函数得到插入点所在段落的对齐方式
		4、输出函数返回值

		【代码输出值描述】
		left!
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:   GetAlignment = " + wf_convert(rte_1.GetAlignment()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help~r~tThis HTML help contains the HTML version of several Appeon 3.0 user documents')
			rte_1.Paste()
			rte_1.SelectText(1,1,1,50,Detail!)
			rte_1.SetAlignment(Left! )
		end if
	Case 'RTEFUNW03P05'
	/*
	   【功能描述】
	    测试GetAlignment函数，插入点段落对齐方式为right!

		【编码描述】
		1、初始化控件及内容
		2、构造插入点的段落对齐方式为right!
		3、设置插入点，调用GetAlignment函数得到插入点所在段落的对齐方式
		4、输出函数返回值

		【代码输出值描述】
		right!
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:   GetAlignment = " + wf_convert(rte_1.GetAlignment()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help~r~tThis HTML help contains the HTML version of several Appeon 3.0 user documents')
			rte_1.Paste()
			rte_1.SelectText(1,1,1,50,Detail!)
			rte_1.SetAlignment(Right! )
		end if
	Case 'RTEFUNW03P06'
	/*
	   【功能描述】
	    测试GetAlignment函数，插入点段落对齐方式为justify!

		【编码描述】
		1、初始化控件及内容
		2、构造插入点的段落对齐方式为justify!
		3、设置插入点，调用GetAlignment函数得到插入点所在段落的对齐方式
		4、输出函数返回值

		【代码输出值描述】
		justify!
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:   GetAlignment = " + wf_convert(rte_1.GetAlignment()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help~r~tThis HTML help contains the HTML version of several Appeon 3.0 user documents')
			rte_1.Paste()
			rte_1.SelectText(1,1,1,50,Detail!)
			rte_1.SetAlignment(Justify! )
		end if
	Case 'RTEFUNW03P07'
	/*
	   【功能描述】
	    选中多个段落时插入点位于开始位置，测试GetAlignment函数

		【编码描述】
		1、初始化控件及内容
		2、从后向前选，选中多个段落，使得插入点位于开始位置
		3、调用GetAlignment函数得到插入点所在段落的对齐方式
		4、输出函数返回值

		【代码输出值描述】
		返回选中的最前的段落的对齐方式
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,2,10,Detail!)
			wf_output("FunReturn:   GetAlignment = " + wf_convert(rte_1.GetAlignment()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help~r~tThis HTML help contains the HTML version of several Appeon 3.0 user documents')
			rte_1.Paste()
			rte_1.SelectTextAll(Detail!)
			rte_1.SelectText(1,1,1,3,Detail!)
			rte_1.SetAlignment(Left!)
			rte_1.SelectText(2,1,2,3,Detail!)
			rte_1.SetAlignment(Center!)
		end if
	Case 'RTEFUNW03P08'
	/*
	   【功能描述】
	    选中多个段落时插入点位于结束位置，测试GetAlignment函数

		【编码描述】
		1、初始化控件及内容
		2、从后向前选，选中多个段落，使得插入点位于结束位置
		3、调用GetAlignment函数得到插入点所在段落的对齐方式
		4、输出函数返回值

		【代码输出值描述】
		返回选中的最后的段落的对齐方式
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(2,10,1,4,Detail!)
			wf_output("FunReturn:   GetAlignment = " + wf_convert(rte_1.GetAlignment()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help~r~tThis HTML help contains the HTML version of several Appeon 3.0 user documents')
			rte_1.Paste()
			rte_1.SelectText(1,1,1,3,Detail!)
			rte_1.SetAlignment(Left!)
			rte_1.SelectText(2,1,2,3,Detail!)
			rte_1.SetAlignment(Center!)
		end if
	Case 'RTEFUNW03P09'
	/*
	   【功能描述】
	    选中InputField后，测试GetAlignment函数

		【编码描述】
		1、初始化控件及内容，插入InputField和图片
		2、设置插入点，选中InputField,调用GetAlignment函数得到插入点所在段落的对齐方式
		3、输出函数返回值

		【代码输出值描述】
		返回选中InputField所在段落的对齐方式
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:   GetAlignment = " + wf_convert(rte_1.GetAlignment()),True)
		else
			wf_data_init(rte_1,1,Detail!)
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'appeon')
			
			rte_1.SelectText(rte_1.LineCount(),1,0,0,Detail!)
			rte_1.SelectText(rte_1.LineCount(),rte_1.LineLength(),rte_1.LineCount(),rte_1.LineLength(),Detail!)	
		end if
	Case 'RTEFUNW03P10'
	/*
	   【功能描述】
	    选中图片后，测试GetAlignment函数

		【编码描述】
		1、初始化控件及内容，插入InputField和图片
		2、设置插入点，选中图片,调用GetAlignment函数得到插入点所在段落的对齐方式
		3、输出函数返回值

		【代码输出值描述】
		返回选中图片所在段落的对齐方式
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn:   GetAlignment = " + wf_convert(rte_1.GetAlignment()),True)
		else
			wf_data_init(rte_1,4,Detail!)
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'appeon')
			rte_1.SelectText(rte_1.LineCount(),1,0,0,Detail!)
			rte_1.SelectText(rte_1.LineCount(),rte_1.LineLength(),rte_1.LineCount() - 1,rte_1.LineLength(),Detail!)	
		end if
	Case 'RTEFUNW03P11'
	/*
	   【功能描述】
	    测试GetParagraphSetting函数，参数为NULL值

		【编码描述】
		1、初始化控件及内容
		2、设置插入点，调用GetParagraphSetting函数，参数指定为NULL
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(lp_set)
			wf_output("FunReturn:   GetParagraphSetting = " + wf_convert(rte_1.GetParagraphSetting(lp_set)),True)
		else
			wf_data_init(rte_1,1,Detail!)
		end if
	Case 'RTEFUNW03P12'
	/*
	   【功能描述】
	    测试GetParagraphSetting函数，参数为Indent!值

		【编码描述】
		1、初始化控件及内容（可采用导入文本或自己构建）
		2、设置插入点，调用GetParagraphSetting函数，参数指定为Indent!
		3、输出函数返回值

		【代码输出值描述】
		输出插入点所在段落缩进的大小，以1/1000 inch为单位
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			wf_output("FunReturn:   GetParagraphSetting = " + wf_convert(rte_1.GetParagraphSetting(Indent!)),True)
		else
			wf_data_init(rte_1,1,Detail!)
//			rte_1.SetParagraphSetting(Indent!, 250)
		end if
	Case 'RTEFUNW03P13'
	/*
	   【功能描述】
	    测试GetParagraphSetting函数，参数为LeftMargin!值

		【编码描述】
		1、初始化控件及内容（可采用导入文本或自己构建）
		2、设置插入点，调用GetParagraphSetting函数，参数指定为LeftMargin!
		3、输出函数返回值

		【代码输出值描述】
		输出插入点所在段落左空白的大小，以1/1000 inch为单位
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			wf_output("FunReturn:   GetParagraphSetting = " + wf_convert(rte_1.GetParagraphSetting(LeftMargin! )),True)
		else
			wf_data_init(rte_1,1,Detail!)
//			rte_1.SetParagraphSetting(LeftMargin! , 150)
		end if
	Case 'RTEFUNW03P14'
	/*
	   【功能描述】
	    测试GetParagraphSetting函数，参数为RightMargin!值

		【编码描述】
		1、初始化控件及内容（可采用导入文本或自己构建）
		2、设置插入点，调用GetParagraphSetting函数，参数指定为RightMargin!
		3、输出函数返回值

		【代码输出值描述】
		输出插入点所在段落左空白的大小，以1/1000 inch为单位
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			wf_output("FunReturn:   GetParagraphSetting = " + wf_convert(rte_1.GetParagraphSetting(RightMargin!)),True)
		else
			wf_data_init(rte_1,1,Detail!)
//			rte_1.SetParagraphSetting(RightMargin! , 350)
		end if
	Case 'RTEFUNW03P15'
	/*
	   【功能描述】
	    选中多段内容时测试GetParagraphSetting函数，参数为任意有效值

		【编码描述】
		1、初始化控件及内容（可采用导入文本或自己构建）
		2、选中多段内容，调用GetParagraphSetting函数，参数为任意有效值
		3、输出函数返回值

		【代码输出值描述】
		输出插入点所在段落的函数参数指定类型的值
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			wf_output("FunReturn:   GetParagraphSetting = " + wf_convert(rte_1.GetParagraphSetting(RightMargin!)),True)
		else
			wf_data_init(rte_1,1,Detail!)
//			rte_1.SetParagraphSetting(RightMargin! , 50)
			rte_1.SelectTextAll(Detail!)
		end if
	Case 'RTEFUNW03P16'
	/*
	   【功能描述】
	    测试Getparent函数

		【编码描述】
		1、初始化控件
		2、调用Getparent函数
		3、输出返回对象的ClassName

		【代码输出值描述】
		返回Parent ClassName
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			PowerObject  ldo_object
			
			ldo_object = rte_1.Getparent()
			wf_output("FunReturn:   Getparent = " + String(ldo_object.ClassName()),True)
		else
			wf_data_init(rte_1,1,Detail!)
		end if
	Case 'RTEFUNW03P17'
	/*
	   【功能描述】
	    测试Getspacing函数

		【编码描述】
		1、初始化控件及内容
		2、设置插入点，调用Getspacing函数
		3、输出函数返回值

		【代码输出值描述】
		返回插入点所在段落的行间距    Spacing枚举类型
		
		【期望UI描述】
		
	*/
		
		if ab_exe then			
			wf_output("FunReturn:   GetSpacing =  " + wf_convert(rte_1.GetSpacing()),True)
		else
			wf_data_init(rte_1,1,Detail!)
		end if
	Case 'RTEFUNW03P18'
	/*
	   【功能描述】
	    选中多个段落时插入点位于开始位置，测试Getspacing函数

		【编码描述】
		1、初始化控件及内容
		2、从后向前选，选中多个段落时插入点位于开始位置，调用Getspacing函数
		3、输出函数返回值

		【代码输出值描述】
		返回选中内容最前的段落的行间距   Spacing枚举类型
		
		【期望UI描述】
		
	*/
		
		if ab_exe then			
			rte_1.SelectText(1,1,0,0,Detail!)
			wf_output("FunReturn:   GetSpacing =  " + wf_convert(rte_1.GetSpacing()),True)
		else
			wf_data_init(rte_1,1,Detail!)
			rte_1.SelectTextAll(Detail!)			
		end if
	Case 'RTEFUNW03P19'
	/*
	   【功能描述】
	    选中多个段落时插入点位于结束位置，测试Getspacing函数

		【编码描述】
		1、初始化控件及内容
		2、从前向后选，选中多个段落时插入点位于结束位置，调用Getspacing函数
		3、输出函数返回值

		【代码输出值描述】
		返回选中内容最后的段落的行间距   Spacing枚举类型
		
		【期望UI描述】
		
	*/
		
		if ab_exe then			
			rte_1.SelectText(10,39,10,39,Detail!)
			wf_output("FunReturn:   GetSpacing =  " + wf_convert(rte_1.GetSpacing()),True)
		else
			wf_data_init(rte_1,1,Detail!)
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

event close;call super::close;if FileExists("PUB_BMP_BT_EMP.bmp") then
	FileDelete("PUB_BMP_BT_EMP.bmp")
end if
end event

type mle_phenomena from w_templet`mle_phenomena within w_rtefunw03
end type

type cb_autoparse from w_templet`cb_autoparse within w_rtefunw03
end type

type cb_wrrun from w_templet`cb_wrrun within w_rtefunw03
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rtefunw03
end type

type dw_info from w_templet`dw_info within w_rtefunw03
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rtefunw03
end type

type pb_runnext from w_templet`pb_runnext within w_rtefunw03
end type

type pb_runall from w_templet`pb_runall within w_rtefunw03
end type

type pb_run from w_templet`pb_run within w_rtefunw03
end type

type pb_end from w_templet`pb_end within w_rtefunw03
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rtefunw03
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rtefunw03
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rtefunw03
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rtefunw03
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rtefunw03
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rtefunw03
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rtefunw03
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rtefunw03
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rtefunw03
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rtefunw03
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rtefunw03
end type

type rte_1 from richtextedit within w_rtefunw03
integer x = 32
integer y = 32
integer width = 2917
integer height = 1292
integer taborder = 70
boolean bringtotop = true
boolean init_wordwrap = true
boolean init_headerfooter = true
integer init_undodepth = 2
long init_leftmargin = 2
long init_topmargin = 2
long init_rightmargin = 2
long init_bottommargin = 2
borderstyle borderstyle = stylelowered!
end type

