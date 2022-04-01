//
//  DataService.swift
//  ExampleMVVM
//
//  Created by hooni on 4/1/22.
//

import Foundation

class DataService {
    
   static func getLocalData() -> DataModel {
       
        let pathString = Bundle.main.path(forResource: "SampleData", ofType: "json")
        
        guard pathString != nil else {
            return DataModel()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        do {
            let jsonData = try Data(contentsOf: url)
            do {
                let dataModel = try JSONDecoder().decode(DataModel.self, from: jsonData)
                return dataModel
            } catch {
                print(error)
            }
            
        } catch {
            print(error)
        }
        
        return DataModel()
    }
}
