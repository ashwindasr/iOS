//
//  CircleView.swift
//  SwiftUIDemo1
//
//  Created by Ashwin Das on 21/02/21.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        Image("mtfuji")
            .resizable()
            .frame(width: 250, height: 250)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/) 
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
