//
//  ContentView.swift
//  myCalc2
//
//  Created by Ανδρέας Γκόγκος on 13/12/20.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var displayText: String = "0"
    @State private var operandPlus: Bool = false
    @State private var operandMinus: Bool = false
    @State private var operandMultiply: Bool = false
    @State private var operandDivide: Bool = false
    @State private var operationInProcess: Bool = false
    @State private var decimal: Bool = false
    @State private var number1: Double = 0
    @State private var number2: Double = 0
    @State private var lastOperand: [Bool] = [false, false, false, false] // + , - , x, /
    @State private var tempNumber2: Double = 0
    @State private var powerToTheNPressed: Bool = false
    
    
    var darkGrayColor: Color = .init(red: 60/254, green: 60/254, blue: 60/254)
    
    var body: some View {
        ZStack (alignment: .bottom){
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 12){
                VStack {
                    Logo()
                }
                Spacer()
                VStack {
                    Display(displayText: self.displayText)
                }
                HStack{
                    Button(action: {
                        displayText = String(sin(Double(displayText)!))
                        makeSoundAndVibrate()
                    }, label: {
                        MathButtons(buttonText: "sin")
                    })
                    Button(action: {
                        displayText = String(cos(Double(displayText)!))
                        makeSoundAndVibrate()
                    }, label: {
                        MathButtons(buttonText: "cos")
                    })
                    Button(action: {
                        displayText = String(tan(Double(displayText)!))
                        makeSoundAndVibrate()
                    }, label: {
                        MathButtons(buttonText: "tan")
                    })
                    Button(action: {
                        displayText = String(asin(Double(displayText)!))
                        makeSoundAndVibrate()
                    }, label: {
                        MathButtons(buttonText: "sin⁻¹")
                    })
                    Button(action: {
                        displayText = String(acos(Double(displayText)!))
                        makeSoundAndVibrate()
                    }, label: {
                        MathButtons(buttonText: "cos⁻¹")
                    })
                    Button(action: {
                        displayText = String(atan(Double(displayText)!))
                        makeSoundAndVibrate()
                    }, label: {
                        MathButtons(buttonText: "tan⁻¹")
                    })
                    Button(action: {
                        displayText = String(Darwin.M_E)
                        makeSoundAndVibrate()
                    }, label: {
                        MathButtons(buttonText: "e")
                    })
                    Button(action: {
                        displayText = String(Double.pi)
                        makeSoundAndVibrate()
                    }, label: {
                        MathButtons(buttonText: "π")
                    })
                }
                HStack{
                    Button(action: {
                        displayText = String(pow(Double(displayText)!, 2))
                        makeSoundAndVibrate()
                    }, label: {
                        MathButtons(buttonText: "x²")
                    })
                    Button(action: {
                        displayText = String(pow(Double(displayText)!, 3))
                        makeSoundAndVibrate()
                    }, label: {
                        MathButtons(buttonText: "x³")
                    })
                    Button(action: {
                        powerToTheNPressed = true
                        number1 = Double(displayText)!
                        operationInProcess = true
                        makeSoundAndVibrate()
                    }, label: {
                        MathButtons(buttonText: "xⁿ")
                    })
                    Button(action: {
                        displayText = String(sqrt(Double(displayText)!))
                        makeSoundAndVibrate()
                    }, label: {
                        MathButtons(buttonText: "√x")
                    })
                    Button(action: {
                        displayText = String(cbrt(Double(displayText)!))
                        makeSoundAndVibrate()
                    }, label: {
                        MathButtons(buttonText: "∛x")
                    })
                    Button(action: {
                        displayText = String(1/Double(displayText)!)
                        makeSoundAndVibrate()
                    }, label: {
                        MathButtons(buttonText: "x⁻¹")
                    })
                    Button(action: {
                        displayText = String(log(Double(displayText)!)/log(10))
                        makeSoundAndVibrate()
                    }, label: {
                        MathButtons(buttonText: "logx")
                    })
                    Button(action: {
                        displayText = String(log(Double(displayText)!))
                        makeSoundAndVibrate()
                    }, label: {
                        MathButtons(buttonText: "lnx")
                    })
                }
                HStack(spacing: 12){
                    Button(action: {
                        operandPlus = false
                        operandMinus = false
                        operandMultiply = false
                        operandDivide = false
                        decimal = false
                        displayText = "0"
                        lastOperand = [false, false, false, false]
                        number1 = 0
                        number2 = 0
                        makeSoundAndVibrate()
                    }, label: {
                        CalcButton(buttonText: "AC", buttonColor: .gray)
                    })
                    Button(action: {
                        if displayText.prefix(1) != "-" {
                            let temp: String = displayText
                            displayText = "-" + temp
                        } else if displayText.prefix(1) == "-" {
                            displayText = String(displayText.dropFirst())
                        }
                        makeSoundAndVibrate()
                    }, label: {
                        CalcButton(buttonText: "±", buttonColor: .gray)
                    })
                    Button(action: {
                        makeSoundAndVibrate()
                        displayText = String(Double(displayText)! * 0.01)
                    }, label: {
                        CalcButton(buttonText: "%", buttonColor: .gray)
                    })
                    Button(action: {
                        number1 = Double(displayText)!
                        operandDivide.toggle()
                        operationInProcess = true
                        decimal = false
                        makeSoundAndVibrate()
                    }, label: {
                        CalcButton(buttonText: "÷", buttonColor: .yellow)
                    })
                }
                HStack(spacing: 12){
                    Button(action: {
                        addButtonText(numberToBeAdded: "7")
                    }, label: {
                        CalcButton(buttonText: "7", buttonColor: darkGrayColor)
                    })
                    Button(action: {
                        addButtonText(numberToBeAdded: "8")
                    }, label: {
                        CalcButton(buttonText: "8", buttonColor: darkGrayColor)
                    })
                    Button(action: {
                        addButtonText(numberToBeAdded: "9")
                    }, label: {
                        CalcButton(buttonText: "9", buttonColor: darkGrayColor)
                    })
                    Button(action: {
                        number1 = Double(displayText)!
                        operandMultiply.toggle()
                        operationInProcess = true
                        decimal = false
                        makeSoundAndVibrate()
                    }, label: {
                        CalcButton(buttonText: "X", buttonColor: .yellow)
                    })
                }
                HStack(spacing: 12){
                    Button(action: {
                        addButtonText(numberToBeAdded: "4")
                    }, label: {
                        CalcButton(buttonText: "4", buttonColor: darkGrayColor)
                    })
                    Button(action: {
                        addButtonText(numberToBeAdded: "5")
                    }, label: {
                        CalcButton(buttonText: "5", buttonColor: darkGrayColor)
                    })
                    Button(action: {
                        addButtonText(numberToBeAdded: "6")
                    }, label: {
                        CalcButton(buttonText: "6", buttonColor: darkGrayColor)
                    })
                    Button(action: {
                        number1 = Double(displayText)!
                        operandMinus.toggle()
                        operationInProcess = true
                        decimal = false
                        makeSoundAndVibrate()
                    }, label: {
                        CalcButton(buttonText: "-", buttonColor: .yellow)
                    })
                }
                HStack(spacing: 12){
                    Button(action: {
                        addButtonText(numberToBeAdded: "1")
                    }, label: {
                        CalcButton(buttonText: "1", buttonColor: darkGrayColor)
                    })
                    Button(action: {
                        addButtonText(numberToBeAdded: "2")
                    }, label: {
                        CalcButton(buttonText: "2", buttonColor: darkGrayColor)
                    })
                    Button(action: {
                        addButtonText(numberToBeAdded: "3")
                    }, label: {
                        CalcButton(buttonText: "3", buttonColor: darkGrayColor)
                    })
                    Button(action: {
                        number1 = Double(displayText)!
                        operandPlus.toggle()
                        operationInProcess = true
                        decimal = false
                        makeSoundAndVibrate()
                    }, label: {
                        CalcButton(buttonText: "+", buttonColor: .yellow)
                    })
                }
                HStack(spacing: 12){
                    Button(action: {
                        addButtonText(numberToBeAdded: "0")
                        makeSoundAndVibrate()
                    }, label: {
                        ButtonZero(buttonText: "0", buttonColor: darkGrayColor)
                    })
                    Button(action: {
                        makeSoundAndVibrate()
                        if !decimal {
                            displayText += "."
                            decimal.toggle()
                        }
                    }, label: {
                        CalcButton(buttonText: ".", buttonColor: darkGrayColor)
                    })
                    Button(action: {
                        number2 = Double(displayText)!
                        
                        conductOperation()
                        makeSoundAndVibrate()
                        
                    }, label: {
                        CalcButton(buttonText: "=", buttonColor: .yellow)
                    })
                }
            }.padding(.bottom)
        }
    }
    
    func addButtonText(numberToBeAdded: String){
        makeSoundAndVibrate()
        
        if displayText == "0" && !operationInProcess{
            self.displayText = numberToBeAdded
        }
        else if !operationInProcess{
            self.displayText += numberToBeAdded
        }
        else if operationInProcess {
            displayText = ""
            displayText += numberToBeAdded
            operationInProcess.toggle()
            tempNumber2 = Double(displayText)!
        }
    }
    
    func conductOperation() {
        // the code below is needed to make = continue calculate
        if !operandPlus && lastOperand[0] {
            displayText = String(Double(displayText)! + tempNumber2)
        }
        if !operandMinus && lastOperand[1] {
            displayText = String(Double(displayText)! - tempNumber2)
        }
        if !operandMultiply && lastOperand[2] {
            displayText = String(Double(displayText)! * tempNumber2)
        }
        if !operandDivide && lastOperand[3] {
            displayText = String(Double(displayText)! / tempNumber2)
        }
        //
        if operandPlus {
            displayText = String(number1 + number2)
            number1 = Double(displayText)!
            operationInProcess.toggle()
            operandPlus.toggle()
            decimal.toggle()
            lastOperand = [true, false, false, false]
        }
        if operandMinus {
            displayText = String(number1 - number2)
            number1 = Double(displayText)!
            operationInProcess.toggle()
            operandMinus.toggle()
            decimal.toggle()
            lastOperand = [false, true, false, false]
        }
        if operandMultiply {
            displayText = String(number1 * number2)
            number1 = Double(displayText)!
            operationInProcess.toggle()
            operandMultiply.toggle()
            decimal.toggle()
            lastOperand = [false, false, true, false]
        }
        if operandDivide {
            displayText = String(number1 / number2)
            number1 = Double(displayText)!
            operationInProcess.toggle()
            operandDivide.toggle()
            decimal.toggle()
            lastOperand = [false, false, false, true]
        }
        if powerToTheNPressed {
            displayText = String(pow(number1, number2))
            number1 = Double(displayText)!
            operationInProcess.toggle()
            powerToTheNPressed.toggle()
            decimal.toggle()
        }
        
        
    }
}

func makeSoundAndVibrate() {
    let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
    impactHeavy.impactOccurred()
    AudioServicesPlaySystemSound(1200)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
