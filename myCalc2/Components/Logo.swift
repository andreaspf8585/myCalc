//
//  Logo.swift
//  myCalc2
//
//  Created by Ανδρέας Γκόγκος on 14/12/20.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        HStack {
            Image("treehead")
                .resizable()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.leading, 20)
            Spacer()
            VStack {
                Text("Scientific Calculator")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 20))
                    .lineLimit(4)
                    .padding()
                    .background(Color.init(.orange))
                    .cornerRadius(20)
                    .shadow(color: Color.white.opacity(0.5), radius: 20, x: 10, y: 10)
                Text("Aνδρέας Γκόγκος, 14/12/2020")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .font(.caption)
                    .lineLimit(4)
                    //.padding()
                    .background(Color.init(.orange))
                    .cornerRadius(20)
                    .shadow(color: Color.white.opacity(0.5), radius: 20, x: 10, y: 10)
            }
            Spacer()
            Image("hammers")
                .resizable()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.trailing, 20)
        }
        .frame(width: UIScreen.main.bounds.width - 20, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.init(.orange))
        
        .cornerRadius(40)
        
        .shadow(color: Color.white.opacity(0.5), radius: 20, x: 10, y: 10)
        .padding(.top, 20)
        
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo()
    }
}
