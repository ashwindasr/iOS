//
//  PizzaDetailView.swift
//  PizzaList
//
//  Created by Ashwin Das on 01/03/21.
//

import SwiftUI

struct PizzaDetailView: View {
    var pizza: Pizza
    var body: some View {
        ScrollView {
            Image(pizza.imageName)
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading) {
                Text("Ingredients")
                    .font(.title)
                    .padding([.bottom], 2)
                
                ForEach(pizza.ingredients, id: \.self) {
                    ingredient in
                    Text(ingredient)
                }
                
                Divider()
                
                Text("Directions")
                    .font(.title)
                    .padding([.bottom], 2)
                
                ForEach(0..<pizza.directions.count, id: \.self) {
                    index in
                    Text(String(index + 1) + ". " + pizza.directions[index])
                }
            }
            .padding()
        }
        .navigationBarTitle(pizza.name)
    }
}

struct PizzaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaDetailView(pizza: PizzaModel().pizzas[1])
    }
}
