//
//  ContentView.swift
//  QuotesApp
//
//  Created by Ashwin Das on 01/03/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = QuoteModel()
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(model.quotes) { quote in
                    NavigationLink(
                        destination: CardDescription(author: quote.author, description: quote.description),
                        label: {
                            ZStack {
                                CardView(quote: quote)
                            }
                        })
                }
            }
            .navigationTitle("Quotes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
