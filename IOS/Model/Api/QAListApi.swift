import Alamofire

struct QAListApi: Decodable {
    let rows: [QA]

    enum CodingKeys: String, CodingKey {
        case rows = "list"
    }
    
    static func get(_ completion: @escaping([QA])->() ){
        AF.request("https://hoanghd.github.io/qa.json")
          .validate()
          .responseDecodable(of: self) { (response) in
            if let qas = response.value {
                completion(qas.rows)
            } else {
                completion([])
            }
          }
    }
}
