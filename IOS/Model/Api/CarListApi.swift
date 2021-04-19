import Alamofire

struct CarListApi: Decodable {
    let rows: [Car]

    enum CodingKeys: String, CodingKey {
        case rows = "list"
    }
    
    static func get( _ id: Int, _ completion: @escaping([Car])->() ){
        AF.request("https://hoanghd.github.io/data.json")
          .validate()
          .responseDecodable(of: self) { (response) in
            if let cars = response.value {
                completion(cars.rows)
            } else {
                completion([])
            }
          }
    }
}
