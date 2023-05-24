//
//  ContentView.swift
//  BasicCalculator
//
//  Created by Gocement on 24/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var textValue: String = ""
    @State private var numberOnScreen: Double = 0
    @State private var previousNumber: Double = 0
    @State private var performingMath: Bool = false
    
    func clickNumber(number: Int?){
        if(performingMath == true) {
            
            performingMath = false
        } else if(number != nil){
            textValue = textValue + String(number!)
            numberOnScreen = Double(textValue) ?? 0.0
        } else if(!textValue.isEmpty){
            textValue.removeLast()
            numberOnScreen = Double(textValue) ?? 0.0
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
                    
                }
                CustomButton(label: "Delete", color: Color.gray){
                    clickNumber(number: nil)
                }
                CustomButton(label: "/", color: Color.orange){
                    
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
                    
                }
            }
            HStack {
                CustomButton(label: "0", color: Color.gray){
                    clickNumber(number: 0)
                }
                CustomButton(label: "=", color: Color.orange){
                    
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
