//
//  Pizza.swift
//  PizzaList
//
//  Created by Ashwin Das on 28/02/21.
//

import Foundation

class Pizza: Identifiable, Decodable {
    
    var id: UUID?
    var name: String
    var imageName: String
    var toppings: [String]
    var ingredients: [String]
    var directions: [String]
}
