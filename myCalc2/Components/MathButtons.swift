//
//  MathButtons.swift
//  myCalc2
//
//  Created by Ανδρέας Γκόγκος on 13/12/20.
//

import SwiftUI

struct MathButtons: View {
    var buttonText: String
    
    var body: some View {
        Text(buttonText)
            .font(.system(size: 20))
            .frame(width: (UIScreen.main.bounds.width - 7 * 10) / 8, height: (UIScreen.main.bounds.width - 5 * 12) / 8, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
            .background(Color.init(.lightGray))
            .cornerRadius((UIScreen.main.bounds.width - 7 * 10) / 8)
    }
}


struct MathButtons_Previews: PreviewProvider {
    static var previews: some View {
        MathButtons(buttonText: "a")
    }
}
