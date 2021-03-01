//
//  CardDescription.swift
//  QuotesApp
//
//  Created by Ashwin Das on 01/03/21.
//

import SwiftUI

struct CardDescription: View {
    var author: String
    var description: [String]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(author)
                    .font(.largeTitle)
                    .bold()
                
                ForEach(description, id: \.self) { item in
                    Text(item)
                }
            }
            .padding()
        }
    }
}

struct CardDescription_Previews: PreviewProvider {
    static var previews: some View {
        let model = QuoteModel()
        
        CardDescription(author: model.quotes[1].author, description: model.quotes[1].description)
    }
}
