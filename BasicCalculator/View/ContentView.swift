//
//  ContentView.swift
//  BasicCalculator
//
//  Created by Gocement on 24/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var textValue: String = ""
    @State private var calculate: Double? = nil
    @State private var firstNumber: Double? = nil
    @State private var secondNumber: Double? = nil
    @State private var expresion: String = ""
    
    func clickNumber(number: Int?){
       if(number != nil){
           textValue = textValue + String(number!)
        } else if(!textValue.isEmpty){
           textValue.removeLast()
        } else {
            textValue = ""
            expresion = ""
            calculate = nil
            firstNumber = nil
            secondNumber = nil
        }
    }
    
    func actionButton(action: String?, perform: Bool = false){
        if(perform){
            secondNumber = Double(textValue)
            
            switch expresion {
                case "+": calculate = firstNumber! + secondNumber!
                case "-": calculate = firstNumber! - secondNumber!
                case "x": calculate = firstNumber! * secondNumber!
                case "/": calculate = firstNumber! / secondNumber!
                default: calculate = 0.0
            }
            
            expresion = ""
            textValue = String(calculate ?? 0.0)
            
            firstNumber = nil
            return
        }
        
        expresion = action!
        
        if(firstNumber != nil){
            secondNumber = Double(textValue)
            textValue = ""
            
            switch action {
                case "+": calculate = firstNumber! + secondNumber!
                case "-": calculate = firstNumber! - secondNumber!
                case "x": calculate = firstNumber! * secondNumber!
                case "/": calculate = firstNumber! / secondNumber!
                default: calculate = 0.0
            }
        } else {
            firstNumber = Double(textValue)
            textValue = ""
        }
    }
    
    var body: some View {
        VStack(alignment: .trailing){
            Spacer()
            Text(textValue)
                .font(.system(size: 30, design: .default))
                .bold()
                
                
            HStack {
                CustomButton(label: "C", color: Color.gray){
                    textValue = ""
                    expresion = ""
                    calculate = nil
                    firstNumber = nil
                    secondNumber = nil
                }
                CustomButton(label: "Delete", color: Color.gray){
                    clickNumber(number: nil)
                }
                CustomButton(label: "/", color: Color.orange){
                    actionButton(action: "/")
                }
            }
            HStack {
                CustomButton(label: "7", color: Color.gray){
                    clickNumber(number: 7)
                }
                CustomButton(label: "8", color: Color.gray){
                    clickNumber(number: 8)
                }
                CustomButton(label: "9", color: Color.gray){
                    clickNumber(number: 9)
                }
                CustomButton(label: "x", color: Color.orange){
                    actionButton(action: "x")
                }
            }
            HStack {
                CustomButton(label: "4", color: Color.gray){
                    clickNumber(number: 4)
                }
                CustomButton(label: "5", color: Color.gray){
                    clickNumber(number: 5)
                }
                CustomButton(label: "6", color: Color.gray){
                    clickNumber(number: 6)
                }
                CustomButton(label: "-", color: Color.orange){
                    actionButton(action: "-")
                }
            }
            HStack {
                CustomButton(label: "1", color: Color.gray){
                    clickNumber(number: 1)
                }
                CustomButton(label: "2", color: Color.gray){
                    clickNumber(number: 2)
                }
                CustomButton(label: "3", color: Color.gray){
                    clickNumber(number: 3)
                }
                CustomButton(label: "+", color: Color.orange){
                    actionButton(action: "+")
                }
            }
            HStack {
                CustomButton(label: "0", color: Color.gray){
                    clickNumber(number: 0)
                }
                CustomButton(label: "=", color: Color.orange){
                    actionButton(action: nil, perform: true)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
