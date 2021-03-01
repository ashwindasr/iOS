//
//  Quote.swift
//  QuotesApp
//
//  Created by Ashwin Das on 01/03/21.
//

import Foundation

class Quote: Identifiable, Decodable {
    
    var id:UUID?
    var quote: String
    var author: String
    var imageName: String
    var description: [String]
    
}
