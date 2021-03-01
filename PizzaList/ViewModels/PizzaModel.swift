//
//  PizzaModel.swift
//  PizzaList
//
//  Created by Ashwin Das on 28/02/21.
//

import Foundation

class PizzaModel: ObservableObject {
    @Published var pizzas = [Pizza]()
    
    init() {
        self.pizzas = DataService("pizzas", "json").getJSONData()
    }
}
