//
//  ContentView.swift
//  PizzaList
//
//  Created by Ashwin Das on 28/02/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = PizzaModel()
    var body: some View {
        NavigationView {
            List(model.pizzas) { pizza in
                
                NavigationLink(destination: PizzaDetailView(pizza: pizza)) {
                    HStack() {
                        Image(pizza.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipped()
                            .cornerRadius(5.0)
                        
                        VStack(alignment: .leading) {
                            Text(pizza.name)
                                .fontWeight(.bold)
                            
                            HStack {
                                ForEach(pizza.toppings, id: \.self) { topping in
                                    Text(topping)
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                }
                
            }
            .navigationBarTitle("Pizzas")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
