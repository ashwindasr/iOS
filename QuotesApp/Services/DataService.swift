//
//  DataService.swift
//  QuotesApp
//
//  Created by Ashwin Das on 01/03/21.
//

import Foundation

class DataService {
    var filename: String
    var fileType: String
    
    init(_ filename: String, _ fileType: String) {
        self.filename = filename
        self.fileType = fileType
    }
    
    func getJSONData() -> [Quote] {
        // Get file path
        let path = Bundle.main.path(forResource: filename, ofType: fileType)
        
        // Check pathstring not null
        guard path != nil else {
            return [Quote]()
        }
        
        // Get URL
        let url = URL(fileURLWithPath: path!)
        
        do {
            // Get data
            let data = try Data(contentsOf: url)
            
            // Initialize json decoder
            let decoder = JSONDecoder()
            
            do {
                // Parse data
                let parsedData = try decoder.decode([Quote].self, from: data)
                
                // Add id and return data
                for item in parsedData {
                    item.id = UUID()
                }
                return parsedData
                
            } catch {
                print(error)
            }
            
        } catch {
            print(error)
        }
        return [Quote]()
    }
}
