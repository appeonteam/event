$PBExportHeader$w_rteevtw01.srw
forward
global type w_rteevtw01 from w_templet
end type
type rte_1 from richtextedit within w_rteevtw01
end type
type cb_1 from commandbutton within w_rteevtw01
end type
end forward

global type w_rteevtw01 from w_templet
string title = "Event 1"
rte_1 rte_1
cb_1 cb_1
end type
global w_rteevtw01 w_rteevtw01

type variables
Long	il_KeyRtn,il_FileExists,il_PrintFooter,il_PrintHeader
end variables

forward prototypes
public subroutine wf_getmodify ()
public subroutine wf_data_init (richtextedit ar_rich, integer ai_sign)
end prototypes

public subroutine wf_getmodify ();wf_OutPut("VarReturn: rte_1.Modified = " + String(rte_1.Modified),true)
end subroutine

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
end subroutine

on w_rteevtw01.create
int iCurrent
call super::create
this.rte_1=create rte_1
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
this.Control[iCurrent+2]=this.cb_1
end on

on w_rteevtw01.destroy
call super::destroy
destroy(this.rte_1)
destroy(this.cb_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 
Modify为false时测试对控件内容做修改是否会触发Modified事件
【编码描述】
1、初始时Modify为false,在Modified事件中写入信息输出代码以及post 一函数输出Modify的值
2、改变Modify为false
3、输出Modify的值
***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Events\Event 1 
Pbl Name:     
Designer:     ouyangwu
Coder:        WuZhiJun(2005-06-23)
DocReviewer:  
CoderReviewer:
【功能描述】
测试RichTextEdit控件的事件触发

【窗口对象】

【编码注意事项】
再各事件中添加信息输出代码，包括其参数输出

【测试注意事项】
 
***********************/
if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return 

Choose Case as_testpoint
	Case 'RTEEVTW01P01'
	/*
	   【功能描述】
	    Constructor

		【编码描述】
		1、在Constructor中写入信息输出代码
		2、查看窗口打开时的输出信息

		【代码输出值描述】
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.TriggerEvent(Constructor!)
		else
		end if
	Case 'RTEEVTW01P02'
	/*
	   【功能描述】
	    Destructor

		【编码描述】
		1、在Destructor事件中写入信息弹出代码（MessageBox）
		2、在窗口关闭时查看是否触发该事件

		【代码输出值描述】
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.TriggerEvent(Destructor!)
		else
		end if
	Case 'RTEEVTW01P03'
	/*
	   【功能描述】
	    DoubleClicked

		【编码描述】
		1、在DoubleClicked事件中写入信息输出代码
		

		【代码输出值描述】
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.TriggerEvent(DoubleClicked!)
		else
		end if
	Case 'RTEEVTW01P04'
	/*
	   【功能描述】
	    拖拽事件

		【编码描述】
		1、在DragDrop\DragEnter\DragLeave\Dragwithin事件中写入信息输出代码
		2、设置RichTextEdit控件Dragauto为true，再放置另一个非RichTextEdit控件，其Dragauto也为true

		【代码输出值描述】
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.DragAuto = true
			cb_1.DragAuto = true
		else
		end if
	Case 'RTEEVTW01P05'
	/*
	   【功能描述】
	    GetFocus

		【编码描述】
		1、在GetFocus事件中写入信息输出代码
		

		【代码输出值描述】
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.TriggerEvent(GetFocus!)
		else
		end if
	Case 'RTEEVTW01P06'
	/*
	   【功能描述】
	    Key，返回0

		【编码描述】
		1、在Key事件中写入信息输出代码,返回0
		

		【代码输出值描述】
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			il_KeyRtn = 0
			rte_1.TriggerEvent(Key!)
		else
		end if
	Case 'RTEEVTW01P07'
	/*
	   【功能描述】
	    Key，返回非0

		【编码描述】
		1、在Key事件中写入信息输出代码,返回1
		

		【代码输出值描述】
		
		
		
		【期望UI描述】
		将不处理所按的键
	*/
		
		if ab_exe then
			il_KeyRtn = 1
			rte_1.TriggerEvent(Key!)
		else
		end if
	Case 'RTEEVTW01P08'
	/*
	   【功能描述】
	    LoseFocus

		【编码描述】
		1、在LoseFocus事件中写入信息输出代码
		

		【代码输出值描述】
		
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.TriggerEvent(LoseFocus!)
		else
		end if
	Case 'RTEEVTW01P09'
	/*
	   【功能描述】
	    MouseDown

		【编码描述】
		1、在MouseDown事件中写入信息输出代码
		

		【代码输出值描述】
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.TriggerEvent(MouseDown!)
		else
		end if
	Case 'RTEEVTW01P10'
	/*
	   【功能描述】
	    MouseMove

		【编码描述】
		1、在MouseMove事件中写入信息输出代码
		

		【代码输出值描述】
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.TriggerEvent(MouseMove!)
		else
		end if
	Case 'RTEEVTW01P11'
	/*
	   【功能描述】
	    MouseUp

		【编码描述】
		1、在MouseUp事件中写入信息输出代码
		

		【代码输出值描述】
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.TriggerEvent(MouseUp!)
		else
		end if
	Case 'RTEEVTW01P12'
	/*
	   【功能描述】
	    RButtonDown,Popmenu为False

		【编码描述】
		1、在RButtonDown事件中写入信息输出代码
		2、初始设置Popmenu为False

		【代码输出值描述】
		
		【期望UI描述】
		触发事件
	*/
		
		if ab_exe then
			rte_1.TriggerEvent(RButtonDown!)
		else
			rte_1.Popmenu = false
		end if
	Case 'RTEEVTW01P13'
	/*
	   【功能描述】
	    RButtonUp，Popmenu为False

		【编码描述】
		1、在RButtonUp事件中写入信息输出代码
		2、初始设置Popmenu为False

		【代码输出值描述】
		
		【期望UI描述】
		触发事件
	*/
		
		if ab_exe then
			rte_1.TriggerEvent(RButtonUp!)
		else
			rte_1.Popmenu = false
		end if
	Case 'RTEEVTW01P14'
	/*
	   【功能描述】
	    RButtonDown,Popmenu为true

		【编码描述】
		1、在RButtonDown事件中写入信息输出代码
		2、初始设置Popmenu为true

		【代码输出值描述】
		
		【期望UI描述】
		不触发事件，弹出右键菜单
	*/
		
		if ab_exe then
			rte_1.TriggerEvent(RButtonDown!)
		else
			rte_1.Popmenu = true
		end if
	Case 'RTEEVTW01P15'
	/*
	   【功能描述】
	    RButtonUp，Popmenu为true

		【编码描述】
		1、在RButtonUp事件中写入信息输出代码
		2、初始设置Popmenu为true

		【代码输出值描述】
		
		【期望UI描述】
		不触发事件，弹出右键菜单
	*/
		
		if ab_exe then
			rte_1.TriggerEvent(RButtonUp!)
		else
			rte_1.Popmenu = true
		end if
	Case 'RTEEVTW01P16'
	/*
	   【功能描述】
	    FileExists,事件返回0

		【编码描述】
		1、在FileExists事件中写入信息输出代码,Return 0
		2、在当前目录创建一个文件
		3、使用SaveDocument函数保存控件中的内容到该文件
		

		【代码输出值描述】
		
		【期望UI描述】
		控件内容仍然被保存到该文件中
	*/
		
		if ab_exe then
			il_FileExists = 0
			rte_1.TriggerEvent(FileExists!)
			rte_1.SaveDocument(as_testpoint + ".txt",FileTypeText!)
		else
			
		end if
	Case 'RTEEVTW01P17'
	/*
	   【功能描述】
	    FileExists,事件返回非0

		【编码描述】
		1、在FileExists事件中写入信息输出代码,Return 1
		2、在当前目录创建一个文件
		3、使用SaveDocument函数保存控件中的内容到该文件
		

		【代码输出值描述】
		
		【期望UI描述】
		控件内容没有被保存到该文件中
		保存失败
	*/
		
		if ab_exe then
			il_FileExists = 1
			rte_1.TriggerEvent(FileExists!)
			rte_1.SaveDocument(as_testpoint + ".txt",FileTypeText!)
		else
			
		end if
	Case 'RTEEVTW01P18'
	/*
	   【功能描述】
	    InputFieldSelected

		【编码描述】
		1、在InputFieldSelected事件中写入信息输出代码
		2、插入几个InputField

		【代码输出值描述】
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.TriggerEvent(InputFieldSelected!)
			rte_1.InputFieldInsert("WuZhiJun")
			rte_1.InputFieldInsert("YuRu")
		else
			
		end if
	Case 'RTEEVTW01P19'
	/*
	   【功能描述】
	    PictureSelected

		【编码描述】
		1、在PictureSelected事件中写入信息输出代码
		2、插入一个图片

		【代码输出值描述】
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.TriggerEvent(PictureSelected!)
			rte_1.InsertPicture("PUB_BMP_AJE.bmp")
		else
			wf_data_init(rte_1,4)
		end if
	Case 'RTEEVTW01P20'
	/*
	   【功能描述】
	    PrintFooter，返回0

		【编码描述】
		1、在PrintFooter事件中写入信息输出代码，返回0
		2、拷贝两页的内容到控件中
		3、再拷贝数据到页脚
		4、打印控件内容

		【代码输出值描述】
		
		【期望UI描述】
		打印该页脚内容
	*/
		
		if ab_exe then
			il_PrintFooter = 0
			rte_1.TriggerEvent(PrintFooter!)
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			
			rte_1.SelectText(1,1,0,0,Detail!)
			ClipBoard('Series1~tphwz~tyiay~r~nSeries2~tabjr~tqgep~r~nSeries3~tpxyj~tstty~r~nSeries4~tzuvl~tdvyb~r~nSeries1~tsuxk~tbmfz~r~nSeries2~tvrtn~tovid~r~nSeries3~tznpg~thozv~r~nSeries4~tafms~tnsnq~r~nSeries1~tivmv~tubcw~r~nSeries2~ttfsr~tqtmk~r~nSeries3~tnepb~thowe~r~nSeries4~tjazh~tkwcm~r~nSeries1~tmtpi~txxxl~r~nSeries2~tzqys~txtww~r~nSeries3~ttaid~tyaxy~r~nSeries4~tqlep~trxib~r~nSeries1~texxy~tfvsd~r~nSeries2~tdygt~thcuy~r~nSeries3~tyfwp~tjsfy~r~nSeries4~tbglg~tzmbi~r~nSeries1~tntat~ttnho~r~nSeries2~tdton~tpyzw~r~nSeries3~totkg~tngup~r~nSeries4~thpkx~teato~r~nSeries1~twzab~tsdnv~r~nSeries2~tqhkf~tcmof~r~nSeries3~tisfr~tfqgv~r~nSeries4~tpmvo~trpjf~r~nSeries1~tzslz~tmpjj~r~nSeries2~tnehr~tykxj~r~nSeries3~tzubu~taccl~r~nSeries4~tfkcy~tzobg~r~nSeries1~thtuo~txraj~r~nSeries2~tvpre~tcwgx~r~nSeries3~txpsw~tcgmm~r~nSeries4~tvede~twdmf~r~nSeries1~tnqwc~tuqds~r~nSeries2~tcili~tqeci~r~nSeries3~thlui~tlgmf~r~nSeries4~tcswt~twkkx~r~nSeries1~tlcbh~tqkvc~r~nSeries2~tswje~tbkrj~r~nSeries3~tlpgf~tgrat~r~nSeries4~tzbsg~tuvzi~r~nSeries1~tfnhy~txwjs~r~nSeries2~tjavw~tauxp~r~nSeries3~tanna~tmxjd~r~nSeries4~tvzuh~tnacz~r~nSeries1~tyhep~twzol~r~nSeries2~thusl~trkvw~r~nSeries3~tpnvg~tzmii~r~nSeries4~tzwud~twdfz~r~nSeries1~tlktb~tqdxg~r~nSeries2~tyyiu~tdsjv~r~nSeries3~tezkm~tesbj~r~nSeries4~tlkye~trtah~r~nSeries1~tnexh~tuqmj~r~nSeries2~ticbm~tusqd~r~nSeries3~tklas~tolwj~r~nSeries4~txptx~txeum~r~nSeries1~tzfwy~tucpa~r~nSeries2~tbqse~tffun~r~nSeries3~tqpkf~tnnbe~r~nSeries4~tcbbc~tjpdy~r~nSeries1~tjlib~titll~r~nSeries2~tplxe~tlrdk~r~nSeries3~texdt~tquvp~r~nSeries4~tttey~thtlq~r~nSeries1~tlbbb~tvoqo~r~nSeries2~tzkyn~tayyr~r~nSeries3~tbaqm~tyjhz~r~nSeries4~txnds~tiyfs~r~nSeries1~texwb~tioew~r~nSeries2~tqvqr~ttcdl~r~nSeries3~tpqmv~tjifv~r~nSeries4~tgymk~tgotz~r~nSeries1~tjmnz~tqtmr~r~nSeries2~tpnde~tvnmt~r~nSeries3~thjit~tsspa~r~nSeries4~tqnjr~tdoyj~r~nSeries1~twpya~ttmle~r~nSeries2~tyqsv~tkpam~r~nSeries3~tsvbm~tvxrl~r~nSeries4~tlivf~tedkj~r~nSeries1~tigav~tyxjv~r~nSeries2~teqvr~tbacu~r~nSeries3~tigai~tpyhb~r~nSeries4~tbxip~tbznc~r~nSeries1~twhrb~tliri~r~nSeries2~tzxoq~tptqq~r~nSeries3~tweaa~tfjeq~r~nSeries4~tiozp~tyfau~r~nSeries1~tuqmv~thxkm~r~nSeries2~tnxms~tyamp~r~nSeries3~ttlza~tnotl~r~nSeries4~tslwu~thtfq~r~nSeries1~tjrrw~tbwhm~r~nSeries2~tqhzk~thdkc~r~nSeries3~trfvb~teiyi~r~nSeries4~tpvfv~tpzhy~r~nSeries1~tujab~ttqww~r~nSeries2~ttbkd~togke~r~nSeries3~tmhib~tyxrn~r~nSeries4~txsxr~tzlet~r~nSeries1~tbqex~tkrqo~r~nSeries2~tiern~taplq~r~nSeries3~tyjpq~toubv~r~nSeries4~tjseb~talwn~r~nSeries1~tksvl~toidz~r~nSeries2~tfpir~twycz~r~nSeries3~ttwzz~tvewx~r~nSeries4~totak~tudkp~r~nSeries1~tedup~tkczl~r~nSeries2~thwus~tkdne~r~nSeries3~tvdcp~tlbkl~r~nSeries4~tpjmp~tfdcy~r~nSeries1~tqtrc~tvvvt~r~nSeries2~trffv~tpekk~r~nSeries3~tqmcu~tpryj~r~nSeries4~taute~tuvcz~r~nSeries1~tvict~thrxs~r~nSeries2~txclp~trgdl~r~nSeries3~twxfa~tigay~r~nSeries4~truei~tcufd~r~nSeries1~tiamh~ttkbx~r~nSeries2~totdi~trxxg~r~nSeries3~tvzqm~teyro~r~nSeries4~tvfic~thqni~r~nSeries1~tvfjz~tauqf~r~nSeries2~tdftg~tmops~r~nSeries3~trgpu~tgxtu~r~nSeries4~thlcv~tspih~r~nSeries1~tazrs~tsfsz~r~nSeries2~twxbq~tmurw~r~nSeries3~tmxcd~tbhum~r~nSeries4~trgjq~tmvnk~r~nSeries1~tyrtn~tsjvw~r~nSeries2~tzxss~tqxnj~r~nSeries3~tomuy~tjnju~r~nSeries4~twrsy~txwqy~r~nSeries1~tyxcs~tzpok~r~nSeries2~tlwjd~trltb~r~nSeries3~tscie~tdpiw~r~nSeries4~tlaqi~tgesj~r~nSeries1~tsqhs~tjlrg~r~nSeries2~tlmwa~tnrxr~r~nSeries3~tfnwa~tkztg~r~nSeries4~tjhxa~tunfq~r~nSeries1~tjvxi~tohnj~r~nSeries2~tqrjs~thymd~r~nSeries3~tovwg~tefhj~r~nSeries4~tesvh~ttizi~r~nSeries1~tojlj~tdpmo~r~nSeries2~txbyu~tyopq~r~nSeries3~tjkzt~tvjgk~r~nSeries4~twxke~twpzh~r~nSeries1~tbjsu~tthsy~r~nSeries2~toefj~tgwwy~r~nSeries3~teozl~tuhmg~r~nSeries4~tabbs~tqrhc~r~nSeries1~trtxm~tjvca~r~nSeries2~txxsu~tfahy~r~nSeries3~tyayz~tkhuh~r~nSeries4~tjrjs~tvoqh~r~nSeries1~ttydw~tpbsz~r~nSeries2~txsbz~tiyrv~r~nSeries3~tgqml~tunws~r~nSeries4~tcpir~tzfcb~r~nSeries1~ttsep~tlkgw~r~nSeries2~tfkhr~touoy~r~nSeries3~tsrwm~tqoja~r~nSeries4~thyqm~tfevs~r~nSeries1~tdcom~tryhg~r~nSeries2~tdmlx~tukwy~r~nSeries3~tzcpr~tskwg~r~nSeries4~txuls~tuckb~r~nSeries1~tsepj~teisz~r~nSeries2~tsgce~tzwap~r~nSeries3~tqrvl~twigr~r~nSeries4~tovjc~tdzxx~r~nSeries1~tphql~tsrzi~r~nSeries2~thmgz~trioq~r~nSeries3~trqet~tkzfb~r~nSeries4~tldji~temsf~r~nSeries1~tzbhz~tfnwy~r~nSeries2~twmxx~tgdpy~r~nSeries3~tlrax~tglmt~r~nSeries4~tbiyl~tbhcw~r~nSeries1~thlsy~toyhg~r~nSeries2~tmgop~tprza~r~nSeries3~txqmo~tmsyh~r~nSeries4~tgagi~tupjq~r~nSeries1~tbzxt~thtop~r~nSeries2~totmi~ttnqw~r~nSeries3~ttoet~tonxw~r~nSeries4~tzghu~ttifk~r~nSeries1~tlgkl~trnuw~r~nSeries2~tkmsy~tqcpu~r~nSeries3~tivah~tqatm~r~nSeries4~tsckm~taalk~r~n ')
			rte_1.Paste()
			
			rte_1.SelectText(1,1,0,0,footer!)
			ClipBoard('YuRu')
			rte_1.Paste()
			
			rte_1.Print(1,'',true,true)
		else
			
		end if
	Case 'RTEEVTW01P21'
	/*
	   【功能描述】
	    PrintFooter，返回非0

		【编码描述】
		1、在PrintFooter事件中写入信息输出代码，返回1
		2、拷贝两页的内容到控件中
		3、再拷贝数据到页脚
		4、打印控件内容

		【代码输出值描述】
		
		
		
		【期望UI描述】
		不打印该页脚内容
	*/
		
		if ab_exe then
			il_PrintFooter = 1
			rte_1.TriggerEvent(PrintFooter!)
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			
			rte_1.SelectText(1,1,0,0,Detail!)
			ClipBoard('Series1~tphwz~tyiay~r~nSeries2~tabjr~tqgep~r~nSeries3~tpxyj~tstty~r~nSeries4~tzuvl~tdvyb~r~nSeries1~tsuxk~tbmfz~r~nSeries2~tvrtn~tovid~r~nSeries3~tznpg~thozv~r~nSeries4~tafms~tnsnq~r~nSeries1~tivmv~tubcw~r~nSeries2~ttfsr~tqtmk~r~nSeries3~tnepb~thowe~r~nSeries4~tjazh~tkwcm~r~nSeries1~tmtpi~txxxl~r~nSeries2~tzqys~txtww~r~nSeries3~ttaid~tyaxy~r~nSeries4~tqlep~trxib~r~nSeries1~texxy~tfvsd~r~nSeries2~tdygt~thcuy~r~nSeries3~tyfwp~tjsfy~r~nSeries4~tbglg~tzmbi~r~nSeries1~tntat~ttnho~r~nSeries2~tdton~tpyzw~r~nSeries3~totkg~tngup~r~nSeries4~thpkx~teato~r~nSeries1~twzab~tsdnv~r~nSeries2~tqhkf~tcmof~r~nSeries3~tisfr~tfqgv~r~nSeries4~tpmvo~trpjf~r~nSeries1~tzslz~tmpjj~r~nSeries2~tnehr~tykxj~r~nSeries3~tzubu~taccl~r~nSeries4~tfkcy~tzobg~r~nSeries1~thtuo~txraj~r~nSeries2~tvpre~tcwgx~r~nSeries3~txpsw~tcgmm~r~nSeries4~tvede~twdmf~r~nSeries1~tnqwc~tuqds~r~nSeries2~tcili~tqeci~r~nSeries3~thlui~tlgmf~r~nSeries4~tcswt~twkkx~r~nSeries1~tlcbh~tqkvc~r~nSeries2~tswje~tbkrj~r~nSeries3~tlpgf~tgrat~r~nSeries4~tzbsg~tuvzi~r~nSeries1~tfnhy~txwjs~r~nSeries2~tjavw~tauxp~r~nSeries3~tanna~tmxjd~r~nSeries4~tvzuh~tnacz~r~nSeries1~tyhep~twzol~r~nSeries2~thusl~trkvw~r~nSeries3~tpnvg~tzmii~r~nSeries4~tzwud~twdfz~r~nSeries1~tlktb~tqdxg~r~nSeries2~tyyiu~tdsjv~r~nSeries3~tezkm~tesbj~r~nSeries4~tlkye~trtah~r~nSeries1~tnexh~tuqmj~r~nSeries2~ticbm~tusqd~r~nSeries3~tklas~tolwj~r~nSeries4~txptx~txeum~r~nSeries1~tzfwy~tucpa~r~nSeries2~tbqse~tffun~r~nSeries3~tqpkf~tnnbe~r~nSeries4~tcbbc~tjpdy~r~nSeries1~tjlib~titll~r~nSeries2~tplxe~tlrdk~r~nSeries3~texdt~tquvp~r~nSeries4~tttey~thtlq~r~nSeries1~tlbbb~tvoqo~r~nSeries2~tzkyn~tayyr~r~nSeries3~tbaqm~tyjhz~r~nSeries4~txnds~tiyfs~r~nSeries1~texwb~tioew~r~nSeries2~tqvqr~ttcdl~r~nSeries3~tpqmv~tjifv~r~nSeries4~tgymk~tgotz~r~nSeries1~tjmnz~tqtmr~r~nSeries2~tpnde~tvnmt~r~nSeries3~thjit~tsspa~r~nSeries4~tqnjr~tdoyj~r~nSeries1~twpya~ttmle~r~nSeries2~tyqsv~tkpam~r~nSeries3~tsvbm~tvxrl~r~nSeries4~tlivf~tedkj~r~nSeries1~tigav~tyxjv~r~nSeries2~teqvr~tbacu~r~nSeries3~tigai~tpyhb~r~nSeries4~tbxip~tbznc~r~nSeries1~twhrb~tliri~r~nSeries2~tzxoq~tptqq~r~nSeries3~tweaa~tfjeq~r~nSeries4~tiozp~tyfau~r~nSeries1~tuqmv~thxkm~r~nSeries2~tnxms~tyamp~r~nSeries3~ttlza~tnotl~r~nSeries4~tslwu~thtfq~r~nSeries1~tjrrw~tbwhm~r~nSeries2~tqhzk~thdkc~r~nSeries3~trfvb~teiyi~r~nSeries4~tpvfv~tpzhy~r~nSeries1~tujab~ttqww~r~nSeries2~ttbkd~togke~r~nSeries3~tmhib~tyxrn~r~nSeries4~txsxr~tzlet~r~nSeries1~tbqex~tkrqo~r~nSeries2~tiern~taplq~r~nSeries3~tyjpq~toubv~r~nSeries4~tjseb~talwn~r~nSeries1~tksvl~toidz~r~nSeries2~tfpir~twycz~r~nSeries3~ttwzz~tvewx~r~nSeries4~totak~tudkp~r~nSeries1~tedup~tkczl~r~nSeries2~thwus~tkdne~r~nSeries3~tvdcp~tlbkl~r~nSeries4~tpjmp~tfdcy~r~nSeries1~tqtrc~tvvvt~r~nSeries2~trffv~tpekk~r~nSeries3~tqmcu~tpryj~r~nSeries4~taute~tuvcz~r~nSeries1~tvict~thrxs~r~nSeries2~txclp~trgdl~r~nSeries3~twxfa~tigay~r~nSeries4~truei~tcufd~r~nSeries1~tiamh~ttkbx~r~nSeries2~totdi~trxxg~r~nSeries3~tvzqm~teyro~r~nSeries4~tvfic~thqni~r~nSeries1~tvfjz~tauqf~r~nSeries2~tdftg~tmops~r~nSeries3~trgpu~tgxtu~r~nSeries4~thlcv~tspih~r~nSeries1~tazrs~tsfsz~r~nSeries2~twxbq~tmurw~r~nSeries3~tmxcd~tbhum~r~nSeries4~trgjq~tmvnk~r~nSeries1~tyrtn~tsjvw~r~nSeries2~tzxss~tqxnj~r~nSeries3~tomuy~tjnju~r~nSeries4~twrsy~txwqy~r~nSeries1~tyxcs~tzpok~r~nSeries2~tlwjd~trltb~r~nSeries3~tscie~tdpiw~r~nSeries4~tlaqi~tgesj~r~nSeries1~tsqhs~tjlrg~r~nSeries2~tlmwa~tnrxr~r~nSeries3~tfnwa~tkztg~r~nSeries4~tjhxa~tunfq~r~nSeries1~tjvxi~tohnj~r~nSeries2~tqrjs~thymd~r~nSeries3~tovwg~tefhj~r~nSeries4~tesvh~ttizi~r~nSeries1~tojlj~tdpmo~r~nSeries2~txbyu~tyopq~r~nSeries3~tjkzt~tvjgk~r~nSeries4~twxke~twpzh~r~nSeries1~tbjsu~tthsy~r~nSeries2~toefj~tgwwy~r~nSeries3~teozl~tuhmg~r~nSeries4~tabbs~tqrhc~r~nSeries1~trtxm~tjvca~r~nSeries2~txxsu~tfahy~r~nSeries3~tyayz~tkhuh~r~nSeries4~tjrjs~tvoqh~r~nSeries1~ttydw~tpbsz~r~nSeries2~txsbz~tiyrv~r~nSeries3~tgqml~tunws~r~nSeries4~tcpir~tzfcb~r~nSeries1~ttsep~tlkgw~r~nSeries2~tfkhr~touoy~r~nSeries3~tsrwm~tqoja~r~nSeries4~thyqm~tfevs~r~nSeries1~tdcom~tryhg~r~nSeries2~tdmlx~tukwy~r~nSeries3~tzcpr~tskwg~r~nSeries4~txuls~tuckb~r~nSeries1~tsepj~teisz~r~nSeries2~tsgce~tzwap~r~nSeries3~tqrvl~twigr~r~nSeries4~tovjc~tdzxx~r~nSeries1~tphql~tsrzi~r~nSeries2~thmgz~trioq~r~nSeries3~trqet~tkzfb~r~nSeries4~tldji~temsf~r~nSeries1~tzbhz~tfnwy~r~nSeries2~twmxx~tgdpy~r~nSeries3~tlrax~tglmt~r~nSeries4~tbiyl~tbhcw~r~nSeries1~thlsy~toyhg~r~nSeries2~tmgop~tprza~r~nSeries3~txqmo~tmsyh~r~nSeries4~tgagi~tupjq~r~nSeries1~tbzxt~thtop~r~nSeries2~totmi~ttnqw~r~nSeries3~ttoet~tonxw~r~nSeries4~tzghu~ttifk~r~nSeries1~tlgkl~trnuw~r~nSeries2~tkmsy~tqcpu~r~nSeries3~tivah~tqatm~r~nSeries4~tsckm~taalk~r~n ')
			rte_1.Paste()
			
			rte_1.SelectText(1,1,0,0,footer!)
			ClipBoard('YuRu')
			rte_1.Paste()
			
			rte_1.Print(1,'',true,true)
		else
			
		end if
	Case 'RTEEVTW01P22'
	/*
	   【功能描述】
	    PrintHeader，返回0

		【编码描述】
		1、在PrintHeader事件中写入信息输出代码，返回0
		2、拷贝两页的内容到控件中
		3、再拷贝数据到页眉
		4、打印控件内容

		【代码输出值描述】
		
		【期望UI描述】
		打印该页眉内容
	*/
		
		if ab_exe then
			il_PrintFooter = 0
			rte_1.TriggerEvent(PrintHeader!)
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			
			rte_1.SelectText(1,1,0,0,Detail!)
			ClipBoard('Series1~tphwz~tyiay~r~nSeries2~tabjr~tqgep~r~nSeries3~tpxyj~tstty~r~nSeries4~tzuvl~tdvyb~r~nSeries1~tsuxk~tbmfz~r~nSeries2~tvrtn~tovid~r~nSeries3~tznpg~thozv~r~nSeries4~tafms~tnsnq~r~nSeries1~tivmv~tubcw~r~nSeries2~ttfsr~tqtmk~r~nSeries3~tnepb~thowe~r~nSeries4~tjazh~tkwcm~r~nSeries1~tmtpi~txxxl~r~nSeries2~tzqys~txtww~r~nSeries3~ttaid~tyaxy~r~nSeries4~tqlep~trxib~r~nSeries1~texxy~tfvsd~r~nSeries2~tdygt~thcuy~r~nSeries3~tyfwp~tjsfy~r~nSeries4~tbglg~tzmbi~r~nSeries1~tntat~ttnho~r~nSeries2~tdton~tpyzw~r~nSeries3~totkg~tngup~r~nSeries4~thpkx~teato~r~nSeries1~twzab~tsdnv~r~nSeries2~tqhkf~tcmof~r~nSeries3~tisfr~tfqgv~r~nSeries4~tpmvo~trpjf~r~nSeries1~tzslz~tmpjj~r~nSeries2~tnehr~tykxj~r~nSeries3~tzubu~taccl~r~nSeries4~tfkcy~tzobg~r~nSeries1~thtuo~txraj~r~nSeries2~tvpre~tcwgx~r~nSeries3~txpsw~tcgmm~r~nSeries4~tvede~twdmf~r~nSeries1~tnqwc~tuqds~r~nSeries2~tcili~tqeci~r~nSeries3~thlui~tlgmf~r~nSeries4~tcswt~twkkx~r~nSeries1~tlcbh~tqkvc~r~nSeries2~tswje~tbkrj~r~nSeries3~tlpgf~tgrat~r~nSeries4~tzbsg~tuvzi~r~nSeries1~tfnhy~txwjs~r~nSeries2~tjavw~tauxp~r~nSeries3~tanna~tmxjd~r~nSeries4~tvzuh~tnacz~r~nSeries1~tyhep~twzol~r~nSeries2~thusl~trkvw~r~nSeries3~tpnvg~tzmii~r~nSeries4~tzwud~twdfz~r~nSeries1~tlktb~tqdxg~r~nSeries2~tyyiu~tdsjv~r~nSeries3~tezkm~tesbj~r~nSeries4~tlkye~trtah~r~nSeries1~tnexh~tuqmj~r~nSeries2~ticbm~tusqd~r~nSeries3~tklas~tolwj~r~nSeries4~txptx~txeum~r~nSeries1~tzfwy~tucpa~r~nSeries2~tbqse~tffun~r~nSeries3~tqpkf~tnnbe~r~nSeries4~tcbbc~tjpdy~r~nSeries1~tjlib~titll~r~nSeries2~tplxe~tlrdk~r~nSeries3~texdt~tquvp~r~nSeries4~tttey~thtlq~r~nSeries1~tlbbb~tvoqo~r~nSeries2~tzkyn~tayyr~r~nSeries3~tbaqm~tyjhz~r~nSeries4~txnds~tiyfs~r~nSeries1~texwb~tioew~r~nSeries2~tqvqr~ttcdl~r~nSeries3~tpqmv~tjifv~r~nSeries4~tgymk~tgotz~r~nSeries1~tjmnz~tqtmr~r~nSeries2~tpnde~tvnmt~r~nSeries3~thjit~tsspa~r~nSeries4~tqnjr~tdoyj~r~nSeries1~twpya~ttmle~r~nSeries2~tyqsv~tkpam~r~nSeries3~tsvbm~tvxrl~r~nSeries4~tlivf~tedkj~r~nSeries1~tigav~tyxjv~r~nSeries2~teqvr~tbacu~r~nSeries3~tigai~tpyhb~r~nSeries4~tbxip~tbznc~r~nSeries1~twhrb~tliri~r~nSeries2~tzxoq~tptqq~r~nSeries3~tweaa~tfjeq~r~nSeries4~tiozp~tyfau~r~nSeries1~tuqmv~thxkm~r~nSeries2~tnxms~tyamp~r~nSeries3~ttlza~tnotl~r~nSeries4~tslwu~thtfq~r~nSeries1~tjrrw~tbwhm~r~nSeries2~tqhzk~thdkc~r~nSeries3~trfvb~teiyi~r~nSeries4~tpvfv~tpzhy~r~nSeries1~tujab~ttqww~r~nSeries2~ttbkd~togke~r~nSeries3~tmhib~tyxrn~r~nSeries4~txsxr~tzlet~r~nSeries1~tbqex~tkrqo~r~nSeries2~tiern~taplq~r~nSeries3~tyjpq~toubv~r~nSeries4~tjseb~talwn~r~nSeries1~tksvl~toidz~r~nSeries2~tfpir~twycz~r~nSeries3~ttwzz~tvewx~r~nSeries4~totak~tudkp~r~nSeries1~tedup~tkczl~r~nSeries2~thwus~tkdne~r~nSeries3~tvdcp~tlbkl~r~nSeries4~tpjmp~tfdcy~r~nSeries1~tqtrc~tvvvt~r~nSeries2~trffv~tpekk~r~nSeries3~tqmcu~tpryj~r~nSeries4~taute~tuvcz~r~nSeries1~tvict~thrxs~r~nSeries2~txclp~trgdl~r~nSeries3~twxfa~tigay~r~nSeries4~truei~tcufd~r~nSeries1~tiamh~ttkbx~r~nSeries2~totdi~trxxg~r~nSeries3~tvzqm~teyro~r~nSeries4~tvfic~thqni~r~nSeries1~tvfjz~tauqf~r~nSeries2~tdftg~tmops~r~nSeries3~trgpu~tgxtu~r~nSeries4~thlcv~tspih~r~nSeries1~tazrs~tsfsz~r~nSeries2~twxbq~tmurw~r~nSeries3~tmxcd~tbhum~r~nSeries4~trgjq~tmvnk~r~nSeries1~tyrtn~tsjvw~r~nSeries2~tzxss~tqxnj~r~nSeries3~tomuy~tjnju~r~nSeries4~twrsy~txwqy~r~nSeries1~tyxcs~tzpok~r~nSeries2~tlwjd~trltb~r~nSeries3~tscie~tdpiw~r~nSeries4~tlaqi~tgesj~r~nSeries1~tsqhs~tjlrg~r~nSeries2~tlmwa~tnrxr~r~nSeries3~tfnwa~tkztg~r~nSeries4~tjhxa~tunfq~r~nSeries1~tjvxi~tohnj~r~nSeries2~tqrjs~thymd~r~nSeries3~tovwg~tefhj~r~nSeries4~tesvh~ttizi~r~nSeries1~tojlj~tdpmo~r~nSeries2~txbyu~tyopq~r~nSeries3~tjkzt~tvjgk~r~nSeries4~twxke~twpzh~r~nSeries1~tbjsu~tthsy~r~nSeries2~toefj~tgwwy~r~nSeries3~teozl~tuhmg~r~nSeries4~tabbs~tqrhc~r~nSeries1~trtxm~tjvca~r~nSeries2~txxsu~tfahy~r~nSeries3~tyayz~tkhuh~r~nSeries4~tjrjs~tvoqh~r~nSeries1~ttydw~tpbsz~r~nSeries2~txsbz~tiyrv~r~nSeries3~tgqml~tunws~r~nSeries4~tcpir~tzfcb~r~nSeries1~ttsep~tlkgw~r~nSeries2~tfkhr~touoy~r~nSeries3~tsrwm~tqoja~r~nSeries4~thyqm~tfevs~r~nSeries1~tdcom~tryhg~r~nSeries2~tdmlx~tukwy~r~nSeries3~tzcpr~tskwg~r~nSeries4~txuls~tuckb~r~nSeries1~tsepj~teisz~r~nSeries2~tsgce~tzwap~r~nSeries3~tqrvl~twigr~r~nSeries4~tovjc~tdzxx~r~nSeries1~tphql~tsrzi~r~nSeries2~thmgz~trioq~r~nSeries3~trqet~tkzfb~r~nSeries4~tldji~temsf~r~nSeries1~tzbhz~tfnwy~r~nSeries2~twmxx~tgdpy~r~nSeries3~tlrax~tglmt~r~nSeries4~tbiyl~tbhcw~r~nSeries1~thlsy~toyhg~r~nSeries2~tmgop~tprza~r~nSeries3~txqmo~tmsyh~r~nSeries4~tgagi~tupjq~r~nSeries1~tbzxt~thtop~r~nSeries2~totmi~ttnqw~r~nSeries3~ttoet~tonxw~r~nSeries4~tzghu~ttifk~r~nSeries1~tlgkl~trnuw~r~nSeries2~tkmsy~tqcpu~r~nSeries3~tivah~tqatm~r~nSeries4~tsckm~taalk~r~n ')
			rte_1.Paste()
			
			rte_1.SelectText(1,1,0,0,Header!)
			ClipBoard('YuRu')
			rte_1.Paste()
			
			rte_1.Print(1,'',true,true)
		else
			
		end if
	Case 'RTEEVTW01P23'
	/*
	   【功能描述】
	    PrintHeader，返回非0

		【编码描述】
		1、在PrintHeader事件中写入信息输出代码，返回1
		2、拷贝两页的内容到控件中
		3、再拷贝数据到页眉
		4、打印控件内容

		【代码输出值描述】
		
		【期望UI描述】
		不打印该页眉内容
	*/
		
		if ab_exe then
			il_PrintFooter = 1
			rte_1.TriggerEvent(PrintHeader!)
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			
			rte_1.SelectText(1,1,0,0,Detail!)
			ClipBoard('Series1~tphwz~tyiay~r~nSeries2~tabjr~tqgep~r~nSeries3~tpxyj~tstty~r~nSeries4~tzuvl~tdvyb~r~nSeries1~tsuxk~tbmfz~r~nSeries2~tvrtn~tovid~r~nSeries3~tznpg~thozv~r~nSeries4~tafms~tnsnq~r~nSeries1~tivmv~tubcw~r~nSeries2~ttfsr~tqtmk~r~nSeries3~tnepb~thowe~r~nSeries4~tjazh~tkwcm~r~nSeries1~tmtpi~txxxl~r~nSeries2~tzqys~txtww~r~nSeries3~ttaid~tyaxy~r~nSeries4~tqlep~trxib~r~nSeries1~texxy~tfvsd~r~nSeries2~tdygt~thcuy~r~nSeries3~tyfwp~tjsfy~r~nSeries4~tbglg~tzmbi~r~nSeries1~tntat~ttnho~r~nSeries2~tdton~tpyzw~r~nSeries3~totkg~tngup~r~nSeries4~thpkx~teato~r~nSeries1~twzab~tsdnv~r~nSeries2~tqhkf~tcmof~r~nSeries3~tisfr~tfqgv~r~nSeries4~tpmvo~trpjf~r~nSeries1~tzslz~tmpjj~r~nSeries2~tnehr~tykxj~r~nSeries3~tzubu~taccl~r~nSeries4~tfkcy~tzobg~r~nSeries1~thtuo~txraj~r~nSeries2~tvpre~tcwgx~r~nSeries3~txpsw~tcgmm~r~nSeries4~tvede~twdmf~r~nSeries1~tnqwc~tuqds~r~nSeries2~tcili~tqeci~r~nSeries3~thlui~tlgmf~r~nSeries4~tcswt~twkkx~r~nSeries1~tlcbh~tqkvc~r~nSeries2~tswje~tbkrj~r~nSeries3~tlpgf~tgrat~r~nSeries4~tzbsg~tuvzi~r~nSeries1~tfnhy~txwjs~r~nSeries2~tjavw~tauxp~r~nSeries3~tanna~tmxjd~r~nSeries4~tvzuh~tnacz~r~nSeries1~tyhep~twzol~r~nSeries2~thusl~trkvw~r~nSeries3~tpnvg~tzmii~r~nSeries4~tzwud~twdfz~r~nSeries1~tlktb~tqdxg~r~nSeries2~tyyiu~tdsjv~r~nSeries3~tezkm~tesbj~r~nSeries4~tlkye~trtah~r~nSeries1~tnexh~tuqmj~r~nSeries2~ticbm~tusqd~r~nSeries3~tklas~tolwj~r~nSeries4~txptx~txeum~r~nSeries1~tzfwy~tucpa~r~nSeries2~tbqse~tffun~r~nSeries3~tqpkf~tnnbe~r~nSeries4~tcbbc~tjpdy~r~nSeries1~tjlib~titll~r~nSeries2~tplxe~tlrdk~r~nSeries3~texdt~tquvp~r~nSeries4~tttey~thtlq~r~nSeries1~tlbbb~tvoqo~r~nSeries2~tzkyn~tayyr~r~nSeries3~tbaqm~tyjhz~r~nSeries4~txnds~tiyfs~r~nSeries1~texwb~tioew~r~nSeries2~tqvqr~ttcdl~r~nSeries3~tpqmv~tjifv~r~nSeries4~tgymk~tgotz~r~nSeries1~tjmnz~tqtmr~r~nSeries2~tpnde~tvnmt~r~nSeries3~thjit~tsspa~r~nSeries4~tqnjr~tdoyj~r~nSeries1~twpya~ttmle~r~nSeries2~tyqsv~tkpam~r~nSeries3~tsvbm~tvxrl~r~nSeries4~tlivf~tedkj~r~nSeries1~tigav~tyxjv~r~nSeries2~teqvr~tbacu~r~nSeries3~tigai~tpyhb~r~nSeries4~tbxip~tbznc~r~nSeries1~twhrb~tliri~r~nSeries2~tzxoq~tptqq~r~nSeries3~tweaa~tfjeq~r~nSeries4~tiozp~tyfau~r~nSeries1~tuqmv~thxkm~r~nSeries2~tnxms~tyamp~r~nSeries3~ttlza~tnotl~r~nSeries4~tslwu~thtfq~r~nSeries1~tjrrw~tbwhm~r~nSeries2~tqhzk~thdkc~r~nSeries3~trfvb~teiyi~r~nSeries4~tpvfv~tpzhy~r~nSeries1~tujab~ttqww~r~nSeries2~ttbkd~togke~r~nSeries3~tmhib~tyxrn~r~nSeries4~txsxr~tzlet~r~nSeries1~tbqex~tkrqo~r~nSeries2~tiern~taplq~r~nSeries3~tyjpq~toubv~r~nSeries4~tjseb~talwn~r~nSeries1~tksvl~toidz~r~nSeries2~tfpir~twycz~r~nSeries3~ttwzz~tvewx~r~nSeries4~totak~tudkp~r~nSeries1~tedup~tkczl~r~nSeries2~thwus~tkdne~r~nSeries3~tvdcp~tlbkl~r~nSeries4~tpjmp~tfdcy~r~nSeries1~tqtrc~tvvvt~r~nSeries2~trffv~tpekk~r~nSeries3~tqmcu~tpryj~r~nSeries4~taute~tuvcz~r~nSeries1~tvict~thrxs~r~nSeries2~txclp~trgdl~r~nSeries3~twxfa~tigay~r~nSeries4~truei~tcufd~r~nSeries1~tiamh~ttkbx~r~nSeries2~totdi~trxxg~r~nSeries3~tvzqm~teyro~r~nSeries4~tvfic~thqni~r~nSeries1~tvfjz~tauqf~r~nSeries2~tdftg~tmops~r~nSeries3~trgpu~tgxtu~r~nSeries4~thlcv~tspih~r~nSeries1~tazrs~tsfsz~r~nSeries2~twxbq~tmurw~r~nSeries3~tmxcd~tbhum~r~nSeries4~trgjq~tmvnk~r~nSeries1~tyrtn~tsjvw~r~nSeries2~tzxss~tqxnj~r~nSeries3~tomuy~tjnju~r~nSeries4~twrsy~txwqy~r~nSeries1~tyxcs~tzpok~r~nSeries2~tlwjd~trltb~r~nSeries3~tscie~tdpiw~r~nSeries4~tlaqi~tgesj~r~nSeries1~tsqhs~tjlrg~r~nSeries2~tlmwa~tnrxr~r~nSeries3~tfnwa~tkztg~r~nSeries4~tjhxa~tunfq~r~nSeries1~tjvxi~tohnj~r~nSeries2~tqrjs~thymd~r~nSeries3~tovwg~tefhj~r~nSeries4~tesvh~ttizi~r~nSeries1~tojlj~tdpmo~r~nSeries2~txbyu~tyopq~r~nSeries3~tjkzt~tvjgk~r~nSeries4~twxke~twpzh~r~nSeries1~tbjsu~tthsy~r~nSeries2~toefj~tgwwy~r~nSeries3~teozl~tuhmg~r~nSeries4~tabbs~tqrhc~r~nSeries1~trtxm~tjvca~r~nSeries2~txxsu~tfahy~r~nSeries3~tyayz~tkhuh~r~nSeries4~tjrjs~tvoqh~r~nSeries1~ttydw~tpbsz~r~nSeries2~txsbz~tiyrv~r~nSeries3~tgqml~tunws~r~nSeries4~tcpir~tzfcb~r~nSeries1~ttsep~tlkgw~r~nSeries2~tfkhr~touoy~r~nSeries3~tsrwm~tqoja~r~nSeries4~thyqm~tfevs~r~nSeries1~tdcom~tryhg~r~nSeries2~tdmlx~tukwy~r~nSeries3~tzcpr~tskwg~r~nSeries4~txuls~tuckb~r~nSeries1~tsepj~teisz~r~nSeries2~tsgce~tzwap~r~nSeries3~tqrvl~twigr~r~nSeries4~tovjc~tdzxx~r~nSeries1~tphql~tsrzi~r~nSeries2~thmgz~trioq~r~nSeries3~trqet~tkzfb~r~nSeries4~tldji~temsf~r~nSeries1~tzbhz~tfnwy~r~nSeries2~twmxx~tgdpy~r~nSeries3~tlrax~tglmt~r~nSeries4~tbiyl~tbhcw~r~nSeries1~thlsy~toyhg~r~nSeries2~tmgop~tprza~r~nSeries3~txqmo~tmsyh~r~nSeries4~tgagi~tupjq~r~nSeries1~tbzxt~thtop~r~nSeries2~totmi~ttnqw~r~nSeries3~ttoet~tonxw~r~nSeries4~tzghu~ttifk~r~nSeries1~tlgkl~trnuw~r~nSeries2~tkmsy~tqcpu~r~nSeries3~tivah~tqatm~r~nSeries4~tsckm~taalk~r~n ')
			rte_1.Paste()
			
			rte_1.SelectText(1,1,0,0,Header!)
			ClipBoard('YuRu')
			rte_1.Paste()
			
			rte_1.Print(1,'',true,true)
		else
			
		end if
	Case 'RTEEVTW01P24'
	/*
	   【功能描述】
	    在Modify属性为false时是否触发Modified事件

		【编码描述】
		1、初始时Modify为false,在Modified事件中写入信息输出代码以及post 某函数输出Modify的值
		2、改变Modify为false
		3、输出Modify的值
		

		【代码输出值描述】
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			rte_1.TriggerEvent(Modified!)
		else
			rte_1.Modified = false
			rte_1.TabBar = true
			rte_1.ToolBar = true
			rte_1.rulerbar = true
		end if
	Case 'RTEEVTW01P25'
	/*
	   【功能描述】
	    在Modify属性为true时是否触发Modified事件

		【编码描述】
		1、初始时Modify为true,在Modified事件中写入信息输出代码以及post 某函数输出Modify的值
		2、输出Modify的值
		

		【代码输出值描述】
		
		【期望UI描述】
		不会触发Modified事件
	*/
		
		if ab_exe then
			rte_1.TriggerEvent(Modified!)
		else
			rte_1.Modified = true
			rte_1.TabBar = true
			rte_1.ToolBar = true
			rte_1.rulerbar = true
		end if
End Choose
if ab_exe then
	wf_postrun(al_row)
end if
end event

event open;call super::open;n_cst_config  lnv_res


if not lnv_res.of_createfile("PUB_BMP_APB.bmp",Gtr_Frame)  then
	messagebox("提示信息","下载文件失败,可能会影响测试")
end if

if not lnv_res.of_createfile("PUB_BMP_AJE.bmp",Gtr_Frame)  then
	messagebox("提示信息","下载文件失败,可能会影响测试")
end if


end event

event close;call super::close;if FileExists("PUB_BMP_APB.bmp")  then
	FileDelete("PUB_BMP_APB.bmp")
end if

if FileExists("PUB_BMP_AJE.bmp")  then
	FileDelete("PUB_BMP_AJE.bmp")
end if

end event

type mle_phenomena from w_templet`mle_phenomena within w_rteevtw01
end type

type cb_autoparse from w_templet`cb_autoparse within w_rteevtw01
end type

type cb_wrrun from w_templet`cb_wrrun within w_rteevtw01
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rteevtw01
end type

type dw_info from w_templet`dw_info within w_rteevtw01
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rteevtw01
end type

type pb_runnext from w_templet`pb_runnext within w_rteevtw01
end type

type pb_runall from w_templet`pb_runall within w_rteevtw01
end type

type pb_run from w_templet`pb_run within w_rteevtw01
end type

type pb_end from w_templet`pb_end within w_rteevtw01
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rteevtw01
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rteevtw01
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rteevtw01
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rteevtw01
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rteevtw01
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rteevtw01
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rteevtw01
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rteevtw01
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rteevtw01
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rteevtw01
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rteevtw01
end type

type rte_1 from richtextedit within w_rteevtw01
integer x = 27
integer y = 32
integer width = 2423
integer height = 1288
integer taborder = 110
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
end type

event constructor;MessageBox('','Constructor event is trigger')
end event

event destructor;MessageBox('','Destructor event is trigger')
end event

event doubleclicked;wf_OutPut("DoubleClicked event is trigger",true)
end event

event dragdrop;wf_OutPut("DrapDrop event is trigger",true)
end event

event dragenter;wf_OutPut("DragEnter event is trigger",true)
end event

event dragleave;wf_OutPut("DragLeave event is trigger",true)
end event

event dragwithin;wf_OutPut("DragWithin event is trigger",true)
end event

event getfocus;wf_OutPut("GetFocus event is trigger",true)
end event

event key;wf_OutPut("Key event is trigger",true)

return il_KeyRtn
end event

event losefocus;wf_OutPut("LoseFocus event is trigger",true)
end event

event mousemove;wf_OutPut("MouseMove event is trigger",true)
end event

event mousedown;wf_OutPut("MouseDown event is trigger",true)
end event

event mouseup;wf_OutPut("MouseUp event is trigger",true)
end event

event rbuttondown;wf_OutPut("RbuttonDown event is trigger",true)
end event

event rbuttonup;wf_OutPut("RbuttonUp event is trigger",true)
end event

event fileexists;wf_OutPut("FileExists event is trigger",true)
end event

event inputfieldselected;wf_OutPut("InputFieldSelected event is trigger",true)
end event

event pictureselected;wf_OutPut("PictureSelected event is trigger",true)
end event

event printfooter;wf_OutPut("PrintFooter event is trigger",true)
end event

event printheader;wf_OutPut("PrintHeader event is trigger",true)
end event

event modified;wf_OutPut("Modified event is trigger",true)

Post wf_GetModify()

end event

type cb_1 from commandbutton within w_rteevtw01
integer x = 2537
integer y = 520
integer width = 343
integer height = 104
integer taborder = 70
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "DragObject"
end type

