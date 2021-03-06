# Form/Window View - Generated Source Code File 
# Generated by the Ring 1.9 Form Designer
# Date : 13/08/2018
# Time : 04:29:00

Load "stdlib.ring"
Load "guilib.ring"

import System.GUI

if IsMainSourceFile() { 
	new App {
		StyleFusion()
		new QtClassConverterView { win.show() } 
		exec()
	}
}

class QtClassConverterView from WindowsViewParent
	win = new MainWindow() { 
		move(14,14)
		resize(1263,716)
		setWindowTitle("Qt Class Converter for RingQt Code Generator")
		setstylesheet("background-color:;") 

		setWindowFlags(Qt_Window | Qt_WindowTitleHint | Qt_WindowSystemMenuHint | Qt_WindowMinimizeButtonHint | Qt_WindowCloseButtonHint) 
		Lablel1 = new label(win) {
			move(168,22)
			resize(152,22)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("Qt Class Name")
			setAlignment(Qt_AlignLeft |  Qt_AlignVCenter)
		}
		Label2 = new label(win) {
			move(620,56)
			resize(144,35)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("Class Code Name")
			setAlignment(Qt_AlignLeft |  Qt_AlignVCenter)
		}
		ClassNameLE = new lineedit(win) {
			move(360,15)
			resize(223,32)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("")
			setTextChangedEvent(Method(:ClassNameLEChangedAction))
			setcursorPositionChangedEvent("")
			seteditingFinishedEvent("")
			setreturnPressedEvent("")
			setselectionChangedEvent("")
			settextEditedEvent("")
			
		}
		ClassCodeNameLE = new lineedit(win) {
			move(783,54)
			resize(225,32)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("")
			setTextChangedEvent("")
			setcursorPositionChangedEvent("")
			seteditingFinishedEvent("")
			setreturnPressedEvent("")
			setselectionChangedEvent("")
			settextEditedEvent("")
			
		}
		ClassParaL = new label(win) {
			move(363,96)
			resize(500,16)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("")
			setAlignment(Qt_AlignLeft |  Qt_AlignVCenter)
		}
		RBNormal = new radiobutton(win) {
			move(359,123)
			resize(111,20)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("Normal")
			setclickedEvent("")
			setpressedEvent("")
			setreleasedEvent("")
			settoggledEvent(Method(:RBNormalAction))
			
		}
		RBNoNew = new radiobutton(win) {
			move(480,123)
			resize(110,19)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("No New")
			setclickedEvent("")
			setpressedEvent("")
			setreleasedEvent("")
			settoggledEvent(Method(:RBNoNewAction))
			
		}
		RBAbstract = new radiobutton(win) {
			move(596,124)
			resize(115,20)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("Abstract")
			setclickedEvent("")
			setpressedEvent("")
			setreleasedEvent("")
			settoggledEvent(Method(:RBAbstractAction))
			
		}
		PassVMPointerCB = new checkbox(win) {
			move(746,124)
			resize(158,20)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("Pass VM Pointer")
			setstateChangedEvent("")
			setclickedEvent("")
			setpressedEvent("")
			setreleasedEvent("")
			settoggledEvent("")
			
		}
		Lablel10 = new label(win) {
			move(618,18)
			resize(152,35)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("Qt Class Parent")
			setAlignment(Qt_AlignLeft |  Qt_AlignVCenter)
		}
		ClassParentLE = new lineedit(win) {
			move(783,14)
			resize(225,32)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("")
			setTextChangedEvent("")
			setcursorPositionChangedEvent("")
			seteditingFinishedEvent("")
			setreturnPressedEvent("")
			setselectionChangedEvent("")
			settextEditedEvent("")
			
		}
		Label12 = new label(win) {
			move(167,60)
			resize(184,32)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("Init Method Parameters")
			setAlignment(Qt_AlignLeft |  Qt_AlignVCenter)
		}
		ClassParaLE = new lineedit(win) {
			move(366,57)
			resize(218,32)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("")
			setTextChangedEvent("")
			setcursorPositionChangedEvent("")
			seteditingFinishedEvent("")
			setreturnPressedEvent("")
			setselectionChangedEvent("")
			settextEditedEvent("")
			
		}
		Label6 = new label(win) {
			move(101,173)
			resize(117,31)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("Enums \ Flags ")
			setAlignment(Qt_AlignLeft |  Qt_AlignVCenter)
		}
		EnumsFlagsTE = new textedit(win) {
			move(27,210)
			resize(254,58)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("")
			setcopyAvailableEvent("")
			setcurrentCharFormatChangedEvent("")
			setcursorPositionChangedEvent("")
			setredoAvailableEvent("")
			setselectionChangedEvent("")
			settextChangedEvent(Method(:FunctionsTEChangedAction))
			setundoAvailableEvent("")
			
		}
		Label16 = new label(win) {
			move(62,283)
			resize(177,31)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("Public Functions \ Slots ")
			setAlignment(Qt_AlignLeft |  Qt_AlignVCenter)
		}
		FunctionsTE = new textedit(win) {
			move(26,320)
			resize(254,134)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("")
			setcopyAvailableEvent("")
			setcurrentCharFormatChangedEvent("")
			setcursorPositionChangedEvent("")
			setredoAvailableEvent("")
			setselectionChangedEvent("")
			settextChangedEvent(Method(:FunctionsTEChangedAction))
			setundoAvailableEvent("")
			
		}
		Label18 = new label(win) {
			move(111,472)
			resize(67,28)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("Signals ")
			setAlignment(Qt_AlignLeft |  Qt_AlignVCenter)
		}
		Label9 = new label(win) {
			move(617,178)
			resize(240,19)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("Output compatible with qt.cf file :")
			setAlignment(Qt_AlignLeft |  Qt_AlignVCenter)
		}
		QtcfOutputTE = new textedit(win) {
			move(295,210)
			resize(933,190)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("")
			setcopyAvailableEvent("")
			setcurrentCharFormatChangedEvent("")
			setcursorPositionChangedEvent("")
			setredoAvailableEvent("")
			setselectionChangedEvent("")
			settextChangedEvent("")
			setundoAvailableEvent("")
			
		}
		Label22 = new label(win) {
			move(597,414)
			resize(310,20)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("Output compatible with qtevents.ring file")
			setAlignment(Qt_AlignLeft |  Qt_AlignVCenter)
		}
		QtEventsOutputTE = new textedit(win) {
			move(295,445)
			resize(933,170)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("")
			setcopyAvailableEvent("")
			setcurrentCharFormatChangedEvent("")
			setcursorPositionChangedEvent("")
			setredoAvailableEvent("")
			setselectionChangedEvent("")
			settextChangedEvent("")
			setundoAvailableEvent("")
			
		}
		Label11 = new label(win) {
			move(237,120)
			resize(108,27)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("Class Type :")
			setAlignment(Qt_AlignLeft |  Qt_AlignVCenter)
		}
		ConvertBtn = new pushbutton(win) {
			move(24,630)
			resize(255,37)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("Convert")
			setClickEvent(Method(:ConvertBtnAction))
			setBtnImage(ConvertBtn,"")
			
		}
		SignalsTE = new textedit(win) {
			move(26,506)
			resize(254,109)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("")
			setcopyAvailableEvent("")
			setcurrentCharFormatChangedEvent("")
			setcursorPositionChangedEvent("")
			setredoAvailableEvent("")
			setselectionChangedEvent("")
			settextChangedEvent(Method(:SignalsTEChangedAction))
			setundoAvailableEvent("")
			
		}
		Label122 = new label(win) {
			move(1090,644)
			resize(128,23)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("By: Majdi Sobain")
			setAlignment(Qt_AlignLeft |  Qt_AlignVCenter)
		}
	}

# End of the Generated Source Code File...