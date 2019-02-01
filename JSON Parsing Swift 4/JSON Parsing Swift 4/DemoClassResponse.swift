//
//  DemoStruct.swift
//  JSON Parsing Swift 4
//
//  Created by Richard EV Simpson on 01/02/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import Foundation

struct DemoClassResponse: Codable {
    let home: Home
}

struct Home: Codable {
    let door: String
    let numberOfWindows: Int
    let alarmClock: Date
    let kitchen: [Kitchen]
}

struct Kitchen: Codable {
    let  kitchenDescription: String
    let parameters: [Parameter]
}

struct Parameter: Codable {
    let name : String
    let price: String
}


