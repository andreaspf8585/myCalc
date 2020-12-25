//
//  ButtonZero.swift
//  myCalc2
//
//  Created by Ανδρέας Γκόγκος on 13/12/20.
//

import SwiftUI

struct ButtonZero: View {
    var buttonText: String
    var buttonColor: Color
    var body: some View {
        Text(buttonText)
            .font(.system(size: 32))
            .frame(width: (UIScreen.main.bounds.width - 4 * 12) / 2, height: (UIScreen.main.bounds.width - 5 * 12) / 4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
            .background(buttonColor)
            .cornerRadius((UIScreen.main.bounds.width - 4 * 12) / 4)
    }
}

struct ButtonZero_Previews: PreviewProvider {
    static var previews: some View {
        ButtonZero(buttonText: "0", buttonColor: .blue)
    }
}
