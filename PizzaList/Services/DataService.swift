//
//  DataService.swift
//  PizzaList
//
//  Created by Ashwin Das on 28/02/21.
//

import Foundation

class DataService {
    private var filename: String
    private var fileExtension: String
    
    init(_ filename: String, _ fileExtension: String) {
        self.filename = filename
        self.fileExtension = fileExtension
    }
    
    func getJSONData() -> [Pizza] {
        let pathString = Bundle.main.path(forResource: filename, ofType: fileExtension)
        
        guard pathString != nil else {
            return [Pizza]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Get data
            let data =  try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode([Pizza].self, from: data)
                
                for item in decodedData {
                    item.id = UUID()
                }
                
                return decodedData
            }
            
        } catch {
            print(error)
        }
        
        return [Pizza]()
        
    }
}
