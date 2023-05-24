//
//  CustomButton.swift
//  BasicCalculator
//
//  Created by Gocement on 24/05/23.
//

import SwiftUI

struct CustomButton: View {
    let label: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action)
        {
            Text("\(label)")
                .padding(8)
                .bold()
                .font(.system(size: 20, design: .default))
                .frame(maxWidth: .infinity)
        }
        .buttonBorderShape(.roundedRectangle(radius: 8.0))
        .buttonStyle(.borderedProminent)
        .tint(color)
    }
}
