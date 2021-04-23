struct QA: Decodable {
    let id: Int
    let type: String
    let date: String
    let customer: String
    let text: String
  
  enum CodingKeys: String, CodingKey {
    case id
    case type
    case date
    case customer
    case text
  }
}
