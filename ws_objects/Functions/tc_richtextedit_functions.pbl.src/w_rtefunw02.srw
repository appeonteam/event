$PBExportHeader$w_rtefunw02.srw
forward
global type w_rtefunw02 from w_templet
end type
type rte_1 from richtextedit within w_rtefunw02
end type
end forward

global type w_rtefunw02 from w_templet
integer width = 4667
integer height = 2432
string title = "Function 2"
rte_1 rte_1
end type
global w_rtefunw02 w_rtefunw02

forward prototypes
public function string wf_convert (string as_parm)
public function string wf_convert (long al_parm)
public function string wf_convert (boolean ab_boolean)
public subroutine wf_data_init (richtextedit ar_rich, integer ai_sign, band ab_band)
public subroutine wf_setparagraph (band ab_band)
public subroutine wf_settextformat (band ab_band)
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
			ls_english = 'About this Appeon for PowerBuilder Help~r~n: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.~t'
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
rte_1.selecttext(1,1,0,0,ab_band)
end subroutine

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

on w_rtefunw02.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rtefunw02.destroy
call super::destroy
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 
将控件内容成功保存到一个文档后或新打开文档后，Modified属性值变为false
***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Functions\Function 2 
Pbl Name:     
Designer:     ouyangwu
Coder:           zhouchaoqun  Date: 2005-06-24
DocReviewer:  
CoderReviewer:
【功能描述】
测试控件的相关函数
【窗口对象】

【编码注意事项】
1、注意使用SelectText函数来定位光标位置(包括定位到哪个Band区)
2、编写Find函数测试点时需要注意构建的控件内容要能满足测试点需要
3、如何将插入点定位到Header或Footer区：
先切换到Header/Footer编辑界面
rte_1.headerFooter = true
rte_1.showheadfoot(true)
再定位
rte_1.SelectText（long ，long ，0，0，Header! /  Footer!）long处为指定的需要定位的位置
若要再切换回Detail区(主输入区) 的话，再rte_1.showheadfoot(false)即可

【测试注意事项】
 
***********************/
Dragmodes  ldm_mode
string   ls_temp
boolean  lb_boolean

if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return 
if not ab_exe then rte_1.ShowHeadFoot(False)

Choose Case as_testpoint
	Case 'RTEFUNW02P01'
	/*
	   【功能描述】
	    测试Cut函数，无选中内容

		【编码描述】
		1、初始化控件内容，拷贝一段内容到控件
		2、无选中内容，调用Cut函数
		3、输出函数返回值

		【代码输出值描述】
		返回0
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			wf_output("FunReturn:  Cut = " + wf_convert(rte_1.Cut()),True)
		else
			wf_data_init(rte_1,1,Detail!)
		end if
	Case 'RTEFUNW02P02'
	/*
	   【功能描述】
	    测试Cut函数，只Cut文本

		【编码描述】
		1、初始化控件内容，拷贝一段含特殊字符的Text内容到控件
		2、选中部分含特殊字符的内容，调用Cut函数
		3、输出函数返回值

		【代码输出值描述】
		返回Cut选中的字符数
		
		【期望UI描述】
		选中内容被剪切
	*/
		
		if ab_exe then
			wf_output("FunReturn:  Cut =  " + wf_convert(rte_1.Cut()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('#$@#!$$#%^%&^&()&*$%')
			rte_1.Paste()
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
			rte_1.SelectText(1,1,1,20,Detail!)
		end if
	Case 'RTEFUNW02P03'
	/*
	   【功能描述】
	    测试Cut函数，Cut内容含图片

		【编码描述】
		1、初始化控件内容，拷贝一段Text内容到控件，插入一张图片
		2、选中含图片的文本内容，调用Cut函数
		3、输出函数返回值

		【代码输出值描述】
		返回Cut选中的字符数
		
		【期望UI描述】
		选中内容被剪切
	*/
		
		if ab_exe then
			wf_output("FunReturn:  Cut = " + wf_convert(rte_1.Cut()),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("About this Appeon for PowerBuilder Help")
			rte_1.paste()
			rte_1.InsertPicture("PUB_BMP_BT_EMP.bmp")		
			rte_1.SelectText(1,10,1,40,Detail!)
		end if
	Case 'RTEFUNW02P04'
	/*
	   【功能描述】
	    测试Cut函数，Cut内容含InputField

		【编码描述】
		1、初始化控件内容，拷贝一段Text内容到控件，插入InputField
		2、选中含InputField的文本内容，调用Cut函数
		3、输出函数返回值

		【代码输出值描述】
		返回Cut选中的字符数
		
		选择的内容中包括Input Field时，正常Cut，但计算返回值时是计算该Input Field名称的长度再加上两个大括号({})
		
		【期望UI描述】
		选中内容被剪切
	*/
		
		if ab_exe then
			wf_output("FunReturn:  Cut = " + wf_convert(rte_1.Cut()),True)
		else
			wf_data_init(rte_1,1,Detail!)
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'appeon')
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
			rte_1.SelectTextAll(Detail!)
		end if
	Case 'RTEFUNW02P05'
	/*
	   【功能描述】
	    测试Drag(Begin!)

		【编码描述】
		1、初始化控件,在拖拽事件中写入代码
		2、调用Drag(Begin!)
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		触发DragEnter事件
	*/
		
		if ab_exe then
			string  ls_ret
			rte_1.SelectText(1,1,0,0,Detail!)
			wf_output("FunReturn:  Execute DragFunciton",True)
			lS_ret = Wf_convert(rte_1.Drag(Begin!))
//			wf_output("FunReturn:  Drag(Begin!) = " + ls_ret,True)			
		else
			wf_data_init(rte_1,1,Detail!)
		end if
	Case 'RTEFUNW02P06'
	/*
	   【功能描述】
	    测试Drag(Cancel!)

		【编码描述】
		1、初始化控件,在拖拽事件中写入代码
		2、Drag(Begin!)
		3、测试Drag(Cancel!)
		4、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			wf_output("FunReturn:  Drag(Cancel!) = " + Wf_convert(rte_1.Drag(Cancel!)),True)
		else
			wf_data_init(rte_1,1,Detail!)
			rte_1.Drag(Begin!)
		end if
	Case 'RTEFUNW02P07'
	/*
	   【功能描述】
	    测试Drag(End!)

		【编码描述】
		1、初始化控件,在拖拽事件中写入代码
		2、Drag(Begin!)
		3、测试Drag(End!)
		4、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		触发DragDrop事件
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			wf_output("FunReturn:  Drag(End!) = " + Wf_convert(rte_1.Drag(End!)),True)
		else
			wf_data_init(rte_1,1,Detail!)
			rte_1.Drag(Begin!)
		end if
	Case 'RTEFUNW02P08'
	/*
	   【功能描述】
	    测试Drag(NULL)

		【编码描述】
		1、初始化控件,在拖拽事件中写入代码
		2、测试Drag(NULL)
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			Setnull(ldm_mode)
			wf_output("FunReturn:  Drag = " + Wf_convert(rte_1.Drag(ldm_mode)),True)
		else
			wf_data_init(rte_1,1,Detail!)
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
		end if
	Case 'RTEFUNW02P09'
	/*
	   【功能描述】
	    测试Find函数,searchtext为NULL

		【编码描述】
		1、初始化控件,在拖拽事件中写入代码
		2、测试Find函数，searchtext参数指定为NULL值
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			Setnull(ls_temp)
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,TRUE, TRUE, FALSE, TRUE)),True)
		else
			wf_data_init(rte_1,1,Detail!)
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
		end if
	Case 'RTEFUNW02P10'
	/*
	   【功能描述】
	    测试Find函数,forward为NULL

		【编码描述】
		1、初始化控件,在拖拽事件中写入代码
		2、测试Find函数，forward参数指定为NULL值
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			SetNull(lb_boolean)
			ls_temp = 'appeon'
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,lb_boolean, TRUE, FALSE, TRUE)),True)
		else
			wf_data_init(rte_1,1,Detail!)
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
		end if
	Case 'RTEFUNW02P11'
	/*
	   【功能描述】
	    测试Find函数,insensitive为NULL

		【编码描述】
		1、初始化控件,在拖拽事件中写入代码
		2、测试Find函数，insensitive参数指定为NULL值
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			SetNull(lb_boolean)
			ls_temp = 'appeon'
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,True, lb_boolean, FALSE, TRUE)),True)
		else
			wf_data_init(rte_1,1,Detail!)
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
		end if
	Case 'RTEFUNW02P12'
	/*
	   【功能描述】
	    测试Find函数,wholeword为NULL

		【编码描述】
		1、初始化控件,在拖拽事件中写入代码
		2、测试Find函数，wholeword参数指定为NULL值
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			SetNull(lb_boolean)
			ls_temp = 'appeon'
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,True, True, lb_boolean, TRUE)),True)
		else
			wf_data_init(rte_1,1,Detail!)
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
		end if
	Case 'RTEFUNW02P13'
	/*
	   【功能描述】
	    测试Find函数,cursor为NULL

		【编码描述】
		1、初始化控件,在拖拽事件中写入代码
		2、测试Find函数，cursor参数指定为NULL值
		3、输出函数返回值
		

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			SetNull(lb_boolean)
			ls_temp = 'appeon'
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,True, True, False, lb_boolean)),True)
		else
			wf_data_init(rte_1,1,Detail!)
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
		end if
	Case 'RTEFUNW02P14'
	/*
	   【功能描述】
	    测试Find函数,searchtext为含回车符的字符串，存在匹配的内容

		【编码描述】
		1、初始化控件,构造控件内容
		2、测试Find函数，searchtext为含回车符的字符串，存在匹配的内容，其他参数有效
		3、输出函数返回值
		

		【代码输出值描述】
		Returns the number of characters found
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "Power~r~n "
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,True, True, False, True)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			rte_1.SelectText(1,1,0,0,Detail!)
			Clipboard("Appeon for Power~r~n Builder")
			rte_1.paste()
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
		end if
	Case 'RTEFUNW02P15'
	/*
	   【功能描述】
	    测试Find函数,searchtext为含Tab符的字符串，存在匹配的内容

		【编码描述】
		1、初始化控件,构造控件内容
		2、测试Find函数，searchtext为含Tab符的字符串，存在匹配的内容，其他参数有效
		3、输出函数返回值
		

		【代码输出值描述】
		Returns the number of characters found
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "Power~t"
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,True, True, False, True)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			rte_1.SelectText(1,1,0,0,Detail!)
			Clipboard("Appeon for Power~tBuilder")
			rte_1.paste()
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
		end if
	Case 'RTEFUNW02P16'
	/*
	   【功能描述】
	    测试Find函数,searchtext为含\符的字符串，存在匹配的内容

		【编码描述】
		1、初始化控件,构造控件内容
		2、测试Find函数，searchtext为含\符的字符串，存在匹配的内容，其他参数有效
		3、输出函数返回值
		

		【代码输出值描述】
		Returns the number of characters found
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "\for"
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,True, True, False, True)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("Appeon\for\PowerBuilder")
			rte_1.paste()
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
		end if
	Case 'RTEFUNW02P17'
	/*
	   【功能描述】
	    测试Find函数,searchtext为空字符串，存在匹配的内容

		【编码描述】
		1、初始化控件,构造控件内容
		2、测试Find函数，searchtext为空字符串，其他参数有效
		3、输出函数返回值
		

		【代码输出值描述】
		Returns the number of characters found
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "for  "
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,True, True, False, True)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			rte_1.SelectText(1,1,0,0,Detail!)
			Clipboard("Appeon   for  PowerBuilder")
			rte_1.paste()
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
		end if
	Case 'RTEFUNW02P18'
	/*
	   【功能描述】
	    测试Find函数,searchtext为任意字符串，但控件中内容不存在该字串匹配

		【编码描述】
		1、初始化控件,构造控件内容
		2、测试Find函数，searchtext为任意字符串，但控件中内容不存在该字串匹配，其他参数有效
		3、输出函数返回值
		

		【代码输出值描述】
		0
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "h@#$sdfgs%^*&6s"
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,True, True, False, True)),True)
		else
			wf_data_init(rte_1,1,Detail!)
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
		end if
	Case 'RTEFUNW02P19'
	/*
	   【功能描述】
	    测试Find函数,searchtext为含多字节字符的字符串，存在匹配的内容

		【编码描述】
		1、初始化控件,构造控件内容
		2、测试Find函数，searchtext为含多字节字符的字符串，存在匹配的内容，其他参数有效
		3、输出函数返回值
		

		【代码输出值描述】
		Returns the number of characters found
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "软件产品"
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,True, True, False, True)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("正阳软件是一家专门从事研发和营销企业级软件产品的公司")
			rte_1.paste()			
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW02P20'
	/*
	   【功能描述】
	    测试Find函数,forward为true,cursor为true

		【编码描述】
		1、初始化控件,构造控件内容
		2、测试Find函数，forward为true,cursor为true，其他参数有效,即从插入点所在的位置开始向前查找
		3、输出函数返回值
		

		【代码输出值描述】
		Returns the number of characters found
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			ls_temp = "Appeon"
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,True, True, False, True)),True)
		else
			wf_data_init(rte_1,1,Detail!)
			rte_1.SelectText(1,1,0,0,Detail!)
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
		end if
	Case 'RTEFUNW02P21'
	/*
	   【功能描述】
	    测试Find函数,forward为false,cursor为true

		【编码描述】
		1、初始化控件,构造控件内容
		2、测试Find函数，forward为false,cursor为true，其他参数有效,即从插入点所在的位置开始向后查找
		3、输出函数返回值
		

		【代码输出值描述】
		Returns the number of characters found
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.setfocus()
			rte_1.selectText(4,1,0,0)
			ls_temp = "Appeon"
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,False, True, False, True)),True)
		else
			wf_data_init(rte_1,1,Detail!)
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
		end if
	Case 'RTEFUNW02P22'
	/*
	   【功能描述】
	    测试Find函数,forward为true,cursor为false

		【编码描述】
		1、初始化控件,构造控件内容
		2、测试Find函数，forward为true,cursor为false，其他参数有效,即从整个数据的起始位置开始查找
		3、输出函数返回值
		

		【代码输出值描述】
		Returns the number of characters found
		
		【期望UI描述】
		即从整个数据的起始位置开始查找
	*/
		
		if ab_exe then
			ls_temp = "Appeon"
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,True, True, False, False)),True)
		else
			wf_data_init(rte_1,1,Detail!)
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW02P23'
	/*
	   【功能描述】
	    测试Find函数,forward为false,cursor为false

		【编码描述】
		1、初始化控件,构造控件内容
		2、测试Find函数，forward为false,cursor为false，其他参数有效,即从整个数据的结束位置开始查找
		3、输出函数返回值
		

		【代码输出值描述】
		Returns the number of characters found
		
		【期望UI描述】
		即从整个数据的结束位置开始查找
	*/
		
		if ab_exe then
			ls_temp = "Appeon"
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,False, True, False, False)),True)
		else
			wf_data_init(rte_1,1,Detail!)
			rte_1.SelectText(1,1,0,0,Detail!)
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
		end if
	Case 'RTEFUNW02P24'
	/*
	   【功能描述】
	    测试Find函数,Insensitive为true,不区分大小写查找

		【编码描述】
		1、初始化控件,构造控件内容（含一些相同字符串，但其有大小写之分）
		2、测试Find函数，Insensitive为true，其他参数有效
		3、输出函数返回值
		

		【代码输出值描述】
		Returns the number of characters found
		
		【期望UI描述】
		不区分大小写查找
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "appeon"
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,True, True, False, True)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("Appeon for PowerBuilder  appeon for powerbuilder")
			rte_1.paste()
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
		end if
	Case 'RTEFUNW02P25'
	/*
	   【功能描述】
	    测试Find函数,Insensitive为false,区分大小写查找

		【编码描述】
		1、初始化控件,构造控件内容（含一些相同字符串，但其有大小写之分）
		2、测试Find函数，Insensitive为true，其他参数有效
		3、输出函数返回值
		

		【代码输出值描述】
		Returns the number of characters found
		
		【期望UI描述】
		区分大小写查找
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "appeon"
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,True, False, False, True)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("Appeon for PowerBuilder  appeon for powerbuilder")
			rte_1.paste()
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
		end if
	Case 'RTEFUNW02P26'
	/*
	   【功能描述】
	    测试Find函数,Wholeword为false,非单词匹配查找

		【编码描述】
		1、初始化控件,构造控件内容
		2、测试Find函数，Wholeword为false，其他参数有效
		3、输出函数返回值
		

		【代码输出值描述】
		Returns the number of characters found
		
		【期望UI描述】
		非单词匹配查找
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "%&^%dhj)(*"
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,True, True, False, True)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			rte_1.SelectText(1,1,0,0,Detail!)
			Clipboard("Appeon for PowerBuilder %&^%dhj)(* appeon for powerbuilder")
			rte_1.paste()
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
		end if
	Case 'RTEFUNW02P27'
	/*
	   【功能描述】
	    测试Find函数,Wholeword为true,单词匹配查找

		【编码描述】
		1、初始化控件,构造控件内容
		2、测试Find函数，Wholeword为true，其他参数有效
		3、输出函数返回值
		

		【代码输出值描述】
		Returns the number of characters found
		
		【期望UI描述】
		单词匹配查找
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "dhj"
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,True, True, False, True)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			rte_1.SelectText(1,1,0,0,Detail!)
			Clipboard("Appeon for PowerBuilder %&^%dhj)(* appeon for powerbuilder")
			rte_1.paste()
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
		end if
	Case 'RTEFUNW02P28'
	/*
	   【功能描述】
	    测试Find函数是否查找InputField值

		【编码描述】
		1、初始化控件,构造控件内容，其中含InputField且输入了值
		2、测试Find函数，InputField值中也包含查找内容
		3、输出函数返回值
		

		【代码输出值描述】
		Returns the number of characters found
		
		【期望UI描述】
		对Input Field的值不会查找
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "Sybase"
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,True, True, False, True)),True)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("Appeon for PowerBuilder %&^%dhj)(* appeon for powerbuilder")
			rte_1.paste()
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'Sybase')
			wf_settextformat(Detail!)
			wf_setparagraph(Detail!)
		end if
	Case 'RTEFUNW02P29'
	/*
	   【功能描述】
	    测试Find函数在Header区查找

		【编码描述】
		1、初始化控件为Header/Footer模式,构造控件Header区内容
		2、测试Find函数在Header区查找
		3、输出函数返回值
		

		【代码输出值描述】
		Returns the number of characters found
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Header!)
			ls_temp = "Sybase"
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,True, True, False, True)),True)
		else
			rte_1.setfocus()
			rte_1.ShowHeadFoot(True)
			rte_1.SelectTextAll(Header!)
			rte_1.Clear()
			rte_1.SelectText(1,1,0,0,Header!)
			Clipboard("Appeon for PowerBuilder %&^%Sybase)(* appeon for powerbuilder")
			rte_1.paste()
			wf_settextformat(Header!)
			wf_setparagraph(Header!)
		end if
	Case 'RTEFUNW02P30'
	/*
	   【功能描述】
	    测试Find函数在Footer区查找

		【编码描述】
		1、初始化控件为Header/Footer模式,构造控件Footer区内容
		2、测试Find函数在Footer区查找
		3、输出函数返回值
		

		【代码输出值描述】
		Returns the number of characters found
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Footer!)
			ls_temp = "Sybase"
			wf_output("FunReturn:  Find = " + wf_convert(rte_1.Find(ls_temp,True, True, False, True)),True)
		else
			rte_1.setfocus()
			rte_1.ShowHeadFoot(True)
			rte_1.SelectTextAll(Footer!)
			rte_1.Clear()
			rte_1.SelectText(1,1,0,0,Footer!)
			Clipboard("Appeon for PowerBuilder %&^%Sybase)(* appeon for powerbuilder")
			rte_1.paste()
			wf_settextformat(Footer!)
			wf_setparagraph(Footer!)
		end if
End Choose
if ab_exe then
	wf_postrun(al_row)
end if
end event

event open;call super::open;n_cst_config   lnv_res


if not lnv_res.of_createfile("PUB_BMP_BT_EMP.bmp",Gtr_Frame) then
	messagebox("提示信息","下载图片失败")
end if
end event

event close;call super::close;if FileExists("PUB_BMP_BT_EMP.bmp") then
	FileDelete("PUB_BMP_BT_EMP.bmp")
end if
end event

type mle_phenomena from w_templet`mle_phenomena within w_rtefunw02
end type

type cb_autoparse from w_templet`cb_autoparse within w_rtefunw02
end type

type cb_wrrun from w_templet`cb_wrrun within w_rtefunw02
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rtefunw02
end type

type dw_info from w_templet`dw_info within w_rtefunw02
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rtefunw02
boolean visible = true
end type

type pb_runnext from w_templet`pb_runnext within w_rtefunw02
end type

type pb_runall from w_templet`pb_runall within w_rtefunw02
end type

type pb_run from w_templet`pb_run within w_rtefunw02
end type

type pb_end from w_templet`pb_end within w_rtefunw02
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rtefunw02
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rtefunw02
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rtefunw02
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rtefunw02
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rtefunw02
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rtefunw02
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rtefunw02
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rtefunw02
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rtefunw02
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rtefunw02
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rtefunw02
end type

type rte_1 from richtextedit within w_rtefunw02
integer x = 32
integer y = 28
integer width = 2917
integer height = 1292
integer taborder = 70
boolean bringtotop = true
boolean init_wordwrap = true
boolean init_headerfooter = true
borderstyle borderstyle = stylelowered!
end type

event dragdrop;wf_output("EventReturn:  Dragdrop Event is triggered.",False)
end event

event dragenter;wf_output("EventReturn:  Dragenter Event is triggered.",False)
end event

event dragleave;wf_output("EventReturn:  Dragleave Event is triggered.",False)
end event

event dragwithin;wf_output("EventReturn:  DragWithin Event is triggered.",False)
end event

