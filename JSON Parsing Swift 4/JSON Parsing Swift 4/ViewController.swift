//
//  ViewController.swift
//  JSON Parsing Swift 4
//
//  Created by Richard EV Simpson on 01/02/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        parseJSONFromFile()
        parseJSONFromStringFile()
    }
    
    func parseJSONFromFile() {
        if let path = Bundle.main.path(forResource: "jsonFile" , ofType: "json"){
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let encoder = JSONDecoder().decoderWithStrategy
                let result = try encoder.decode(DemoClassResponse.self, from: data)
                
                // Ophalen van wat voorbeeld data
                let keuken : String? = result.home.kitchen.first?.parameters.compactMap{ $0.price.contains("5000") ? $0.name : nil }.first!
                print(keuken ?? "Niks gevonden")
            }
            catch {
                print(error)
            }
        }
    }
    
    func parseJSONFromStringFile() {
        let jsonString = """
{
   "Home":{
      "Door":"A beautiful white door",
      "NumberOfWindows":4,
      "AlarmClock":"2018-11-28T15:28:42.9405508",
      "Kitchen":[
         {
            "kitchenDescription":"A nice kitchen with white and blue colors",
            "Parameters":[
               {
                  "Name":"Halve the kitchen",
                  "Price":"2500 Euro"
               },
               {
                  "Name":"Whole kitchen",
                  "Price":"5000 euro"
               }
            ]
         }
      ]
   }
}
"""
        
        let data = jsonString.data(using: .utf8)!
        let encoder = JSONDecoder().decoderWithStrategy
        guard let result = try? encoder.decode(DemoClassResponse.self, from: data) else { return }
        
        // Ophalen van wat voorbeeld data
        let keuken : String? = result.home.kitchen.first?.parameters.compactMap{ $0.price.contains("2500") ? $0.name : nil }.first!
        print(keuken ?? "Niks gevonden")
        
    }
}

