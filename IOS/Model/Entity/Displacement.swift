struct Displacement: Decodable {
    let id: String
    let text: String
  
  enum CodingKeys: String, CodingKey {
    case id
    case text
  }
}
