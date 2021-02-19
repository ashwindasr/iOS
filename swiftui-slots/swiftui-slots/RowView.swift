//
//  RowView.swift
//  swiftui-slots
//
//  Created by Ashwin Das on 18/02/21.
//

import SwiftUI

struct RowView: View {
    
    @Binding var row:[String]
    @Binding var colorArray:[Color]
    
    var body: some View {
        HStack {
            Spacer()
            
            // Card 1
            CardView(symbol: $row[0], successColor: $colorArray[0])
            
            // Card 2
            CardView(symbol: $row[1], successColor: $colorArray[1])
            
            // Card 3
            CardView(symbol: $row[2], successColor: $colorArray[2])
            
            Spacer()
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(row: Binding.constant(["apple", "cherry", "star"]), colorArray: Binding.constant([Color.white, Color.green, Color.white]))
    }
}
