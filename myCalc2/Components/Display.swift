//
//  Display.swift
//  myCalc2
//
//  Created by Ανδρέας Γκόγκος on 13/12/20.
//

import SwiftUI

struct Display: View {
    var displayText: String = ""
    var body: some View {
        HStack{
            Spacer()
            Text(displayText)
                .foregroundColor(.white)
                .font(.system(size: 64))
                .lineLimit(1)
                .minimumScaleFactor(0.3)
                .padding()
        }.border(Color.orange)
        
    }
}

struct Display_Previews: PreviewProvider {
    static var previews: some View {
        Display()
    }
}
