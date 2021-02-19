//
//  CardView.swift
//  swiftui-slots
//
//  Created by Ashwin Das on 18/02/21.
//

import SwiftUI

struct CardView: View {
    
    @Binding var symbol:String
    @Binding var successColor:Color

    var body: some View {
        Image(symbol)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            .background(successColor.opacity(0.5))
            .cornerRadius(20.0)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol: Binding.constant("apple"), successColor: Binding.constant(Color.green))
    }
}
