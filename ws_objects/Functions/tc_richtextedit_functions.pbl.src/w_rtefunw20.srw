$PBExportHeader$w_rtefunw20.srw
forward
global type w_rtefunw20 from w_templet
end type
type rte_1 from richtextedit within w_rtefunw20
end type
type dw_1 from datawindow within w_rtefunw20
end type
end forward

global type w_rtefunw20 from w_templet
string title = "20-Function"
rte_1 rte_1
dw_1 dw_1
end type
global w_rtefunw20 w_rtefunw20

type variables
DataStore			ids_dw
Datawindowchild	idw_Child

String	is_Sql = "SELECT emp_id," + &
				"dep_id," + &
				"emp_code," + &
				"emp_name," + &
				"emp_sex," + &
				"emp_born," + &
				"emp_age," + &
				"emp_salary " + &
			"FROM PUB_T_RICHTEXTEDIT  ;"
			
String	is_Syntax,is_Error

end variables

forward prototypes
public subroutine wf_data_init (richtextedit ar_rich, integer ai_sign)
public subroutine wf_initcontrol ()
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
			ls_english = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents:Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'
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

public subroutine wf_initcontrol ();rte_1.ShowHeadFoot(false)
rte_1.Preview(false)
rte_1.SelectTextAll(Detail!)
rte_1.Clear()
ClipBoard('Series1~t814~ttmiu~r~nSeries2~t756~tyvga~r~nSeries3~t839~thfsh~r~nSeries4~t881~tcxhu~r~nSeries1~t853~tyyht~r~nSeries2~t742~tdglf~r~nSeries3~t997~tiebd~r~nSeries4~t966~ttoeu~r~nSeries1~t339~tfhda~r~nSeries2~t461~tphbs~r~nSeries3~t722~twztp~r~nSeries4~t976~tjngj~r~nSeries1~t540~tcpxr~r~nSeries2~t591~tvbvc~r~nSeries3~t974~tefkb~r~nSeries4~t447~tmgsd~r~nSeries1~t712~tmzmm~r~nSeries2~t952~twdeh~r~nSeries3~t504~tkruq~r~nSeries4~t995~tyvec~r~nSeries1~t409~tpesr~r~nSeries2~t426~tmdxl~r~nSeries3~t573~tubry~r~nSeries4~t656~teshq~r~nSeries1~t938~tzmre~r~nSeries2~t530~tqnkq~r~nSeries3~t438~ttxgi~r~nSeries4~t959~tgqus~r~nSeries1~t834~twtcz~r~nSeries2~t346~tlter~r~nSeries3~t309~tbltz~r~nSeries4~t774~tdyzv~r~nSeries1~t539~thnki~r~nSeries2~t892~tjwzz~r~nSeries3~t855~tdjpq~r~nSeries4~t711~tuowk~r~nSeries1~t768~tfcco~r~nSeries2~t455~tkvrj~r~nSeries3~t425~tfrjp~r~nSeries4~t420~tgdjd~r~n ')
rte_1.Paste()

end subroutine

on w_rtefunw20.create
int iCurrent
call super::create
this.rte_1=create rte_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
this.Control[iCurrent+2]=this.dw_1
end on

on w_rtefunw20.destroy
call super::destroy
destroy(this.rte_1)
destroy(this.dw_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 
将控件内容成功保存到一个文档后或新打开文档后，Modified属性值变为false
***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Functions\20-Function 
Pbl Name:     
Designer:     ouyangwu
Coder:        WuZhiJun(2005-06-28)
DocReviewer:  
CoderReviewer:
【功能描述】
主要测试DataSource函数
【窗口对象】

【编码注意事项】

【测试注意事项】
该函数目前不支持，所以该窗口暂不需要测试 
***********************/

//公共变量定义
String	ls_Temp
Integer	li_RtnVal,li_Val1,li_Val2,li_Val3,li_Val4

if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return

if Not ab_exe then
	rte_1.SelectTextAll(Detail!)
	rte_1.Clear()
end if

Choose Case as_testpoint
	Case 'RTEFUNW20P01'
	/*
	   【功能描述】
	    DataSource，参数为NULL

		【编码描述】
		1、初始化控件
		2、指定参数为NULL，调用DataSource
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(ids_dw)
			li_RtnVal = rte_1.DataSource(ids_dw)
			wf_OutPut("FunReturn: rte_1.DataSource(ids_dw)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW20P02'
	/*
	   【功能描述】
	    DataSource，DS中没有数据

		【编码描述】
		1、初始化控件及Datastore
		2、DS中没有数据，调用DataSource
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			ids_dw.Reset()
			li_RtnVal = rte_1.DataSource(ids_dw)
			wf_OutPut("FunReturn: rte_1.DataSource(ids_dw)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW20P03'
	/*
	   【功能描述】
	    DataSource，有效调用后，插入与列名相同的InputField

		【编码描述】
		1、初始化控件及Datastore数据，InputFieldVisibleName=false
		2、有效调用DataSource，再在控件中插入与列名相同的InputField
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		被插入的InputField将直接显示为对应的数据
	*/
		
		if ab_exe then
			ids_dw.Retrieve()
			rte_1.InputFieldsVisible = false
			li_RtnVal = rte_1.DataSource(ids_dw)
			rte_1.InputFieldInsert('emp_id')
			wf_OutPut("FunReturn: rte_1.DataSource(ids_dw)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW20P04'
	/*
	   【功能描述】
	    DataSource，有效调用前插入与列名相同的InputField

		【编码描述】
		1、初始化控件及Datastore数据，InputFieldVisibleName=false，在控件中插入与列名相同的InputField
		2、有效调用DataSource
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		被插入的InputField将显示为对应的数据
	*/
		
		if ab_exe then
			ids_dw.Retrieve()
			rte_1.InputFieldsVisible = false
			rte_1.InputFieldInsert('emp_id')
			li_RtnVal = rte_1.DataSource(ids_dw)
			wf_OutPut("FunReturn: rte_1.DataSource(ids_dw)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW20P05'
	/*
	   【功能描述】
	    DataSource，有效调用后修改DS中数据的影响

		【编码描述】
		1、初始化控件及Datastore数据，InputFieldVisibleName=false，在控件中插入与列名相同的InputField
		2、有效调用DataSource，再修改DS中第一行相应的数据
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		控件中没有刷新
	*/
		
		if ab_exe then
			ids_dw.Retrieve()
			rte_1.InputFieldsVisible = false
			rte_1.InputFieldInsert('emp_id')
			li_RtnVal = rte_1.DataSource(ids_dw)
			ids_dw.SetItem(1,'emp_name','WuZhiJun')
			wf_OutPut("FunReturn: rte_1.DataSource(ids_dw)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW20P06'
	/*
	   【功能描述】
	    DataSource，有效调用后删除DS中数据的影响

		【编码描述】
		1、初始化控件及Datastore数据，InputFieldVisibleName=false，在控件中插入与列名相同的InputField
		2、有效调用DataSource，再删除DS中第一行相应的数据
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		控件中没有刷新
	*/
		
		if ab_exe then
			ids_dw.Retrieve()
			rte_1.InputFieldsVisible = false
			rte_1.InputFieldInsert('emp_id')
			li_RtnVal = rte_1.DataSource(ids_dw)
			ids_dw.DeleteRow(1)
			wf_OutPut("FunReturn: rte_1.DataSource(ids_dw)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW20P07'
	/*
	   【功能描述】
	    DataSource，有效调用后增加DS中数据的影响

		【编码描述】
		1、初始化控件及Datastore数据，InputFieldVisibleName=false，在控件中插入与列名相同的InputField
		2、有效调用DataSource，再在DS中第一行前增加一行的数据
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		控件中没有刷新
	*/
		
		if ab_exe then
			ids_dw.Retrieve()
			rte_1.InputFieldsVisible = false
			rte_1.InputFieldInsert('emp_id')
			li_RtnVal = rte_1.DataSource(ids_dw)
			ids_dw.InsertRow(1)
			wf_OutPut("FunReturn: rte_1.DataSource(ids_dw)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW20P08'
	/*
	   【功能描述】
	    DataSource，有效调用后修改DS中数据，再刷新控件

		【编码描述】
		1、初始化控件及Datastore数据，InputFieldVisibleName=false，在控件中插入与列名相同的InputField
		2、有效调用DataSource，再修改DS中第一行相应的数据
		3、再调用ScrollNextRow，ScrollPriorRow函数刷新
		4、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		控件中数据也相应变化了
	*/
		
		if ab_exe then
			ids_dw.Retrieve()
			rte_1.InputFieldsVisible = false
			rte_1.InputFieldInsert('emp_id')
			li_RtnVal = rte_1.DataSource(ids_dw)
			ids_dw.SetItem(1,'emp_name','WuZhiJun')
			rte_1.ScrollNextRow()
			rte_1.ScrollPriorRow()
			wf_OutPut("FunReturn: rte_1.DataSource(ids_dw)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW20P09'
	/*
	   【功能描述】
	    DataSource，有效调用后删除DS中数据，再刷新控件

		【编码描述】
		1、初始化控件及Datastore数据，InputFieldVisibleName=false，在控件中插入与列名相同的InputField
		2、有效调用DataSource，再删除DS中第一行相应的数据
		3、调用ScrollNextRow、ScrollpriorRow刷新控件
		4、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		控件中不再显示为被删除的数据
	*/
		
		if ab_exe then
			ids_dw.Retrieve()
			rte_1.InputFieldsVisible = false
			rte_1.InputFieldInsert('emp_id')
			li_RtnVal = rte_1.DataSource(ids_dw)
			ids_dw.DeleteRow(1)
			rte_1.ScrollNextRow()
			rte_1.ScrollPriorRow()
			wf_OutPut("FunReturn: rte_1.DataSource(ids_dw)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW20P10'
	/*
	   【功能描述】
	    DataSource，有效调用后增加DS中数据，再刷新控件

		【编码描述】
		1、初始化控件及Datastore数据，InputFieldVisibleName=false，在控件中插入与列名相同的InputField
		2、有效调用DataSource，再在DS中第一行前增加一行的数据
		3、再调用ScrollPriorRow刷新控件
		4、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		控件显示新增的数据
	*/
		
		if ab_exe then
			ids_dw.Retrieve()
			rte_1.InputFieldsVisible = false
			rte_1.InputFieldInsert('emp_id')
			li_RtnVal = rte_1.DataSource(ids_dw)
			ids_dw.InsertRow(1)
			rte_1.ScrollPriorRow()
			wf_OutPut("FunReturn: rte_1.DataSource(ids_dw)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW20P11'
	/*
	   【功能描述】
	    DataSource，重复插入与列名相同的InputField

		【编码描述】
		1、初始化控件及Datastore数据，InputFieldVisibleName=false
		2、有效调用DataSource，再在控件中重复插入与列名相同的InputField
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		重复的InputField数据相同
	*/
		
		if ab_exe then
			ids_dw.Retrieve()
			rte_1.InputFieldsVisible = false
			li_RtnVal = rte_1.DataSource(ids_dw)
			rte_1.InputFieldInsert('emp_id')
			rte_1.InputFieldInsert('emp_id')
			wf_OutPut("FunReturn: rte_1.DataSource(ids_dw)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW20P12'
	/*
	   【功能描述】
	    DataSource，Reset数据源

		【编码描述】
		1、初始化控件及Datastore数据，InputFieldVisibleName=false
		2、有效调用DataSource，再在控件中插入与列名相同的InputField，再Reset Datastore数据
		3、调用ScrollNextPage，ScrollNextRow，ScrollPriorPage，ScrollPriorRow等函数
		4、输出各函数返回值

		【代码输出值描述】
		ScrollNextPage，ScrollNextRow，ScrollPriorPage，ScrollPriorRow等函数返回0
		
		【期望UI描述】
		与列名相同的各InputField保留Reset前的数据
	*/
		
		if ab_exe then
			ids_dw.Retrieve()
			rte_1.InputFieldsVisible = false
			li_RtnVal = rte_1.DataSource(ids_dw)
			rte_1.InputFieldInsert('emp_id')
			ids_dw.Reset()
			li_Val1 = rte_1.ScrollNextPage()
			li_Val2 = rte_1.ScrollNextRow()
			li_Val3 = rte_1.ScrollPriorPage()
			li_Val4 = rte_1.ScrollPriorRow()
			wf_OutPut("FunReturn: rte_1.DataSource(ids_dw)=" + String(li_RtnVal),true)
			wf_OutPut("VarReturn: li_Val1=" + String(li_Val1),false)
			wf_OutPut("VarReturn: li_Val2=" + String(li_Val2),false)
			wf_OutPut("VarReturn: li_Val3=" + String(li_Val3),false)
			wf_OutPut("VarReturn: li_Val4=" + String(li_Val4),false)
		else
		end if
	Case 'RTEFUNW20P13'
	/*
	   【功能描述】
	    DataSource，数据源是DataWindow

		【编码描述】
		1、初始化控件及Datawindow数据，InputFieldVisibleName=false
		2、有效调用DataSource，再在控件中插入与列名相同的InputField
		3、输出各函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			dw_1.Retrieve()
			rte_1.InputFieldsVisible = false
			li_RtnVal = rte_1.DataSource(dw_1)
			rte_1.InputFieldInsert('emp_id')
			wf_OutPut("FunReturn: rte_1.DataSource(ids_dw)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW20P14'
	/*
	   【功能描述】
	    DataSource，数据源是Datawindowchild

		【编码描述】
		1、初始化控件及Datawindowchild数据，InputFieldVisibleName=false
		2、有效调用DataSource，再在控件中插入与列名相同的InputField
		3、输出各函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			idw_Child.Retrieve()
			rte_1.InputFieldsVisible = false
			li_RtnVal = rte_1.DataSource(idw_Child)
			rte_1.InputFieldInsert('emp_id')
			wf_OutPut("FunReturn: rte_1.DataSource(idw_Child)=" + String(li_RtnVal),true)
		else
		end if
End Choose
if ab_exe then
	wf_postrun(al_row)
end if


end event

event close;call super::close;Destroy ids_dw

if FileExists("PUB_BMP_APB.bmp") then
	FileDelete("PUB_BMP_APB.bmp")
end if

end event

event open;call super::open;ids_dw = Create DataStore
n_cst_config  lnv_res


is_Syntax = Gtr_Sqlserver.SyntaxFromSQL(is_Sql,'Style(Type=grid)',is_Error)

//clipboard(is_Syntax)
//messagebox('',is_Syntax)
if ids_dw.Create(is_Syntax,is_Error) = -1 then
	messagebox("提示信息","生成数据对象失败")
end if

ids_dw.SetTransObject(Gtr_Sqlserver)
ids_dw.Retrieve()

dw_1.Create(is_Syntax,is_Error)
dw_1.SetTransObject(Gtr_Sqlserver)
dw_1.Retrieve()

dw_1.GetChild('emp_name',idw_Child)
idw_Child.SetTransObject(Gtr_Sqlserver)
idw_Child.Retrieve()


if not lnv_res.of_createFile("PUB_BMP_APB.bmp",gtr_frame) then
	messagebox("提示信息","下载图片失败")
end if






end event

type mle_phenomena from w_templet`mle_phenomena within w_rtefunw20
end type

type cb_autoparse from w_templet`cb_autoparse within w_rtefunw20
end type

type cb_wrrun from w_templet`cb_wrrun within w_rtefunw20
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rtefunw20
end type

type dw_info from w_templet`dw_info within w_rtefunw20
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rtefunw20
end type

type pb_runnext from w_templet`pb_runnext within w_rtefunw20
end type

type pb_runall from w_templet`pb_runall within w_rtefunw20
end type

type pb_run from w_templet`pb_run within w_rtefunw20
end type

type pb_end from w_templet`pb_end within w_rtefunw20
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rtefunw20
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rtefunw20
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rtefunw20
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rtefunw20
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rtefunw20
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rtefunw20
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rtefunw20
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rtefunw20
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rtefunw20
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rtefunw20
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rtefunw20
end type

type rte_1 from richtextedit within w_rtefunw20
integer x = 27
integer y = 32
integer width = 1541
integer height = 1288
integer taborder = 10
boolean bringtotop = true
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_headerfooter = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_rtefunw20
integer x = 1595
integer y = 32
integer width = 1362
integer height = 1288
integer taborder = 70
boolean bringtotop = true
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

