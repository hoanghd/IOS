struct Car: Decodable {
    let id: Int
    let code: String
    let date: String
    let ago: Int
    let name: String
    let img: String
    let info: String
  
  enum CodingKeys: String, CodingKey {
    case id
    case code
    case date
    case ago
    case name
    case img
    case info
  }
}
