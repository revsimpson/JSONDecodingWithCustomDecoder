//
//  DateParser.swift
//  JSON Parsing Swift 4
//
//  Created by Richard EV Simpson on 01/02/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import Foundation
class DateParser: NSObject {
 
    class var locale : Locale {
        get {
            return  Locale.init(identifier: "nl-NL")
        }
    }
    
    class var timezone : TimeZone {
        get {
            return TimeZone.init(abbreviation: "CET")!
        }
    }
    
    class var calendar : Calendar {
        get {
            return Calendar.init(identifier: .gregorian)
        }
    }
    
    class var datumFormatParser : DateFormatter {
        get {
            
            let formatter = DateFormatter()
            formatter.locale =  locale
            formatter.timeZone = timezone
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSS"
            return formatter
        }
    }
}
