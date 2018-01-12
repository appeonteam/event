$PBExportHeader$w_rtefunw22.srw
forward
global type w_rtefunw22 from w_templet
end type
type rte_1 from richtextedit within w_rtefunw22
end type
end forward

global type w_rtefunw22 from w_templet
integer width = 4677
integer height = 2504
string title = "Function 22"
rte_1 rte_1
end type
global w_rtefunw22 w_rtefunw22

type variables
DataStore 	ids_dw
end variables

forward prototypes
public subroutine wf_data_init (richtextedit ar_rich, integer ai_sign)
end prototypes

public subroutine wf_data_init (richtextedit ar_rich, integer ai_sign);//==================================================================================
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

ar_rich.SelectTextAll (Detail! )
ar_rich.Clear( )
for ll_num = 1 to upperbound(ls_array[])
	i = integer(ls_array[ll_num])
	choose case i
		case 1 //Ó¢ÎÄ
			ls_english = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'
			Clipboard(ls_english)
			ar_rich.paste()
		case 2 //ÖÐÎÄ
			ls_china   = "ÕýÑôÈí¼þÊÇÒ»¼Ò×¨ÃÅ´ÓÊÂÑÐ·¢ºÍÓªÏúÆóÒµ¼¶Èí¼þ²úÆ·µÄ¹«Ë¾£¬³ÉÁ¢ÓÚÃÀ¹ú¹è¹È£¬2001Äê12ÔÂÔÚÉîÛÚ½¨Á¢ÑÐ·¢ÖÐÐÄ¡£ÕýÑôÈí¼þÔÚÆóÒµÓ¦ÓÃ¼¶Èí¼þµÄ½á¹¹ÐÔ±ä¸ïÖÐ£¬Ò»Ö±Õ¼¾Ý¼¼ÊõÉÏµÄÁìÏÈµØÎ»£¬ÆäÉêÇëµÄ¶àÏî·¢Ã÷×¨Àû£¬½â¾öÁË»¥ÁªÍøÈí¼þµÄ¾ÖÏÞÐÔ£¬ÕâÐ©¼¼Êõ·¢Ã÷¶ÔÆóÒµ¿ª·¢ÓëÓ¦ÓÃ»¥ÁªÍøÈí¼þ²úÉúÉîÔ¶µÄÓ°Ïì£¬Ò²Ê¹ÕýÑôÈí¼þ³ÉÎªÈ«Çò×îÔçÈ·ÈÏ²¢½â¾öÁËÍøÂçä¯ÀÀÆ÷ÔÚ·ÃÎÊÆóÒµÈí¼þ·½Ãæ¾ÖÏÞÐÔµÄ¹«Ë¾¡£"
			Clipboard(ls_china)
			ar_rich.paste()
		case 3  //Í¼Æ¬
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

on w_rtefunw22.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rtefunw22.destroy
call super::destroy
destroy(this.rte_1)
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
	rte_1.ShowHeadFoot(false)
	wf_data_init(rte_1,4)
end if

Choose Case as_testpoint
	Case 'RTEFUNW22P01'
		
	if ab_exe then
			SetNull(lb_CancelDig)
			li_RtnVal = rte_1.PrintEX(lb_CancelDig)
			wf_OutPut("FunReturn: rte_1.PrintEX(lb_CancelDig)=" + String(li_RtnVal),true)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ClipBoard('Series1~t490~tknfp~r~nSeries2~t843~tycgf~r~nSeries3~t631~teowq~r~nSeries4~t667~twwwp~r~nSeries1~t373~tsqme~r~nSeries2~t515~togep~r~nSeries3~t485~tpxnv~r~nSeries4~t352~tiupa~r~nSeries1~t678~tyynm~r~nSeries2~t604~tmnuv~r~nSeries3~t806~tlhse~r~nSeries4~t344~tdwra~r~nSeries1~t755~tgfmz~r~nSeries2~t792~tgipd~r~nSeries3~t357~todkj~r~nSeries4~t610~tjqwi~r~nSeries1~t407~tpuoq~r~nSeries2~t813~timvf~r~nSeries3~t727~tuzwy~r~nSeries4~t560~tijgf~r~nSeries1~t985~tllkj~r~nSeries2~t812~tuhsj~r~nSeries3~t395~tfbtl~r~nSeries4~t738~tmfqr~r~nSeries1~t977~tyjfj~r~nSeries2~t939~thhss~r~nSeries3~t943~tctyd~r~nSeries4~t858~teamd~r~nSeries1~t767~tjbpr~r~nSeries2~t772~ttneg~r~nSeries3~t442~tiwxg~r~nSeries4~t582~tjwlg~r~nSeries1~t847~tsmea~r~nSeries2~t418~tarwt~r~nSeries3~t446~tjsjb~r~nSeries4~t618~toioj~r~nSeries1~t426~twhyp~r~nSeries2~t808~tvrui~r~nSeries3~t422~toswk~r~nSeries4~t350~tfygt~r~nSeries1~t482~tdhac~r~nSeries2~t618~tyhsg~r~nSeries3~t599~twzmt~r~nSeries4~t498~tonzl~r~nSeries1~t584~tjhga~r~nSeries2~t805~thnih~r~nSeries3~t749~teqgj~r~nSeries4~t312~twkjs~r~nSeries1~t836~ttpjh~r~nSeries2~t931~tefqz~r~nSeries3~t458~tauld~r~nSeries4~t603~tchjc~r~nSeries1~t892~tdyrf~r~nSeries2~t464~tvriv~r~nSeries3~t807~tyeeg~r~nSeries4~t944~tivdr~r~nSeries1~t606~tygur~r~nSeries2~t694~tdred~r~nSeries3~t476~tkubn~r~nSeries4~t320~tgupr~r~nSeries1~t697~tqylo~r~nSeries2~t804~tcwqx~r~nSeries3~t689~tzmau~r~nSeries4~t694~tjgmh~r~nSeries1~t482~tmhgd~r~nSeries2~t318~tmphn~r~nSeries3~t586~tkamh~r~nSeries4~t823~trktr~r~nSeries1~t547~tfacl~r~nSeries2~t870~tgrzk~r~nSeries3~t864~tldac~r~nSeries4~t448~tlteo~r~nSeries1~t343~tomon~r~nSeries2~t880~trqyj~r~nSeries3~t347~tginr~r~nSeries4~t301~tnzwa~r~nSeries1~t536~txxae~r~nSeries2~t431~trwud~r~nSeries3~t561~tzrfu~r~nSeries4~t348~tewjt~r~n ')
			rte_1.Paste()
		end if
	Case 'RTEFUNW22P02'
		
		if ab_exe then
			SetNull(lb_CancelDig)
			li_RtnVal = rte_1.PrintEX(false)
			wf_OutPut("FunReturn: rte_1.PrintEX(false)=" + String(li_RtnVal),true)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ClipBoard('Series1~t490~tknfp~r~nSeries2~t843~tycgf~r~nSeries3~t631~teowq~r~nSeries4~t667~twwwp~r~nSeries1~t373~tsqme~r~nSeries2~t515~togep~r~nSeries3~t485~tpxnv~r~nSeries4~t352~tiupa~r~nSeries1~t678~tyynm~r~nSeries2~t604~tmnuv~r~nSeries3~t806~tlhse~r~nSeries4~t344~tdwra~r~nSeries1~t755~tgfmz~r~nSeries2~t792~tgipd~r~nSeries3~t357~todkj~r~nSeries4~t610~tjqwi~r~nSeries1~t407~tpuoq~r~nSeries2~t813~timvf~r~nSeries3~t727~tuzwy~r~nSeries4~t560~tijgf~r~nSeries1~t985~tllkj~r~nSeries2~t812~tuhsj~r~nSeries3~t395~tfbtl~r~nSeries4~t738~tmfqr~r~nSeries1~t977~tyjfj~r~nSeries2~t939~thhss~r~nSeries3~t943~tctyd~r~nSeries4~t858~teamd~r~nSeries1~t767~tjbpr~r~nSeries2~t772~ttneg~r~nSeries3~t442~tiwxg~r~nSeries4~t582~tjwlg~r~nSeries1~t847~tsmea~r~nSeries2~t418~tarwt~r~nSeries3~t446~tjsjb~r~nSeries4~t618~toioj~r~nSeries1~t426~twhyp~r~nSeries2~t808~tvrui~r~nSeries3~t422~toswk~r~nSeries4~t350~tfygt~r~nSeries1~t482~tdhac~r~nSeries2~t618~tyhsg~r~nSeries3~t599~twzmt~r~nSeries4~t498~tonzl~r~nSeries1~t584~tjhga~r~nSeries2~t805~thnih~r~nSeries3~t749~teqgj~r~nSeries4~t312~twkjs~r~nSeries1~t836~ttpjh~r~nSeries2~t931~tefqz~r~nSeries3~t458~tauld~r~nSeries4~t603~tchjc~r~nSeries1~t892~tdyrf~r~nSeries2~t464~tvriv~r~nSeries3~t807~tyeeg~r~nSeries4~t944~tivdr~r~nSeries1~t606~tygur~r~nSeries2~t694~tdred~r~nSeries3~t476~tkubn~r~nSeries4~t320~tgupr~r~nSeries1~t697~tqylo~r~nSeries2~t804~tcwqx~r~nSeries3~t689~tzmau~r~nSeries4~t694~tjgmh~r~nSeries1~t482~tmhgd~r~nSeries2~t318~tmphn~r~nSeries3~t586~tkamh~r~nSeries4~t823~trktr~r~nSeries1~t547~tfacl~r~nSeries2~t870~tgrzk~r~nSeries3~t864~tldac~r~nSeries4~t448~tlteo~r~nSeries1~t343~tomon~r~nSeries2~t880~trqyj~r~nSeries3~t347~tginr~r~nSeries4~t301~tnzwa~r~nSeries1~t536~txxae~r~nSeries2~t431~trwud~r~nSeries3~t561~tzrfu~r~nSeries4~t348~tewjt~r~n ')
			rte_1.Paste()
		end if
		
		
	Case 'RTEFUNW22P03'
		if ab_exe then
			SetNull(lb_CancelDig)
			li_RtnVal = rte_1.PrintEX(true)
			wf_OutPut("FunReturn: rte_1.PrintEX(true)=" + String(li_RtnVal),true)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ClipBoard('Series1~t490~tknfp~r~nSeries2~t843~tycgf~r~nSeries3~t631~teowq~r~nSeries4~t667~twwwp~r~nSeries1~t373~tsqme~r~nSeries2~t515~togep~r~nSeries3~t485~tpxnv~r~nSeries4~t352~tiupa~r~nSeries1~t678~tyynm~r~nSeries2~t604~tmnuv~r~nSeries3~t806~tlhse~r~nSeries4~t344~tdwra~r~nSeries1~t755~tgfmz~r~nSeries2~t792~tgipd~r~nSeries3~t357~todkj~r~nSeries4~t610~tjqwi~r~nSeries1~t407~tpuoq~r~nSeries2~t813~timvf~r~nSeries3~t727~tuzwy~r~nSeries4~t560~tijgf~r~nSeries1~t985~tllkj~r~nSeries2~t812~tuhsj~r~nSeries3~t395~tfbtl~r~nSeries4~t738~tmfqr~r~nSeries1~t977~tyjfj~r~nSeries2~t939~thhss~r~nSeries3~t943~tctyd~r~nSeries4~t858~teamd~r~nSeries1~t767~tjbpr~r~nSeries2~t772~ttneg~r~nSeries3~t442~tiwxg~r~nSeries4~t582~tjwlg~r~nSeries1~t847~tsmea~r~nSeries2~t418~tarwt~r~nSeries3~t446~tjsjb~r~nSeries4~t618~toioj~r~nSeries1~t426~twhyp~r~nSeries2~t808~tvrui~r~nSeries3~t422~toswk~r~nSeries4~t350~tfygt~r~nSeries1~t482~tdhac~r~nSeries2~t618~tyhsg~r~nSeries3~t599~twzmt~r~nSeries4~t498~tonzl~r~nSeries1~t584~tjhga~r~nSeries2~t805~thnih~r~nSeries3~t749~teqgj~r~nSeries4~t312~twkjs~r~nSeries1~t836~ttpjh~r~nSeries2~t931~tefqz~r~nSeries3~t458~tauld~r~nSeries4~t603~tchjc~r~nSeries1~t892~tdyrf~r~nSeries2~t464~tvriv~r~nSeries3~t807~tyeeg~r~nSeries4~t944~tivdr~r~nSeries1~t606~tygur~r~nSeries2~t694~tdred~r~nSeries3~t476~tkubn~r~nSeries4~t320~tgupr~r~nSeries1~t697~tqylo~r~nSeries2~t804~tcwqx~r~nSeries3~t689~tzmau~r~nSeries4~t694~tjgmh~r~nSeries1~t482~tmhgd~r~nSeries2~t318~tmphn~r~nSeries3~t586~tkamh~r~nSeries4~t823~trktr~r~nSeries1~t547~tfacl~r~nSeries2~t870~tgrzk~r~nSeries3~t864~tldac~r~nSeries4~t448~tlteo~r~nSeries1~t343~tomon~r~nSeries2~t880~trqyj~r~nSeries3~t347~tginr~r~nSeries4~t301~tnzwa~r~nSeries1~t536~txxae~r~nSeries2~t431~trwud~r~nSeries3~t561~tzrfu~r~nSeries4~t348~tewjt~r~n ')
			rte_1.Paste()
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

type mle_phenomena from w_templet`mle_phenomena within w_rtefunw22
end type

type cb_autoparse from w_templet`cb_autoparse within w_rtefunw22
end type

type cb_wrrun from w_templet`cb_wrrun within w_rtefunw22
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rtefunw22
end type

type dw_info from w_templet`dw_info within w_rtefunw22
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rtefunw22
end type

type pb_runnext from w_templet`pb_runnext within w_rtefunw22
end type

type pb_runall from w_templet`pb_runall within w_rtefunw22
end type

type pb_run from w_templet`pb_run within w_rtefunw22
end type

type pb_end from w_templet`pb_end within w_rtefunw22
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rtefunw22
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rtefunw22
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rtefunw22
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rtefunw22
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rtefunw22
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rtefunw22
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rtefunw22
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rtefunw22
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rtefunw22
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rtefunw22
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rtefunw22
end type

type rte_1 from richtextedit within w_rtefunw22
integer x = 27
integer y = 32
integer width = 2921
integer height = 1288
integer taborder = 10
boolean bringtotop = true
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_headerfooter = true
borderstyle borderstyle = stylelowered!
end type

