$PBExportHeader$w_rtefunw07.srw
forward
global type w_rtefunw07 from w_templet
end type
type rte_1 from richtextedit within w_rtefunw07
end type
end forward

global type w_rtefunw07 from w_templet
string title = "Function 7"
rte_1 rte_1
end type
global w_rtefunw07 w_rtefunw07

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

on w_rtefunw07.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rtefunw07.destroy
call super::destroy
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 
将控件内容成功保存到一个文档后或新打开文档后，Modified属性值变为false
***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Functions\Function 7 
Pbl Name:     
Designer:     ouyangwu
Coder:        WuZhiJun(2005-06-24)
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

//公共变量定义
String	ls_Temp,ls_FileName
Integer	li_RtnVal
Boolean	lb_RtnVal
long		ll_RtnVal

if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return

if Not ab_exe then
	rte_1.WordWrap = true
	wf_data_init(rte_1,4)
	rte_1.ShowHeadFoot(false)
	rte_1.Preview(false)
end if

Choose Case as_testpoint
	Case 'RTEFUNW07P01'
	/*
	   【功能描述】
	    InsertPicture,FileName为NULL

		【编码描述】
		1、初始化控件
		2、指定filename为NULL,调用函数
		3、输出函数返回值
		

		【代码输出值描述】
		NULL
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(ls_FileName)
			li_RtnVal = rte_1.InsertPicture(ls_FileName)
			wf_OutPut("FunReturn: rte_1.InsertPicture(ls_FileName)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW07P02'
	/*
	   【功能描述】
	    InsertPicture,FileName为BMP文件，使用相对路径

		【编码描述】
		1、初始化控件
		2、指定filename为BMP文件,使用相对路径，设置插入点在Detail区，调用函数
		3、输出函数返回值
		

		【代码输出值描述】
		0
		
		【期望UI描述】
		图片插入到当插入点
	*/
		
		if ab_exe then
			ls_FileName = "PUB_BMP_APB.bmp"
			rte_1.SelectText(1,1,0,0,Detail!)
			li_RtnVal = rte_1.InsertPicture(ls_FileName)
			wf_OutPut("FunReturn: rte_1.InsertPicture(ls_FileName)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW07P03'
	/*
	   【功能描述】
	    InsertPicture,FileName为BMP文件，使用绝对路径

		【编码描述】
		1、初始化控件，HeaderFooter=true
		2、指定filename为BMP文件,使用绝对路径，切换为Header/Footer编辑界面，设置插入点在Header区，调用函数
		3、输出函数返回值
		

		【代码输出值描述】
		0
		
		【期望UI描述】
		图片插入到当插入点
	*/
		
		if ab_exe then
			ls_FileName = "C:\PUB_BMP_AJE.bmp"
			rte_1.SelectText(1,1,0,0,Header!)
			li_RtnVal = rte_1.InsertPicture(ls_FileName)
			wf_OutPut("FunReturn: rte_1.InsertPicture(ls_FileName)=" + String(li_RtnVal),true)
		else
			rte_1.HeaderFooter = true
			rte_1.showHeadFoot(true)
		end if
	Case 'RTEFUNW07P04'
	/*
	   【功能描述】
	    InsertPicture,插入时替换高亮选中内容

		【编码描述】
		1、初始化控件，HeaderFooter=true
		2、指定filename为BMP文件,使用绝对路径，切换为Header/Footer编辑界面，设置插入点在Footer区，高亮选中部分内容，调用函数
		3、输出函数返回值
		

		【代码输出值描述】
		0
		
		【期望UI描述】
		选中内容被替换成图片
	*/
		
		if ab_exe then
			ls_FileName = "C:\PUB_BMP_AJE.bmp"
			rte_1.SelectText(1,1,0,0,Footer!)
			li_RtnVal = rte_1.InsertPicture(ls_FileName)
			wf_OutPut("FunReturn: rte_1.InsertPicture(ls_FileName)=" + String(li_RtnVal),true)
		else
			rte_1.HeaderFooter = true
			rte_1.showHeadFoot(true)
		end if
	Case 'RTEFUNW07P05'
	/*
	   【功能描述】
	    InsertPicture,连续插入多幅图片

		【编码描述】
		1、初始化控件
		2、指定filename为BMP文件,使用绝对路径，调用函数连续插入多幅图片
		3、输出函数返回值
		

		【代码输出值描述】
		0
		
		【期望UI描述】
		插入了多幅图片
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,2,10,Detail!)

			
			ls_FileName = "C:\PUB_BMP_AJE.bmp"
			li_RtnVal = rte_1.InsertPicture(ls_FileName)
			wf_OutPut("FunReturn: rte_1.InsertPicture(ls_FileName)=" + String(li_RtnVal),true)
			
			ls_FileName = "C:\PUB_BMP_AJE.bmp"
			li_RtnVal = rte_1.InsertPicture(ls_FileName)
			wf_OutPut("FunReturn: rte_1.InsertPicture(ls_FileName)=" + String(li_RtnVal),false)
			
			ls_FileName = "C:\PUB_BMP_AJE.bmp"
			li_RtnVal = rte_1.InsertPicture(ls_FileName)
			wf_OutPut("FunReturn: rte_1.InsertPicture(ls_FileName)=" + String(li_RtnVal),false)
		else
		end if
	Case 'RTEFUNW07P06'
	/*
	   【功能描述】
	    InsertPicture,已经存在一幅被单击选中的图片

		【编码描述】
		1、初始时：插入一幅图片
		2、设置插入点后有效插入图片
		3、输出函数返回值
		

		【代码输出值描述】
		0
		
		【期望UI描述】
		单击存在的图片依然保持被选择的状态
	*/
		
		if ab_exe then
			ls_FileName = "C:\PUB_BMP_AJE.bmp"
			li_RtnVal = rte_1.InsertPicture(ls_FileName)
			wf_OutPut("FunReturn: rte_1.InsertPicture(ls_FileName)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW07P07'
	/*
	   【功能描述】
	    Ispreview,控件不处于Preview状态

		【编码描述】
		1、初始时：控件不处于Preview状态
		2、调用Ispreview函数
		3、输出函数返回值
		

		【代码输出值描述】
		false
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lb_RtnVal = rte_1.IsPreview()
			wf_OutPut("FunReturn: rte_1.IsPreview()=" + String(lb_RtnVal),true)
		else
		end if
	Case 'RTEFUNW07P08'
	/*
	   【功能描述】
	    Ispreview,控件处于Preview状态

		【编码描述】
		1、初始时：调用Preview(true)使得控件处于Preview状态
		2、调用Ispreview函数
		3、输出函数返回值
		

		【代码输出值描述】
		true
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lb_RtnVal = rte_1.IsPreview()
			wf_OutPut("FunReturn: rte_1.IsPreview()=" + String(lb_RtnVal),true)
		else
			rte_1.Preview(true)
		end if
	Case 'RTEFUNW07P09'
	/*
	   【功能描述】
	    LineCount,控件内容为空

		【编码描述】
		1、初始时：控件内容为空
		2、调用LineCount函数
		3、输出函数返回值
		

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			li_RtnVal = rte_1.LineCount()
			wf_OutPut("FunReturn: rte_1.LineCount()=" + String(li_RtnVal),true)
		else
			rte_1.SelectTextAll()
			rte_1.Clear()
		end if
	Case 'RTEFUNW07P10'
	/*
	   【功能描述】
	    LineCount,计算Detail区的行数

		【编码描述】
		1、初始时：HeaderFooter=true，构建Detail区数据以及Header/Footer区数据,每个数据区都不能完全显示完数据行
		2、设置插入点在Detail区，调用LineCount函数
		3、输出函数返回值
		

		【代码输出值描述】
		返回主输入区的内容行数
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			li_RtnVal = rte_1.LineCount()
			wf_OutPut("FunReturn: rte_1.LineCount()=" + String(li_RtnVal),true)
		else
			rte_1.HeaderFooter=true
			rte_1.ShowHeadFoot(true)
			ClipBoard('About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.')
			rte_1.SelectText(1,1,0,0,Header!)
			rte_1.Paste()
			rte_1.SelectText(1,1,0,0,Footer!)
			rte_1.Paste()
		end if
	Case 'RTEFUNW07P11'
	/*
	   【功能描述】
	    LineCount,计算header区的行数

		【编码描述】
		1、初始时：HeaderFooter=true，构建Detail区数据以及Header/Footer区数据,每个数据区都不能完全显示完数据行
		2、设置插入点在Header区，调用LineCount函数
		3、输出函数返回值
		

		【代码输出值描述】
		返回Header区的内容行数
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Header!)
			li_RtnVal = rte_1.LineCount()
			wf_OutPut("FunReturn: rte_1.LineCount()=" + String(li_RtnVal),true)
		else
			rte_1.HeaderFooter=true
			rte_1.ShowHeadFoot(true)
			ClipBoard('About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.')
			rte_1.SelectText(1,1,0,0,Header!)
			rte_1.Paste()
			rte_1.SelectText(1,1,0,0,Footer!)
			rte_1.Paste()
		end if
	Case 'RTEFUNW07P12'
	/*
	   【功能描述】
	    LineCount,计算Footer区的行数

		【编码描述】
		1、初始时：HeaderFooter=true，构建Detail区数据以及Header/Footer区数据,每个数据区都不能完全显示完数据行
		2、设置插入点在Footer区，调用LineCount函数
		3、输出函数返回值
		

		【代码输出值描述】
		返回Footer区的内容行数
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Footer!)
			li_RtnVal = rte_1.LineCount()
			wf_OutPut("FunReturn: rte_1.LineCount()=" + String(li_RtnVal),true)
		else
			rte_1.HeaderFooter=true
			rte_1.ShowHeadFoot(true)
			ClipBoard('About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.')
			rte_1.SelectText(1,1,0,0,Header!)
			rte_1.Paste()
			rte_1.SelectText(1,1,0,0,Footer!)
			rte_1.Paste()
		end if
	Case 'RTEFUNW07P13'
	/*
	   【功能描述】
	    LineCount,是否计算InputField长度

		【编码描述】
		1、初始时：构建Detail区数据，插入一个InputField并设置其数据
		2、设置插入点到含InputField数据行中，调用LineCount函数
		3、输出函数返回值
		

		【代码输出值描述】
		返回的数据字节长度不包括InputField长度
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			li_RtnVal = rte_1.LineCount()
			wf_OutPut("FunReturn: rte_1.LineCount()=" + String(li_RtnVal),true)
		else
			rte_1.SelectText(100,1,100,1,Detail!)
			rte_1.InputFieldInsert('WuZhiJun')
			rte_1.InputFieldChangeData('WuZhiJun','About this Appeon for PowerBuilder Help')
		end if
	Case 'RTEFUNW07P14'
	/*
	   【功能描述】
	    LineCount,是否计算图片的长度

		【编码描述】
		1、初始时：构建Detail区数据，插入一个图片并使其占用一行
		2、设置插入点到图片行，调用LineCount函数
		3、输出函数返回值
		

		【代码输出值描述】
		0
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			li_RtnVal = rte_1.LineCount()
			wf_OutPut("FunReturn: rte_1.LineCount()=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW07P15'
	/*
	   【功能描述】
	    LineCount,WordWrap=true

		【编码描述】
		1、初始时：WordWrap=true，构建Detail区数据，一些数据行超过控件宽度，使得WordWrap发生作用
		2、调用LineCount函数
		3、输出函数返回值
		

		【代码输出值描述】
		返回控件中实际的行数
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			li_RtnVal = rte_1.LineCount()
			wf_OutPut("FunReturn: rte_1.LineCount()=" + String(li_RtnVal),true)
		else
			rte_1.WordWrap = true
		end if
	Case 'RTEFUNW07P16'
	/*
	   【功能描述】
	    Linelength,插入点在Detail区

		【编码描述】
		1、初始时：构建Detail区数据
		2、设置插入点，调用Linelength函数
		3、输出函数返回值
		

		【代码输出值描述】
		返回插入点所在行的长度
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			ll_RtnVal = rte_1.LineLength()
			wf_OutPut("FunReturn: rte_1.LineLength()=" + String(ll_RtnVal),true)
		else
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW07P17'
	/*
	   【功能描述】
	    Linelength,插入点在Header区

		【编码描述】
		1、初始时：构建Detail/Header/Footer区数据
		2、设置插入点在header区，调用Linelength函数
		3、输出函数返回值
		

		【代码输出值描述】
		返回插入点所在行的长度
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Header!)
			ll_RtnVal = rte_1.LineLength()
			wf_OutPut("FunReturn: rte_1.LineLength()=" + String(ll_RtnVal),true)
		else
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			rte_1.SelectText(1,1,0,0,Header!)
			ClipBoard("I'm chinese")
			rte_1.Paste()
			rte_1.SelectText(1,1,0,0,Footer!)
			rte_1.Paste()
		end if
	Case 'RTEFUNW07P18'
	/*
	   【功能描述】
	    Linelength,插入点在Footer区

		【编码描述】
		1、初始时：构建Detail/Header/Footer区数据
		2、设置插入点在Footer区，调用Linelength函数
		3、输出函数返回值
		

		【代码输出值描述】
		返回插入点所在行的长度
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Footer!)
			ll_RtnVal = rte_1.LineLength()
			wf_OutPut("FunReturn: rte_1.LineLength()=" + String(ll_RtnVal),true)
		else
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			rte_1.SelectText(1,1,0,0,Header!)
			ClipBoard("I'm chinese")
			rte_1.Paste()
			rte_1.SelectText(1,1,0,0,Footer!)
			rte_1.Paste()
		end if
	Case 'RTEFUNW07P19'
	/*
	   【功能描述】
	    Linelength,计算某行存在图片的Length

		【编码描述】
		1、初始时：构建Detail区数据，插入一个图片
		2、设置插入点到含图片的那一行，调用Linelength函数
		3、输出函数返回值
		

		【代码输出值描述】
		返回插入点所在行的长度
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			ll_RtnVal = rte_1.LineLength()
			wf_OutPut("FunReturn: rte_1.LineLength()=" + String(ll_RtnVal),true)
		else
			wf_data_init(rte_1,4)
		end if
	Case 'RTEFUNW07P20'
	/*
	   【功能描述】
	    Linelength,WordWrap=true

		【编码描述】
		1、初始时：WordWrap=true，构建Detail区数据，一些数据行超过控件宽度，使得WordWrap发生作用
		2、设置插入点，调用Linelength函数
		3、输出函数返回值
		

		【代码输出值描述】
		返回插入点所在行的实际长度
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			ll_RtnVal = rte_1.LineLength()
			wf_OutPut("FunReturn: rte_1.LineLength()=" + String(ll_RtnVal),true)
		else
			rte_1.WordWrap = true
		end if
	Case 'RTEFUNW07P21'
	/*
	   【功能描述】
	    Linelength,从前往后选择多行数据时，计算结束行的数据长度

		【编码描述】
		1、初始时：构建Detail区数据
		2、从前往后选择多行数据，调用Linelength函数
		3、输出函数返回值
		

		【代码输出值描述】
		返回结束行的数据长度
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,8,10,Detail!)
			ll_RtnVal = rte_1.LineLength()
			wf_OutPut("FunReturn: rte_1.LineLength()=" + String(ll_RtnVal),true)
		else
		end if
	Case 'RTEFUNW07P22'
	/*
	   【功能描述】
	    Linelength,从后往前选择多行数据时，计算开始行的数据长度

		【编码描述】
		1、初始时：构建Detail区数据
		2、从后往前选择多行数据，调用Linelength函数
		3、输出函数返回值
		

		【代码输出值描述】
		返回开始行的数据长度
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SelectText(10,10,1,1,Detail!)
			ll_RtnVal = rte_1.LineLength()
			wf_OutPut("FunReturn: rte_1.LineLength()=" + String(ll_RtnVal),true)
		else
		end if
	Case 'RTEFUNW07P23'
	/*
	   【功能描述】
	    Linelength,测试多字节字符的长度计算

		【编码描述】
		1、初始时：构建Detail区数据，某行含有多字节字符数据
		2、设置插入点到含有多字节字符的数据行中，调用Linelength函数
		3、输出函数返回值
		

		【代码输出值描述】
		返回行的实际数据字节数
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			ll_RtnVal = rte_1.LineLength()
			wf_OutPut("FunReturn: rte_1.LineLength()=" + String(ll_RtnVal),true)
		else
			rte_1.SelectText(1,1,0,0,Detail!)
			ClipBoard('我是中国人,我爱我的祖国和人民')
			rte_1.Paste()
		end if
	Case 'RTEFUNW07P24'
	/*
	   【功能描述】
	    Linelength,测试是否计算InputField的长度

		【编码描述】
		1、初始时：构建Detail区数据，某行含有InputField并设置了数据
		2、设置插入点到含有InputField的数据行中，调用Linelength函数
		3、输出函数返回值
		

		【代码输出值描述】
		返回行的实际数据字节数，不包括InputField的长度
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			li_RtnVal = rte_1.Linelength()
			wf_OutPut("FunReturn: rte_1.Linelength()=" + String(li_RtnVal),true)
		else
			rte_1.InputFieldInsert('WuZhiJun')
			rte_1.InputFieldChangeData('WuZhiJun','About this Appeon for PowerBuilder Help')
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


if not lnv_res.of_createFile("C:\PUB_BMP_AJE.bmp",gtr_frame) then
	messagebox("提示信息","下载图片失败")
end if
end event

event close;call super::close;
if FileExists("PUB_BMP_APB.bmp") then
	FileDelete("PUB_BMP_APB.bmp")
end if

if FileExists("C:\PUB_BMP_AJE.bmp") then
	FileDelete("C:\PUB_BMP_AJE.bmp")
end if

end event

type mle_phenomena from w_templet`mle_phenomena within w_rtefunw07
end type

type cb_autoparse from w_templet`cb_autoparse within w_rtefunw07
end type

type cb_wrrun from w_templet`cb_wrrun within w_rtefunw07
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rtefunw07
end type

type dw_info from w_templet`dw_info within w_rtefunw07
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rtefunw07
end type

type pb_runnext from w_templet`pb_runnext within w_rtefunw07
end type

type pb_runall from w_templet`pb_runall within w_rtefunw07
end type

type pb_run from w_templet`pb_run within w_rtefunw07
end type

type pb_end from w_templet`pb_end within w_rtefunw07
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rtefunw07
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rtefunw07
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rtefunw07
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rtefunw07
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rtefunw07
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rtefunw07
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rtefunw07
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rtefunw07
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rtefunw07
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rtefunw07
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rtefunw07
end type

type rte_1 from richtextedit within w_rtefunw07
integer x = 27
integer y = 32
integer width = 2921
integer height = 1288
integer taborder = 70
boolean bringtotop = true
boolean init_headerfooter = true
borderstyle borderstyle = stylelowered!
end type

