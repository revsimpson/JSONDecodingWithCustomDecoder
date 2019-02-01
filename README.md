# JSONDecodingWithCustomDecoder
Example of JSON decoding with a custom decoder so you do not have to make coding keys!!
---------------------------------------------------------------------------------------

When you decode data from JSON in Swift and your receiving data does not conform your struct names you normally do this:


<B>Example Code</B>

struct APIGetMyResponse: Codable {

    let activeYears: [ActieveJaren]

    enum CodingKeys: String, CodingKey {
        case actieveJaren = "ActiveYears" 
    }
}

struct ActiveYears: Codable {

    let mydate: Date?
    
    let number, year: Int

    enum CodingKeys: String, CodingKey {
        case mydate = "Mydate"
        case number = "Number"
        case year = "Year"
    }
}

extension ActiveYears {
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        number = try container.decode(Int.self, forKey:.number)
        jaar = try container.decode(Int.self, forKey: .year)
        
        let dateString = try container.decode(String.self, forKey: .mydate)
        mydate = ServerDateFormatter().DateformatterForCodable(dateString) <- You need to write a formatter to convert the date !
    }
}

# With a custom Decoder it will be just this...for all your structs !!!!

struct APIGetMyResponse: Codable {

    let activeYears: [ActieveJaren]
    
}


struct ActiveYears: Codable {

    let mydate: Date?
    
    let number, year: Int
    
}


<B>Check the source code to see how to make a custom Decoder !!
