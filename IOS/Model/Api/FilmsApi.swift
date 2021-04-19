import Alamofire

struct FilmsApi: Decodable {
    let count: Int
    let rows: [Film]

    enum CodingKeys: String, CodingKey {
        case count
        case rows = "results"
    }
    
    static func get( completion: @escaping([Film])->() ){
        AF.request("https://swapi.dev/api/films")
          .validate()
          .responseDecodable(of: self) { (response) in
            if let films = response.value {
                completion(films.rows)
            } else {
                completion([])
            }
          }
    }
}
