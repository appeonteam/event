$PBExportHeader$w_rtefunw11.srw
forward
global type w_rtefunw11 from w_templet
end type
type rte_1 from richtextedit within w_rtefunw11
end type
end forward

global type w_rtefunw11 from w_templet
string title = "Function 11"
rte_1 rte_1
end type
global w_rtefunw11 w_rtefunw11

forward prototypes
public subroutine wf_data_init (richtextedit ar_rich, integer ai_sign, band ab_band)
public function string wf_convert (string as_parm)
public function string wf_convert (long al_parm)
public function string wf_convert (boolean ab_boolean)
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

on w_rtefunw11.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rtefunw11.destroy
call super::destroy
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 
将控件内容成功保存到一个文档后或新打开文档后，Modified属性值变为false
***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Functions\Function 11 
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
long     	ll_temp
string   	ls_temp
FileType 	lft_type
integer  	li_FileNum
Datastore 	ld_data
String 		ls_FileName

if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return 
if not ab_exe then 
	rte_1.Resize(2926,1280)
	if FileExists("test.rtf") then FileDelete("test.rtf")
	if FileExists("test.txt") then FileDelete("test.txt")
	if FileExists("test.doc") then FileDelete("test.doc")	
	rte_1.ShowHeadFoot(False)
end if

Choose Case as_testpoint
	Case 'RTEFUNW11P01'
	/*
	   【功能描述】
	    Resize，width为NULL

		【编码描述】
		1、初始化控件
		2、指定width为NULL调用函数
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(ll_temp)
			wf_output("FunReturn:  Resize = " +  wf_convert(rte_1.Resize(ll_temp,1280)),True)
		else
			wf_data_init(rte_1,1,Detail!)
		end if
	Case 'RTEFUNW11P02'
	/*
	   【功能描述】
	    Resize，Height为NULL

		【编码描述】
		1、初始化控件
		2、指定Height为NULL调用函数
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(ll_temp)
			wf_output("FunReturn:  Resize = " +  wf_convert(rte_1.Resize(2926,ll_temp)),True)
		else
			wf_data_init(rte_1,1,Detail!)
		end if
	Case 'RTEFUNW11P03'
	/*
	   【功能描述】
	    Resize，参数值都有效

		【编码描述】
		1、初始化控件
		2、指定有效参数调用函数
		3、输出函数返回值，以及width和height属性值

		【代码输出值描述】
		1，以及改变后的width和height值
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(ll_temp)
			wf_output("FunReturn:  Resize = " +  wf_convert(rte_1.Resize(2526,1000)),True)
			wf_output("FunReturn:  Width  = " +  wf_convert(rte_1.Width),False)
			wf_output("FunReturn:  Height = " +  wf_convert(rte_1.Height),False)
		else
			wf_data_init(rte_1,1,Detail!)
		end if
	Case 'RTEFUNW11P04'
	/*
	   【功能描述】
	    SaveDocument，参数filename为NULL

		【编码描述】
		1、初始化控件,构建数据
		2、指定参数filename为NULL,只带一个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(ls_FileName)
			wf_output("FunReturn: SaveDocument = " + wf_convert(rte_1.SaveDocument(ls_FileName,filetypeRichText!)),True)
		else
			wf_data_init(rte_1,1,Detail!)
		end if
	Case 'RTEFUNW11P05'
	/*
	   【功能描述】
	    SaveDocument，参数filetype为NULL

		【编码描述】
		1、初始化控件,构建数据
		2、指定参数filetype为NULL,调用函数
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(lft_type)
			wf_output("FunReturn: SaveDocument = " + wf_convert(rte_1.SaveDocument("test.rtf",lft_type)),True)
		else
			wf_data_init(rte_1,1,Detail!)
		end if
	Case 'RTEFUNW11P06'
	/*
	   【功能描述】
	    SaveDocument，filename指定为rtf扩展名的相对路径文件名，不指定参数filetype

		【编码描述】
		1、初始化控件,构建数据
		2、filename指定为rtf扩展名的相对路径文件名，不指定参数filetype,调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn: SaveDocument = " + wf_convert(rte_1.SaveDocument("test.rtf")),True)
		else
			wf_data_init(rte_1,1,Detail!)
		end if
	Case 'RTEFUNW11P07'
	/*
	   【功能描述】
	    SaveDocument，filename指定为txt扩展名的绝对路径文件名，不指定参数filetype

		【编码描述】
		1、初始化控件,构建数据
		2、filename指定为txt扩展名的相对路径文件名，不指定参数filetype,调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn: SaveDocument = " + wf_convert(rte_1.SaveDocument("test.Txt")),True)
		else
			wf_data_init(rte_1,1,Detail!)
		end if
	Case 'RTEFUNW11P08'
	/*
	   【功能描述】
	    SaveDocument，filename指定为其他扩展名的绝对路径文件名，不指定参数filetype

		【编码描述】
		1、初始化控件,构建数据
		2、filename指定为非txt/rtf的其他扩展名的相对路径文件名，不指定参数filetype,调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn: SaveDocument = " + wf_convert(rte_1.SaveDocument("test.Doc")),True)
		else
			wf_data_init(rte_1,1,Detail!)
		end if
	Case 'RTEFUNW11P09'
	/*
	   【功能描述】
	    SaveDocument，filename指定为rtf扩展名的绝对路径文件名，指定filetypeRichText!

		【编码描述】
		1、初始化控件,使得Detail/Header/Footer三个区中都
		包含图片，以及含数据的和不含数据的InputField
		2、filename为rtf扩展名的相对路径文件名，参数filetype=filetypeRichText!,调用函数
		3、输出函数返回值,InsertDocument将导出的文件重新插入替换到控件中,输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		UI无变化
	*/
		
		if ab_exe then
			wf_output("FunReturn: SaveDocument = " + wf_convert(rte_1.SaveDocument("test.rtf",filetypeRichText!)),True)
		else
			wf_data_init(rte_1,1,Detail!)
			wf_data_init(rte_1,1,Header!)
			wf_data_init(rte_1,1,Footer!)
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')			
		end if
	Case 'RTEFUNW11P10'
	/*
	   【功能描述】
	    SaveDocument，filename指定为其他扩展名的绝对路径文件名，指定filetypeRichText!

		【编码描述】
		1、初始化控件,构建数据,使得Detail/Header/Footer三个区中都
		包含图片，以及含数据的和不含数据的InputField
		2、filename指定为非rtf的扩展名的相对路径文件名，指定参数filetype=filetypeRichText!,调用函数
		3、输出函数返回值
		

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		文件内容仍然为rtf格式
	*/
		
		if ab_exe then
			wf_output("FunReturn: SaveDocument = " + wf_convert(rte_1.SaveDocument("test.txt",filetypeRichText!)),True)
		else
			wf_data_init(rte_1,1,Detail!)
			wf_data_init(rte_1,1,Header!)
			wf_data_init(rte_1,1,Footer!)
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')			
		end if
	Case 'RTEFUNW11P11'
	/*
	   【功能描述】
	    SaveDocument，filename指定为txt扩展名的绝对路径文件名，指定filetypeText!

		【编码描述】
		1、初始化控件,使得Detail/Header/Footer三个区中都
		包含图片，以及含数据的和不含数据的InputField
		2、filename为txt扩展文件名，指定参数filetype=filetypeText!,调用函数
		3、输出函数返回值,再InsertDocument将导出的文件重新插入替换到控件中,输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		Detail区图片及Inputfield丢失
	*/
		
		if ab_exe then
			wf_output("FunReturn: SaveDocument  = " + wf_convert(rte_1.SaveDocument("test.txt",filetypeText!)),True)
			wf_output("FunReturn: InsertDocument =" + wf_convert(rte_1.InsertDocument("test.txt",TRUE, FileTypeText!)),False)			
		else
			wf_data_init(rte_1,1,Detail!)
			wf_data_init(rte_1,1,Header!)
			wf_data_init(rte_1,1,Footer!)
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')			
		end if
	Case 'RTEFUNW11P12'
	/*
	   【功能描述】
	    SaveDocument，filename为txt文件名，指定filetypeText!，再切换到Header/Footer编辑界面

		【编码描述】
		1、初始化控件,使得Detail/Header/Footer三个区中都
		包含图片，以及含数据的和不含数据的InputField
		2、filename指定为txt扩展文件名，指定参数filetype=filetypeText!,调用函数
		3、输出函数返回值,再InsertDocument将导出的文件重新插入替换到，再切换编辑界面

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		Header与Footer区内容丢失
	*/
		
		if ab_exe then
			wf_output("FunReturn: SaveDocument  = " + wf_convert(rte_1.SaveDocument("test.txt",filetypeText!)),True)
			wf_output("FunReturn: InsertDocument =" + wf_convert(rte_1.InsertDocument("test.txt",TRUE, FileTypeText!)),False)			
			rte_1.ShowHeadFoot(True)
		else
			wf_data_init(rte_1,1,Detail!)
			wf_data_init(rte_1,1,Header!)
			wf_data_init(rte_1,1,Footer!)
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')			
		end if
	Case 'RTEFUNW11P13'
	/*
	   【功能描述】
	    SaveDocument，filename指定为其他扩展名的绝对路径文件名，指定filetypeText!

		【编码描述】
		1、初始化控件,使得Detail/Header/Footer三个区中都
		包含图片，以及含数据的和不含数据的InputField
		2、filename为其他扩展文件名，指定参数filetype=filetypeText!,调用函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		
		【期望UI描述】
		文件内容以txt格式保存
	*/
		
		if ab_exe then
			wf_output("FunReturn: SaveDocument  = " + wf_convert(rte_1.SaveDocument("test.doc",filetypeText!)),True)			
		else
			wf_data_init(rte_1,1,Detail!)
			wf_data_init(rte_1,1,Header!)
			wf_data_init(rte_1,1,Footer!)
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')			
		end if
	Case 'RTEFUNW11P14'
	/*
	   【功能描述】
	    SaveDocument，filename指定为无效的文件名

		【编码描述】
		1、初始化控件,构建数据
		2、filename为无效的文件名，调用函数
		3、输出函数返回值

		【代码输出值描述】
		-1
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			wf_output("FunReturn: SaveDocument  = " + wf_convert(rte_1.SaveDocument('',filetypeText!)),True)			
		else
			wf_data_init(rte_1,1,Detail!)	
		end if
	Case 'RTEFUNW11P15'
	/*
	   【功能描述】
	    SaveDocument，指定的文件名已存在且没有权限写

		【编码描述】
		1、初始化控件,构建数据
		2、以独占写操作方式创建一个文件，指定该文件为filename，调用函数
		3、输出函数返回值,关闭文件

		【代码输出值描述】
		-1
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then		
			li_FileNum = FileOpen("test.txt",StreamMode!,Write!,LockWrite!,Append!)			
			wf_output("FunReturn: SaveDocument  = " + wf_convert(rte_1.SaveDocument("test.txt",filetypeText!)),True)			
			FileClose(li_FileNum)
		else
			wf_data_init(rte_1,1,Detail!)	
		end if
	Case 'RTEFUNW11P16'
	/*
	   【功能描述】
	    SaveDocument，控件与DataStore共享数据

		【编码描述】
		1、初始化控件,创建DataStore并检索数据与控件共享
		2、调用函数保存内容
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		所有实例被保存
	*/
		ld_data = create datastore
		rte_1.DataSource(ld_data) //data share
		ld_data.dataobject = 'rtefunw11_d01_temp01'
		if ab_exe then		
			wf_output("FunReturn: SaveDocument  = " + wf_convert(rte_1.SaveDocument("test.rtf",FileTypeRichText!)),True)			
		else
			wf_data_init(rte_1,1,Detail!)	
			rte_1.InputFieldInsert('info_2')
		end if
		Destroy ld_data
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


if FileExists("test.rtf") then FileDelete("test.rtf")
if FileExists("test.txt") then FileDelete("test.txt")
if FileExists("test.doc") then FileDelete("test.doc")	

end event

type mle_phenomena from w_templet`mle_phenomena within w_rtefunw11
end type

type cb_autoparse from w_templet`cb_autoparse within w_rtefunw11
end type

type cb_wrrun from w_templet`cb_wrrun within w_rtefunw11
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rtefunw11
end type

type dw_info from w_templet`dw_info within w_rtefunw11
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rtefunw11
end type

type pb_runnext from w_templet`pb_runnext within w_rtefunw11
end type

type pb_runall from w_templet`pb_runall within w_rtefunw11
end type

type pb_run from w_templet`pb_run within w_rtefunw11
end type

type pb_end from w_templet`pb_end within w_rtefunw11
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rtefunw11
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rtefunw11
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rtefunw11
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rtefunw11
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rtefunw11
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rtefunw11
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rtefunw11
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rtefunw11
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rtefunw11
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rtefunw11
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rtefunw11
end type

type rte_1 from richtextedit within w_rtefunw11
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

