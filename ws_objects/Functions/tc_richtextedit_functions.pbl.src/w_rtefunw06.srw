$PBExportHeader$w_rtefunw06.srw
forward
global type w_rtefunw06 from w_templet
end type
type rte_1 from richtextedit within w_rtefunw06
end type
end forward

global type w_rtefunw06 from w_templet
integer width = 4658
integer height = 2360
string title = "Function 6"
rte_1 rte_1
end type
global w_rtefunw06 w_rtefunw06

forward prototypes
public function string wf_getfilename (string as_filename)
public subroutine wf_data_init (richtextedit ar_rich, integer ai_sign)
end prototypes

public function string wf_getfilename (string as_filename);Return as_FileName
end function

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

on w_rtefunw06.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rtefunw06.destroy
call super::destroy
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 
将控件内容成功保存到一个文档后或新打开文档后，Modified属性值变为false
***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Functions\Function 6 
Pbl Name:     
Designer:     ouyangwu
Coder:        WuZhiJun(2005-06-23)
DocReviewer:  
CoderReviewer:
【功能描述】
测试控件的相关函数
【窗口对象】

【编码注意事项】
1、构建的rtf文件中请包含图片
2、rtf文件可用Word构建，也可直接用Windows自带的RichText编辑器构建
3、注意使用SelectText函数来定位光标位置
4、如何将插入点定位到Header或Footer区：
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
Boolean	lb_Flag
FileType	lf_FileType

if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return

if ab_exe then
	ls_FileName = wf_GetFileName(This.ClassName())
else
	wf_data_init(rte_1,4)
end if

Choose Case as_testpoint
	Case 'RTEFUNW06P01'
	/*
	   【功能描述】
	    InsertDocument,只带两个参数，filename为NULL

		【编码描述】
		1、初始化控件
		2、指定filename为NULL，带两个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		
		【期望UI描述】
		
	*/
		if ab_exe then
			SetNull(ls_FileName)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,true)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,true)=" + String(li_RtnVal),true)
		else
		end if
		
	Case 'RTEFUNW06P02'
	/*
	   【功能描述】
	    InsertDocument,只带两个参数，clearflag为NULL

		【编码描述】
		1、初始化控件
		2、指定clearflag为NULL，带两个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(lb_Flag)
			ls_FileName += "_rtf01.rtf"
			li_RtnVal = rte_1.InsertDocument(ls_FileName,lb_Flag)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,lb_Flag)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW06P03'
	/*
	   【功能描述】
	    InsertDocument,带三个参数，filetype为NULL

		【编码描述】
		1、初始化控件
		2、指定filetype为NULL，带三个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			ls_FileName += "_rtf01.rtf"
			SetNull(lf_FileType)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,true,lf_FileType)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,true,lf_FileType)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW06P04'
	/*
	   【功能描述】
	    ClearFlag=False时插入rtf格式的文件，文件中不包含Header/Footer内容

		【编码描述】
		1、初始化控件及内容，构建相应rtf文件，文件中不包含Header/Footer内容,HeaderFooter=false
		2、指定filename为rtf文件,ClearFlag = False，FileType=FileTypeRichText!，设置插入点后带三个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		文件的主区域内容插入到插入点位置
	*/
		
		if ab_exe then
			ls_FileName += "_rtf02_NoHF.RTF"
			rte_1.HeaderFooter = false
			lf_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,false,lf_FileType)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,false,lf_FileType)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW06P05'
	/*
	   【功能描述】
	    ClearFlag=False时插入rtf格式的文件，文件中包含Header/Footer内容，HeaderFooter=false

		【编码描述】
		1、初始化控件及内容，构建相应rtf文件，文件中不包含Header/Footer内容,HeaderFooter=false
		2、指定filename为rtf文件,ClearFlag = False，FileType=FileTypeRichText!，设置插入点后带三个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		文件的主区域内容插入到插入点位置
	*/
		
		if ab_exe then
			ls_FileName += "_rtf01.rtf"
			rte_1.HeaderFooter = false
			lf_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,false,lf_FileType)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,false,lf_FileType)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW06P06'
	/*
	   【功能描述】
	    ClearFlag=False时插入rtf格式的文件到Detail区，文件中包含Header/Footer内容，HeaderFooter=true

		【编码描述】
		1、初始化控件及内容，构建相应rtf文件，文件中不包含Header/Footer内容,HeaderFooter=true
		2、指定filename为rtf文件,ClearFlag = False，FileType=FileTypeRichText!，设置插入点为Detail编辑区，带三个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		文件的主区域内容插入到插入点位置
	*/
		
		if ab_exe then
			ls_FileName += "_rtf01.rtf"
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lf_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,false,lf_FileType)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,false,lf_FileType)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW06P07'
	/*
	   【功能描述】
	    ClearFlag=False时插入rtf格式的文件到Detail区，文件中包含Header/Footer内容，HeaderFooter=true

		【编码描述】
		1、初始化控件及内容，构建相应rtf文件，文件中不包含Header/Footer内容,HeaderFooter=true
		2、指定filename为rtf文件,ClearFlag = False，FileType=FileTypeRichText!，设置插入点为Detail编辑区，带三个参数调用函数
		3、输出函数返回值
		4、切换到Header/Footer编辑状态

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		文件中的Header/Footer内容附加到当前控件相应区域
	*/
		
		if ab_exe then
			ls_FileName += "_rtf01.rtf"
			rte_1.HeaderFooter = true
			lf_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,false,lf_FileType)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,false,lf_FileType)=" + String(li_RtnVal),true)
			rte_1.ShowHeadFoot(true)
			rte_1.SelectText(1,1,0,0,Header!)
		else
		end if
	Case 'RTEFUNW06P08'
	/*
	   【功能描述】
	    ClearFlag=False时插入rtf格式的文件到Header区，文件中包含Header/Footer内容，HeaderFooter=true

		【编码描述】
		1、初始化控件及内容，构建相应rtf文件，文件中不包含Header/Footer内容,HeaderFooter=true
		2、指定filename为rtf文件,ClearFlag = False，FileType=FileTypeRichText!，设置插入点为Header编辑区，带三个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		文件的主区域内容插入到插入点位置
	*/
		
		if ab_exe then
			ls_FileName += "_rtf01.rtf"
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lf_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Header!)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,false,lf_FileType)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,false,lf_FileType)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW06P09'
	/*
	   【功能描述】
	    ClearFlag=False时插入rtf格式的文件到Footer区，文件中包含Header/Footer内容，HeaderFooter=true

		【编码描述】
		1、初始化控件及内容，构建相应rtf文件，文件中不包含Header/Footer内容,HeaderFooter=true
		2、指定filename为rtf文件,ClearFlag = False，FileType=FileTypeRichText!，设置插入点为Footer编辑区，带三个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		文件的主区域内容插入到插入点位置
	*/
		
		if ab_exe then
			ls_FileName += "_rtf01.rtf"
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lf_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Footer!)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,false,lf_FileType)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,false,lf_FileType)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW06P10'
	/*
	   【功能描述】
	    ClearFlag=False时插入Txt格式的文件到Detail区，HeaderFooter=false

		【编码描述】
		1、初始化控件及内容，构建相应txt文件，HeaderFooter=false
		2、指定filename为Txt文件,ClearFlag = False，FileType=FileTypeText!，设置插入点为detail编辑区，带三个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		文件的主区域内容插入到插入点位置
	*/
		
		if ab_exe then
			ls_FileName += "_txt01.txt"
			rte_1.HeaderFooter = false
			lf_FileType = FileTypeText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,false,lf_FileType)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,false,lf_FileType)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW06P11'
	/*
	   【功能描述】
	    ClearFlag=False时插入Txt格式的文件到Detail区，HeaderFooter=true

		【编码描述】
		1、初始化控件及内容，构建相应txt文件，HeaderFooter=true,且Header/Footer区存在内容
		2、指定filename为Txt文件,ClearFlag = False，FileType=FileTypeText!，设置插入点为detail编辑区，带三个参数调用函数
		3、输出函数返回值
		4、切换到Header/Footer编辑区

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		Header/Footer编辑区内容保持不变
	*/
		
		if ab_exe then
			ls_FileName += "_txt01.txt"
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lf_FileType = FileTypeText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,false,lf_FileType)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,false,lf_FileType)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW06P12'
	/*
	   【功能描述】
	    ClearFlag=true时插入Txt格式的文件，HeaderFooter=false

		【编码描述】
		1、初始化控件及内容，构建相应txt文件，HeaderFooter=false
		2、指定filename为Txt文件,ClearFlag =true，FileType=FileTypeText!，设置插入点为detail编辑区，带三个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		文件的内容覆盖Detail区的内容
	*/
		
		if ab_exe then
			ls_FileName += "_txt01.txt"
			rte_1.HeaderFooter = false
			lf_FileType = FileTypeText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,true,lf_FileType)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,true,lf_FileType)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW06P13'
	/*
	   【功能描述】
	    ClearFlag=true时插入Txt格式的文件，HeaderFooter=true，Header/footer区效果

		【编码描述】
		1、初始化控件及内容，构建相应txt文件，HeaderFooter=true,且Header/Footer区存在内容
		2、指定filename为Txt文件,ClearFlag =true，FileType=FileTypeText!，设置插入点为Header编辑区，带三个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		Header/Footer区内容被清除
	*/
		
		if ab_exe then
			ls_FileName += "_txt01.txt"
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lf_FileType = FileTypeText!
			rte_1.SelectText(1,1,0,0,header!)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,true,lf_FileType)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,true,lf_FileType)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW06P14'
	/*
	   【功能描述】
	    ClearFlag=true时插入Txt格式的文件，HeaderFooter=true，Detail区效果

		【编码描述】
		1、初始化控件及内容，构建相应txt文件，HeaderFooter=true,且Header/Footer区存在内容
		2、指定filename为Txt文件,ClearFlag =true，FileType=FileTypeText!，设置插入点为Header编辑区，带三个参数调用函数
		3、输出函数返回值
		4、切换回Detail区编辑界面

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		文件的内容覆盖Detail区的内容
	*/
		
		if ab_exe then
			ls_FileName += "_txt01.txt"
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lf_FileType = FileTypeText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,true,lf_FileType)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,true,lf_FileType)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW06P15'
	/*
	   【功能描述】
	    ClearFlag=true时插入rtf格式的文件，HeaderFooter=true，Header/footer区效果

		【编码描述】
		1、初始化控件及内容，构建相应含Header/Footer内容的rtf文件，HeaderFooter=true,且控件Header/Footer区存在内容
		2、指定filename为rtf文件,ClearFlag =true，FileType=FileTypeRichText!，设置插入点为Header编辑区，带三个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		Header/Footer区被替换为文件中相应的内容
	*/
		
		if ab_exe then
			ls_FileName += "_rtf01.rtf"
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lf_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Header!)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,true,lf_FileType)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,true,lf_FileType)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW06P16'
	/*
	   【功能描述】
	    ClearFlag=true时插入rtf格式的文件，HeaderFooter=true，Detail区效果

		【编码描述】
		1、初始化控件及内容，构建相应含Header/Footer内容的rtf文件，HeaderFooter=true,且控件Header/Footer区存在内容
		2、指定filename为rtf文件,ClearFlag =true，FileType=FileTypeRichText!，设置插入点为Footer编辑区，带三个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		Detail区被替换为文件中相应的内容
	*/
		
		if ab_exe then
			ls_FileName += "_rtf01.rtf"
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lf_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,true,lf_FileType)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,true,lf_FileType)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW06P17'
	/*
	   【功能描述】
	    测试rtf文件中含有不支持的格式化表格

		【编码描述】
		1、初始化控件及内容，构建相应含有不支持的格式化表格的rtf文件
		2、带有效三个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		不支持的格式化表格后面的内容将不会插入到控件中
	*/
		
		if ab_exe then
			ls_FileName += "_rtfP17_Table.rtf"
			lf_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,true,lf_FileType)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,true,lf_FileType)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW06P18'
	/*
	   【功能描述】
	    测试rtf文件中含有不支持的绘图对象

		【编码描述】
		1、初始化控件及内容，构建相应含有不支持的绘图对象的rtf文件
		2、带有效三个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		不支持的绘图对象后面的内容将不会插入到控件中
	*/
		
		if ab_exe then
			ls_FileName += "_rtfP18_Draw.rtf"
			lf_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,true,lf_FileType)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,true,lf_FileType)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW06P19'
	/*
	   【功能描述】
	    测试rtf文件中含有不支持的双下划线

		【编码描述】
		1、初始化控件及内容，构建相应含有不支持的绘图对象的rtf文件
		2、带有效三个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		不支持的双下划线的格式将被忽略
	*/
		
		if ab_exe then
			ls_FileName += "_rtfP19_DouUnLine.rtf"
			lf_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,true,lf_FileType)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,true,lf_FileType)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW06P20'
	/*
	   【功能描述】
	    测试指定的文件不存在

		【编码描述】
		1、初始化控件及内容
		2、指定的文件不存在
		3、输出函数返回值

		【代码输出值描述】
		-1
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			ls_FileName += "NoExists.rtf"
			lf_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,true,lf_FileType)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,true,lf_FileType)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW06P21'
	/*
	   【功能描述】
	    测试指定的文件不为rtf文件，而FileType指定为FileTypeRichText!

		【编码描述】
		1、初始化控件及内容
		2、指定的FileType为FileTypeRichText!,指定的FileName不为rtf文件，调用函数
		3、输出函数返回值

		【代码输出值描述】
		-1
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			ls_FileName += "_txt01.txt"
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lf_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,true,lf_FileType)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,true,lf_FileType)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW06P22'
	/*
	   【功能描述】
	    测试指定的文件为其他类型的文件，而FileType指定为FileTypeText!

		【编码描述】
		1、初始化控件及内容
		2、指定的FileType为FileTypeText!,指定的FileName不为rtf和Txt文件，调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		其他类型的文件以文本格式读入
	*/
		
		if ab_exe then
			ls_FileName += "_dat01.dat"
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lf_FileType = FileTypeText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,true,lf_FileType)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,true,lf_FileType)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW06P23'
	/*
	   【功能描述】
	    测试选中一部分内容，有效调用函数插入文件内容到当前插入点

		【编码描述】
		1、初始化控件及内容
		2、指定的ClearFlag=False,有效指定其他参数，高亮选种部分内容，调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		高亮选中部分的内容被替换成文件中的内容
	*/
		
		if ab_exe then
			ls_FileName += "_rtf01.rtf"
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lf_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_RtnVal = rte_1.InsertDocument(ls_FileName,false,lf_FileType)
			wf_OutPut("FunReturn: rte_1.InsertDocument(ls_FileName,false,lf_FileType)=" + String(li_RtnVal),true)
		else
		end if
End Choose
if ab_exe then
	wf_postrun(al_row)
end if
end event

event open;call super::open;n_cst_config  lnv_res
boolean  lb_1,lb_2,lb_3,lb_4,lb_5,lb_6,lb_7,lb_8

lb_1 = lnv_res.of_createFile("w_rtefunw06_dat01.dat",gtr_frame) 
lb_2 = lnv_res.of_createFile("w_rtefunw06_rtf01.rtf",gtr_frame) 
lb_3 = lnv_res.of_createFile("w_rtefunw06_rtf02_nohf.rtf",gtr_frame) 
lb_4 = lnv_res.of_createFile("w_rtefunw06_rtfp17_table.rtf",gtr_frame) 
lb_5 = lnv_res.of_createFile("w_rtefunw06_rtfp18_draw.rtf",gtr_frame) 
lb_6 = lnv_res.of_createFile("w_rtefunw06_rtfp19_douunline.rtf",gtr_frame) 
lb_7 = lnv_res.of_createFile("w_rtefunw06_txt01.txt",gtr_frame) 
lb_8 = lnv_res.of_createFile("PUB_BMP_APB.bmp",gtr_frame)

if not lb_1 or not lb_2 or not lb_3 or not lb_4 or not lb_5 or not lb_6 or not lb_7 or not lb_8 then
	messagebox("提示信息","下载文件失败")
end if






end event

event close;call super::close;
if FileExists("w_rtefunw06_dat01.dat") then
	FileDelete("w_rtefunw06_dat01.dat")
end if

if FileExists("w_rtefunw06_rtf01.rtf") then
	FileDelete("w_rtefunw06_rtf01.rtf")
end if

if FileExists("w_rtefunw06_rtf02_nohf.rtf") then
	FileDelete("w_rtefunw06_rtf02_nohf.rtf")
end if

if FileExists("w_rtefunw06_rtfp17_table.rtf") then
	FileDelete("w_rtefunw06_rtfp17_table.rtf")
end if

if FileExists("w_rtefunw06_rtfp18_draw.rtf") then
	FileDelete("w_rtefunw06_rtfp18_draw.rtf")
end if

if FileExists("w_rtefunw06_rtfp19_douunline.rtf") then
	FileDelete("w_rtefunw06_rtfp19_douunline.rtf")
end if

if FileExists("w_rtefunw06_txt01.txt") then
	FileDelete("w_rtefunw06_txt01.txt")
end if

if FileExists("PUB_BMP_APB.bmp") then
	FileDelete("PUB_BMP_APB.bmp")
end if



end event

type mle_phenomena from w_templet`mle_phenomena within w_rtefunw06
end type

type cb_autoparse from w_templet`cb_autoparse within w_rtefunw06
end type

type cb_wrrun from w_templet`cb_wrrun within w_rtefunw06
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rtefunw06
end type

type dw_info from w_templet`dw_info within w_rtefunw06
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rtefunw06
end type

type pb_runnext from w_templet`pb_runnext within w_rtefunw06
end type

type pb_runall from w_templet`pb_runall within w_rtefunw06
end type

type pb_run from w_templet`pb_run within w_rtefunw06
end type

type pb_end from w_templet`pb_end within w_rtefunw06
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rtefunw06
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rtefunw06
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rtefunw06
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rtefunw06
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rtefunw06
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rtefunw06
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rtefunw06
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rtefunw06
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rtefunw06
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rtefunw06
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rtefunw06
end type

type rte_1 from richtextedit within w_rtefunw06
integer x = 27
integer y = 32
integer width = 2921
integer height = 1292
integer taborder = 70
boolean bringtotop = true
boolean init_wordwrap = true
borderstyle borderstyle = stylelowered!
end type

