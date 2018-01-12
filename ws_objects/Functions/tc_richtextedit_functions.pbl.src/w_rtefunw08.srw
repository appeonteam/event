$PBExportHeader$w_rtefunw08.srw
forward
global type w_rtefunw08 from w_templet
end type
type rte_1 from richtextedit within w_rtefunw08
end type
end forward

global type w_rtefunw08 from w_templet
string title = "Function 8"
rte_1 rte_1
end type
global w_rtefunw08 w_rtefunw08

forward prototypes
public subroutine wf_data_init (richtextedit ar_rich, integer ai_sign)
public function string wf_getmanypagestring ()
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

public function string wf_getmanypagestring ();String ls_Temp

ls_Temp = 'Series1~tphqg~thume~r~nSeries2~tayln~tlfdx~r~nSeries3~tfirc~tvscx~r~nSeries4~tggbw~tkfnq~r~nSeries1~tduxw~tfnfo~r~nSeries2~tzvsr~ttkjp~r~nSeries3~trepg~tgxrp~r~nSeries4~tnrvy~tstmw~r~nSeries1~tcysy~tycqp~r~nSeries2~tevik~teffm~r~nSeries3~tznim~tkkas~r~nSeries4~tvwsr~tenzk~r~nSeries1~tycxf~txtls~r~nSeries2~tgyps~tfadp~r~nSeries3~tooef~txzbc~r~nSeries4~toeju~tvpva~r~nSeries1~tboyg~tpoey~r~nSeries2~tlfpb~tnplj~r~nSeries3~tvrvi~tpyam~r~nSeries4~tyehw~tqnqr~r~nSeries1~tqpmx~tujjl~r~nSeries2~toova~towux~r~nSeries3~twhms~tncbx~r~nSeries4~tcoks~tfzkv~r~nSeries1~tatxd~tknly~r~nSeries2~tjyhf~tixjs~r~nSeries3~twnkk~tufnu~r~nSeries4~txxzr~tzbmn~r~nSeries1~tmgqo~toket~r~nSeries2~tlyhn~tkoau~r~nSeries3~tgzqr~tcddi~r~nSeries4~tutei~tojwa~r~nSeries1~tyyzp~tvscm~r~nSeries2~tpsaj~tlfvg~r~nSeries3~tubfa~taovl~r~nSeries4~tzyln~ttrkd~r~nSeries1~tcpws~trtes~r~nSeries2~tjwhd~tizco~r~nSeries3~tbzcn~tfwlq~r~nSeries4~tijtv~tdwvx~r~nSeries1~thrcb~tldvg~r~nSeries2~tylwg~tbusb~r~nSeries3~tmbor~txtlh~r~nSeries4~tcsmp~txohg~r~nSeries1~tmgnk~teufd~r~nSeries2~txoto~tgbgx~r~nSeries3~tpeya~tnfet~r~nSeries4~tcuke~tpzsh~r~nSeries1~tklju~tggge~r~nSeries2~tkjdq~tzjen~r~nSeries3~tpevq~tgxie~r~nSeries4~tpjsr~tdzja~r~nSeries1~tzujl~tlchh~r~nSeries2~tbfqm~tkimw~r~nSeries3~tzobi~twybx~r~nSeries4~tduun~tfsks~r~nSeries1~trsrt~tekmq~r~nSeries2~tdcyz~tjeeu~r~nSeries3~thmsr~tqcoz~r~nSeries4~tijip~tfion~r~nSeries1~teedd~tpszr~r~nSeries2~tnavy~tmmta~r~nSeries3~ttbdz~tqsoe~r~nSeries4~tmuvn~tppps~r~nSeries1~tuacb~tazux~r~nSeries2~tmhec~tthle~r~nSeries3~tgrpu~tnkdm~r~nSeries4~tbppw~teqtg~r~nSeries1~tjopa~trmow~r~nSeries2~tzdqy~toxyt~r~nSeries3~tjbbh~tawdy~r~nSeries4~tdcpr~tjbxp~r~nSeries1~thooh~tpkwq~r~nSeries2~tyuhr~tqzhn~r~nSeries3~tbnfu~tvqnq~r~nSeries4~tqlrz~tjpxi~r~nSeries1~togvl~tiexd~r~nSeries2~tzuzo~tsrkr~r~nSeries3~tusvo~tjbrz~r~nSeries4~tmwzp~towkj~r~nSeries1~tilef~traam~r~nSeries2~tdigp~tnpuu~r~nSeries3~thgxp~tqnjw~r~nSeries4~tjmwa~txxmn~r~nSeries1~tsnhh~tlqqr~r~nSeries2~tzudl~ttfzo~r~nSeries3~ttcjt~tnzxu~r~nSeries4~tglsd~tsmzc~r~nSeries1~tnock~tvfaj~r~nSeries2~tfrmx~totho~r~nSeries3~twkbj~tzwuc~r~nSeries4~twljf~trimp~r~nSeries1~tmyhc~thzri~r~nSeries2~twkba~trxbg~r~nSeries3~tfcbc~teyhj~r~nSeries4~tugix~twtbv~r~nSeries1~ttreh~tbbcp~r~nSeries2~txifb~txvfb~r~nSeries3~tcgkc~tfqck~r~nSeries4~tcotz~tgkub~r~nSeries1~tmjrm~tbszt~r~nSeries2~tsshf~troef~r~nSeries3~twsjr~txjhg~r~nSeries4~tuzyu~tpzww~r~nSeries1~teiqu~trpix~r~nSeries2~tiqfl~tduuv~r~nSeries3~teoow~tqcud~r~nSeries4~thnef~tnjha~r~nSeries1~timuc~tzfsk~r~nSeries2~tuidu~tburi~r~nSeries3~tswtb~trecu~r~nSeries4~tykab~tfcvk~r~nSeries1~tdzez~ttoid~r~nSeries2~tukuh~tjzef~r~nSeries3~tczzz~tbfkq~r~nSeries4~tdpqz~tikfo~r~nSeries1~tbucd~ththx~r~nSeries2~tdjgk~tjelr~r~nSeries3~tlpax~tamce~r~nSeries4~trosw~titdp~r~nSeries1~ttpcc~tlifk~r~nSeries2~teljy~ttihr~r~nSeries3~tcqay~tbnef~r~nSeries4~txnxv~tgzed~r~nSeries1~tyyhn~tgycd~r~nSeries2~trudm~tphme~r~nSeries3~tckot~trwos~r~nSeries4~tpofg~thfoz~r~nSeries1~tqvlq~tfxww~r~nSeries2~tkmfx~tdyyg~r~nSeries3~tmdca~tszsg~r~nSeries4~tovso~tdkjg~r~nSeries1~thcwm~tbmxr~r~nSeries2~tmhuy~tfyqg~r~nSeries3~tajqk~tcklz~r~nSeries4~tnayx~tqkqo~r~nSeries1~tyzwm~tyubz~r~nSeries2~tazcp~tkhkt~r~nSeries3~tkydz~tivcu~r~nSeries4~typur~tfmbi~r~nSeries1~tsgek~tyrgz~r~nSeries2~tvxdh~tpoam~r~nSeries3~tvafy~trarx~r~nSeries4~tsvkh~ttqdi~r~nSeries1~thers~tigbh~r~nSeries2~tzjzu~tjxmm~r~nSeries3~tyspn~tarae~r~nSeries4~twkeg~tjccv~r~nSeries1~thhrj~tvbjt~r~nSeries2~tsqdj~tootg~r~nSeries3~tpknf~tpfyc~r~nSeries4~tgfie~towqr~r~nSeries1~twwwp~tzsqm~r~nSeries2~tetog~tepsp~r~nSeries3~txnvj~tiupa~r~nSeries4~tlyyn~tmkmn~r~nSeries1~tuvkl~thsec~r~nSeries2~tdwra~tcgfm~r~nSeries3~tzkgi~tpdfo~r~nSeries4~tdkjm~tjqwi~r~nSeries1~tqpuo~tqhim~r~nSeries2~tvfvu~tzwyv~r~nSeries3~tijgf~tullk~r~nSeries4~tjduh~tsjaf~r~nSeries1~tbtlk~tmfqr~r~nSeries2~tmyjf~tjnhh~r~nSeries3~tssqc~ttydt~r~nSeries4~teamd~tcjbp~r~nSeries1~trhtn~tegyi~r~nSeries2~twxgc~tjwlg~r~nSeries3~trsme~taear~r~nSeries4~twtvj~tsjba~r~nSeries1~toioj~tlwhy~r~nSeries2~tpnvr~tuiho~r~nSeries3~tswki~tfygt~r~nSeries4~tydha~tcwyh~r~nSeries1~tsgew~tzmtg~r~nSeries2~tonzl~ttjhg~r~nSeries3~tauhn~tihre~r~nSeries4~tqgjf~twkjs~r~nSeries1~tmtpj~thaef~r~nSeries2~tqzaa~tuldr~r~nSeries3~tchjc~tcdyr~r~nSeries4~tfvvr~tivuy~r~nSeries1~teegf~tivdr~r~nSeries2~tcygu~trqdr~r~nSeries3~tedak~tubnf~r~nSeries4~tgupr~toqyl~r~nSeries1~tobcw~tqxkz~r~nSeries2~tmaus~tjgmh~r~nSeries3~tcmhg~tdnmp~r~nSeries4~thnqk~tamhu~r~nSeries1~trktr~tffac~r~nSeries2~tlvgr~tzkkl~r~nSeries3~tdacl~tlteo~r~nSeries4~tjomo~tnxrq~r~nSeries1~tyjzg~tinrn~r~nSeries2~tnzwa~tcxxa~r~nSeries3~tedrw~tudxz~r~nSeries4~trfus~tewjt~r~nSeries1~tboxv~tynfh~r~nSeries2~tkstc~tenau~r~nSeries3~tmndd~txfdm~r~nSeries4~tvzca~tutdc~r~nSeries1~tckxa~taydz~r~nSeries2~tsxtt~tobbg~r~nSeries3~tqngv~tvpjg~r~nSeries4~tojog~tlmkx~r~nSeries1~tgbfc~tpypc~r~nSeries2~tkqch~tbddz~r~nSeries3~twrxb~tzmqr~r~nSeries4~tlxvo~tbtwh~r~nSeries1~txgin~tfgfr~r~nSeries2~tcclm~tznmj~r~nSeries3~tugww~tbsqf~r~nSeries4~tcihu~tbsjo~r~nSeries1~tllms~tqsgh~r~nSeries2~tmcph~telso~r~nSeries3~ttflb~tgsfn~r~nSeries4~tpcuz~tsrup~r~nSeries1~tchyn~tvzhc~r~nSeries2~tpqug~triwn~r~nSeries3~tiqxd~tfjpw~r~nSeries4~tpxfb~tlkpn~r~nSeries1~tpeel~tfjmt~r~nSeries2~tkuqp~tzomw~r~nSeries3~tnlmb~tupmk~r~nSeries4~ttlpt~tndmp~r~nSeries1~tdsyd~tsgvf~r~nSeries2~tpene~tmwbo~r~nSeries3~trifs~tuqhc~r~nSeries4~teskm~tkhss~r~nSeries1~tmvno~tnwaf~r~nSeries2~txwhg~tbiba~r~nSeries3~tbvqo~tpqfo~r~nSeries4~tvius~tsqfq~r~nSeries1~tweht~txdzu~r~nSeries2~tjtln~ttxmr~r~nSeries3~tjxxw~ttlgg~r~nSeries4~tkytb~tioly~r~nSeries1~tdnil~tqado~r~nSeries2~tjskk~tvfxa~r~nSeries3~thhjm~tbocl~r~nSeries4~tjari~tntdw~r~nSeries1~tcldv~tdxro~r~nSeries2~tpbyj~tzwyy~r~nSeries3~tojuo~tthwm~r~nSeries4~tlvrg~tlfzd~r~nSeries1~tzdbt~tubxu~r~nSeries2~toffv~tncrs~r~nSeries3~twsaz~tnmoi~r~nSeries4~tjoiv~tvgob~r~nSeries1~tqpnc~tkwvn~r~nSeries2~thkeb~tmtdh~r~nSeries3~tvygk~tjisu~r~nSeries4~txhat~tmuud~r~nSeries1~tqbhm~tknhf~r~nSeries2~txaxq~txkjl~r~nSeries3~tzzqt~tsjfa~r~nSeries4~teedf~tuujk~r~nSeries1~tolxj~toqkd~r~nSeries2~tvfep~tvlhv~r~nSeries3~thrwt~tfduk~r~nSeries4~txffj~tpssw~r~nSeries1~tyxli~tjjhe~r~nSeries2~tvryx~tozba~r~nSeries3~tfpfm~towgr~r~nSeries4~tgonu~tatdq~r~nSeries1~tlahy~tggyl~r~nSeries2~tjddj~thmlt~r~nSeries3~tedzl~todsr~r~nSeries4~tkeut~tgtnk~r~nSeries1~tntar~tjkpx~r~nSeries2~tinov~tgzdt~r~nSeries3~thunw~tooxv~r~nSeries4~tjjmp~tsvkn~r~nSeries1~thkwj~topmm~r~nSeries2~tlebk~tsucv~r~nSeries3~tzqly~tqnwc~r~nSeries4~tmbvb~thrml~r~nSeries1~towpj~tbwyv~r~nSeries2~twtgt~toqnm~r~nSeries3~ticxa~tpzar~r~nSeries4~tknnx~ttuuf~r~nSeries1~tarzr~tosdq~r~nSeries2~twsmt~tcjgh~r~nSeries3~tecqu~tdosr~r~nSeries4~ttjxy~taayk~r~nSeries1~tqrxy~tcrxu~r~nSeries2~twjxn~tpqjn~r~nSeries3~tbkcp~tdmok~r~nSeries4~talxa~tpemv~r~nSeries1~tbqlz~tsvxz~r~nSeries2~tkuta~tppwg~r~nSeries3~tzpdp~tyzkz~r~nSeries4~tcvbn~ttcvf~r~nSeries1~txsxp~tjaox~r~nSeries2~ttfhv~txxyt~r~nSeries3~tgokr~tcxae~r~nSeries4~ttauq~tgndm~r~nSeries1~tphwz~tyiay~r~nSeries2~tabjr~tqgep~r~nSeries3~tpxyj~tstty~r~nSeries4~tzuvl~tdvyb~r~nSeries1~tsuxk~tbmfz~r~nSeries2~tvrtn~tovid~r~nSeries3~tznpg~thozv~r~nSeries4~tafms~tnsnq~r~nSeries1~tivmv~tubcw~r~nSeries2~ttfsr~tqtmk~r~nSeries3~tnepb~thowe~r~nSeries4~tjazh~tkwcm~r~nSeries1~tmtpi~txxxl~r~nSeries2~tzqys~txtww~r~nSeries3~ttaid~tyaxy~r~nSeries4~tqlep~trxib~r~nSeries1~texxy~tfvsd~r~nSeries2~tdygt~thcuy~r~nSeries3~tyfwp~tjsfy~r~nSeries4~tbglg~tzmbi~r~nSeries1~tntat~ttnho~r~nSeries2~tdton~tpyzw~r~nSeries3~totkg~tngup~r~nSeries4~thpkx~teato~r~nSeries1~twzab~tsdnv~r~nSeries2~tqhkf~tcmof~r~nSeries3~tisfr~tfqgv~r~nSeries4~tpmvo~trpjf~r~nSeries1~tzslz~tmpjj~r~nSeries2~tnehr~tykxj~r~nSeries3~tzubu~taccl~r~nSeries4~tfkcy~tzobg~r~nSeries1~thtuo~txraj~r~nSeries2~tvpre~tcwgx~r~nSeries3~txpsw~tcgmm~r~nSeries4~tvede~twdmf~r~nSeries1~tnqwc~tuqds~r~nSeries2~tcili~tqeci~r~nSeries3~thlui~tlgmf~r~nSeries4~tcswt~twkkx~r~nSeries1~tlcbh~tqkvc~r~nSeries2~tswje~tbkrj~r~nSeries3~tlpgf~tgrat~r~nSeries4~tzbsg~tuvzi~r~nSeries1~tfnhy~txwjs~r~nSeries2~tjavw~tauxp~r~nSeries3~tanna~tmxjd~r~nSeries4~tvzuh~tnacz~r~nSeries1~tyhep~twzol~r~nSeries2~thusl~trkvw~r~nSeries3~tpnvg~tzmii~r~nSeries4~tzwud~twdfz~r~nSeries1~tlktb~tqdxg~r~nSeries2~tyyiu~tdsjv~r~nSeries3~tezkm~tesbj~r~nSeries4~tlkye~trtah~r~nSeries1~tnexh~tuqmj~r~nSeries2~ticbm~tusqd~r~nSeries3~tklas~tolwj~r~nSeries4~txptx~txeum~r~nSeries1~tzfwy~tucpa~r~nSeries2~tbqse~tffun~r~nSeries3~tqpkf~tnnbe~r~nSeries4~tcbbc~tjpdy~r~nSeries1~tjlib~titll~r~nSeries2~tplxe~tlrdk~r~nSeries3~texdt~tquvp~r~nSeries4~tttey~thtlq~r~nSeries1~tlbbb~tvoqo~r~nSeries2~tzkyn~tayyr~r~nSeries3~tbaqm~tyjhz~r~nSeries4~txnds~tiyfs~r~nSeries1~texwb~tioew~r~nSeries2~tqvqr~ttcdl~r~nSeries3~tpqmv~tjifv~r~nSeries4~tgymk~tgotz~r~nSeries1~tjmnz~tqtmr~r~nSeries2~tpnde~tvnmt~r~nSeries3~thjit~tsspa~r~nSeries4~tqnjr~tdoyj~r~n '

Return ls_Temp

end function

on w_rtefunw08.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rtefunw08.destroy
call super::destroy
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 
将控件内容成功保存到一个文档后或新打开文档后，Modified属性值变为false
***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Functions\Function 8 
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
String	ls_Temp,ls_Error
Integer	li_RtnVal
Integer	li_X,li_Y
long		ll_RtnVal
DataStore lds_dw

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

lds_dw = Create DataStore

if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return

if Not ab_exe then
	rte_1.ShowHeadFoot(false)
	wf_data_init(rte_1,4)
end if

Choose Case as_testpoint
	Case 'RTEFUNW08P01'
	/*
	   【功能描述】
	    Move，参数X指定为NULL

		【编码描述】
		1、初始化控件
		2、指定X为NULL调用函数
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(li_X)
			li_RtnVal = rte_1.Move(li_X,li_Y)
			wf_OutPut("FunReturn: rte_1.Move(li_X,li_Y)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW08P02'
	/*
	   【功能描述】
	    Move，参数Y指定为NULL

		【编码描述】
		1、初始化控件
		2、指定Y为NULL调用函数
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(li_Y)
			li_RtnVal = rte_1.Move(li_X,li_Y)
			wf_OutPut("FunReturn: rte_1.Move(li_X,li_Y)=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW08P03'
	/*
	   【功能描述】
	    Move，参数X、Y指定为负数

		【编码描述】
		1、初始化控件
		2、参数X、Y指定为负数，调用Move函数
		3、输出函数返回值以及控件的X、Y坐标属性

		【代码输出值描述】
		1
		
		【期望UI描述】
		控件移动
	*/
		
		if ab_exe then
			li_X = -100
			li_Y = -100
			li_RtnVal = rte_1.Move(li_X,li_Y)
			wf_OutPut("FunReturn: rte_1.Move(li_X,li_Y)=" + String(li_RtnVal),true)
			wf_OutPut("VarReturn: li_X=" + String(li_X),false)
			wf_OutPut("VarReturn: li_Y=" + String(li_Y),false)
		else
		end if
	Case 'RTEFUNW08P04'
	/*
	   【功能描述】
	    Move，参数X、Y指定为正数

		【编码描述】
		1、初始化控件
		2、参数X、Y指定为正数，调用Move函数
		3、输出函数返回值以及控件的X、Y坐标属性

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			li_X = 100
			li_Y = 100
			li_RtnVal = rte_1.Move(li_X,li_Y)
			wf_OutPut("FunReturn: rte_1.Move(li_X,li_Y)=" + String(li_RtnVal),true)
			wf_OutPut("VarReturn: li_X=" + String(li_X),false)
			wf_OutPut("VarReturn: li_Y=" + String(li_Y),false)
		else
		end if
	Case 'RTEFUNW08P05'
	/*
	   【功能描述】
	    PageCount，控件中无内容

		【编码描述】
		1、初始化控件，控件内容为空
		2、调用PageCount函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			li_RtnVal = rte_1.PageCount()
			wf_OutPut("FunReturn: rte_1.PageCount()=" + String(li_RtnVal),true)
		else
			rte_1.SelectTextAll()
			rte_1.Clear()
		end if
	Case 'RTEFUNW08P06'
	/*
	   【功能描述】
	    PageCount，控件中只有一页内容

		【编码描述】
		1、初始化控件，控件内容只有一页内容，且某行数据超过默认打印机的默认纸张宽度
		2、调用PageCount函数
		3、输出函数返回值

		【代码输出值描述】
		1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			li_RtnVal = rte_1.PageCount()
			wf_OutPut("FunReturn: rte_1.PageCount()=" + String(li_RtnVal),true)
		else
		end if
	Case 'RTEFUNW08P07'
	/*
	   【功能描述】
	    PageCount，控件中有多页内容

		【编码描述】
		1、初始化控件，控件内容有多页内容
		2、调用PageCount函数
		3、输出函数返回值

		【代码输出值描述】
		返回页数
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			li_RtnVal = rte_1.PageCount()
			wf_OutPut("FunReturn: rte_1.PageCount()=" + String(li_RtnVal),true)
		else
			rte_1.SelectTextAll()
			rte_1.Clear()
			ls_Temp = wf_GetManyPageString()
			ClipBoard(ls_Temp)
			rte_1.Paste()
		end if
	Case 'RTEFUNW08P08'
	/*
	   【功能描述】
	    PageCount，控件与DataStore共享数据，DataStore中有多页数据，每行数据不超过一页

		【编码描述】
		1、初始化控件，控件与DataStore共享数据
		2、调用PageCount函数
		3、输出函数返回值

		【代码输出值描述】
		返回1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			ls_Syntax = Gtr_Sqlserver.SyntaxFromSQL(ls_SQL,'Style(Type=grid)',ls_Error)
			lds_dw.Create(ls_Syntax,ls_Error)
			lds_dw.SetTransObject(Gtr_Sqlserver)
			lds_dw.Retrieve()
			rte_1.InputFieldInsert("emp_id")
			rte_1.ReplaceText(" ~r~n ")
			rte_1.InputFieldInsert("dep_id")
			rte_1.ReplaceText(" ~r~n ")
			rte_1.InputFieldInsert("emp_code")
			rte_1.ReplaceText(" ~r~n ")
			rte_1.InputFieldInsert("emp_name")
			rte_1.ReplaceText(" ~r~n ")
			rte_1.InputFieldInsert("emp_sex")
			rte_1.ReplaceText(" ~r~n ")
			rte_1.InputFieldInsert("emp_born")
			rte_1.ReplaceText(" ~r~n ")
			rte_1.InputFieldInsert("emp_age")
			rte_1.ReplaceText(" ~r~n ")
			rte_1.InputFieldInsert("emp_salary")
			rte_1.ReplaceText(" ~r~n ")
			
			rte_1.DataSource(lds_dw)
			
			li_RtnVal = rte_1.PageCount()
			wf_OutPut("FunReturn: rte_1.PageCount()=" + String(li_RtnVal),true)
		else
			rte_1.SelectTextAll()
			rte_1.Clear()
		end if
	Case 'RTEFUNW08P09'
	/*
	   【功能描述】
	    PageCount，控件中detail+Header+Footer三个区的数据加起来刚好超过一页

		【编码描述】
		1、初始化控件，构建控件中各区内容使得detail+Header+Footer三个区的数据加起来刚好超过一页
		2、调用PageCount函数
		3、输出函数返回值

		【代码输出值描述】
		返回2
		
		【期望UI描述】
		
	*/
		//在本测试案例中66行刚好一页
		if ab_exe then
			li_RtnVal = rte_1.PageCount()
			wf_OutPut("FunReturn: rte_1.PageCount()=" + String(li_RtnVal),true)
		else
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			
			rte_1.SelectTextAll(Header!)
			rte_1.Clear()
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			rte_1.SelectTextAll(Footer!)
			rte_1.Clear()
			
			ls_Temp = 'Series1~tnvqz~tbkat~r~nSeries2~tnefu~tlgex~r~nSeries3~tktrm~thdda~r~nSeries4~tpswp~ttfvo~r~nSeries1~tvuji~tuwbm~r~nSeries2~tibru~tcttm~r~nSeries3~trvzn~tjrch~r~nSeries4~tjwzw~tmoze~r~nSeries1~tcrzn~tjkfr~r~nSeries2~tvkrm~trdwr~r~nSeries3~toaoc~tqpkt~r~nSeries4~tlmwx~twtnu~r~nSeries1~tamqe~tlrwb~r~nSeries2~tgbij~tilnh~r~nSeries3~tiiul~tltov~r~nSeries4~tbefl~twlpb~r~nSeries1~thyff~thbav~r~nSeries2~thfua~thlin~r~nSeries3~tdjdf~tpekx~r~nSeries4~tglix~tlaxx~r~nSeries1~ttolh~tglvw~r~nSeries2~txkyv~tulcy~r~nSeries3~tjefl~tloqz~r~n '
			ClipBoard(ls_Temp)
			
			rte_1.SelectText(1,1,0,0,Header!)
			rte_1.Paste()
			
			rte_1.SelectText(1,1,0,0,Detail!)
			rte_1.Paste()
			
			rte_1.SelectText(1,1,0,0,Footer!)
			rte_1.Paste()
		end if
	Case 'RTEFUNW08P10'
	/*
	   【功能描述】
	    PageCount，控件中Header+Footer区的数据加起来超过一页

		【编码描述】
		1、初始化控件，构建控件中各区内容，使得Header+Footer两个区的数据加起来超过一页
		2、调用PageCount函数
		3、输出函数返回值

		【代码输出值描述】
		返回1
		
		【期望UI描述】
		
	*/
		
		//在本测试案例中66行刚好一页
		if ab_exe then
			li_RtnVal = rte_1.PageCount()
			wf_OutPut("FunReturn: rte_1.PageCount()=" + String(li_RtnVal),true)
		else
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			
			rte_1.SelectTextAll(Header!)
			rte_1.Clear()
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			rte_1.SelectTextAll(Footer!)
			rte_1.Clear()
			
			ls_Temp = 'Series1~tejnr~ttibv~r~nSeries2~tnjep~tfqds~r~nSeries3~tmvst~tmmww~r~nSeries4~twqkn~tnrmq~r~nSeries1~tmjcc~tpaow~r~nSeries2~tazfe~turgp~r~nSeries3~tbfry~tedqj~r~nSeries4~trltm~tymhy~r~nSeries1~tsoic~twuoh~r~nSeries2~tfere~tbeac~r~nSeries3~tazuv~tjoxy~r~nSeries4~tipms~tgufj~r~nSeries1~tiwlc~tfywx~r~nSeries2~tteyy~tqdhx~r~nSeries3~twjhi~tudgh~r~nSeries4~tyxyo~txbsc~r~nSeries1~teftd~trqel~r~nSeries2~txfvc~tfbbj~r~nSeries3~tjyfs~tvkvs~r~nSeries4~tapds~thakg~r~nSeries1~tdvhc~tfmce~r~nSeries2~tztgj~tcmhx~r~nSeries3~tlhas~tqkau~r~nSeries4~tqlnf~thggt~r~nSeries1~tagrn~tffmn~r~nSeries2~tpinw~tlexr~r~nSeries3~tqxis~tbfnh~r~nSeries4~tjzqv~toxku~r~nSeries1~tkylz~tcrup~r~nSeries2~tmiba~tcpjz~r~nSeries3~tsnac~tlmnu~r~nSeries4~tqnbd~tifzl~r~nSeries1~tujqv~tnfjx~r~nSeries2~txvkc~tzfkz~r~n '
			ClipBoard(ls_Temp)
			
			rte_1.SelectText(1,1,0,0,Header!)
			rte_1.Paste()
			
//			rte_1.SelectText(1,1,0,0,Detail!)
//			rte_1.Paste()
			
			rte_1.SelectText(1,1,0,0,Footer!)
			rte_1.Paste()
		end if
	Case 'RTEFUNW08P11'
	/*
	   【功能描述】
	    Paste，剪贴板中的数据为空

		【编码描述】
		1、初始化控件
		2、设置剪贴板中的数据为空，设置插入点，调用Paste函数
		3、输出函数返回值

		【代码输出值描述】
		返回-1 
		
		【期望UI描述】
		UI无变化
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			ll_RtnVal = rte_1.Paste()
			wf_OutPut("FunReturn: rte_1.Paste()=" + String(ll_RtnVal),true)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
		end if
	Case 'RTEFUNW08P12'
	/*
	   【功能描述】
	    Paste，将剪贴板中的数据粘帖到Detail区

		【编码描述】
		1、初始化控件
		2、设置剪贴板中的数据，设置插入点在Detail区，调用Paste函数
		3、输出函数返回值

		【代码输出值描述】
		返回粘帖的字节数
		
		【期望UI描述】
		在插入点位置粘帖了数据
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Detail!)
			ClipBoard('Series1~tzjqn~taqpo~r~nSeries2~thygj~tsjta~r~nSeries3~tkzrs~tosyq~r~nSeries4~thquh~tkjcj~r~nSeries1~tyugt~tedog~r~nSeries2~tfurk~txiyq~r~nSeries3~tufot~tiajm~r~nSeries4~twhyi~tlthm~r~nSeries1~toevl~twlrx~r~nSeries2~tpwpz~thsvb~r~nSeries3~tfzvt~tvhwy~r~nSeries4~tcfzn~tmaom~r~nSeries1~tafsy~tvyrq~r~nSeries2~tpizt~teuox~r~nSeries3~tgthf~txsmx~r~nSeries4~tjrwp~tsurs~r~nSeries1~tgwth~thilg~r~nSeries2~tdhzf~tzaxa~r~nSeries3~tdtkl~thyhq~r~nSeries4~tzfdi~tmsru~r~n ')
			ll_RtnVal = rte_1.Paste()
			wf_OutPut("FunReturn: rte_1.Paste()=" + String(ll_RtnVal),true)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
		end if
	Case 'RTEFUNW08P13'
	/*
	   【功能描述】
	    Paste，将剪贴板中的数据粘帖到Header区

		【编码描述】
		1、初始化控件
		2、设置剪贴板中的数据（含多字节字符），设置插入点在Header区，调用Paste函数
		3、输出函数返回值

		【代码输出值描述】
		返回粘帖的字节数
		
		【期望UI描述】
		在插入点位置粘帖了数据
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Header!)
			ClipBoard('Series1~tzjqn~taqpo~r~nSeries2~thygj~tsjta~r~nSeries3~tkzrs~tosyq~r~nSeries4~thquh~tkjcj~r~nSeries1~tyugt~tedog~r~nSeries2~tfurk~txiyq~r~nSeries3~tufot~tiajm~r~nSeries4~twhyi~tlthm~r~nSeries1~toevl~twlrx~r~nSeries2~tpwpz~thsvb~r~nSeries3~tfzvt~tvhwy~r~nSeries4~tcfzn~tmaom~r~nSeries1~tafsy~tvyrq~r~nSeries2~tpizt~teuox~r~nSeries3~tgthf~txsmx~r~nSeries4~tjrwp~tsurs~r~nSeries1~tgwth~thilg~r~nSeries2~tdhzf~tzaxa~r~nSeries3~tdtkl~thyhq~r~nSeries4~tzfdi~tmsru~r~n ')
			ll_RtnVal = rte_1.Paste()
			wf_OutPut("FunReturn: rte_1.Paste()=" + String(ll_RtnVal),true)
		else
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			rte_1.SelectTextAll(Header!)
			rte_1.Clear()
		end if
	Case 'RTEFUNW08P14'
	/*
	   【功能描述】
	    Paste，将剪贴板中的数据粘帖到Footer区

		【编码描述】
		1、初始化控件
		2、设置剪贴板中的数据，设置插入点在Footer区，调用Paste函数
		3、输出函数返回值

		【代码输出值描述】
		返回0
		
		【期望UI描述】
		在插入点位置粘帖了数据
	*/
		
		if ab_exe then
			rte_1.SelectText(1,1,0,0,Footer!)
			ClipBoard('Series1~tzjqn~taqpo~r~nSeries2~thygj~tsjta~r~nSeries3~tkzrs~tosyq~r~nSeries4~thquh~tkjcj~r~nSeries1~tyugt~tedog~r~nSeries2~tfurk~txiyq~r~nSeries3~tufot~tiajm~r~nSeries4~twhyi~tlthm~r~nSeries1~toevl~twlrx~r~nSeries2~tpwpz~thsvb~r~nSeries3~tfzvt~tvhwy~r~nSeries4~tcfzn~tmaom~r~nSeries1~tafsy~tvyrq~r~nSeries2~tpizt~teuox~r~nSeries3~tgthf~txsmx~r~nSeries4~tjrwp~tsurs~r~nSeries1~tgwth~thilg~r~nSeries2~tdhzf~tzaxa~r~nSeries3~tdtkl~thyhq~r~nSeries4~tzfdi~tmsru~r~n ')
			ll_RtnVal = rte_1.Paste()
			wf_OutPut("FunReturn: rte_1.Paste()=" + String(ll_RtnVal),true)
		else
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			rte_1.SelectTextAll(Footer!)
			rte_1.Clear()
		end if
	Case 'RTEFUNW08P15'
	/*
	   【功能描述】
	    Paste，粘帖时是否替换被选中的内容

		【编码描述】
		1、初始化控件
		2、设置剪贴板中的数据，高亮选中某部分含InputField和图片的内容，调用Paste函数
		3、输出函数返回值

		【代码输出值描述】
		返回粘帖的字节数
		
		【期望UI描述】
		将高亮选中部分替换为剪贴板中的内容
	*/
		
		if ab_exe then
			ll_RtnVal = rte_1.Paste()
			wf_OutPut("FunReturn: rte_1.Paste()=" + String(ll_RtnVal),true)
		else
			rte_1.SelectTextAll(Detail!)
			ClipBoard('Series1~teecx~tkqkr~r~nSeries2~tudlm~tzgdt~r~nSeries3~tnhmi~tvnnk~r~nSeries4~tclga~trygy~r~nSeries1~tdqdh~tltrs~r~nSeries2~tthid~tzyqa~r~nSeries3~tzfno~tvktq~r~nSeries4~tcotc~thcol~r~nSeries1~tinei~tytym~r~nSeries2~trjsc~tyoei~r~nSeries3~tvdyh~tphlj~r~nSeries4~tzhez~tohmi~r~nSeries1~turcp~tblvw~r~nSeries2~taaji~tqugt~r~nSeries3~taoqm~temjl~r~nSeries4~thgox~tprur~r~nSeries1~ttymk~tktdb~r~nSeries2~tnoxw~tttge~r~nSeries3~teqim~tlhcz~r~nSeries4~ttcty~tphme~r~n ')
		end if
	Case 'RTEFUNW08P16'
	/*
	   【功能描述】
	    Paste，是否能粘帖RichText格式的内容

		【编码描述】
		1、初始化控件
		2、调用Paste函数
		3、输出函数返回值

		【代码输出值描述】
		返回粘帖的文本字符数
		
		【期望UI描述】
		在插入点粘帖了除InputField、图片、RichText格式外的文本内容
	*/
		
		if ab_exe then
			ll_RtnVal = rte_1.Paste()
			wf_OutPut("FunReturn: rte_1.Paste()=" + String(ll_RtnVal),true)
		else
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ClipBoard("{\rtf1\ansi\ansicpg1252\uc2 \deff0\deflang1033\deflangfe1033{\fonttbl{\f0\froman\fcharset0\fprq2{\*\panose 02020603050405020304}Times New Roman;}{\f17\fnil\fcharset134\fprq2{\*\panose 02010600030101010101}\'cb\'ce\'cc\'e5{\*\falt SimSun};}~r~n{\f28\fnil\fcharset134\fprq2{\*\panose 02010600030101010101}@\'cb\'ce\'cc\'e5;}{\f29\froman\fcharset238\fprq2 Times New Roman CE;}{\f30\froman\fcharset204\fprq2 Times New Roman Cyr;}{\f32\froman\fcharset161\fprq2 Times New Roman Greek;}~r~n{\f33\froman\fcharset162\fprq2 Times New Roman Tur;}{\f34\froman\fcharset177\fprq2 Times New Roman (Hebrew);}{\f35\froman\fcharset178\fprq2 Times New Roman (Arabic);}{\f36\froman\fcharset186\fprq2 Times New Roman Baltic;}~r~n{\f167\fnil\fcharset0\fprq2 SimSun Western{\*\falt SimSun};}{\f255\fnil\fcharset0\fprq2 @\'cb\'ce\'cc\'e5 Western;}}{\colortbl;\red0\green0\blue0;\red0\green0\blue255;\red0\green255\blue255;\red0\green255\blue0;\red255\green0\blue255;\red255\green0\blue0;~r~n\red255\green255\blue0;\red255\green255\blue255;\red0\green0\blue128;\red0\green128\blue128;\red0\green128\blue0;\red128\green0\blue128;\red128\green0\blue0;\red128\green128\blue0;\red128\green128\blue128;\red192\green192\blue192;}{\stylesheet{~r~n\ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 \fs22\cf1\lang1033\langfe2052\loch\f17\hich\af17\dbch\af17\cgrid\langnp1033\langfenp2052 \snext0 Normal;}{\*\cs10 \additive Default Paragraph Font;}}{\info~r~n{\title Tjokdrelkdfaslk;sdf}{\author appeon}{\operator appeon}{\creatim\yr2005\mo6\dy25\hr10\min28}{\revtim\yr2005\mo6\dy25\hr10\min29}{\version1}{\edmins1}{\nofpages1}{\nofwords0}{\nofchars0}{\*\company appeon}{\nofcharsws0}{\vern8269}}~r~n\paperw12240\paperh15840\margl1800\margr1800\margt1440\margb1440\gutter0 \widowctrl\ftnbj\aenddoc\noxlattoyen\expshrtn\noultrlspc\dntblnsbdb\nospaceforul\formshade\horzdoc\dgmargin\dghspace180\dgvspace180\dghorigin1800\dgvorigin1440\dghshow1\dgvshow1~r~n\jexpand\viewkind1\viewscale100\pgbrdrhead\pgbrdrfoot\splytwnine\ftnlytwnine\htmautsp\nolnhtadjtbl\useltbaln\alntblind\lytcalctblwd\lyttblrtgr\lnbrkrule \fet0\sectd \linex0\endnhere\sectlinegrid360\sectdefaultcl {\*\pnseclvl1~r~n\pnucrm\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl2\pnucltr\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl3\pndec\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl4\pnlcltr\pnstart1\pnindent720\pnhang{\pntxta \hich )}}~r~n{\*\pnseclvl5\pndec\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl6\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl7\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}~r~n{\*\pnseclvl8\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl9\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}\pard\plain \ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 ~r~n\fs22\cf1\lang1033\langfe2052\loch\af17\hich\af17\dbch\af17\cgrid\langnp1033\langfenp2052 {\hich\af17\dbch\af17\loch\f17 T\hich\af17\dbch\af17\loch\f17 jokdrelkdfaslk;\hich\af17\dbch\af17\loch\f17 sdf~r~n\par }}")
		end if
End Choose
if ab_exe then
	wf_postrun(al_row)
end if

Destroy lds_dw
end event

event open;call super::open;n_cst_config  lnv_res


if not lnv_res.of_createFile("PUB_BMP_APB.bmp",gtr_frame) then
	messagebox("提示信息","下载图片失败")
end if




end event

event close;call super::close;
if FileExists("PUB_BMP_APB.bmp") then
	FileDelete("PUB_BMP_APB.bmp")
end if
end event

type mle_phenomena from w_templet`mle_phenomena within w_rtefunw08
end type

type cb_autoparse from w_templet`cb_autoparse within w_rtefunw08
end type

type cb_wrrun from w_templet`cb_wrrun within w_rtefunw08
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rtefunw08
end type

type dw_info from w_templet`dw_info within w_rtefunw08
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rtefunw08
end type

type pb_runnext from w_templet`pb_runnext within w_rtefunw08
end type

type pb_runall from w_templet`pb_runall within w_rtefunw08
end type

type pb_run from w_templet`pb_run within w_rtefunw08
end type

type pb_end from w_templet`pb_end within w_rtefunw08
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rtefunw08
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rtefunw08
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rtefunw08
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rtefunw08
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rtefunw08
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rtefunw08
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rtefunw08
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rtefunw08
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rtefunw08
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rtefunw08
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rtefunw08
end type

type rte_1 from richtextedit within w_rtefunw08
integer x = 27
integer y = 32
integer width = 2921
integer height = 1288
integer taborder = 10
boolean bringtotop = true
boolean init_headerfooter = true
borderstyle borderstyle = stylelowered!
end type

