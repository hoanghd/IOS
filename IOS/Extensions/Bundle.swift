import Foundation

extension Bundle {
    static func plist<T: Decodable>(_ name: String) -> [T] {
        guard let url = Bundle.main.url(forResource: name, withExtension: "plist"),
              let data = try? Data(contentsOf: url) else {
            return []
        }
        
        guard let dic = try? PropertyListDecoder().decode([T].self, from: data) else {
            return []
        }
        
        return dic
    }
    
    static func plist<T: Decodable>(_ name: String) -> T? {
        guard let url = Bundle.main.url(forResource: name, withExtension: "plist"),
              let data = try? Data(contentsOf: url) else {
            return nil
        }
        
        guard let dic = try? PropertyListDecoder().decode(T.self, from: data) else {
            return nil
        }
        
        return dic
    }
}
