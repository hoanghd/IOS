import Foundation

struct Country: Hashable {
    let name: String
    let capital: String
    
    static func all() -> [Country] {
        return [
            Country(name: "Andorra", capital: "Andorra la Vella"),
            Country(name: "United Arab Emirates", capital: "Abu Dhabi")
        ]
    }
    
    private let identifier = UUID()
}
