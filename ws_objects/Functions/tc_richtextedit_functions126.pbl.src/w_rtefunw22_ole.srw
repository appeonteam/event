$PBExportHeader$w_rtefunw22_ole.srw
forward
global type w_rtefunw22_ole from w_templet
end type
type ole_1 from olecustomcontrol within w_rtefunw22_ole
end type
end forward

global type w_rtefunw22_ole from w_templet
integer width = 4677
integer height = 2504
string title = "Function 22(OLE)"
ole_1 ole_1
end type
global w_rtefunw22_ole w_rtefunw22_ole

type variables
DataStore 	ids_dw
end variables

forward prototypes
public subroutine wf_data_init (integer ai_sign)
end prototypes

public subroutine wf_data_init (integer ai_sign);//==================================================================================
// Function: wf_data_init()
//--------------------------------------------------------------------------------------------------------------------------------------------------
// Arguments:  Richtextedit   ar_rich
//                        Integer  ai_sign  --  1ÎªÓ¢ÎÄ£¬2ÎªÖÐÎÄ£¬3ÖÐÓ¢ÎÄ£¬4ÎªÓ¢ÎÄÍ¼Æ¬£¬5ÖÐÎÄÍ¼Æ¬£¬6ÖÐÓ¢ÎÄÍ¼Æ¬
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
	case 1 //Ó¢ÎÄ
		ls_array[] = {'1'}
	case 2 //ÖÐÎÄ
		ls_array[] = {'2'}
	case 3 //ÖÐÓ¢ÎÄ
		ls_array[] = {'1','2'}
	case 4 //Ó¢ÎÄÍ¼Æ¬
		ls_array[] = {'1','3'}
	case 5 //ÖÐÎÄÍ¼Æ¬
		ls_array[] = {'2','3'}
	case 6 //ÖÐÓ¢ÎÄÍ¼Æ¬
		ls_array[] = {'1','2','3'}
end choose

ole_1.object.SelectTextAll (Detail! )
ole_1.object.Clear( )
for ll_num = 1 to upperbound(ls_array[])
	i = integer(ls_array[ll_num])
	choose case i
		case 1 //Ó¢ÎÄ
			ls_english = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'
			Clipboard(ls_english)
			ole_1.object.paste()
		case 2 //ÖÐÎÄ
			ls_china   = "ÕýÑôÈí¼þÊÇÒ»¼Ò×¨ÃÅ´ÓÊÂÑÐ·¢ºÍÓªÏúÆóÒµ¼¶Èí¼þ²úÆ·µÄ¹«Ë¾£¬³ÉÁ¢ÓÚÃÀ¹ú¹è¹È£¬2001Äê12ÔÂÔÚÉîÛÚ½¨Á¢ÑÐ·¢ÖÐÐÄ¡£ÕýÑôÈí¼þÔÚÆóÒµÓ¦ÓÃ¼¶Èí¼þµÄ½á¹¹ÐÔ±ä¸ïÖÐ£¬Ò»Ö±Õ¼¾Ý¼¼ÊõÉÏµÄÁìÏÈµØÎ»£¬ÆäÉêÇëµÄ¶àÏî·¢Ã÷×¨Àû£¬½â¾öÁË»¥ÁªÍøÈí¼þµÄ¾ÖÏÞÐÔ£¬ÕâÐ©¼¼Êõ·¢Ã÷¶ÔÆóÒµ¿ª·¢ÓëÓ¦ÓÃ»¥ÁªÍøÈí¼þ²úÉúÉîÔ¶µÄÓ°Ïì£¬Ò²Ê¹ÕýÑôÈí¼þ³ÉÎªÈ«Çò×îÔçÈ·ÈÏ²¢½â¾öÁËÍøÂçä¯ÀÀÆ÷ÔÚ·ÃÎÊÆóÒµÈí¼þ·½Ãæ¾ÖÏÞÐÔµÄ¹«Ë¾¡£"
			Clipboard(ls_china)
			ole_1.object.paste()
		case 3  //Í¼Æ¬
			ole_1.object.InsertPicture("PUB_BMP_APB.bmp", 1)
	end choose
	Clipboard('')
next

ole_1.object.SelectTextALL(Detail!)

ole_1.object.Settextstyle( true, true, true, true, true, true)
ole_1.object.SettextColor(rgb(0,0,255 ))

ole_1.object.SelectText(1,1,1,5,Detail!)
ole_1.object.SetAlignment ( Center!  )

ole_1.object.SelectText(2,1,2,5,Detail!)
ole_1.object.SetAlignment ( Right!   )

ole_1.object.SelectText(3,1,3,5,Detail!)
ole_1.object.SetAlignment (  Left!  )

ole_1.object.SelectText(4,1,4,5,Detail!)
ole_1.object.SetAlignment ( Justify!)

ole_1.object.SelectText(ole_1.object.LineCount(),1,0,0,Detail!)
ole_1.object.SelectText(ole_1.object.LineCount(),ole_1.object.LineLength() + 1,0,0,Detail!)
end subroutine

on w_rtefunw22_ole.create
int iCurrent
call super::create
this.ole_1=create ole_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_1
end on

on w_rtefunw22_ole.destroy
call super::destroy
destroy(this.ole_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 
½«¿Ø¼þÄÚÈÝ³É¹¦±£´æµ½Ò»¸öÎÄµµºó»òÐÂ´ò¿ªÎÄµµºó£¬ModifiedÊôÐÔÖµ±äÎªfalse
***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Functions\Function 10 
Pbl Name:     
Designer:     ouyangwu
Coder:        WuZhiJun(2005-06-27)
DocReviewer:  
CoderReviewer:
¡¾¹¦ÄÜÃèÊö¡¿

¡¾´°¿Ú¶ÔÏó¡¿

¡¾±àÂë×¢ÒâÊÂÏî¡¿

¡¾²âÊÔ×¢ÒâÊÂÏî¡¿
 
***********************/

//¹«¹²±äÁ¿¶¨Òå
String		ls_Temp,ls_PageRange,ls_Error
Integer		li_RtnVal,li_Copys
Boolean		lb_RtnVal,lb_PreviewSet,lb_Collate,lb_CancelDig
TrigEvent 	ltr_Event
Long			ll_RtnVal
String		ls_Sql,ls_Syntax

ls_Sql = "SELECT emp_id," + &
				"dep_id," + &
				"emp_code," + &
				"emp_name," + &
				"emp_sex," + &
				"emp_born," + &
				"emp_age," + &
				"emp_salary " + &
			"FROM PUB_T_RICHTEXTEDIT  ;"

if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return
if isnull(ab_exe) then return

if Not ab_exe then
	ole_1.object.ShowHeadFoot(false, false)
	wf_data_init(4)
end if

Choose Case as_testpoint
	Case 'RTEFUNW22P01'
		
	if ab_exe then
			SetNull(lb_CancelDig)
			li_RtnVal = ole_1.object.PrintEX(lb_CancelDig)
			wf_OutPut("FunReturn: ole_1.object.PrintEX(lb_CancelDig)=" + String(li_RtnVal),true)
		else
			ole_1.object.SelectTextAll(Detail!)
			ole_1.object.Clear()
			ClipBoard('Series1~t490~tknfp~r~nSeries2~t843~tycgf~r~nSeries3~t631~teowq~r~nSeries4~t667~twwwp~r~nSeries1~t373~tsqme~r~nSeries2~t515~togep~r~nSeries3~t485~tpxnv~r~nSeries4~t352~tiupa~r~nSeries1~t678~tyynm~r~nSeries2~t604~tmnuv~r~nSeries3~t806~tlhse~r~nSeries4~t344~tdwra~r~nSeries1~t755~tgfmz~r~nSeries2~t792~tgipd~r~nSeries3~t357~todkj~r~nSeries4~t610~tjqwi~r~nSeries1~t407~tpuoq~r~nSeries2~t813~timvf~r~nSeries3~t727~tuzwy~r~nSeries4~t560~tijgf~r~nSeries1~t985~tllkj~r~nSeries2~t812~tuhsj~r~nSeries3~t395~tfbtl~r~nSeries4~t738~tmfqr~r~nSeries1~t977~tyjfj~r~nSeries2~t939~thhss~r~nSeries3~t943~tctyd~r~nSeries4~t858~teamd~r~nSeries1~t767~tjbpr~r~nSeries2~t772~ttneg~r~nSeries3~t442~tiwxg~r~nSeries4~t582~tjwlg~r~nSeries1~t847~tsmea~r~nSeries2~t418~tarwt~r~nSeries3~t446~tjsjb~r~nSeries4~t618~toioj~r~nSeries1~t426~twhyp~r~nSeries2~t808~tvrui~r~nSeries3~t422~toswk~r~nSeries4~t350~tfygt~r~nSeries1~t482~tdhac~r~nSeries2~t618~tyhsg~r~nSeries3~t599~twzmt~r~nSeries4~t498~tonzl~r~nSeries1~t584~tjhga~r~nSeries2~t805~thnih~r~nSeries3~t749~teqgj~r~nSeries4~t312~twkjs~r~nSeries1~t836~ttpjh~r~nSeries2~t931~tefqz~r~nSeries3~t458~tauld~r~nSeries4~t603~tchjc~r~nSeries1~t892~tdyrf~r~nSeries2~t464~tvriv~r~nSeries3~t807~tyeeg~r~nSeries4~t944~tivdr~r~nSeries1~t606~tygur~r~nSeries2~t694~tdred~r~nSeries3~t476~tkubn~r~nSeries4~t320~tgupr~r~nSeries1~t697~tqylo~r~nSeries2~t804~tcwqx~r~nSeries3~t689~tzmau~r~nSeries4~t694~tjgmh~r~nSeries1~t482~tmhgd~r~nSeries2~t318~tmphn~r~nSeries3~t586~tkamh~r~nSeries4~t823~trktr~r~nSeries1~t547~tfacl~r~nSeries2~t870~tgrzk~r~nSeries3~t864~tldac~r~nSeries4~t448~tlteo~r~nSeries1~t343~tomon~r~nSeries2~t880~trqyj~r~nSeries3~t347~tginr~r~nSeries4~t301~tnzwa~r~nSeries1~t536~txxae~r~nSeries2~t431~trwud~r~nSeries3~t561~tzrfu~r~nSeries4~t348~tewjt~r~n ')
			ole_1.object.Paste()
		end if
	Case 'RTEFUNW22P02'
		
		if ab_exe then
			SetNull(lb_CancelDig)
			li_RtnVal = ole_1.object.PrintEX(false)
			wf_OutPut("FunReturn: ole_1.object.PrintEX(false)=" + String(li_RtnVal),true)
		else
			ole_1.object.SelectTextAll(Detail!)
			ole_1.object.Clear()
			ClipBoard('Series1~t490~tknfp~r~nSeries2~t843~tycgf~r~nSeries3~t631~teowq~r~nSeries4~t667~twwwp~r~nSeries1~t373~tsqme~r~nSeries2~t515~togep~r~nSeries3~t485~tpxnv~r~nSeries4~t352~tiupa~r~nSeries1~t678~tyynm~r~nSeries2~t604~tmnuv~r~nSeries3~t806~tlhse~r~nSeries4~t344~tdwra~r~nSeries1~t755~tgfmz~r~nSeries2~t792~tgipd~r~nSeries3~t357~todkj~r~nSeries4~t610~tjqwi~r~nSeries1~t407~tpuoq~r~nSeries2~t813~timvf~r~nSeries3~t727~tuzwy~r~nSeries4~t560~tijgf~r~nSeries1~t985~tllkj~r~nSeries2~t812~tuhsj~r~nSeries3~t395~tfbtl~r~nSeries4~t738~tmfqr~r~nSeries1~t977~tyjfj~r~nSeries2~t939~thhss~r~nSeries3~t943~tctyd~r~nSeries4~t858~teamd~r~nSeries1~t767~tjbpr~r~nSeries2~t772~ttneg~r~nSeries3~t442~tiwxg~r~nSeries4~t582~tjwlg~r~nSeries1~t847~tsmea~r~nSeries2~t418~tarwt~r~nSeries3~t446~tjsjb~r~nSeries4~t618~toioj~r~nSeries1~t426~twhyp~r~nSeries2~t808~tvrui~r~nSeries3~t422~toswk~r~nSeries4~t350~tfygt~r~nSeries1~t482~tdhac~r~nSeries2~t618~tyhsg~r~nSeries3~t599~twzmt~r~nSeries4~t498~tonzl~r~nSeries1~t584~tjhga~r~nSeries2~t805~thnih~r~nSeries3~t749~teqgj~r~nSeries4~t312~twkjs~r~nSeries1~t836~ttpjh~r~nSeries2~t931~tefqz~r~nSeries3~t458~tauld~r~nSeries4~t603~tchjc~r~nSeries1~t892~tdyrf~r~nSeries2~t464~tvriv~r~nSeries3~t807~tyeeg~r~nSeries4~t944~tivdr~r~nSeries1~t606~tygur~r~nSeries2~t694~tdred~r~nSeries3~t476~tkubn~r~nSeries4~t320~tgupr~r~nSeries1~t697~tqylo~r~nSeries2~t804~tcwqx~r~nSeries3~t689~tzmau~r~nSeries4~t694~tjgmh~r~nSeries1~t482~tmhgd~r~nSeries2~t318~tmphn~r~nSeries3~t586~tkamh~r~nSeries4~t823~trktr~r~nSeries1~t547~tfacl~r~nSeries2~t870~tgrzk~r~nSeries3~t864~tldac~r~nSeries4~t448~tlteo~r~nSeries1~t343~tomon~r~nSeries2~t880~trqyj~r~nSeries3~t347~tginr~r~nSeries4~t301~tnzwa~r~nSeries1~t536~txxae~r~nSeries2~t431~trwud~r~nSeries3~t561~tzrfu~r~nSeries4~t348~tewjt~r~n ')
			ole_1.object.Paste()
		end if
		
		
	Case 'RTEFUNW22P03'
		if ab_exe then
			SetNull(lb_CancelDig)
			li_RtnVal = ole_1.object.PrintEX(true)
			wf_OutPut("FunReturn: ole_1.object.PrintEX(true)=" + String(li_RtnVal),true)
		else
			ole_1.object.SelectTextAll(Detail!)
			ole_1.object.Clear()
			ClipBoard('Series1~t490~tknfp~r~nSeries2~t843~tycgf~r~nSeries3~t631~teowq~r~nSeries4~t667~twwwp~r~nSeries1~t373~tsqme~r~nSeries2~t515~togep~r~nSeries3~t485~tpxnv~r~nSeries4~t352~tiupa~r~nSeries1~t678~tyynm~r~nSeries2~t604~tmnuv~r~nSeries3~t806~tlhse~r~nSeries4~t344~tdwra~r~nSeries1~t755~tgfmz~r~nSeries2~t792~tgipd~r~nSeries3~t357~todkj~r~nSeries4~t610~tjqwi~r~nSeries1~t407~tpuoq~r~nSeries2~t813~timvf~r~nSeries3~t727~tuzwy~r~nSeries4~t560~tijgf~r~nSeries1~t985~tllkj~r~nSeries2~t812~tuhsj~r~nSeries3~t395~tfbtl~r~nSeries4~t738~tmfqr~r~nSeries1~t977~tyjfj~r~nSeries2~t939~thhss~r~nSeries3~t943~tctyd~r~nSeries4~t858~teamd~r~nSeries1~t767~tjbpr~r~nSeries2~t772~ttneg~r~nSeries3~t442~tiwxg~r~nSeries4~t582~tjwlg~r~nSeries1~t847~tsmea~r~nSeries2~t418~tarwt~r~nSeries3~t446~tjsjb~r~nSeries4~t618~toioj~r~nSeries1~t426~twhyp~r~nSeries2~t808~tvrui~r~nSeries3~t422~toswk~r~nSeries4~t350~tfygt~r~nSeries1~t482~tdhac~r~nSeries2~t618~tyhsg~r~nSeries3~t599~twzmt~r~nSeries4~t498~tonzl~r~nSeries1~t584~tjhga~r~nSeries2~t805~thnih~r~nSeries3~t749~teqgj~r~nSeries4~t312~twkjs~r~nSeries1~t836~ttpjh~r~nSeries2~t931~tefqz~r~nSeries3~t458~tauld~r~nSeries4~t603~tchjc~r~nSeries1~t892~tdyrf~r~nSeries2~t464~tvriv~r~nSeries3~t807~tyeeg~r~nSeries4~t944~tivdr~r~nSeries1~t606~tygur~r~nSeries2~t694~tdred~r~nSeries3~t476~tkubn~r~nSeries4~t320~tgupr~r~nSeries1~t697~tqylo~r~nSeries2~t804~tcwqx~r~nSeries3~t689~tzmau~r~nSeries4~t694~tjgmh~r~nSeries1~t482~tmhgd~r~nSeries2~t318~tmphn~r~nSeries3~t586~tkamh~r~nSeries4~t823~trktr~r~nSeries1~t547~tfacl~r~nSeries2~t870~tgrzk~r~nSeries3~t864~tldac~r~nSeries4~t448~tlteo~r~nSeries1~t343~tomon~r~nSeries2~t880~trqyj~r~nSeries3~t347~tginr~r~nSeries4~t301~tnzwa~r~nSeries1~t536~txxae~r~nSeries2~t431~trwud~r~nSeries3~t561~tzrfu~r~nSeries4~t348~tewjt~r~n ')
			ole_1.object.Paste()
		end if
		
End Choose

if ab_exe then
	wf_postrun(al_row)
end if
end event

event open;call super::open;ids_dw = Create DataStore
n_cst_config  lnv_res


if not lnv_res.of_createFile("PUB_BMP_APB.bmp",gtr_frame) then
	messagebox("ÌáÊ¾ÐÅÏ¢","ÏÂÔØÍ¼Æ¬Ê§°Ü")
end if





end event

event close;call super::close;Destroy ids_dw

if FileExists("PUB_BMP_APB.bmp") then
	FileDelete("PUB_BMP_APB.bmp")
end if

end event

type mle_phenomena from w_templet`mle_phenomena within w_rtefunw22_ole
end type

type cb_autoparse from w_templet`cb_autoparse within w_rtefunw22_ole
end type

type cb_wrrun from w_templet`cb_wrrun within w_rtefunw22_ole
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rtefunw22_ole
end type

type dw_info from w_templet`dw_info within w_rtefunw22_ole
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rtefunw22_ole
end type

type pb_runnext from w_templet`pb_runnext within w_rtefunw22_ole
end type

type pb_runall from w_templet`pb_runall within w_rtefunw22_ole
end type

type pb_run from w_templet`pb_run within w_rtefunw22_ole
end type

type pb_end from w_templet`pb_end within w_rtefunw22_ole
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rtefunw22_ole
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rtefunw22_ole
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rtefunw22_ole
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rtefunw22_ole
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rtefunw22_ole
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rtefunw22_ole
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rtefunw22_ole
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rtefunw22_ole
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rtefunw22_ole
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rtefunw22_ole
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rtefunw22_ole
end type

type ole_1 from olecustomcontrol within w_rtefunw22_ole
event fileexists ( string filename,  long presult )
event rbtnup ( long presult )
event rbtndown ( long presult )
event pictureselected ( long presult )
event modified ( long presult )
event key ( long keycode,  long keyflags,  long presult )
event dclicked ( long presult )
integer x = 27
integer y = 32
integer width = 2921
integer height = 1288
integer taborder = 70
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_rtefunw22_ole.win"
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Bw_rtefunw22_ole.bin 
2E00000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000797b3af001d121c800000003000003c00000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000033c00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003ca8b32274d04317f533962bbefa4474f00000000797b3af001d121c8797b3af001d121c8000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000d00000075000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a0000000b0000000cfffffffe0000000efffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
21ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000fffe00020006ca8b32274d04317f533962bbefa4474f00000001fb8f0821101b01640008ed8413c72e2b000000300000030c0000000d0000010000000070000001010000007800000102000000800000010300000088000001040000009000000105000001d800000106000001e800000107000001fc000001080000020800000109000002100000010a000002180000010b0000022000000000000002280000000300010000000000030000420b000000030000214800000003000000240000004b0000013d0000fffe000100060be3520311ce8f91aa00e39d51b84b0000000001fb8f0821101b01640008ed8413c72e2b000000300000010d0000000800000002000000480000000a00000058000000090000006000000004000000680000000700000074000000060000007c0000000800000084000000000000008c00000008000000054f535b8b0000000000000002000000860000000200000190000000060001d4c0000000000000000b000000000000000b000000000000000b00000000000000080000000000000005006f00660000086e00000e00740073006900720065006b000400740005000000730000007a0069000000000900000007006500770a670069080000006300000061006800070072000a0000007500000064006e0072006500000002000000050061006e0000066d000007000000690000006100740000006c000000410000000807db000000000000000000410000000c4f535b8b0000000000000000000000060001d4c0000000000000000b000000000000000b000000000000000b000000000000000b000000000000000d00000000000000010001060000000900636166006d616e6501030065000c0000735f00006b636f74706f727001070073000900006f6600006973746e0100657a090000015f000000657478650078746e0000010a00000009746e6f66646c6f62000102000000090078655f00746e657401090079000a00006e7500006c72656400656e69000001050000000d75636f64746e656d656d616e00010800000012006e6f66007274737474656b69756f726804006867050000016600000000746e6f00000100000000097265765f6e6f697300010b0000000700617469000063696c00000000000100000000420b0000214800000024e3520300ce8f910b00e39d11b84b00aa00860151c0019000040001d4e5cccecb010000000101010100000001000000000000000000000000000001000000000807db00000000000000000c00535b8b000200004f0000008001d4c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Bw_rtefunw22_ole.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
