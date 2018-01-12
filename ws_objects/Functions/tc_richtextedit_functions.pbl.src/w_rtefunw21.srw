$PBExportHeader$w_rtefunw21.srw
forward
global type w_rtefunw21 from w_templet
end type
type rte_1 from richtextedit within w_rtefunw21
end type
end forward

global type w_rtefunw21 from w_templet
string title = "21-Format Effect Functions"
rte_1 rte_1
end type
global w_rtefunw21 w_rtefunw21

forward prototypes
public subroutine wf_data_init (richtextedit ar_rich, integer ai_sign, band ab_band)
public subroutine wf_setparagraph ()
public subroutine wf_settextformat ()
end prototypes

public subroutine wf_data_init (richtextedit ar_rich, integer ai_sign, band ab_band);//==================================================================================
// Function: wf_data_init()
//--------------------------------------------------------------------------------------------------------------------------------------------------
// Arguments:  Richtextedit   ar_rich
//             Integer  		ai_sign  --  1为英文，2为中文，3中英文，4为英文图片，5中文图片，6中英文图片，7图片
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
			ls_english = 'About this Appeon for PowerBuilder Help: ~r~nThis HTML help contains the HTML version of several Appeon 3.0 user documents: ~r~nWorking with Appeon Developer is the HTML version of the Appeon Developer User Guide; ~r~nAppeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; ~r~nAppeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.~r~n'
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

rte_1.SelectTextALL()
rte_1.SetParagraphSetting ( Indent! , 0 )
rte_1.SetParagraphSetting ( LeftMargin!  , 0 )
rte_1.SetParagraphSetting ( RightMargin!  , 0 )
rte_1.selecttext(1,1,0,0)
end subroutine

public subroutine wf_setparagraph ();//
rte_1.SelectTextALL()
rte_1.SetParagraphSetting ( Indent! , 500 )
rte_1.SetParagraphSetting ( LeftMargin!  , 500 )
rte_1.SetParagraphSetting ( RightMargin!  , 800 )
rte_1.selecttext(1,1,0,0)
end subroutine

public subroutine wf_settextformat ();//
rte_1.SelectTextALL()


rte_1.SetParagraphSetting ( Indent! , 0 )
rte_1.SetParagraphSetting ( LeftMargin!  , 0 )
rte_1.SetParagraphSetting ( RightMargin!  , 0 )

rte_1.Settextstyle( true, true, true, true, true, true)

rte_1.SelectText(1,1,1,5)
rte_1.SetAlignment ( Center!  )

rte_1.SelectText(2,1,2,5)
rte_1.SetAlignment ( Right!   )

rte_1.SelectText(3,1,3,5)
rte_1.SetAlignment (  Left!  )

rte_1.SelectText(4,1,4,5)
rte_1.SetAlignment ( Justify!   )

rte_1.SelectText(1,1,0,0)
end subroutine

on w_rtefunw21.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rtefunw21.destroy
call super::destroy
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 
将控件内容成功保存到一个文档后或新打开文档后，Modified属性值变为false
***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Functions\21-Format Effect Functions 
Pbl Name:     tc_objrichtextedit01.pbl
Designer:     ouyangwu
Coder:        ouyangwu 2005-07-27
DocReviewer:  
CoderReviewer:
【功能描述】
测试控件内容的各种格式对函数的影响

【窗口对象】

【编码注意事项】

【测试注意事项】
 
***********************/
if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return 
integer li_rtn
Choose Case as_testpoint
	Case 'RTEFUNW21P01'
	/*
	   【功能描述】
	    测试Text格式对COPY函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、选种含格式的Text内容，调用Copy函数
		3、输出函数返回值

		1、函数返回COPY的字符数
	*/
		
		if ab_exe then
			rte_1.selecttext(1,5,1,20)
			wf_output('FunReturn:rte_1.copy()='+String(rte_1.copy()),true)
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
		end if
	Case 'RTEFUNW21P02'
	/*
	   【功能描述】
	    测试段落格式对COPY函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、选种含段落格式的Text内容，调用Copy函数
		3、输出函数返回值

		1、函数返回COPY的字符数
	*/
		
		if ab_exe then
			rte_1.selecttext(1,5,4,20)
			wf_output('FunReturn:rte_1.copy()='+String(rte_1.copy()),true)
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
			wf_setparagraph()
		end if
	Case 'RTEFUNW21P03'
	/*
	   【功能描述】
	    测试Text格式对clear函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、选种含格式的Text内容，调用clear函数
		3、输出函数返回值

		1、函数返回clear的字符数
	*/
		
		if ab_exe then
			rte_1.selecttext(1,5,1,20)
			wf_output('FunReturn:rte_1.clear()='+String(rte_1.clear()),true)
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
		end if
	Case 'RTEFUNW21P04'
	/*
	   【功能描述】
	    测试段落格式对clear函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、选种含段落格式的Text内容，调用clear函数
		3、输出函数返回值

		1、函数返回clear的字符数
	*/
		
		if ab_exe then
			rte_1.selecttext(1,5,4,20)
			wf_output('FunReturn:rte_1.clear()='+String(rte_1.clear()),true)
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
			wf_setparagraph()
		end if
	Case 'RTEFUNW21P05'
	/*
	   【功能描述】
	    测试Text格式对Paste函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、选中全部有格式的Text内容，调用Paste函数
		3、输出函数返回值

		1、函数返回Paste的字符数
	*/
		
		if ab_exe then
			rte_1.selecttext(1,5,1,25)
			rte_1.settextstyle( true,true,true, true,true, true)
			rte_1.selecttext(1, 10, 1, 20)
			Clipboard("Sybase")
			wf_output('FunReturn:rte_1.Paste()='+String(rte_1.Paste()),true)
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
		end if
	Case 'RTEFUNW21P06'
	/*
	   【功能描述】
	    测试段落格式对Paste函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、选中含段落格式的Text内容，调用Paste函数
		3、输出函数返回值

		1、函数返回Paste的字符数
	*/
		
		if ab_exe then
			rte_1.selecttext(1,5,4,20)
			rte_1.copy()
			rte_1.SelectTextALL()
			rte_1.Settextstyle( false, false, false, false, false, false)
			rte_1.selecttext(1,5,4,20)
			wf_output('FunReturn:rte_1.Paste()='+String(rte_1.Paste()),true)
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
			wf_setparagraph()
		end if
	Case 'RTEFUNW21P07'
	/*
	   【功能描述】
	    测试Text格式对PasteRTF函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、选种含格式的Text内容，调用PasteRTF函数
		3、输出函数返回值

		1、函数返回PasteRTF的字符数
	*/
		
		if ab_exe then
			String ls_rtf7
			rte_1.selecttext(1,5,1,20)
			rte_1.SetTextStyle(false,false,false,true,true,true)
			ls_rtf7 = rte_1.copyrtf(TRUE)
			wf_settextformat()
			rte_1.selecttext(1,5,1,20)
			wf_output('FunReturn:rte_1.PasteRTF(ls_rtf7)='+String(rte_1.PasteRTF(ls_rtf7)),true)
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
		end if
	Case 'RTEFUNW21P08'
	/*
	   【功能描述】
	    测试段落格式对PasteRTF函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、选种含段落格式的Text内容，调用PasteRTF函数
		3、输出函数返回值

		1、函数返回PasteRTF的字符数
	*/
		
		if ab_exe then
			String ls_rtf8
			rte_1.selecttext(1,5,3,20)
			ls_rtf8 = rte_1.copyrtf(TRUE)
			wf_setparagraph()
			rte_1.selecttext(1,5,3,20)
			wf_output('FunReturn:rte_1.PasteRTF(ls_rtf8)='+String(rte_1.PasteRTF(ls_rtf8)),true)
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
		end if
	Case 'RTEFUNW21P09'
	/*
	   【功能描述】
	    测试Text格式对Print函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、调用Print函数
		3、输出函数返回值

		1、函数返回1，打印正常
	*/
		
		if ab_exe then
			wf_output("FunReturn:rte_1.Print(1,'',true,true)="+String(rte_1.Print(1,'',true,true)),true)
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
		end if
	Case 'RTEFUNW21P10'
	/*
	   【功能描述】
	    测试段落格式对Print函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、调用Print函数
		3、输出函数返回值

		1、函数返回1，打印正常
	*/
		
		if ab_exe then
			wf_output("FunReturn:rte_1.Print(1,'',true,true)="+String(rte_1.Print(1,'',true,true)),true)
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
			wf_setparagraph()
		end if
	Case 'RTEFUNW21P11'
	/*
	   【功能描述】
	    测试Text格式对ReplaceText函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、选种含格式的Text内容，调用ReplaceText函数
		3、输出函数返回值

		1、函数返回被替换的字符数
	*/
		
		if ab_exe then
			String  ls_rtf11
			rte_1.selecttext(1,5,1,20)
			ls_rtf11 = 'ReplaceText Executed'
			wf_output('FunReturn:rte_1.ReplaceText(ls_rtf11)='+String(rte_1.ReplaceText(ls_rtf11)),true)
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
		end if
	Case 'RTEFUNW21P12'
	/*
	   【功能描述】
	    测试段落格式对ReplaceText函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、选种含段落格式的Text内容，调用ReplaceText函数
		3、输出函数返回值

		1、函数返回被替换的字符数
	*/
		
		if ab_exe then
			String  ls_rtf12
			rte_1.selecttext(1,5,2,20)
			ls_rtf12 = 'ReplaceText~r~nExecuted'
			wf_output('FunReturn:rte_1.ReplaceText(ls_rtf12)='+String(rte_1.ReplaceText(ls_rtf12)),true)
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
			wf_setparagraph()
		end if
	Case 'RTEFUNW21P13'
	/*
	   【功能描述】
	    测试Text格式对InsertDocument函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、选种含格式的Text内容，构建一文档，其含各种Text格式的内容，调用InsertDocument函数插入该文档
		3、输出函数返回值

		1、函数执行成功返回1
	*/
		
		if ab_exe then
			rte_1.SelectText(1,5,1,20)
			li_rtn = rte_1.InsertDocument('W_RTEFUNW21_rtf13.rtf',False)
			wf_output('FunReturn:rte_1.InsertDocument()='+String(li_rtn),true)
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
		end if
	Case 'RTEFUNW21P14'
	/*
	   【功能描述】
	    测试段落格式对InsertDocument函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、选种含段落格式的Text内容，构建一文档，其含各种段落格式的内容，调用InsertDocument函数插入该文档
		3、输出函数返回值

		1、函数执行成功返回1
	*/
		
		if ab_exe then
			rte_1.SelectText(1,5,3,20)
			li_rtn = rte_1.InsertDocument('W_RTEFUNW21_rtf13.rtf',False)
			wf_output('FunReturn:rte_1.InsertDocument()='+String(li_rtn),true)
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
			wf_setparagraph()
		end if
	Case 'RTEFUNW21P15'
	/*
	   【功能描述】
	    测试Text格式对SetAlignment函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、选种含格式的Text内容，调用SetAlignment函数
		3、输出函数返回值

		1、函数执行成功返回1
	*/
		
		if ab_exe then
			rte_1.SelectText(1,5,3,20)
			wf_output('FunReturn:rte_1.SetAlignment(Center! )='+String(rte_1.SetAlignment(Center!)),true)
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
		end if
	Case 'RTEFUNW21P16'
	/*
	   【功能描述】
	    测试Text格式对GetAlignment函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、选种含格式的Text内容，调用GetAlignment函数
		3、输出函数返回值

		1、函数执行成功返回Alignment枚举值
	*/
		
		if ab_exe then
			Alignment  la_alig
			rte_1.SelectText(1,5,3,20)
			la_alig = rte_1.GetAlignment()
			IF la_alig = Center! THEN
				wf_output('FunReturn:rte_1.GetAlignment()=Center!',true)
			ELSEIF la_alig = Left! THEN 
				wf_output('FunReturn:rte_1.GetAlignment()=Left!',true)
			ELSEIF la_alig = Right! THEN
				wf_output('FunReturn:rte_1.GetAlignment()=Right!',true)
			ELSEIF la_alig = Justify! THEN
				wf_output('FunReturn:rte_1.GetAlignment()=Justify!',true)
			END IF
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
		end if
	Case 'RTEFUNW21P17'
	/*
	   【功能描述】
	    测试设置Text格式对undo函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、设置Text格式，调用undo函数
		3、输出函数返回值

		1、函数执行成功返回1
	*/
		
		
		if ab_exe then
			rte_1.SelectText(1,5,1,20)
			rte_1.SetTextStyle(true,true,true,false,false,false)
			wf_output('FunReturn:rte_1.undo()='+String(rte_1.undo()),true)
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
		end if
	Case 'RTEFUNW21P18'
	/*
	   【功能描述】
	    测试设置段落格式对undo函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、设置段落格式，调用undo函数
		3、输出函数返回值

		1、函数执行成功返回1
	*/
		
		if ab_exe then
			rte_1.SelectText(1,5,2,20)
			rte_1.SetParagraphSetting ( LeftMargin! , 1000 )
			wf_output('FunReturn:rte_1.undo()='+String(rte_1.undo()),true)
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
		end if
	Case 'RTEFUNW21P19'
	/*
	   【功能描述】
	    测试含有各种格式对SaveDocument函数的影响

		【编码描述】
		1、构建控件及含各种格式的Text内容
		2、调用SaveDocument函数
		3、输出函数返回值

		1、函数执行成功返回1
	*/
		
		if ab_exe then
			rte_1.SelectText(1,5,2,20)
			rte_1.SetTextColor(rgb(255,0,0))
			li_rtn = rte_1.SaveDocument('RTEFUNW21P19.rtf',FileTypeRichText! )
			wf_output('FunReturn:rte_1.SaveDocument()='+String(li_rtn),true)
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
			wf_setparagraph()
		end if
	Case 'RTEFUNW21P20'
	/*
	   【功能描述】
	    测试Text格式对SetSpacing函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、选种含格式的Text内容，调用SetSpacing函数
		3、输出函数返回值

		1、函数执行成功返回1
	*/
		
		if ab_exe then
			rte_1.SelectText(1,5,3,20)
			wf_output('FunReturn:rte_1.SetSpacing(Spacing2!)='+String(rte_1.SetSpacing(Spacing2!)),true)
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
		end if
	Case 'RTEFUNW21P21'
	/*
	   【功能描述】
	    测试Text格式对GetSpacing函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、选种含格式的Text内容，调用GetSpacing函数
		3、输出函数返回值

		1、函数执行成功返回Spacing枚举值
	*/
		
		if ab_exe then
			Spacing lsp_Spacing
			rte_1.SelectText(1,5,3,20)
			rte_1.SetSpacing(Spacing2!)
			lsp_Spacing = rte_1.GetSpacing()
			IF lsp_Spacing = Spacing1! THEN
				wf_output('FunReturn:rte_1.GetSpacing()=Spacing1!',true)
			ELSEIF lsp_Spacing = Spacing15! THEN
				wf_output('FunReturn:rte_1.GetSpacing()=Spacing15!',true)
			ELSEIF lsp_Spacing = Spacing2! THEN
				wf_output('FunReturn:rte_1.GetSpacing()=Spacing2!',true)
			END IF
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
		end if
	Case 'RTEFUNW21P22'
	/*
	   【功能描述】
	    测试Text格式对SetTextColor函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、选种含格式的Text内容，调用SetTextColor函数
		3、输出函数返回值

		1、函数执行成功返回1
	*/
		
		if ab_exe then
			rte_1.SelectText(1,5,3,20)
			wf_output('FunReturn:rte_1.SetTextColor(rgb(255,0,255))='+String(rte_1.SetTextColor(rgb(255,0,255))),true)
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
		end if
	Case 'RTEFUNW21P23'
	/*
	   【功能描述】
	    测试Text格式对GetTextColor函数的影响

		【编码描述】
		1、构建控件及含格式的Text内容
		2、选种含格式的Text内容，调用GetTextColor函数
		3、输出函数返回值

		1、函数执行成功返回TextColor值
	*/
		
		if ab_exe then
			rte_1.SelectText(1,5,3,20)
			rte_1.SetTextColor(rgb(255,0,255))
			wf_output('FunReturn:rte_1.GetTextColor())='+String(rte_1.GetTextColor()),true)
		else
			rte_1.Setfocus()
			wf_data_init(rte_1,4,detail!)
			wf_settextformat()
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

if not lnv_res.of_createFile("W_RTEFUNW21_rtf13.rtf",gtr_frame) then
	messagebox("提示信息","下载文件失败")
end if








end event

event close;call super::close;
if FileExists("PUB_BMP_BT_EMP.bmp") then
	FileDelete("PUB_BMP_BT_EMP.bmp")
end if

if FileExists("W_RTEFUNW21_rtf13.rtf") then
	FileDelete("W_RTEFUNW21_rtf13.rtf")
end if

if FileExists("RTEFUNW21P19.rtf") then
	FileDelete("RTEFUNW21P19.rtf")
end if

end event

type mle_phenomena from w_templet`mle_phenomena within w_rtefunw21
end type

type cb_autoparse from w_templet`cb_autoparse within w_rtefunw21
end type

type cb_wrrun from w_templet`cb_wrrun within w_rtefunw21
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rtefunw21
end type

type dw_info from w_templet`dw_info within w_rtefunw21
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rtefunw21
end type

type pb_runnext from w_templet`pb_runnext within w_rtefunw21
end type

type pb_runall from w_templet`pb_runall within w_rtefunw21
end type

type pb_run from w_templet`pb_run within w_rtefunw21
end type

type pb_end from w_templet`pb_end within w_rtefunw21
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rtefunw21
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rtefunw21
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rtefunw21
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rtefunw21
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rtefunw21
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rtefunw21
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rtefunw21
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rtefunw21
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rtefunw21
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rtefunw21
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rtefunw21
end type

type rte_1 from richtextedit within w_rtefunw21
integer x = 27
integer y = 24
integer width = 2926
integer height = 1300
integer taborder = 10
boolean bringtotop = true
boolean init_wordwrap = true
boolean init_headerfooter = true
boolean init_popmenu = true
borderstyle borderstyle = stylelowered!
end type

