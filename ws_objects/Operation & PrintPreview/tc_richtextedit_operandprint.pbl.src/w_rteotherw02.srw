$PBExportHeader$w_rteotherw02.srw
forward
global type w_rteotherw02 from w_templet
end type
type rte_2 from richtextedit within w_rteotherw02
end type
type cb_1 from commandbutton within w_rteotherw02
end type
type cb_2 from commandbutton within w_rteotherw02
end type
type cb_3 from commandbutton within w_rteotherw02
end type
type rte_1 from richtextedit within w_rteotherw02
end type
end forward

global type w_rteotherw02 from w_templet
string title = "02-PrintPreview"
rte_2 rte_2
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
rte_1 rte_1
end type
global w_rteotherw02 w_rteotherw02

type variables
String is_data = "Please read the PowerBuilder Enterprise Installation Guide for ~r~n" +&
"detailed information about installing the product set. This book is ~r~n"+&
"available online at http://sybooks.sybase.com/. If you are installing~r~n"+&
"an upgrade version of a product set, please read Section II, Upgrade~r~n"+&
"Information, before running the Setup program.~r~n"+&
"~r~n"+&
"This section highlights some installation requirements and issues and~r~n"+&
"contains additional installation notes.~r~n"+&
"~r~n"+&
"Tools included in PowerBuilder Enterprise~r~n"+&
"-----------------------------------------~r~n"+&
"PowerBuilder Enterprise 8.0 contains the following products:~r~n"+&
"~r~n"+&
"PowerBuilder 8.0 (Build 6028)~r~n"+&
"Jaguar 3.6.1 (Build 36108 plus some additional fixes)~r~n"+&
"PowerDynamo 3.5.2 (no build number)~r~n"+&
"Adaptive Server Anywhere 7.0.1 (Build 918)~r~n"+&
"Sybase Online Books Version 4.1~r~n"+&
"InfoMaker 8.0 (Build 6028)~r~n"+&
"~r~n"+&
"Important note for PowerJ users~r~n"+&
"-------------------------------~r~n"+&
"If you are a PowerJ user, Sybase recommends that you do not install ~r~n"+&
"the Jaguar 3.6.1 build distributed with this release. This build has~r~n"+&
"not been certified for use with PowerJ and may cause loss of PowerJ~r~n"+&
"functionality. This incompatibility will be addressed in an upcoming~r~n"+&
"consolidated EBF release. The Jaguar 3.6.1 build distributed with the~r~n"+&
"EAServer 3.6.1 C1 release provides full support for PowerBuilder 8 ~r~n"+&
"with the exception of the following fixes:~r~n"+&
"~r~n"+&
"CR 232684: The first PowerBuilder 8 component deployed to EAServer may not ~r~n" +&
"deploy successfully. No errors are reported during deployment, but ~r~n" +&
"attempting to generate proxy objects fails. Redeploying the component~r~n" +&
"fixes this problem.~r~n"+&
"~r~n"+&
"CR 234360: The Jaguar client runtime does not include the ~r~n"+&
"PowerBuilder 8 Web DataWindow component stub classes. As a result, ~r~n"+&
"if you have only the Jaguar client runtime installed on the computer ~r~n"+&
"where PowerDynamo is running, you may not be able to run Web~r~n"+&
"DataWindows. The workaround is to copy the required classes manually ~r~n"+&
"to the PowerDynamo computer so that they can be found at run time.~r~n"+&
"~r~n"+&
"CR 238509: The Jaguar server classpath must be modified to use the ~r~n"+&
"new PowerBuilder JDBC database interface.~r~n"+&
"~r~n"+&
"Adaptive Server Anywhere version~r~n"+&
"-------------------------------~r~n"+&
"This release includes Adaptive Server Anywhere 7.0.1. If you have ~r~n"+&
"already installed a later version of Adaptive Server Anywhere, do not~r~n "+&
"install Adaptive Server Anywhere 7.0.1 from this CD. ~r~n"+&
"~r~n"+&
"Supported operating systems~r~n"+&
"---------------------------~r~n"+&
"This release has been tested on Windows 98, Windows 2000 with service ~r~n"+&
"pack 1, and Windows NT 4.x with service pack 6a. These are the ~r~n"+&
"supported operating systems for both development and deployment.~r~n"+&
"~r~n"+&
"Required software~r~n"+&
"-----------------~r~n"+&
"If you want to use Web targets in PowerBuilder, you must have ~r~n"+&
"Microsoft Internet Explorer 5.5 installed on the development computer ~r~n"+&
"before you run the Setup program. For your convenience, a self-~r~n"+&
"extracting executable for Internet Explorer 5.5 is provided in the ~r~n"+&
"Support directory on the CD.~r~n"+&
"~r~n"+&
"NOTE: The Microsoft Java VM must be installed on your computer if you ~r~n"+&
"want to use Java applets and JavaBeans components in your Web pages.~r~n "+&
"The VM is not installed if you use the typical setup for Internet~r~n "+&
"Explorer 5.5. To install it, run the custom setup for Internet~r~n "+&
"Explorer 5.5 and select the Microsoft VM.~r~n"+&
"~r~n"+&
"Adaptive Server Anywhere (ASA) 7.0.1 is also required for Web target~r~n"+&
"development. You can select Adaptive Server Anywhere 7.0.1 from the~r~n"+&
"Select Components page in the Setup program. ~r~n"+&
"~r~n"+&
"If Internet Explorer 5.5 and Adaptive Server Anywhere 7.0.1 are not ~r~n"+&
"both installed on your system, you will not be able to use Web targets~r~n"+&
"functionality. If the installation program cannot detect Internet ~r~n"+&
"Explorer 5.5 on your system, or if it cannot detect ASA 7.0.1 and~r~n"+&
"you have not selected ASA in the common install, you will receive a ~r~n"+&
"warning. If you choose to continue, the installation will disable~r~n"+&
"Web targets functionality. If you want to use Web targets at a later~r~n"+&
"date, you will need to reinstall PowerBuilder 8.~r~n"+&
"~r~n"+&
"Note that if you already have Internet Explorer 5.5 and ASA 7.0.1 on ~r~n"+&
"your system and you do not want the Web targets functionality enabled,~r~n"+&
"you must do a custom installation of PowerBuilder 8.  ~r~n"+&
"~r~n"+&
"Adaptive Server Anywhere is also required if you want to use the ~r~n"+&
"EAS Demo database or PowerBuilder sample applications. If you do not ~r~n"+&
"have any version of ASA installed, you will see a message during the ~r~n"+&
"Jaguar CTS 3.6.1 installation that ASA 6.0 is not installed. Unless~r~n"+&
"you want to use the samples, you can ignore this message.~r~n"+&
"~r~n"+&
"If you plan to migrate data from a PowerSite component manager~r~n"+&
"database, do not uninstall Adaptive Server Anywhere 6 before ~r~n"+&
"installing Adaptive Server Anywhere 7.0.1 (but install ASA 7.0.1 in a ~r~n"+&
"separate directory). See ~"Migrating PowerSite projects~" in the ~r~n"+&
"PowerBuilder readme file.~r~n"+&
"~r~n"+&
"Optional software~r~n"+&
"-----------------~r~n"+&
"Particular PowerBuilder features require installation of additional ~r~n"+&
"tools.~r~n"

end variables

on w_rteotherw02.create
int iCurrent
call super::create
this.rte_2=create rte_2
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_3
this.Control[iCurrent+5]=this.rte_1
end on

on w_rteotherw02.destroy
call super::destroy
destroy(this.rte_2)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 

***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Operation & PrintPreview\02-PrintPreview 
Pbl Name:     
Designer:     ouyangwu
Coder:        ouyangwu 2005-06-28
DocReviewer:  
CoderReviewer:
【功能描述】

【窗口对象】

【编码注意事项】

【测试注意事项】
 
***********************/
if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return 
rte_1.SetRedraw(false)
rte_2.SetRedraw(false)
rte_1.visible=true
rte_2.visible=true
rte_1.SetFocus()
rte_1.preview(false)
rte_1.selecttextall( )
rte_1.Clear()
rte_1.Replacetext( "Appeon~tRichText~tControl~r~n ")
rte_1.insertpicture("PUB_BMP_APB.bmp" )
rte_1.inputfieldinsert( "Field" )
rte_1.inputfieldchangedata( "Field", "This is InputField")
rte_1.Replacetext(" ~r~n ")
rte_1.Replacetext(is_data)
rte_1.SelectText(1,1,0,0)
rte_2.SetFocus()
rte_2.preview(false)
rte_2.selecttextall( )
rte_2.Clear()
rte_2.Replacetext( "Appeon  RichText Control~r~n ")
rte_2.insertpicture("PUB_BMP_APB.bmp" )
rte_2.inputfieldinsert( "Field" )
rte_2.inputfieldchangedata( "Field", "This is InputField")
rte_1.Replacetext(" ~r~n ")
rte_2.Replacetext(is_data)
rte_2.SelectText(1,1,0,0)
rte_2.visible=false
rte_1.SetRedraw(true)
rte_2.SetRedraw(true)
Choose Case as_testpoint
	Case 'RTEOTHERW02P01'
	/*
	   【功能描述】
	    预览界面的操作

		【编码描述】
		1、初始化控件，headerfooter静态设置为true,在PrintHeader和PrintFooter事件中写入信息输出代码，构建两页数据内容
		2、headerfooter为true,设置控件处于预览状态
		

		【代码输出值描述】
		【期望UI描述】
		边距设置时：
		设置为负数时取绝对值
		设置绝对值大于纸张大小的都将自动恢复为上一次的值
		设置为有效值时预览界面将发生变化
		设置预览页数时：
		输入负数或0则转到第一页数据
		大于总页数的值则转到最后一页数据
	*/
		
		if ab_exe then
			rte_1.preview(true)
		else
		end if
	Case 'RTEOTHERW02P02'
	/*
	   【功能描述】
	    headerFooter为false时预览界面下的设置是否触发Printheader/printfooter事件

		【编码描述】
		1、初始化控件，headerfooter静态设置为false,在PrintHeader和PrintFooter事件中写入信息输出代码，构建两页数据内容
		2、设置控件处于预览状态
		

		【代码输出值描述】
		
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_2.visible=true
			rte_1.visible=false
			rte_1.preview(true)
		else
		end if
	Case 'RTEOTHERW02P03'
	/*
	   【功能描述】
	    预览时取打印机缺省纸张大小

		【编码描述】
		1、初始化控件及内容
		2、调用PrintSetup进行纸张设置
		3、预览控件
		4、打印控件内容
		

		【代码输出值描述】
		
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_2.visible=true
			rte_1.visible=false
			IF PrintSetup()=1 THEN
				rte_2.preview(true)
				rte_2.print( 1,"", True, false)
			END IF
		else
			
		end if
	Case 'RTEOTHERW02P04'
	/*
	   【功能描述】
	    预览时页纸宽度不够时，数据内容将被截取掉

		【编码描述】
		1、初始化控件及内容
		2、调用PrintSetup进行纸张设置
		3、预览控件
		4、打印控件内容
		

		【代码输出值描述】
		
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SetFocus()
			rte_1.preview(false)
			rte_1.selecttextall()
			rte_1.Clear()
			String ls_data = "Please read the PowerBuilder Enterprise Installation Guide for Please read the PowerBuilder Enterprise Installation Guide for Please read the PowerBuilder Enterprise Installation Guide for Please read the PowerBuilder Enterprise Installation Guide for Please read the PowerBuilder Enterprise Installation Guide for Please read the PowerBuilder Enterprise Installation Guide for "
			rte_1.ReplaceText(ls_data)
			rte_1.preview(true)
		else
		
		end if
	Case 'RTEOTHERW02P05'
	/*
	   【功能描述】
	    预览时页纸宽度不够内容超过时，右边距设置将变得无效

		【编码描述】
		1、初始化控件及内容
		3、预览控件
		
		

		【代码输出值描述】
		
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SetFocus()
			rte_1.preview(false)
			rte_1.selecttextall()
			rte_1.Clear()
			String ls_data5 = "Please read the PowerBuilder Enterprise Installation Guide for Please read the PowerBuilder Enterprise Installation Guide for Please read the PowerBuilder Enterprise Installation Guide for Please read the PowerBuilder Enterprise Installation Guide for Please read the PowerBuilder Enterprise Installation Guide for Please read the PowerBuilder Enterprise Installation Guide for "
			rte_1.ReplaceText(ls_data5)
			rte_1.rightmargin = 1000
			rte_1.preview(true)
		else
		end if
	Case 'RTEOTHERW02P06'
	/*
	   【功能描述】
	    设置Tab、Space、Enter字符可视时，是否对打印预览有影响

		【编码描述】
		1、初始化控件，构建两页数据内容
		2、设置Tab、Space、Enter字符可视，设置控件处于预览状态
		3、打印控件内容

		【代码输出值描述】
		
		
		
		【期望UI描述】
		正常打印，Tab、Space、Enter可视字符不打印
	*/
		
		if ab_exe then
			rte_2.visible=true
			rte_1.visible=false

			rte_2.tabsvisible = true
			rte_2.spacesvisible = true
			rte_2.returnsvisible = true
			rte_2.preview(true)
			rte_2.print( 1,"", false, false)
		else
		end if
	Case 'RTEOTHERW02P07'
	/*
	   【功能描述】
	    InputFieldNamesVisible为true时，是否对打印预览有影响

		【编码描述】
		1、初始化控件，InputFieldNamesVisible为true，构建两页数据内容以及InputField内容
		2、打印控件内容
		3、设置控件处于预览状态
		

		【代码输出值描述】
		
		
		
		【期望UI描述】
		InputField内容正常打印
	*/
		
		if ab_exe then
			rte_2.visible=true
			rte_1.visible=false
			rte_1.InputFieldNamesVisible = true
			rte_1.print( 1,"", false, false)
			rte_1.preview(true)
		else
		end if
	Case 'RTEOTHERW02P08'
	/*
	   【功能描述】
	    Preview预览时，触发PrintHeader/printFooter事件

		【编码描述】
		1、初始化控件，在PrintHeader/printFooter事件中写入信息输出代码，构建一页内容
		2、调用Preview函数预览控件
		
		

		【代码输出值描述】
		PrintHeader/printFooter事件被触发
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.SetFocus()
			rte_1.preview(false)
			rte_1.selecttextall()
			rte_1.Clear()
			String ls_data8 = "Please read the PowerBuilder Enterprise Installation Guide for"
			rte_1.ReplaceText(ls_data8)
			rte_1.preview(true)		
		else
		end if
	Case 'RTEOTHERW02P09'
	/*
	   【功能描述】
	    预览界面设置页边距后获取各页边距属性

		【编码描述】
		1、初始化控件，构建两页内容
		2、调用Preview函数预览控件
		3、输出各页边距属性
		4、窗口上需要放置获取各页边距属性按钮，放置打印按钮
		
		

		【代码输出值描述】
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.preview(true)
		else
		end if
	Case 'RTEOTHERW02P10'
	/*
	   【功能描述】
	    预览界面设置页边距再返回编辑界面后获取各页边距属性

		【编码描述】
		1、初始化控件，构建两页内容
		2、调用Preview函数预览控件
		3、输出各页边距属性
		4、窗口上需要放置获取各页边距属性按钮，放置切换编辑界面按钮
		

		【代码输出值描述】
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.preview(true)
		else
		end if
	Case 'RTEOTHERW02P11'
	/*
	   【功能描述】
	    预览界面时动态设置页边距属性值

		【编码描述】
		1、初始化控件，在PrintHeader/PrintFooter事件中写入信息输出代码，构建两页内容
		2、调用Preview函数预览控件
		3、动态修改各页边距属性值
		4、输出页边距属性值
		

		【代码输出值描述】
		
		【期望UI描述】
		设置页边距属性值不会对预览界面产生影响，UI无变化
	*/
		
		if ab_exe then
			rte_1.preview(true)
			rte_1.LeftMargin = 1000
			rte_1.RightMargin = 500
			rte_1.topMargin = 1000
			rte_1.bottomMargin = 1000
			wf_output("ProReturn:rte_1.LeftMargin="+String(rte_1.LeftMargin),true)
			wf_output("ProReturn:rte_1.RightMargin="+String(rte_1.RightMargin),false)
			wf_output("ProReturn:rte_1.TopMargin="+String(rte_1.TopMargin),false)
			wf_output("ProReturn:rte_1.BottomMargin="+String(rte_1.BottomMargin),false)
		else
		end if
	Case 'RTEOTHERW02P12'
	/*
	   【功能描述】
	    Print打印控件本身

		【编码描述】
		1、初始化控件，构建数据内容
		2、调用Print ( printjobnumber, x, y {, width, height } )函数打印控件
		3、输出函数返回值
		

		【代码输出值描述】
		1
		【期望UI描述】
		
	*/
		
		if ab_exe then
			Long ll_jobnum,li_rtn
			ll_jobnum = printopen()
			li_rtn = rte_1.print( ll_jobnum, 1, 1)
			PrintClose(ll_jobnum)
			wf_output('VarReturn:'+String(li_rtn),true)
		else
		end if
End Choose
if ab_exe then
	wf_postrun(al_row)
end if
end event

event open;call super::open;rte_2.visible=false
n_cst_config  lnv_res


if not lnv_res.of_createfile("PUB_BMP_APB.bmp",gtr_frame) then
	messagebox("提示信息","下载图片失败")
end if



end event

event close;call super::close;
if FileExists("PUB_BMP_APB.bmp") then
	FileDelete("PUB_BMP_APB.bmp")
end if
end event

type mle_phenomena from w_templet`mle_phenomena within w_rteotherw02
end type

type cb_autoparse from w_templet`cb_autoparse within w_rteotherw02
end type

type cb_wrrun from w_templet`cb_wrrun within w_rteotherw02
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rteotherw02
end type

type dw_info from w_templet`dw_info within w_rteotherw02
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rteotherw02
end type

type pb_runnext from w_templet`pb_runnext within w_rteotherw02
end type

type pb_runall from w_templet`pb_runall within w_rteotherw02
end type

type pb_run from w_templet`pb_run within w_rteotherw02
end type

type pb_end from w_templet`pb_end within w_rteotherw02
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rteotherw02
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rteotherw02
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rteotherw02
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rteotherw02
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rteotherw02
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rteotherw02
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rteotherw02
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rteotherw02
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rteotherw02
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rteotherw02
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rteotherw02
end type

type rte_2 from richtextedit within w_rteotherw02
integer x = 14
integer y = 28
integer width = 2926
integer height = 1284
integer taborder = 10
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_wordwrap = true
boolean init_rulerbar = true
boolean init_tabbar = true
boolean init_toolbar = true
borderstyle borderstyle = stylelowered!
end type

event printfooter;wf_output('EveReturn:PrintFooter('+String(currentpage)+','+String(totalpages)+','+String(currentrow)+')',false)
end event

event printheader;wf_output('EveReturn:PrintHeader('+String(currentpage)+','+String(totalpages)+','+String(currentrow)+')',false)
end event

type cb_1 from commandbutton within w_rteotherw02
integer x = 1742
integer y = 2160
integer width = 384
integer height = 108
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "宋体"
string text = "Preview"
end type

event clicked;IF rte_1.ispreview( ) THEN
	rte_1.preview(false)
ELSE
	rte_1.preview(true)
END IF
end event

type cb_2 from commandbutton within w_rteotherw02
integer x = 2139
integer y = 2160
integer width = 384
integer height = 108
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "宋体"
string text = "Print"
end type

event clicked;rte_1.print( 1,"", false, false)
end event

type cb_3 from commandbutton within w_rteotherw02
integer x = 2537
integer y = 2160
integer width = 384
integer height = 108
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "宋体"
string text = "Get Margin"
end type

event clicked;wf_output("ProReturn:rte_1.LeftMargin="+String(rte_1.LeftMargin),true)
wf_output("ProReturn:rte_1.RightMargin="+String(rte_1.RightMargin),false)
wf_output("ProReturn:rte_1.TopMargin="+String(rte_1.TopMargin),false)
wf_output("ProReturn:rte_1.BottomMargin="+String(rte_1.BottomMargin),false)
end event

type rte_1 from richtextedit within w_rteotherw02
integer x = 14
integer y = 28
integer width = 2926
integer height = 1284
integer taborder = 70
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_rulerbar = true
boolean init_tabbar = true
boolean init_toolbar = true
boolean init_headerfooter = true
borderstyle borderstyle = stylelowered!
end type

event printfooter;wf_output('EveReturn:PrintFooter('+String(currentpage)+','+String(totalpages)+','+String(currentrow)+')',false)
return 1
end event

event printheader;wf_output('EveReturn:PrintHeader('+String(currentpage)+','+String(totalpages)+','+String(currentrow)+')',false)
return 1
end event

