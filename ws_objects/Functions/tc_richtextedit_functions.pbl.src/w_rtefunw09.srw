$PBExportHeader$w_rtefunw09.srw
forward
global type w_rtefunw09 from w_templet
end type
type rte_1 from richtextedit within w_rtefunw09
end type
end forward

global type w_rtefunw09 from w_templet
string title = "Function 9"
rte_1 rte_1
end type
global w_rtefunw09 w_rtefunw09

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

on w_rtefunw09.create
int iCurrent
call super::create
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_1
end on

on w_rtefunw09.destroy
call super::destroy
destroy(this.rte_1)
end on

event ue_runscript;call super::ue_runscript;/*********************** 
Category Describe: 
将控件内容成功保存到一个文档后或新打开文档后，Modified属性值变为false
***********************/

/***********************
Window   Describe: 
Path:         $APb TestCase System\Function Test Case\Controls\RichTextEdit\Functions\Function 9 
Pbl Name:     
Designer:     ouyangwu
Coder:        WuZhiJun(2005-06-25)
DocReviewer:  
CoderReviewer:
【功能描述】

【窗口对象】

【编码注意事项】

【测试注意事项】
 
***********************/

//公共变量定义
String	ls_Temp,ls_RichText
Integer	li_RtnVal
Long		ll_RtnVal
Band		lb_Band
long		ll_FromLine,ll_FromChar,ll_ToLine,ll_ToChar

if Not ab_exe then
	rte_1.ShowHeadFoot(false)
	wf_data_init(rte_1,4)
end if

if isnull(as_testpoint) or as_testpoint = "" then return
if isnull(al_row) or al_row < 1 then return 
if isnull(ab_exe) then return 
Choose Case as_testpoint
	Case 'RTEFUNW09P01'
	/*
	   【功能描述】
	    PasteRTF，richtextstring为NULL

		【编码描述】
		1、初始化控件
		2、指定richtextstring为NULL，只带第一个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(ls_RichText)
			ll_RtnVal = rte_1.PasteRTF(ls_RichText)
			wf_OutPut("FunReturn: rte_1.PasteRTF(ls_RichText)=" + String(ll_RtnVal),true)
		else
		end if
	Case 'RTEFUNW09P02'
	/*
	   【功能描述】
	    PasteRTF，band为NULL

		【编码描述】
		1、初始化控件
		2、指定band为NULL，带两个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		NULL
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			SetNull(lb_Band)
			ll_RtnVal = rte_1.PasteRTF(ls_RichText,lb_Band)
			wf_OutPut("FunReturn: rte_1.PasteRTF(ls_RichText,lb_Band)=" + String(ll_RtnVal),true)
		else
		end if
	Case 'RTEFUNW09P03'
	/*
	   【功能描述】
	    PasteRTF，richtextstring为空字符串

		【编码描述】
		1、初始化控件
		2、richtextstring为空字符串，带第一个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		-1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			ls_RichText = ''
			ll_RtnVal = rte_1.PasteRTF(ls_RichText)
			wf_OutPut("FunReturn: rte_1.PasteRTF(ls_RichText)=" + String(ll_RtnVal),true)
		else
		end if
	Case 'RTEFUNW09P04'
	/*
	   【功能描述】
	    PasteRTF，richtextstring为非RichText格式的字符串

		【编码描述】
		1、初始化控件
		2、richtextstring为非RichText格式的字符串，带第一个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		-1
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			ls_RichText = 'I am a student'
			ll_RtnVal = rte_1.PasteRTF(ls_RichText)
			wf_OutPut("FunReturn: rte_1.PasteRTF(ls_RichText)=" + String(ll_RtnVal),true)
		else
		end if
	Case 'RTEFUNW09P05'
	/*
	   【功能描述】
	    PasteRTF，richtextstring为包含图片以及RichText格式的字符串

		【编码描述】
		1、初始化控件
		2、richtextstring为包含图片以及RichText格式的字符串，带第一个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回粘帖的字节数
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			ls_RichText = "{\rtf1\ansi\ansicpg1252\uc2 \deff17\deflang1033\deflangfe1033{\fonttbl{\f0\froman\fcharset0\fprq2{\*\panose 02020603050405020304}Times New Roman;}{\f17\fnil\fcharset134\fprq2{\*\panose 02010600030101010101}\'cb\'ce\'cc\'e5{\*\falt SimSun};}~r~n{\f28\fnil\fcharset134\fprq2{\*\panose 02010600030101010101}@\'cb\'ce\'cc\'e5;}{\f32\froman\fcharset238\fprq2 Times New Roman CE;}{\f33\froman\fcharset204\fprq2 Times New Roman Cyr;}{\f35\froman\fcharset161\fprq2 Times New Roman Greek;}~r~n{\f36\froman\fcharset162\fprq2 Times New Roman Tur;}{\f37\froman\fcharset177\fprq2 Times New Roman (Hebrew);}{\f38\froman\fcharset178\fprq2 Times New Roman (Arabic);}{\f39\froman\fcharset186\fprq2 Times New Roman Baltic;}~r~n{\f170\fnil\fcharset0\fprq2 SimSun Western{\*\falt SimSun};}{\f258\fnil\fcharset0\fprq2 @\'cb\'ce\'cc\'e5 Western;}}{\colortbl;\red0\green0\blue0;\red0\green0\blue255;\red0\green255\blue255;\red0\green255\blue0;\red255\green0\blue255;\red255\green0\blue0;~r~n\red255\green255\blue0;\red255\green255\blue255;\red0\green0\blue128;\red0\green128\blue128;\red0\green128\blue0;\red128\green0\blue128;\red128\green0\blue0;\red128\green128\blue0;\red128\green128\blue128;\red192\green192\blue192;}{\stylesheet{~r~n\ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 \fs22\cf1\lang1033\langfe2052\loch\f17\hich\af17\dbch\af17\cgrid\langnp1033\langfenp2052 \snext0 Normal;}{\*\cs10 \additive Default Paragraph Font;}}{\info~r~n{\title Tjokdrelkdfaslk;sdf}{\author appeon}{\operator appeon}{\creatim\yr2005\mo6\dy25\hr10\min28}{\revtim\yr2005\mo6\dy27\hr9\min28}{\version8}{\edmins2}{\nofpages1}{\nofwords0}{\nofchars0}{\*\company appeon}{\nofcharsws0}{\vern8269}}~r~n\paperw12240\paperh15840\margl1800\margr1800\margt1440\margb1440\gutter0 \widowctrl\ftnbj\aenddoc\noxlattoyen\expshrtn\noultrlspc\dntblnsbdb\nospaceforul\hyphcaps0\formshade\horzdoc\dgmargin\dghspace180\dgvspace180\dghorigin1800\dgvorigin1440\dghshow1~r~n\dgvshow1\jexpand\viewkind1\viewscale100\pgbrdrhead\pgbrdrfoot\splytwnine\ftnlytwnine\htmautsp\nolnhtadjtbl\useltbaln\alntblind\lytcalctblwd\lyttblrtgr\lnbrkrule \fet0\sectd \linex0\endnhere\sectlinegrid360\sectdefaultcl {\*\pnseclvl1~r~n\pnucrm\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl2\pnucltr\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl3\pndec\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl4\pnlcltr\pnstart1\pnindent720\pnhang{\pntxta \hich )}}~r~n{\*\pnseclvl5\pndec\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl6\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl7\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}~r~n{\*\pnseclvl8\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl9\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}\pard\plain \ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 ~r~n\fs22\cf1\lang1033\langfe2052\loch\af17\hich\af17\dbch\af17\cgrid\langnp1033\langfenp2052 {\hich\af17\dbch\af17\loch\f17 How are you?~r~n\par \hich\af17\dbch\af17\loch\f17 Thank you!~r~n\par \hich\af17\dbch\af17\loch\f17 Not at all.~r~n\par ~r~n\par {\*\shppict{\pict{\*\picprop\shplid1025{\sp{\sn shapeType}{\sv 75}}{\sp{\sn fFlipH}{\sv 0}}{\sp{\sn fFlipV}{\sv 0}}{\sp{\sn pibName}{\sv Aster2.bmp}}{\sp{\sn pibFlags}{\sv 2}}{\sp{\sn fLine}{\sv 0}}{\sp{\sn fLayoutInCell}{\sv 1}}}~r~n\picscalex100\picscaley100\piccropl0\piccropr0\piccropt0\piccropb0\picw3761\pich4329\picwgoal2132\pichgoal2454\pngblip\bliptag-972157684{\*\blipuid c60e0d0cd1e59ba88f607006cc1bd509}~r~n89504e470d0a1a0a0000000d4948445200000097000000a70100000000349ef3790000000467414d410000b18e7cfb5193000000097048597300000faf00000f~r~n120187cff298000003654944415448c7bd963b8e9c4010866b444048eac03247c13703c981431fc147311b39f411dcd25e0047db927197abfeaa6eba61b41a69~r~na51d6917f8fac14f3d9bf8faa32b4a0f327e90bd65ed5bd8a3dff1cefa7e5e59ba5dd946d385ad345c342fd49fe725a2ee3c6f27a2f3bc7b2c0a9b8fb5b34921~r~n13f357e7a5a9617f94eda3de066176a32c0e0d5b67615bdfb065d2b55dc36896f79a41325321e4125767fb0d78999de9cb628f49eb54b16d000b63c5e441d7ea~r~n50d94f17916d51986e2e0c023323fb834067b8779e35630df91ec16ca57bc31ffa2e67d040a629db546f314f0737f307be89fc1b9de1db95e9cba2f992b22f55~r~n94f917f2521e107673793659764960f87437f2e4310479c6821a52d93a16a6ee248dbf652a2c761e93164660e22cc4aea938feaf62aafd56c59fac09c2625731~r~nd93b88592c749c8906cd8f3054312e0f9bac37793e4f1645caf29cc9e63b6579ce448407d4c12c0c5d5ece0f89ce2ecbcb6c61962dfb26df9e987b4e4333ef99~r~nf91bf3d8b017e6dfcc3fda1cac7f84bd8edf8e388d96f4c9842c488e60c96c752369249146a825c388117101b12701fca6137a631d7b1cd803c903a2c7e285f4~r~n427a11bb595cc58a8d5e370216913e50ef6cc122d2a095f916e3543132867d687236213ffc9eb02d0dc8ad15f7a3b30e8c1a76d3cba7cc6c3e7d96bf0f763b64~r~na6f33e66766fadb1be7987691a2b2d59f3dc68bef76db04bd7da006383db6aadd8e439bd994d536d7bf707e352f94dd9629eb51eb0c2977a4141c348309f6f16~r~n2f01235127482db6c6e1bd47df7764cfd79c51aff5b717fc6fe3f9193def7bc39eb05f9b1f92475f38f5a77cd3dc6af24d53ec9c979abce7fc952c4de73c17f5~r~nfbb91e0435fea96eac2398d597a30e6de73a84909fb2c052d7d4a6a9aa6bb9fee5552ecf58553b756ff8a8aab1a5ee9a187279c6b6a3662f53aee3476d27d476~r~n62b716b93cef0ba557eca55798b5c8e5f9590002c9e53983407279b96f0dce74d0190492c9cbbd317a6f4c75bff41e8aabb3e40d0df3432e5b33d896fbb432ef~r~ndd787fd5e3711618f972165826be9c19f0dd99a93bc9ed93999d41cc8e9931f22396f3cbe07eb89c7356cd2deba585059d17c7866d73395f1516a10f41ec3665~r~nfe77e4a09f05ea9ca9cf70af9ef5ec2cd0323ece8e075bcab9f36056375ab695d75667dbb25d55377edd61fcaeec3faf80fed4d45e068e0000000049454e44ae426082}}{\nonshppict{\pict\picscalex100\picscaley100\piccropl0\piccropr0\piccropt0\piccropb0~r~n\picw3761\pich4329\picwgoal2132\pichgoal2454\wmetafile8\bliptag-972157684\blipupi99{\*\blipuid c60e0d0cd1e59ba88f607006cc1bd509}~r~n010009000003d00600000000ac06000000000400000003010800050000000b0200000000050000000c02a700970005000000070104000000ac060000430f2000~r~ncc000000a700970000000000a7009700000000002800000097000000a700000001000100000000000c0d0000af0f0000120f0000020000000200000000000000~r~nffffff00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00~r~nfffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffff~r~nffffffffffcffffffffffffffffffefffffffffffffffffffe03fffffffffffffffffefffffffffffffffffff0007ffffffffffffffffeffffffffffffffffff~r~ne0001ffffffffffffffffeffffffffffffffffff80000ffffffffffffffffeffffffffffffffffff000003fffffffffffffffefffffffffffffffffc000001ff~r~nfffffffffffffefffffffffffffffffc000000fffffffffffffffefffffffffffffffff80000007ffffffffffffffefffffffffffffffff00000007fffffffff~r~nfffffeffffff7ffffffffff00000003ffffffffffdfffefffffe3fffffffffe00000001ffffffffff8fffefffff81fffffffffe00000001ffffffffff07ffefc~r~nfff00fffffffffe00000001fffffffffe03ffefcfff007ffffffffe00000001fffffffffc01ffef8fff803ffffffffe00000000fffffffff803ffef0fffc01ff~r~nffffffc00000000fffffffff007ffef0fffe00ffffffffc00000000ffffffffe00fffee0ffff007fffffffc00000000ffffffffc03fffee0ffff803fffffffc0~r~n0000000ffffffff807fffee0ffffc01fffffffc00000000ffffffff00ffffee0ffffe00fffffffc00000000fffffffe01ffffee0fffff007ffffffc00000000f~r~nffffffc03ffffec0fffff803ffffffe00000000fffffff007ffffec0fffffc01ffffffe00000001ffffffe00fffffec0fffffe00ffffffe00000001ffffffc01~r~nfffffec0ffffff803fffffe00000001ffffff803fffffec0ffffffc01ffffff00000003ffffff007fffffec0ffffffe00ffffff00000003fffffe00ffffffec0~r~nfffffff007fffff80000007fffffc01ffffffee0fffffff803fffff80000007fffff803ffffffee0fffffffc01fffffc000000ffffff007ffffffee0fffffffe~r~n00fffffc000000fffffe00fffffffee0ffffffff007ffffe000000fffffc01fffffffef0ffffffff803ffffe000001fffff803fffffffef0ffffffffc01fffff~r~n000003fffff007fffffffef8ffffffffe00fffff000003ffffe00ffffffffe00fffffffff007ffff800007ffffc01ffffffffe00fffffffff803ffffc0000fff~r~nff803ffffffffe00fffffffffc01ffffc0000fffff00fffffffffe00fffffffffe00ffffe0001ffffe01fffffffffe00ffffffffff007fffe0003ffffc03ffff~r~nfffffe00ffffffffff803ffff0003ffff007fffffffffe00ffffffffffc01ffff8007fffe00ffffffffffe00ffffffffffe00ffff8007fffc01ffffffffffe00~r~nfffffffffff007fffc00ffff803ffffffffffe00fffffffffff803fffe00ffff007ffffffffffe00fffffffffffc01fffe01fffe00fffffffffffe00ffffffff~r~nfffe00ffff01fffc01fffffffffffe00ffffffffffff007fff03fffc03fffffffffffe00ffffffffffff80ffff83fffe07fffffffffffe00ffffffffffffc1ff~r~nff87ffff0ffffffffffffe00ffffffffffffe3ffffc7ffff9ffffffffffffe00fffffffffffff7ffffffffffbffffffffffffe00ffffffffffffffffffffffff~r~nfffffffffffffe00ffff803fffffffffff87fffffffffff007fffe00fffc0003fffffffff0003fffffffff00007ffe00fff00000ffffffffe0001ffffffff800~r~n001ffe00ffc000001fffffff800007ffffffe0000007fe00ff80000007ffffff000003ffffffc0000003fe00ff00000001fffffe000001ffffff00000001fe00~r~nfe000000007ffffc000000fffffc00000001fe00fc000000003ffff8000000fffff000000000fe00fc000000000ffff80000007fffc0000000007e00f8000000~r~n0003fff00000003fff00000000007e00f00000000000fff00000003ffc00000000003e00f000000000007fe00000003ff000000000003e00f000000000001fe0~r~n0000001fc000000000003e00e0000000000007e00000001f0000000000001e00e0000000000001e00000001e0000000000001e00c0000000000000e00000001c~r~n0000000000000e00c000000000000040000000180000000000000e00e0000000000001e00000001e0000000000001e00e0000000000003e00000001f00000000~r~n00001e00e000000000000fe00000001fc000000000001e00f000000000003fe00000003ff000000000003e00f00000000000fff00000003ffc00000000003e00~r~nf00000000001fff00000003fff00000000007e00f80000000007fff80000007fff80000000007e00fc000000001ffff80000007fffe000000000fe00fc000000~r~n007ffffc000000fffff800000001fe00fe00000000fffffe000001fffffc00000001fe00ff00000003fffffe000001ffffff00000003fe00ff0000000fffffff~r~n000007ffffffc0000007fe00ffc000003fffffffc0001ffffffff000000ffe00ffe00000fffffffff0003ffffffffe00003ffe00fff80007fffffffffe03ffff~r~nffffff8000fffe00ffffc1fffffffffffffffffffffffffc3ffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffff7ffffdfffffbfffffff~r~nfffffe00ffffffffffffe3ffff8fffff1ffffffffffffe00ffffffffffffc1ffff07fffe0ffffffffffffe00ffffffffffff80ffff03fffc07fffffffffffe00~r~nffffffffffff007ffe03fff803fffffffffffe00fffffffffffe00fffe01fffc01fffffffffffe00fffffffffffc01fffc01fffe00fffffffffffe00ffffffff~r~nfff803fffc00ffff007ffffffffffe00fffffffffff007fff800ffff803ffffffffffe00ffffffffffe00ffff0007fffc01ffffffffffe00ffffffffffc01fff~r~nf0003fffe00ffffffffffe00ffffffffff803fffe0003ffff007fffffffffe00ffffffffff007fffe0001ffff803fffffffffe00fffffffffe00ffffc0001fff~r~nfc01fffffffffe00fffffffffc01ffffc0000ffffe00fffffffffe00fffffffff803ffff800007ffff007ffffffffe00fffffffff007ffff000007ffff803fff~r~nfffffe00ffffffffe00fffff000003ffffc01ffffffffe00ffffffffc03ffffe000003fffff00ffffffffe00ffffffff807ffffe000001fffff807fffffffe00~r~nffffffff00fffffc000001fffffc03fffffffe00fffffffe01fffffc000000fffffe01fffffffe00fffffffc03fffff8000000ffffff00fffffffe00fffffff8~r~n07fffff00000007fffff807ffffffe00fffffff00ffffff00000007fffffc03ffffffe00ffffffe01ffffff00000003fffffe01ffffffe00ffffffc03fffffe0~r~n0000003ffffff00ffffffe00ffffff807fffffe00000003ffffff807fffffe00ffffff00ffffffe00000001ffffffc03fffffe00fffffe01ffffffc00000001f~r~nfffffe01fffffe00fffffc03ffffffc00000001fffffff00fffffe00fffff807ffffffc00000001fffffff807ffffe00fffff00fffffffc00000001fffffffc0~r~n3ffffe00ffffe01fffffffc00000000fffffffe01ffffe00ffffc03fffffffc00000000ffffffff00ffffe00ffff807fffffffc00000000ffffffff807fffe00~r~nffff00ffffffffc00000001ffffffffc01fffe00fffe01ffffffffe00000001ffffffffe00fffe00fffc03ffffffffe00000001fffffffff007ffe00fff007ff~r~nffffffe00000001fffffffff803ffe00fff80fffffffffe00000001fffffffffc07ffe00fffc1fffffffffe00000001fffffffffe0fffe00fffe3ffffffffff0~r~n0000003ffffffffff1fffe00ffff7ffffffffff00000003ffffffffffbfffe00fffffffffffffff80000007ffffffffffffffe00fffffffffffffffc000000ff~r~nfffffffffffffe00fffffffffffffffc000000fffffffffffffffe00fffffffffffffffe000003fffffffffffffffe00ffffffffffffffff800007ffffffffff~r~nfffffe00ffffffffffffffffc0000ffffffffffffffffe00fffffffffffffffff0003ffffffffffffffffe00fffffffffffffffffe01fffffffffffffffffe00~r~nffffffffffffffffffc7fffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffff~r~nfffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffff~r~nfffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffffffffffff~r~nfffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffffffffffffffffffff~r~nfffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00~r~nfffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe0005000000070101000000030000000000}}~r~n\par }}"
			ll_RtnVal = rte_1.PasteRTF(ls_RichText)
			wf_OutPut("FunReturn: rte_1.PasteRTF(ls_RichText)=" + String(ll_RtnVal),true)
		else
		end if
	Case 'RTEFUNW09P06'
	/*
	   【功能描述】
	    PasteRTF，band为Detail!

		【编码描述】
		1、初始化控件，构建含图片及InputField的数据
		2、选中部分含图片及InputField的内容，band为Detail!，带两个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回粘帖的字节数
		
		【期望UI描述】
		替换了被选中的内容
	*/
		
		if ab_exe then
			ls_RichText = "{\rtf1\ansi\ansicpg1252\uc2 \deff17\deflang1033\deflangfe1033{\fonttbl{\f0\froman\fcharset0\fprq2{\*\panose 02020603050405020304}Times New Roman;}{\f17\fnil\fcharset134\fprq2{\*\panose 02010600030101010101}\'cb\'ce\'cc\'e5{\*\falt SimSun};}~r~n{\f28\fnil\fcharset134\fprq2{\*\panose 02010600030101010101}@\'cb\'ce\'cc\'e5;}{\f32\froman\fcharset238\fprq2 Times New Roman CE;}{\f33\froman\fcharset204\fprq2 Times New Roman Cyr;}{\f35\froman\fcharset161\fprq2 Times New Roman Greek;}~r~n{\f36\froman\fcharset162\fprq2 Times New Roman Tur;}{\f37\froman\fcharset177\fprq2 Times New Roman (Hebrew);}{\f38\froman\fcharset178\fprq2 Times New Roman (Arabic);}{\f39\froman\fcharset186\fprq2 Times New Roman Baltic;}~r~n{\f170\fnil\fcharset0\fprq2 SimSun Western{\*\falt SimSun};}{\f258\fnil\fcharset0\fprq2 @\'cb\'ce\'cc\'e5 Western;}}{\colortbl;\red0\green0\blue0;\red0\green0\blue255;\red0\green255\blue255;\red0\green255\blue0;\red255\green0\blue255;\red255\green0\blue0;~r~n\red255\green255\blue0;\red255\green255\blue255;\red0\green0\blue128;\red0\green128\blue128;\red0\green128\blue0;\red128\green0\blue128;\red128\green0\blue0;\red128\green128\blue0;\red128\green128\blue128;\red192\green192\blue192;}{\stylesheet{~r~n\ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 \fs22\cf1\lang1033\langfe2052\loch\f17\hich\af17\dbch\af17\cgrid\langnp1033\langfenp2052 \snext0 Normal;}{\*\cs10 \additive Default Paragraph Font;}}{\info~r~n{\title Tjokdrelkdfaslk;sdf}{\author appeon}{\operator appeon}{\creatim\yr2005\mo6\dy25\hr10\min28}{\revtim\yr2005\mo6\dy27\hr9\min28}{\version8}{\edmins2}{\nofpages1}{\nofwords0}{\nofchars0}{\*\company appeon}{\nofcharsws0}{\vern8269}}~r~n\paperw12240\paperh15840\margl1800\margr1800\margt1440\margb1440\gutter0 \widowctrl\ftnbj\aenddoc\noxlattoyen\expshrtn\noultrlspc\dntblnsbdb\nospaceforul\hyphcaps0\formshade\horzdoc\dgmargin\dghspace180\dgvspace180\dghorigin1800\dgvorigin1440\dghshow1~r~n\dgvshow1\jexpand\viewkind1\viewscale100\pgbrdrhead\pgbrdrfoot\splytwnine\ftnlytwnine\htmautsp\nolnhtadjtbl\useltbaln\alntblind\lytcalctblwd\lyttblrtgr\lnbrkrule \fet0\sectd \linex0\endnhere\sectlinegrid360\sectdefaultcl {\*\pnseclvl1~r~n\pnucrm\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl2\pnucltr\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl3\pndec\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl4\pnlcltr\pnstart1\pnindent720\pnhang{\pntxta \hich )}}~r~n{\*\pnseclvl5\pndec\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl6\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl7\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}~r~n{\*\pnseclvl8\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl9\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}\pard\plain \ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 ~r~n\fs22\cf1\lang1033\langfe2052\loch\af17\hich\af17\dbch\af17\cgrid\langnp1033\langfenp2052 {\hich\af17\dbch\af17\loch\f17 How are you?~r~n\par \hich\af17\dbch\af17\loch\f17 Thank you!~r~n\par \hich\af17\dbch\af17\loch\f17 Not at all.~r~n\par ~r~n\par {\*\shppict{\pict{\*\picprop\shplid1025{\sp{\sn shapeType}{\sv 75}}{\sp{\sn fFlipH}{\sv 0}}{\sp{\sn fFlipV}{\sv 0}}{\sp{\sn pibName}{\sv Aster2.bmp}}{\sp{\sn pibFlags}{\sv 2}}{\sp{\sn fLine}{\sv 0}}{\sp{\sn fLayoutInCell}{\sv 1}}}~r~n\picscalex100\picscaley100\piccropl0\piccropr0\piccropt0\piccropb0\picw3761\pich4329\picwgoal2132\pichgoal2454\pngblip\bliptag-972157684{\*\blipuid c60e0d0cd1e59ba88f607006cc1bd509}~r~n89504e470d0a1a0a0000000d4948445200000097000000a70100000000349ef3790000000467414d410000b18e7cfb5193000000097048597300000faf00000f~r~n120187cff298000003654944415448c7bd963b8e9c4010866b444048eac03247c13703c981431fc147311b39f411dcd25e0047db927197abfeaa6eba61b41a69~r~na51d6917f8fac14f3d9bf8faa32b4a0f327e90bd65ed5bd8a3dff1cefa7e5e59ba5dd946d385ad345c342fd49fe725a2ee3c6f27a2f3bc7b2c0a9b8fb5b34921~r~n13f357e7a5a9617f94eda3de066176a32c0e0d5b67615bdfb065d2b55dc36896f79a41325321e4125767fb0d78999de9cb628f49eb54b16d000b63c5e441d7ea~r~n50d94f17916d51986e2e0c023323fb834067b8779e35630df91ec16ca57bc31ffa2e67d040a629db546f314f0737f307be89fc1b9de1db95e9cba2f992b22f55~r~n94f917f2521e107673793659764960f87437f2e4310479c6821a52d93a16a6ee248dbf652a2c761e93164660e22cc4aea938feaf62aafd56c59fac09c2625731~r~nd93b88592c749c8906cd8f3054312e0f9bac37793e4f1645caf29cc9e63b6579ce448407d4c12c0c5d5ece0f89ce2ecbcb6c61962dfb26df9e987b4e4333ef99~r~nf91bf3d8b017e6dfcc3fda1cac7f84bd8edf8e388d96f4c9842c488e60c96c752369249146a825c388117101b12701fca6137a631d7b1cd803c903a2c7e285f4~r~n427a11bb595cc58a8d5e370216913e50ef6cc122d2a095f916e3543132867d687236213ffc9eb02d0dc8ad15f7a3b30e8c1a76d3cba7cc6c3e7d96bf0f763b64~r~na6f33e66766fadb1be7987691a2b2d59f3dc68bef76db04bd7da006383db6aadd8e439bd994d536d7bf707e352f94dd9629eb51eb0c2977a4141c348309f6f16~r~n2f01235127482db6c6e1bd47df7764cfd79c51aff5b717fc6fe3f9193def7bc39eb05f9b1f92475f38f5a77cd3dc6af24d53ec9c979abce7fc952c4de73c17f5~r~nfbb91e0435fea96eac2398d597a30e6de73a84909fb2c052d7d4a6a9aa6bb9fee5552ecf58553b756ff8a8aab1a5ee9a187279c6b6a3662f53aee3476d27d476~r~n62b716b93cef0ba557eca55798b5c8e5f9590002c9e53983407279b96f0dce74d0190492c9cbbd317a6f4c75bff41e8aabb3e40d0df3432e5b33d896fbb432ef~r~ndd787fd5e3711618f972165826be9c19f0dd99a93bc9ed93999d41cc8e9931f22396f3cbe07eb89c7356cd2deba585059d17c7866d73395f1516a10f41ec3665~r~nfe77e4a09f05ea9ca9cf70af9ef5ec2cd0323ece8e075bcab9f36056375ab695d75667dbb25d55377edd61fcaeec3faf80fed4d45e068e0000000049454e44ae426082}}{\nonshppict{\pict\picscalex100\picscaley100\piccropl0\piccropr0\piccropt0\piccropb0~r~n\picw3761\pich4329\picwgoal2132\pichgoal2454\wmetafile8\bliptag-972157684\blipupi99{\*\blipuid c60e0d0cd1e59ba88f607006cc1bd509}~r~n010009000003d00600000000ac06000000000400000003010800050000000b0200000000050000000c02a700970005000000070104000000ac060000430f2000~r~ncc000000a700970000000000a7009700000000002800000097000000a700000001000100000000000c0d0000af0f0000120f0000020000000200000000000000~r~nffffff00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00~r~nfffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffff~r~nffffffffffcffffffffffffffffffefffffffffffffffffffe03fffffffffffffffffefffffffffffffffffff0007ffffffffffffffffeffffffffffffffffff~r~ne0001ffffffffffffffffeffffffffffffffffff80000ffffffffffffffffeffffffffffffffffff000003fffffffffffffffefffffffffffffffffc000001ff~r~nfffffffffffffefffffffffffffffffc000000fffffffffffffffefffffffffffffffff80000007ffffffffffffffefffffffffffffffff00000007fffffffff~r~nfffffeffffff7ffffffffff00000003ffffffffffdfffefffffe3fffffffffe00000001ffffffffff8fffefffff81fffffffffe00000001ffffffffff07ffefc~r~nfff00fffffffffe00000001fffffffffe03ffefcfff007ffffffffe00000001fffffffffc01ffef8fff803ffffffffe00000000fffffffff803ffef0fffc01ff~r~nffffffc00000000fffffffff007ffef0fffe00ffffffffc00000000ffffffffe00fffee0ffff007fffffffc00000000ffffffffc03fffee0ffff803fffffffc0~r~n0000000ffffffff807fffee0ffffc01fffffffc00000000ffffffff00ffffee0ffffe00fffffffc00000000fffffffe01ffffee0fffff007ffffffc00000000f~r~nffffffc03ffffec0fffff803ffffffe00000000fffffff007ffffec0fffffc01ffffffe00000001ffffffe00fffffec0fffffe00ffffffe00000001ffffffc01~r~nfffffec0ffffff803fffffe00000001ffffff803fffffec0ffffffc01ffffff00000003ffffff007fffffec0ffffffe00ffffff00000003fffffe00ffffffec0~r~nfffffff007fffff80000007fffffc01ffffffee0fffffff803fffff80000007fffff803ffffffee0fffffffc01fffffc000000ffffff007ffffffee0fffffffe~r~n00fffffc000000fffffe00fffffffee0ffffffff007ffffe000000fffffc01fffffffef0ffffffff803ffffe000001fffff803fffffffef0ffffffffc01fffff~r~n000003fffff007fffffffef8ffffffffe00fffff000003ffffe00ffffffffe00fffffffff007ffff800007ffffc01ffffffffe00fffffffff803ffffc0000fff~r~nff803ffffffffe00fffffffffc01ffffc0000fffff00fffffffffe00fffffffffe00ffffe0001ffffe01fffffffffe00ffffffffff007fffe0003ffffc03ffff~r~nfffffe00ffffffffff803ffff0003ffff007fffffffffe00ffffffffffc01ffff8007fffe00ffffffffffe00ffffffffffe00ffff8007fffc01ffffffffffe00~r~nfffffffffff007fffc00ffff803ffffffffffe00fffffffffff803fffe00ffff007ffffffffffe00fffffffffffc01fffe01fffe00fffffffffffe00ffffffff~r~nfffe00ffff01fffc01fffffffffffe00ffffffffffff007fff03fffc03fffffffffffe00ffffffffffff80ffff83fffe07fffffffffffe00ffffffffffffc1ff~r~nff87ffff0ffffffffffffe00ffffffffffffe3ffffc7ffff9ffffffffffffe00fffffffffffff7ffffffffffbffffffffffffe00ffffffffffffffffffffffff~r~nfffffffffffffe00ffff803fffffffffff87fffffffffff007fffe00fffc0003fffffffff0003fffffffff00007ffe00fff00000ffffffffe0001ffffffff800~r~n001ffe00ffc000001fffffff800007ffffffe0000007fe00ff80000007ffffff000003ffffffc0000003fe00ff00000001fffffe000001ffffff00000001fe00~r~nfe000000007ffffc000000fffffc00000001fe00fc000000003ffff8000000fffff000000000fe00fc000000000ffff80000007fffc0000000007e00f8000000~r~n0003fff00000003fff00000000007e00f00000000000fff00000003ffc00000000003e00f000000000007fe00000003ff000000000003e00f000000000001fe0~r~n0000001fc000000000003e00e0000000000007e00000001f0000000000001e00e0000000000001e00000001e0000000000001e00c0000000000000e00000001c~r~n0000000000000e00c000000000000040000000180000000000000e00e0000000000001e00000001e0000000000001e00e0000000000003e00000001f00000000~r~n00001e00e000000000000fe00000001fc000000000001e00f000000000003fe00000003ff000000000003e00f00000000000fff00000003ffc00000000003e00~r~nf00000000001fff00000003fff00000000007e00f80000000007fff80000007fff80000000007e00fc000000001ffff80000007fffe000000000fe00fc000000~r~n007ffffc000000fffff800000001fe00fe00000000fffffe000001fffffc00000001fe00ff00000003fffffe000001ffffff00000003fe00ff0000000fffffff~r~n000007ffffffc0000007fe00ffc000003fffffffc0001ffffffff000000ffe00ffe00000fffffffff0003ffffffffe00003ffe00fff80007fffffffffe03ffff~r~nffffff8000fffe00ffffc1fffffffffffffffffffffffffc3ffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffff7ffffdfffffbfffffff~r~nfffffe00ffffffffffffe3ffff8fffff1ffffffffffffe00ffffffffffffc1ffff07fffe0ffffffffffffe00ffffffffffff80ffff03fffc07fffffffffffe00~r~nffffffffffff007ffe03fff803fffffffffffe00fffffffffffe00fffe01fffc01fffffffffffe00fffffffffffc01fffc01fffe00fffffffffffe00ffffffff~r~nfff803fffc00ffff007ffffffffffe00fffffffffff007fff800ffff803ffffffffffe00ffffffffffe00ffff0007fffc01ffffffffffe00ffffffffffc01fff~r~nf0003fffe00ffffffffffe00ffffffffff803fffe0003ffff007fffffffffe00ffffffffff007fffe0001ffff803fffffffffe00fffffffffe00ffffc0001fff~r~nfc01fffffffffe00fffffffffc01ffffc0000ffffe00fffffffffe00fffffffff803ffff800007ffff007ffffffffe00fffffffff007ffff000007ffff803fff~r~nfffffe00ffffffffe00fffff000003ffffc01ffffffffe00ffffffffc03ffffe000003fffff00ffffffffe00ffffffff807ffffe000001fffff807fffffffe00~r~nffffffff00fffffc000001fffffc03fffffffe00fffffffe01fffffc000000fffffe01fffffffe00fffffffc03fffff8000000ffffff00fffffffe00fffffff8~r~n07fffff00000007fffff807ffffffe00fffffff00ffffff00000007fffffc03ffffffe00ffffffe01ffffff00000003fffffe01ffffffe00ffffffc03fffffe0~r~n0000003ffffff00ffffffe00ffffff807fffffe00000003ffffff807fffffe00ffffff00ffffffe00000001ffffffc03fffffe00fffffe01ffffffc00000001f~r~nfffffe01fffffe00fffffc03ffffffc00000001fffffff00fffffe00fffff807ffffffc00000001fffffff807ffffe00fffff00fffffffc00000001fffffffc0~r~n3ffffe00ffffe01fffffffc00000000fffffffe01ffffe00ffffc03fffffffc00000000ffffffff00ffffe00ffff807fffffffc00000000ffffffff807fffe00~r~nffff00ffffffffc00000001ffffffffc01fffe00fffe01ffffffffe00000001ffffffffe00fffe00fffc03ffffffffe00000001fffffffff007ffe00fff007ff~r~nffffffe00000001fffffffff803ffe00fff80fffffffffe00000001fffffffffc07ffe00fffc1fffffffffe00000001fffffffffe0fffe00fffe3ffffffffff0~r~n0000003ffffffffff1fffe00ffff7ffffffffff00000003ffffffffffbfffe00fffffffffffffff80000007ffffffffffffffe00fffffffffffffffc000000ff~r~nfffffffffffffe00fffffffffffffffc000000fffffffffffffffe00fffffffffffffffe000003fffffffffffffffe00ffffffffffffffff800007ffffffffff~r~nfffffe00ffffffffffffffffc0000ffffffffffffffffe00fffffffffffffffff0003ffffffffffffffffe00fffffffffffffffffe01fffffffffffffffffe00~r~nffffffffffffffffffc7fffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffff~r~nfffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffff~r~nfffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffffffffffff~r~nfffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffffffffffffffffffff~r~nfffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00~r~nfffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe0005000000070101000000030000000000}}~r~n\par }}"
			ll_RtnVal = rte_1.PasteRTF(ls_RichText,Detail!)
			wf_OutPut("FunReturn: rte_1.PasteRTF(ls_RichText,Detail!)=" + String(ll_RtnVal),true)
		else
			rte_1.InputFieldInsert("WuZhiJun")
		end if
	Case 'RTEFUNW09P07'
	/*
	   【功能描述】
	    PasteRTF，band为Header!

		【编码描述】
		1、初始化控件，构建数据
		2、设置插入点到Header区，band为Header!，带两个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回粘帖的字节数
		
		【期望UI描述】
		在插入点的位置插入了粘帖的数据
	*/
		
		if ab_exe then
			ls_RichText = "{\rtf1\ansi\ansicpg1252\uc2 \deff17\deflang1033\deflangfe1033{\fonttbl{\f0\froman\fcharset0\fprq2{\*\panose 02020603050405020304}Times New Roman;}{\f17\fnil\fcharset134\fprq2{\*\panose 02010600030101010101}\'cb\'ce\'cc\'e5{\*\falt SimSun};}~r~n{\f28\fnil\fcharset134\fprq2{\*\panose 02010600030101010101}@\'cb\'ce\'cc\'e5;}{\f32\froman\fcharset238\fprq2 Times New Roman CE;}{\f33\froman\fcharset204\fprq2 Times New Roman Cyr;}{\f35\froman\fcharset161\fprq2 Times New Roman Greek;}~r~n{\f36\froman\fcharset162\fprq2 Times New Roman Tur;}{\f37\froman\fcharset177\fprq2 Times New Roman (Hebrew);}{\f38\froman\fcharset178\fprq2 Times New Roman (Arabic);}{\f39\froman\fcharset186\fprq2 Times New Roman Baltic;}~r~n{\f170\fnil\fcharset0\fprq2 SimSun Western{\*\falt SimSun};}{\f258\fnil\fcharset0\fprq2 @\'cb\'ce\'cc\'e5 Western;}}{\colortbl;\red0\green0\blue0;\red0\green0\blue255;\red0\green255\blue255;\red0\green255\blue0;\red255\green0\blue255;\red255\green0\blue0;~r~n\red255\green255\blue0;\red255\green255\blue255;\red0\green0\blue128;\red0\green128\blue128;\red0\green128\blue0;\red128\green0\blue128;\red128\green0\blue0;\red128\green128\blue0;\red128\green128\blue128;\red192\green192\blue192;}{\stylesheet{~r~n\ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 \fs22\cf1\lang1033\langfe2052\loch\f17\hich\af17\dbch\af17\cgrid\langnp1033\langfenp2052 \snext0 Normal;}{\*\cs10 \additive Default Paragraph Font;}}{\info~r~n{\title Tjokdrelkdfaslk;sdf}{\author appeon}{\operator appeon}{\creatim\yr2005\mo6\dy25\hr10\min28}{\revtim\yr2005\mo6\dy27\hr9\min28}{\version8}{\edmins2}{\nofpages1}{\nofwords0}{\nofchars0}{\*\company appeon}{\nofcharsws0}{\vern8269}}~r~n\paperw12240\paperh15840\margl1800\margr1800\margt1440\margb1440\gutter0 \widowctrl\ftnbj\aenddoc\noxlattoyen\expshrtn\noultrlspc\dntblnsbdb\nospaceforul\hyphcaps0\formshade\horzdoc\dgmargin\dghspace180\dgvspace180\dghorigin1800\dgvorigin1440\dghshow1~r~n\dgvshow1\jexpand\viewkind1\viewscale100\pgbrdrhead\pgbrdrfoot\splytwnine\ftnlytwnine\htmautsp\nolnhtadjtbl\useltbaln\alntblind\lytcalctblwd\lyttblrtgr\lnbrkrule \fet0\sectd \linex0\endnhere\sectlinegrid360\sectdefaultcl {\*\pnseclvl1~r~n\pnucrm\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl2\pnucltr\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl3\pndec\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl4\pnlcltr\pnstart1\pnindent720\pnhang{\pntxta \hich )}}~r~n{\*\pnseclvl5\pndec\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl6\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl7\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}~r~n{\*\pnseclvl8\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl9\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}\pard\plain \ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 ~r~n\fs22\cf1\lang1033\langfe2052\loch\af17\hich\af17\dbch\af17\cgrid\langnp1033\langfenp2052 {\hich\af17\dbch\af17\loch\f17 How are you?~r~n\par \hich\af17\dbch\af17\loch\f17 Thank you!~r~n\par \hich\af17\dbch\af17\loch\f17 Not at all.~r~n\par ~r~n\par {\*\shppict{\pict{\*\picprop\shplid1025{\sp{\sn shapeType}{\sv 75}}{\sp{\sn fFlipH}{\sv 0}}{\sp{\sn fFlipV}{\sv 0}}{\sp{\sn pibName}{\sv Aster2.bmp}}{\sp{\sn pibFlags}{\sv 2}}{\sp{\sn fLine}{\sv 0}}{\sp{\sn fLayoutInCell}{\sv 1}}}~r~n\picscalex100\picscaley100\piccropl0\piccropr0\piccropt0\piccropb0\picw3761\pich4329\picwgoal2132\pichgoal2454\pngblip\bliptag-972157684{\*\blipuid c60e0d0cd1e59ba88f607006cc1bd509}~r~n89504e470d0a1a0a0000000d4948445200000097000000a70100000000349ef3790000000467414d410000b18e7cfb5193000000097048597300000faf00000f~r~n120187cff298000003654944415448c7bd963b8e9c4010866b444048eac03247c13703c981431fc147311b39f411dcd25e0047db927197abfeaa6eba61b41a69~r~na51d6917f8fac14f3d9bf8faa32b4a0f327e90bd65ed5bd8a3dff1cefa7e5e59ba5dd946d385ad345c342fd49fe725a2ee3c6f27a2f3bc7b2c0a9b8fb5b34921~r~n13f357e7a5a9617f94eda3de066176a32c0e0d5b67615bdfb065d2b55dc36896f79a41325321e4125767fb0d78999de9cb628f49eb54b16d000b63c5e441d7ea~r~n50d94f17916d51986e2e0c023323fb834067b8779e35630df91ec16ca57bc31ffa2e67d040a629db546f314f0737f307be89fc1b9de1db95e9cba2f992b22f55~r~n94f917f2521e107673793659764960f87437f2e4310479c6821a52d93a16a6ee248dbf652a2c761e93164660e22cc4aea938feaf62aafd56c59fac09c2625731~r~nd93b88592c749c8906cd8f3054312e0f9bac37793e4f1645caf29cc9e63b6579ce448407d4c12c0c5d5ece0f89ce2ecbcb6c61962dfb26df9e987b4e4333ef99~r~nf91bf3d8b017e6dfcc3fda1cac7f84bd8edf8e388d96f4c9842c488e60c96c752369249146a825c388117101b12701fca6137a631d7b1cd803c903a2c7e285f4~r~n427a11bb595cc58a8d5e370216913e50ef6cc122d2a095f916e3543132867d687236213ffc9eb02d0dc8ad15f7a3b30e8c1a76d3cba7cc6c3e7d96bf0f763b64~r~na6f33e66766fadb1be7987691a2b2d59f3dc68bef76db04bd7da006383db6aadd8e439bd994d536d7bf707e352f94dd9629eb51eb0c2977a4141c348309f6f16~r~n2f01235127482db6c6e1bd47df7764cfd79c51aff5b717fc6fe3f9193def7bc39eb05f9b1f92475f38f5a77cd3dc6af24d53ec9c979abce7fc952c4de73c17f5~r~nfbb91e0435fea96eac2398d597a30e6de73a84909fb2c052d7d4a6a9aa6bb9fee5552ecf58553b756ff8a8aab1a5ee9a187279c6b6a3662f53aee3476d27d476~r~n62b716b93cef0ba557eca55798b5c8e5f9590002c9e53983407279b96f0dce74d0190492c9cbbd317a6f4c75bff41e8aabb3e40d0df3432e5b33d896fbb432ef~r~ndd787fd5e3711618f972165826be9c19f0dd99a93bc9ed93999d41cc8e9931f22396f3cbe07eb89c7356cd2deba585059d17c7866d73395f1516a10f41ec3665~r~nfe77e4a09f05ea9ca9cf70af9ef5ec2cd0323ece8e075bcab9f36056375ab695d75667dbb25d55377edd61fcaeec3faf80fed4d45e068e0000000049454e44ae426082}}{\nonshppict{\pict\picscalex100\picscaley100\piccropl0\piccropr0\piccropt0\piccropb0~r~n\picw3761\pich4329\picwgoal2132\pichgoal2454\wmetafile8\bliptag-972157684\blipupi99{\*\blipuid c60e0d0cd1e59ba88f607006cc1bd509}~r~n010009000003d00600000000ac06000000000400000003010800050000000b0200000000050000000c02a700970005000000070104000000ac060000430f2000~r~ncc000000a700970000000000a7009700000000002800000097000000a700000001000100000000000c0d0000af0f0000120f0000020000000200000000000000~r~nffffff00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00~r~nfffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffff~r~nffffffffffcffffffffffffffffffefffffffffffffffffffe03fffffffffffffffffefffffffffffffffffff0007ffffffffffffffffeffffffffffffffffff~r~ne0001ffffffffffffffffeffffffffffffffffff80000ffffffffffffffffeffffffffffffffffff000003fffffffffffffffefffffffffffffffffc000001ff~r~nfffffffffffffefffffffffffffffffc000000fffffffffffffffefffffffffffffffff80000007ffffffffffffffefffffffffffffffff00000007fffffffff~r~nfffffeffffff7ffffffffff00000003ffffffffffdfffefffffe3fffffffffe00000001ffffffffff8fffefffff81fffffffffe00000001ffffffffff07ffefc~r~nfff00fffffffffe00000001fffffffffe03ffefcfff007ffffffffe00000001fffffffffc01ffef8fff803ffffffffe00000000fffffffff803ffef0fffc01ff~r~nffffffc00000000fffffffff007ffef0fffe00ffffffffc00000000ffffffffe00fffee0ffff007fffffffc00000000ffffffffc03fffee0ffff803fffffffc0~r~n0000000ffffffff807fffee0ffffc01fffffffc00000000ffffffff00ffffee0ffffe00fffffffc00000000fffffffe01ffffee0fffff007ffffffc00000000f~r~nffffffc03ffffec0fffff803ffffffe00000000fffffff007ffffec0fffffc01ffffffe00000001ffffffe00fffffec0fffffe00ffffffe00000001ffffffc01~r~nfffffec0ffffff803fffffe00000001ffffff803fffffec0ffffffc01ffffff00000003ffffff007fffffec0ffffffe00ffffff00000003fffffe00ffffffec0~r~nfffffff007fffff80000007fffffc01ffffffee0fffffff803fffff80000007fffff803ffffffee0fffffffc01fffffc000000ffffff007ffffffee0fffffffe~r~n00fffffc000000fffffe00fffffffee0ffffffff007ffffe000000fffffc01fffffffef0ffffffff803ffffe000001fffff803fffffffef0ffffffffc01fffff~r~n000003fffff007fffffffef8ffffffffe00fffff000003ffffe00ffffffffe00fffffffff007ffff800007ffffc01ffffffffe00fffffffff803ffffc0000fff~r~nff803ffffffffe00fffffffffc01ffffc0000fffff00fffffffffe00fffffffffe00ffffe0001ffffe01fffffffffe00ffffffffff007fffe0003ffffc03ffff~r~nfffffe00ffffffffff803ffff0003ffff007fffffffffe00ffffffffffc01ffff8007fffe00ffffffffffe00ffffffffffe00ffff8007fffc01ffffffffffe00~r~nfffffffffff007fffc00ffff803ffffffffffe00fffffffffff803fffe00ffff007ffffffffffe00fffffffffffc01fffe01fffe00fffffffffffe00ffffffff~r~nfffe00ffff01fffc01fffffffffffe00ffffffffffff007fff03fffc03fffffffffffe00ffffffffffff80ffff83fffe07fffffffffffe00ffffffffffffc1ff~r~nff87ffff0ffffffffffffe00ffffffffffffe3ffffc7ffff9ffffffffffffe00fffffffffffff7ffffffffffbffffffffffffe00ffffffffffffffffffffffff~r~nfffffffffffffe00ffff803fffffffffff87fffffffffff007fffe00fffc0003fffffffff0003fffffffff00007ffe00fff00000ffffffffe0001ffffffff800~r~n001ffe00ffc000001fffffff800007ffffffe0000007fe00ff80000007ffffff000003ffffffc0000003fe00ff00000001fffffe000001ffffff00000001fe00~r~nfe000000007ffffc000000fffffc00000001fe00fc000000003ffff8000000fffff000000000fe00fc000000000ffff80000007fffc0000000007e00f8000000~r~n0003fff00000003fff00000000007e00f00000000000fff00000003ffc00000000003e00f000000000007fe00000003ff000000000003e00f000000000001fe0~r~n0000001fc000000000003e00e0000000000007e00000001f0000000000001e00e0000000000001e00000001e0000000000001e00c0000000000000e00000001c~r~n0000000000000e00c000000000000040000000180000000000000e00e0000000000001e00000001e0000000000001e00e0000000000003e00000001f00000000~r~n00001e00e000000000000fe00000001fc000000000001e00f000000000003fe00000003ff000000000003e00f00000000000fff00000003ffc00000000003e00~r~nf00000000001fff00000003fff00000000007e00f80000000007fff80000007fff80000000007e00fc000000001ffff80000007fffe000000000fe00fc000000~r~n007ffffc000000fffff800000001fe00fe00000000fffffe000001fffffc00000001fe00ff00000003fffffe000001ffffff00000003fe00ff0000000fffffff~r~n000007ffffffc0000007fe00ffc000003fffffffc0001ffffffff000000ffe00ffe00000fffffffff0003ffffffffe00003ffe00fff80007fffffffffe03ffff~r~nffffff8000fffe00ffffc1fffffffffffffffffffffffffc3ffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffff7ffffdfffffbfffffff~r~nfffffe00ffffffffffffe3ffff8fffff1ffffffffffffe00ffffffffffffc1ffff07fffe0ffffffffffffe00ffffffffffff80ffff03fffc07fffffffffffe00~r~nffffffffffff007ffe03fff803fffffffffffe00fffffffffffe00fffe01fffc01fffffffffffe00fffffffffffc01fffc01fffe00fffffffffffe00ffffffff~r~nfff803fffc00ffff007ffffffffffe00fffffffffff007fff800ffff803ffffffffffe00ffffffffffe00ffff0007fffc01ffffffffffe00ffffffffffc01fff~r~nf0003fffe00ffffffffffe00ffffffffff803fffe0003ffff007fffffffffe00ffffffffff007fffe0001ffff803fffffffffe00fffffffffe00ffffc0001fff~r~nfc01fffffffffe00fffffffffc01ffffc0000ffffe00fffffffffe00fffffffff803ffff800007ffff007ffffffffe00fffffffff007ffff000007ffff803fff~r~nfffffe00ffffffffe00fffff000003ffffc01ffffffffe00ffffffffc03ffffe000003fffff00ffffffffe00ffffffff807ffffe000001fffff807fffffffe00~r~nffffffff00fffffc000001fffffc03fffffffe00fffffffe01fffffc000000fffffe01fffffffe00fffffffc03fffff8000000ffffff00fffffffe00fffffff8~r~n07fffff00000007fffff807ffffffe00fffffff00ffffff00000007fffffc03ffffffe00ffffffe01ffffff00000003fffffe01ffffffe00ffffffc03fffffe0~r~n0000003ffffff00ffffffe00ffffff807fffffe00000003ffffff807fffffe00ffffff00ffffffe00000001ffffffc03fffffe00fffffe01ffffffc00000001f~r~nfffffe01fffffe00fffffc03ffffffc00000001fffffff00fffffe00fffff807ffffffc00000001fffffff807ffffe00fffff00fffffffc00000001fffffffc0~r~n3ffffe00ffffe01fffffffc00000000fffffffe01ffffe00ffffc03fffffffc00000000ffffffff00ffffe00ffff807fffffffc00000000ffffffff807fffe00~r~nffff00ffffffffc00000001ffffffffc01fffe00fffe01ffffffffe00000001ffffffffe00fffe00fffc03ffffffffe00000001fffffffff007ffe00fff007ff~r~nffffffe00000001fffffffff803ffe00fff80fffffffffe00000001fffffffffc07ffe00fffc1fffffffffe00000001fffffffffe0fffe00fffe3ffffffffff0~r~n0000003ffffffffff1fffe00ffff7ffffffffff00000003ffffffffffbfffe00fffffffffffffff80000007ffffffffffffffe00fffffffffffffffc000000ff~r~nfffffffffffffe00fffffffffffffffc000000fffffffffffffffe00fffffffffffffffe000003fffffffffffffffe00ffffffffffffffff800007ffffffffff~r~nfffffe00ffffffffffffffffc0000ffffffffffffffffe00fffffffffffffffff0003ffffffffffffffffe00fffffffffffffffffe01fffffffffffffffffe00~r~nffffffffffffffffffc7fffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffff~r~nfffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffff~r~nfffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffffffffffff~r~nfffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffffffffffffffffffff~r~nfffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00~r~nfffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe0005000000070101000000030000000000}}~r~n\par }}"
			ll_RtnVal = rte_1.PasteRTF(ls_RichText,Header!)
			wf_OutPut("FunReturn: rte_1.PasteRTF(ls_RichText,Header!)=" + String(ll_RtnVal),true)
		else
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			rte_1.SelectText(1,1,0,0,Header!)
		end if
	Case 'RTEFUNW09P08'
	/*
	   【功能描述】
	    PasteRTF，band为Footer!

		【编码描述】
		1、初始化控件，构建数据
		2、设置插入点到Footer区，band为Footer!，带两个参数调用函数
		3、输出函数返回值

		【代码输出值描述】
		返回粘帖的字节数
		
		【期望UI描述】
		在插入点的位置插入了粘帖的数据
	*/
		
		if ab_exe then
			ls_RichText = "{\rtf1\ansi\ansicpg1252\uc2 \deff17\deflang1033\deflangfe1033{\fonttbl{\f0\froman\fcharset0\fprq2{\*\panose 02020603050405020304}Times New Roman;}{\f17\fnil\fcharset134\fprq2{\*\panose 02010600030101010101}\'cb\'ce\'cc\'e5{\*\falt SimSun};}~r~n{\f28\fnil\fcharset134\fprq2{\*\panose 02010600030101010101}@\'cb\'ce\'cc\'e5;}{\f32\froman\fcharset238\fprq2 Times New Roman CE;}{\f33\froman\fcharset204\fprq2 Times New Roman Cyr;}{\f35\froman\fcharset161\fprq2 Times New Roman Greek;}~r~n{\f36\froman\fcharset162\fprq2 Times New Roman Tur;}{\f37\froman\fcharset177\fprq2 Times New Roman (Hebrew);}{\f38\froman\fcharset178\fprq2 Times New Roman (Arabic);}{\f39\froman\fcharset186\fprq2 Times New Roman Baltic;}~r~n{\f170\fnil\fcharset0\fprq2 SimSun Western{\*\falt SimSun};}{\f258\fnil\fcharset0\fprq2 @\'cb\'ce\'cc\'e5 Western;}}{\colortbl;\red0\green0\blue0;\red0\green0\blue255;\red0\green255\blue255;\red0\green255\blue0;\red255\green0\blue255;\red255\green0\blue0;~r~n\red255\green255\blue0;\red255\green255\blue255;\red0\green0\blue128;\red0\green128\blue128;\red0\green128\blue0;\red128\green0\blue128;\red128\green0\blue0;\red128\green128\blue0;\red128\green128\blue128;\red192\green192\blue192;}{\stylesheet{~r~n\ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 \fs22\cf1\lang1033\langfe2052\loch\f17\hich\af17\dbch\af17\cgrid\langnp1033\langfenp2052 \snext0 Normal;}{\*\cs10 \additive Default Paragraph Font;}}{\info~r~n{\title Tjokdrelkdfaslk;sdf}{\author appeon}{\operator appeon}{\creatim\yr2005\mo6\dy25\hr10\min28}{\revtim\yr2005\mo6\dy27\hr9\min28}{\version8}{\edmins2}{\nofpages1}{\nofwords0}{\nofchars0}{\*\company appeon}{\nofcharsws0}{\vern8269}}~r~n\paperw12240\paperh15840\margl1800\margr1800\margt1440\margb1440\gutter0 \widowctrl\ftnbj\aenddoc\noxlattoyen\expshrtn\noultrlspc\dntblnsbdb\nospaceforul\hyphcaps0\formshade\horzdoc\dgmargin\dghspace180\dgvspace180\dghorigin1800\dgvorigin1440\dghshow1~r~n\dgvshow1\jexpand\viewkind1\viewscale100\pgbrdrhead\pgbrdrfoot\splytwnine\ftnlytwnine\htmautsp\nolnhtadjtbl\useltbaln\alntblind\lytcalctblwd\lyttblrtgr\lnbrkrule \fet0\sectd \linex0\endnhere\sectlinegrid360\sectdefaultcl {\*\pnseclvl1~r~n\pnucrm\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl2\pnucltr\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl3\pndec\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl4\pnlcltr\pnstart1\pnindent720\pnhang{\pntxta \hich )}}~r~n{\*\pnseclvl5\pndec\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl6\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl7\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}~r~n{\*\pnseclvl8\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl9\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}\pard\plain \ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 ~r~n\fs22\cf1\lang1033\langfe2052\loch\af17\hich\af17\dbch\af17\cgrid\langnp1033\langfenp2052 {\hich\af17\dbch\af17\loch\f17 How are you?~r~n\par \hich\af17\dbch\af17\loch\f17 Thank you!~r~n\par \hich\af17\dbch\af17\loch\f17 Not at all.~r~n\par ~r~n\par {\*\shppict{\pict{\*\picprop\shplid1025{\sp{\sn shapeType}{\sv 75}}{\sp{\sn fFlipH}{\sv 0}}{\sp{\sn fFlipV}{\sv 0}}{\sp{\sn pibName}{\sv Aster2.bmp}}{\sp{\sn pibFlags}{\sv 2}}{\sp{\sn fLine}{\sv 0}}{\sp{\sn fLayoutInCell}{\sv 1}}}~r~n\picscalex100\picscaley100\piccropl0\piccropr0\piccropt0\piccropb0\picw3761\pich4329\picwgoal2132\pichgoal2454\pngblip\bliptag-972157684{\*\blipuid c60e0d0cd1e59ba88f607006cc1bd509}~r~n89504e470d0a1a0a0000000d4948445200000097000000a70100000000349ef3790000000467414d410000b18e7cfb5193000000097048597300000faf00000f~r~n120187cff298000003654944415448c7bd963b8e9c4010866b444048eac03247c13703c981431fc147311b39f411dcd25e0047db927197abfeaa6eba61b41a69~r~na51d6917f8fac14f3d9bf8faa32b4a0f327e90bd65ed5bd8a3dff1cefa7e5e59ba5dd946d385ad345c342fd49fe725a2ee3c6f27a2f3bc7b2c0a9b8fb5b34921~r~n13f357e7a5a9617f94eda3de066176a32c0e0d5b67615bdfb065d2b55dc36896f79a41325321e4125767fb0d78999de9cb628f49eb54b16d000b63c5e441d7ea~r~n50d94f17916d51986e2e0c023323fb834067b8779e35630df91ec16ca57bc31ffa2e67d040a629db546f314f0737f307be89fc1b9de1db95e9cba2f992b22f55~r~n94f917f2521e107673793659764960f87437f2e4310479c6821a52d93a16a6ee248dbf652a2c761e93164660e22cc4aea938feaf62aafd56c59fac09c2625731~r~nd93b88592c749c8906cd8f3054312e0f9bac37793e4f1645caf29cc9e63b6579ce448407d4c12c0c5d5ece0f89ce2ecbcb6c61962dfb26df9e987b4e4333ef99~r~nf91bf3d8b017e6dfcc3fda1cac7f84bd8edf8e388d96f4c9842c488e60c96c752369249146a825c388117101b12701fca6137a631d7b1cd803c903a2c7e285f4~r~n427a11bb595cc58a8d5e370216913e50ef6cc122d2a095f916e3543132867d687236213ffc9eb02d0dc8ad15f7a3b30e8c1a76d3cba7cc6c3e7d96bf0f763b64~r~na6f33e66766fadb1be7987691a2b2d59f3dc68bef76db04bd7da006383db6aadd8e439bd994d536d7bf707e352f94dd9629eb51eb0c2977a4141c348309f6f16~r~n2f01235127482db6c6e1bd47df7764cfd79c51aff5b717fc6fe3f9193def7bc39eb05f9b1f92475f38f5a77cd3dc6af24d53ec9c979abce7fc952c4de73c17f5~r~nfbb91e0435fea96eac2398d597a30e6de73a84909fb2c052d7d4a6a9aa6bb9fee5552ecf58553b756ff8a8aab1a5ee9a187279c6b6a3662f53aee3476d27d476~r~n62b716b93cef0ba557eca55798b5c8e5f9590002c9e53983407279b96f0dce74d0190492c9cbbd317a6f4c75bff41e8aabb3e40d0df3432e5b33d896fbb432ef~r~ndd787fd5e3711618f972165826be9c19f0dd99a93bc9ed93999d41cc8e9931f22396f3cbe07eb89c7356cd2deba585059d17c7866d73395f1516a10f41ec3665~r~nfe77e4a09f05ea9ca9cf70af9ef5ec2cd0323ece8e075bcab9f36056375ab695d75667dbb25d55377edd61fcaeec3faf80fed4d45e068e0000000049454e44ae426082}}{\nonshppict{\pict\picscalex100\picscaley100\piccropl0\piccropr0\piccropt0\piccropb0~r~n\picw3761\pich4329\picwgoal2132\pichgoal2454\wmetafile8\bliptag-972157684\blipupi99{\*\blipuid c60e0d0cd1e59ba88f607006cc1bd509}~r~n010009000003d00600000000ac06000000000400000003010800050000000b0200000000050000000c02a700970005000000070104000000ac060000430f2000~r~ncc000000a700970000000000a7009700000000002800000097000000a700000001000100000000000c0d0000af0f0000120f0000020000000200000000000000~r~nffffff00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00~r~nfffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffff~r~nffffffffffcffffffffffffffffffefffffffffffffffffffe03fffffffffffffffffefffffffffffffffffff0007ffffffffffffffffeffffffffffffffffff~r~ne0001ffffffffffffffffeffffffffffffffffff80000ffffffffffffffffeffffffffffffffffff000003fffffffffffffffefffffffffffffffffc000001ff~r~nfffffffffffffefffffffffffffffffc000000fffffffffffffffefffffffffffffffff80000007ffffffffffffffefffffffffffffffff00000007fffffffff~r~nfffffeffffff7ffffffffff00000003ffffffffffdfffefffffe3fffffffffe00000001ffffffffff8fffefffff81fffffffffe00000001ffffffffff07ffefc~r~nfff00fffffffffe00000001fffffffffe03ffefcfff007ffffffffe00000001fffffffffc01ffef8fff803ffffffffe00000000fffffffff803ffef0fffc01ff~r~nffffffc00000000fffffffff007ffef0fffe00ffffffffc00000000ffffffffe00fffee0ffff007fffffffc00000000ffffffffc03fffee0ffff803fffffffc0~r~n0000000ffffffff807fffee0ffffc01fffffffc00000000ffffffff00ffffee0ffffe00fffffffc00000000fffffffe01ffffee0fffff007ffffffc00000000f~r~nffffffc03ffffec0fffff803ffffffe00000000fffffff007ffffec0fffffc01ffffffe00000001ffffffe00fffffec0fffffe00ffffffe00000001ffffffc01~r~nfffffec0ffffff803fffffe00000001ffffff803fffffec0ffffffc01ffffff00000003ffffff007fffffec0ffffffe00ffffff00000003fffffe00ffffffec0~r~nfffffff007fffff80000007fffffc01ffffffee0fffffff803fffff80000007fffff803ffffffee0fffffffc01fffffc000000ffffff007ffffffee0fffffffe~r~n00fffffc000000fffffe00fffffffee0ffffffff007ffffe000000fffffc01fffffffef0ffffffff803ffffe000001fffff803fffffffef0ffffffffc01fffff~r~n000003fffff007fffffffef8ffffffffe00fffff000003ffffe00ffffffffe00fffffffff007ffff800007ffffc01ffffffffe00fffffffff803ffffc0000fff~r~nff803ffffffffe00fffffffffc01ffffc0000fffff00fffffffffe00fffffffffe00ffffe0001ffffe01fffffffffe00ffffffffff007fffe0003ffffc03ffff~r~nfffffe00ffffffffff803ffff0003ffff007fffffffffe00ffffffffffc01ffff8007fffe00ffffffffffe00ffffffffffe00ffff8007fffc01ffffffffffe00~r~nfffffffffff007fffc00ffff803ffffffffffe00fffffffffff803fffe00ffff007ffffffffffe00fffffffffffc01fffe01fffe00fffffffffffe00ffffffff~r~nfffe00ffff01fffc01fffffffffffe00ffffffffffff007fff03fffc03fffffffffffe00ffffffffffff80ffff83fffe07fffffffffffe00ffffffffffffc1ff~r~nff87ffff0ffffffffffffe00ffffffffffffe3ffffc7ffff9ffffffffffffe00fffffffffffff7ffffffffffbffffffffffffe00ffffffffffffffffffffffff~r~nfffffffffffffe00ffff803fffffffffff87fffffffffff007fffe00fffc0003fffffffff0003fffffffff00007ffe00fff00000ffffffffe0001ffffffff800~r~n001ffe00ffc000001fffffff800007ffffffe0000007fe00ff80000007ffffff000003ffffffc0000003fe00ff00000001fffffe000001ffffff00000001fe00~r~nfe000000007ffffc000000fffffc00000001fe00fc000000003ffff8000000fffff000000000fe00fc000000000ffff80000007fffc0000000007e00f8000000~r~n0003fff00000003fff00000000007e00f00000000000fff00000003ffc00000000003e00f000000000007fe00000003ff000000000003e00f000000000001fe0~r~n0000001fc000000000003e00e0000000000007e00000001f0000000000001e00e0000000000001e00000001e0000000000001e00c0000000000000e00000001c~r~n0000000000000e00c000000000000040000000180000000000000e00e0000000000001e00000001e0000000000001e00e0000000000003e00000001f00000000~r~n00001e00e000000000000fe00000001fc000000000001e00f000000000003fe00000003ff000000000003e00f00000000000fff00000003ffc00000000003e00~r~nf00000000001fff00000003fff00000000007e00f80000000007fff80000007fff80000000007e00fc000000001ffff80000007fffe000000000fe00fc000000~r~n007ffffc000000fffff800000001fe00fe00000000fffffe000001fffffc00000001fe00ff00000003fffffe000001ffffff00000003fe00ff0000000fffffff~r~n000007ffffffc0000007fe00ffc000003fffffffc0001ffffffff000000ffe00ffe00000fffffffff0003ffffffffe00003ffe00fff80007fffffffffe03ffff~r~nffffff8000fffe00ffffc1fffffffffffffffffffffffffc3ffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffff7ffffdfffffbfffffff~r~nfffffe00ffffffffffffe3ffff8fffff1ffffffffffffe00ffffffffffffc1ffff07fffe0ffffffffffffe00ffffffffffff80ffff03fffc07fffffffffffe00~r~nffffffffffff007ffe03fff803fffffffffffe00fffffffffffe00fffe01fffc01fffffffffffe00fffffffffffc01fffc01fffe00fffffffffffe00ffffffff~r~nfff803fffc00ffff007ffffffffffe00fffffffffff007fff800ffff803ffffffffffe00ffffffffffe00ffff0007fffc01ffffffffffe00ffffffffffc01fff~r~nf0003fffe00ffffffffffe00ffffffffff803fffe0003ffff007fffffffffe00ffffffffff007fffe0001ffff803fffffffffe00fffffffffe00ffffc0001fff~r~nfc01fffffffffe00fffffffffc01ffffc0000ffffe00fffffffffe00fffffffff803ffff800007ffff007ffffffffe00fffffffff007ffff000007ffff803fff~r~nfffffe00ffffffffe00fffff000003ffffc01ffffffffe00ffffffffc03ffffe000003fffff00ffffffffe00ffffffff807ffffe000001fffff807fffffffe00~r~nffffffff00fffffc000001fffffc03fffffffe00fffffffe01fffffc000000fffffe01fffffffe00fffffffc03fffff8000000ffffff00fffffffe00fffffff8~r~n07fffff00000007fffff807ffffffe00fffffff00ffffff00000007fffffc03ffffffe00ffffffe01ffffff00000003fffffe01ffffffe00ffffffc03fffffe0~r~n0000003ffffff00ffffffe00ffffff807fffffe00000003ffffff807fffffe00ffffff00ffffffe00000001ffffffc03fffffe00fffffe01ffffffc00000001f~r~nfffffe01fffffe00fffffc03ffffffc00000001fffffff00fffffe00fffff807ffffffc00000001fffffff807ffffe00fffff00fffffffc00000001fffffffc0~r~n3ffffe00ffffe01fffffffc00000000fffffffe01ffffe00ffffc03fffffffc00000000ffffffff00ffffe00ffff807fffffffc00000000ffffffff807fffe00~r~nffff00ffffffffc00000001ffffffffc01fffe00fffe01ffffffffe00000001ffffffffe00fffe00fffc03ffffffffe00000001fffffffff007ffe00fff007ff~r~nffffffe00000001fffffffff803ffe00fff80fffffffffe00000001fffffffffc07ffe00fffc1fffffffffe00000001fffffffffe0fffe00fffe3ffffffffff0~r~n0000003ffffffffff1fffe00ffff7ffffffffff00000003ffffffffffbfffe00fffffffffffffff80000007ffffffffffffffe00fffffffffffffffc000000ff~r~nfffffffffffffe00fffffffffffffffc000000fffffffffffffffe00fffffffffffffffe000003fffffffffffffffe00ffffffffffffffff800007ffffffffff~r~nfffffe00ffffffffffffffffc0000ffffffffffffffffe00fffffffffffffffff0003ffffffffffffffffe00fffffffffffffffffe01fffffffffffffffffe00~r~nffffffffffffffffffc7fffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffff~r~nfffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffff~r~nfffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffffffffffff~r~nfffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffffffffffffffffffff~r~nfffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00~r~nfffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe0005000000070101000000030000000000}}~r~n\par }}"
			ll_RtnVal = rte_1.PasteRTF(ls_RichText,Footer!)
			wf_OutPut("FunReturn: rte_1.PasteRTF(ls_RichText,Footer!)=" + String(ll_RtnVal),true)
		else
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			rte_1.SelectText(1,1,0,0,Footer!)
		end if
	Case 'RTEFUNW09P09'
	/*
	   【功能描述】
	    PointerX

		【编码描述】
		1、初始化控件，构建数据
		2、调用函数
		3、输出函数返回值

		【代码输出值描述】
		Returns the pointer's distance from the left edge of objectname in PowerBuilder units
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			li_RtnVal = rte_1.PointerX()
			if li_RtnVal >= 0 then
				ls_Temp = "Execute Succeed!"
			else
				ls_Temp = "Execute Failed!"
			end if
			wf_OutPut("FunReturn: rte_1.PointerX()=" + ls_Temp,true)
		else
		end if
	Case 'RTEFUNW09P10'
	/*
	   【功能描述】
	    PointerY

		【编码描述】
		1、初始化控件，构建数据
		2、调用函数
		3、输出函数返回值

		【代码输出值描述】
		Returns the pointer's distance from the top of objectname in PowerBuilder units
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			li_RtnVal = rte_1.PointerY()
			if li_RtnVal >= 0 then
				ls_Temp = "Execute Succeed!"
			else
				ls_Temp = "Execute Failed!"
			end if
			wf_OutPut("FunReturn: rte_1.PointerY()=" + ls_Temp,true)
		else
		end if
	Case 'RTEFUNW09P11'
	/*
	   【功能描述】
	    Position,带两个参数，插入点在Detail区，没有高亮选中内容，插入点所处行前面有InputField

		【编码描述】
		1、初始化控件，构建数据
		2、设置插入点在Detail区，有InputField位于插入点前面且在同一行，带两个参数调用函数
		3、输出函数返回值以及参数值

		【代码输出值描述】
		函数返回Detail!枚举值
		参数为插入点的位置
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lb_Band = rte_1.Position(ll_FromLine,ll_FromChar)
			Choose Case lb_Band
				Case detail!
					ls_Temp = 'detail!'
				Case footer!
					ls_Temp = 'footer!'
				Case header!
					ls_Temp = 'header!'
			End Choose
			wf_OutPut("FunReturn: rte_1.Position(ll_FromLine,ll_FromChar)=" + ls_Temp,true)
			wf_OutPut("VarReturn: FromLine=" + String(ll_FromLine),false)
			wf_OutPut("VarReturn: FromChar=" + String(ll_FromChar),false)
		else
			rte_1.SelectText(1,1,0,0,Detail!)
			rte_1.InputFieldInsert("RuYu")
		end if
	Case 'RTEFUNW09P12'
	/*
	   【功能描述】
	    Position,带两个参数，插入点在Detail区，没有高亮选中内容，插入点所处行前面有图片

		【编码描述】
		1、初始化控件，构建数据
		2、设置插入点在Detail区，有位于位于插入点前面且在同一行，带两个参数调用函数
		3、输出函数返回值以及参数值

		【代码输出值描述】
		函数返回Detail!枚举值
		参数为插入点的位置
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lb_Band = rte_1.Position(ll_FromLine,ll_FromChar)
			Choose Case lb_Band
				Case detail!
					ls_Temp = 'detail!'
				Case footer!
					ls_Temp = 'footer!'
				Case header!
					ls_Temp = 'header!'
			End Choose
			wf_OutPut("FunReturn: rte_1.Position(ll_FromLine,ll_FromChar)=" + ls_Temp,true)
			wf_OutPut("VarReturn: FromLine=" + String(ll_FromLine),false)
			wf_OutPut("VarReturn: FromChar=" + String(ll_FromChar),false)
		else
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW09P13'
	/*
	   【功能描述】
	    Position,带两个参数，插入点在Header区，从后往前高亮选中多行内容

		【编码描述】
		1、初始化控件，构建数据
		2、设置插入点在Header区，从后往前高高亮选中多行内容，带两个参数调用函数
		3、输出函数返回值以及参数值

		【代码输出值描述】
		函数返回Header!枚举值
		参数为插入点的位置
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lb_Band = rte_1.Position(ll_FromLine,ll_FromChar)
			Choose Case lb_Band
				Case detail!
					ls_Temp = 'detail!'
				Case footer!
					ls_Temp = 'footer!'
				Case header!
					ls_Temp = 'header!'
			End Choose
			wf_OutPut("FunReturn: rte_1.Position(ll_FromLine,ll_FromChar)=" + ls_Temp,true)
			wf_OutPut("VarReturn: FromLine=" + String(ll_FromLine),false)
			wf_OutPut("VarReturn: FromChar=" + String(ll_FromChar),false)
		else
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			rte_1.SelectText(10,1,1,1,Header!)
		end if
	Case 'RTEFUNW09P14'
	/*
	   【功能描述】
	    Position,带两个参数，插入点在Footer区，从前往后高亮选中多行内容

		【编码描述】
		1、初始化控件，构建数据
		2、设置插入点在Footer区，从前往后高亮选中多行内容，带两个参数调用函数
		3、输出函数返回值以及参数值

		【代码输出值描述】
		函数返回Footer!枚举值
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lb_Band = rte_1.Position(ll_FromLine,ll_FromChar)
			Choose Case lb_Band
				Case detail!
					ls_Temp = 'detail!'
				Case footer!
					ls_Temp = 'footer!'
				Case header!
					ls_Temp = 'header!'
			End Choose
			wf_OutPut("FunReturn: rte_1.Position(ll_FromLine,ll_FromChar)=" + ls_Temp,true)
			wf_OutPut("VarReturn: FromLine=" + String(ll_FromLine),false)
			wf_OutPut("VarReturn: FromChar=" + String(ll_FromChar),false)
		else
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			rte_1.SelectText(1,1,10,1,Footer!)
		end if
	Case 'RTEFUNW09P15'
	/*
	   【功能描述】
	    Position,带四个参数，插入点在Detail区，没有高亮选中内容，插入点所处行前面有InputField

		【编码描述】
		1、初始化控件，构建数据
		2、设置插入点在Detail区，有InputField位于插入点前面且在同一行，带四个参数调用函数
		3、输出函数返回值以及参数值

		【代码输出值描述】
		函数返回Detail!枚举值
		参数为插入点的位置
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lb_Band = rte_1.Position(ll_FromLine,ll_FromChar,ll_ToLine,ll_ToChar)
			Choose Case lb_Band
				Case detail!
					ls_Temp = 'detail!'
				Case footer!
					ls_Temp = 'footer!'
				Case header!
					ls_Temp = 'header!'
			End Choose
			wf_OutPut("FunReturn: rte_1.Position(ll_FromLine,ll_FromChar,ll_ToLine,ll_ToChar)=" + ls_Temp,true)
			wf_OutPut("VarReturn: FromLine=" + String(ll_FromLine),false)
			wf_OutPut("VarReturn: FromChar=" + String(ll_FromChar),false)
			wf_OutPut("VarReturn: ToLine=" + String(ll_ToLine),false)
			wf_OutPut("VarReturn: ToChar=" + String(ll_ToChar),false)
		else
			rte_1.SelectText(1,1,0,0,Detail!)
			rte_1.InputFieldInsert("LanSu")
		end if
	Case 'RTEFUNW09P16'
	/*
	   【功能描述】
	    Position,带四个参数，插入点在Detail区，没有高亮选中内容，插入点所处行前面有图片

		【编码描述】
		1、初始化控件，构建数据
		2、设置插入点在Detail区，有位于位于插入点前面且在同一行，带四个参数调用函数
		3、输出函数返回值以及参数值

		【代码输出值描述】
		函数返回Detail!枚举值
		参数为插入点的位置
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lb_Band = rte_1.Position(ll_FromLine,ll_FromChar,ll_ToLine,ll_ToChar)
			Choose Case lb_Band
				Case detail!
					ls_Temp = 'detail!'
				Case footer!
					ls_Temp = 'footer!'
				Case header!
					ls_Temp = 'header!'
			End Choose
			wf_OutPut("FunReturn: rte_1.Position(ll_FromLine,ll_FromChar,ll_ToLine,ll_ToChar)=" + ls_Temp,true)
			wf_OutPut("VarReturn: FromLine=" + String(ll_FromLine),false)
			wf_OutPut("VarReturn: FromChar=" + String(ll_FromChar),false)
			wf_OutPut("VarReturn: ToLine=" + String(ll_ToLine),false)
			wf_OutPut("VarReturn: ToChar=" + String(ll_ToChar),false)
		else
			rte_1.SelectText(1,1,0,0,Detail!)
		end if
	Case 'RTEFUNW09P17'
	/*
	   【功能描述】
	    Position,带四个参数，插入点在Header区，从后往前高亮选中多行内容

		【编码描述】
		1、初始化控件，构建数据
		2、设置插入点在Header区，从后往前高高亮选中多行内容，带四个参数调用函数
		3、输出函数返回值以及参数值

		【代码输出值描述】
		函数返回Header!枚举值
		参数为插入点的位置
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lb_Band = rte_1.Position(ll_FromLine,ll_FromChar,ll_ToLine,ll_ToChar)
			Choose Case lb_Band
				Case detail!
					ls_Temp = 'detail!'
				Case footer!
					ls_Temp = 'footer!'
				Case header!
					ls_Temp = 'header!'
			End Choose
			wf_OutPut("FunReturn: rte_1.Position(ll_FromLine,ll_FromChar,ll_ToLine,ll_ToChar)=" + ls_Temp,true)
			wf_OutPut("VarReturn: FromLine=" + String(ll_FromLine),false)
			wf_OutPut("VarReturn: FromChar=" + String(ll_FromChar),false)
			wf_OutPut("VarReturn: ToLine=" + String(ll_ToLine),false)
			wf_OutPut("VarReturn: ToChar=" + String(ll_ToChar),false)
		else
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			rte_1.SelectText(10,1,1,1,Header!)
		end if
	Case 'RTEFUNW09P18'
	/*
	   【功能描述】
	    Position,带四个参数，插入点在Footer区，从前往后高亮选中多行内容

		【编码描述】
		1、初始化控件，构建数据
		2、设置插入点在Footer区，从前往后高亮选中多行内容，带四个参数调用函数
		3、输出函数返回值以及参数值

		【代码输出值描述】
		函数返回Footer!枚举值
		
		【期望UI描述】
		
	*/
		
		if ab_exe then
			lb_Band = rte_1.Position(ll_FromLine,ll_FromChar,ll_ToLine,ll_ToChar)
			Choose Case lb_Band
				Case detail!
					ls_Temp = 'detail!'
				Case footer!
					ls_Temp = 'footer!'
				Case header!
					ls_Temp = 'header!'
			End Choose
			wf_OutPut("FunReturn: rte_1.Position(ll_FromLine,ll_FromChar,ll_ToLine,ll_ToChar)=" + ls_Temp,true)
			wf_OutPut("VarReturn: FromLine=" + String(ll_FromLine),false)
			wf_OutPut("VarReturn: FromChar=" + String(ll_FromChar),false)
			wf_OutPut("VarReturn: ToLine=" + String(ll_ToLine),false)
			wf_OutPut("VarReturn: ToChar=" + String(ll_ToChar),false)
		else
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			rte_1.SelectText(1,1,10,1,Footer!)
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




end event

event close;call super::close;
if FileExists("PUB_BMP_APB.bmp") then
	FileDelete("PUB_BMP_APB.bmp")
end if

end event

type mle_phenomena from w_templet`mle_phenomena within w_rtefunw09
end type

type cb_autoparse from w_templet`cb_autoparse within w_rtefunw09
end type

type cb_wrrun from w_templet`cb_wrrun within w_rtefunw09
end type

type cb_genconfigfile from w_templet`cb_genconfigfile within w_rtefunw09
end type

type dw_info from w_templet`dw_info within w_rtefunw09
end type

type pb_saveexpect from w_templet`pb_saveexpect within w_rtefunw09
end type

type pb_runnext from w_templet`pb_runnext within w_rtefunw09
end type

type pb_runall from w_templet`pb_runall within w_rtefunw09
end type

type pb_run from w_templet`pb_run within w_rtefunw09
end type

type pb_end from w_templet`pb_end within w_rtefunw09
end type

type mle_expectdesc from w_templet`mle_expectdesc within w_rtefunw09
integer y = 64
integer height = 440
end type

type mle_describe from w_templet`mle_describe within w_rtefunw09
integer y = 588
integer height = 716
end type

type mle_factual from w_templet`mle_factual within w_rtefunw09
integer y = 1808
integer height = 328
end type

type mle_expect from w_templet`mle_expect within w_rtefunw09
integer y = 1392
integer height = 332
end type

type dw_testpoint from w_templet`dw_testpoint within w_rtefunw09
integer y = 1392
integer height = 744
end type

type gb_1 from w_templet`gb_1 within w_rtefunw09
integer y = 1324
integer height = 828
end type

type gb_2 from w_templet`gb_2 within w_rtefunw09
integer y = 0
integer height = 520
end type

type gb_3 from w_templet`gb_3 within w_rtefunw09
integer y = 1324
integer height = 416
end type

type gb_4 from w_templet`gb_4 within w_rtefunw09
integer y = 1736
integer height = 416
end type

type gb_5 from w_templet`gb_5 within w_rtefunw09
integer y = 524
integer height = 796
end type

type gb_phenomena from w_templet`gb_phenomena within w_rtefunw09
end type

type rte_1 from richtextedit within w_rtefunw09
integer x = 27
integer y = 32
integer width = 2921
integer height = 1288
integer taborder = 70
boolean bringtotop = true
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_headerfooter = true
borderstyle borderstyle = stylelowered!
end type

