//
//  QuoteModel.swift
//  QuotesApp
//
//  Created by Ashwin Das on 01/03/21.
//

import Foundation

class QuoteModel: ObservableObject {
    @Published var quotes = [Quote]()
    
    init() {
        let filename = "data"
        let fileType = "json"
        
        quotes = DataService(filename, fileType).getJSONData()
    }
}
