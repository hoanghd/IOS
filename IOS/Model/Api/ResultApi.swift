import Alamofire

struct ResultApi<T: Decodable>: Decodable {
    let rows: [T]

    enum CodingKeys: String, CodingKey {
        case rows = "list"
    }
    
    static func findAll( _ url: String, _ completion: @escaping([T])->() ){
        AF.request(url)
          .validate()
          .responseDecodable(of: self) { (response) in
            if let result = response.value {
                completion( result.rows )
            } else {
                completion( [] )
            }
          }
    }
}
