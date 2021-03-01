//
//  CardView.swift
//  QuotesApp
//
//  Created by Ashwin Das on 01/03/21.
//

import SwiftUI

struct CardView: View {
    var quote: Quote
    
    var body: some View {
        ZStack {
            Image(quote.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .cornerRadius(20)
                .padding()
            
            VStack(alignment: .leading) {
                Text(quote.quote)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .blur(radius: 0.5)
                    .padding([.bottom], 10)
                
                Text("- " + quote.author)
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding(50)
            .shadow(color: .black, radius: 10, x: 2, y: 2)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(quote: QuoteModel().quotes[1])
    }
}
