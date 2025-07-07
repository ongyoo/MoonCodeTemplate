//
//  JSONMapper+Extensions.swift.swift
//  MoonCodeTemplate
//
//  Created by Komsit Chusangthong on 8/7/2568 BE.
//

import Foundation

final class CodableMapper<T: Codable>: NSObject {
    private var decoder: JSONDecoder!
    private var endcode: JSONEncoder!
    override init() {
        super.init()
        endcode = JSONEncoder()
        decoder = JSONDecoder()
    }
    
    // MARK :  Mapper
    func map(StringJSON value: String) -> T? {
        do {
            let data = try decoder.decode(T.self, withJSONObject: value)
            return data
        } catch let error {
            debugPrint("error : \(error)")
            return nil
        }
    }
    
    func map(AnyObject value: Any) -> T? {
        do {
            let data = try decoder.decode(T.self, withJSONObject: value)
            return data
        } catch let error {
            debugPrint("error : \(error)")
            return nil
        }
    }
    
    func map(DictionaryObject value: [String:Any]) -> T? {
        do {
            let data = try decoder.decode(T.self, withJSONObject: value)
            return data
        } catch let error {
            debugPrint("error : \(error)")
            return nil
        }
    }
    
    func map(DataObject value: Data) -> T? {
        do {
            let data = try decoder.decode(T.self, from: value)
            return data
        } catch let error {
            debugPrint("error : \(error)")
            return nil
        }
    }
}

// MARK : Encodable Convert Object
extension Encodable {
    func toAnyObject() -> Any? {
        do {
            let data = try JSONEncoder().encodeJSONObject(self)
            return data
        } catch let error {
            debugPrint("error : \(error)")
            return nil
        }
    }
    
    func toDictionaryObject() -> [String:Any]? {
        do {
            let data = try JSONEncoder().encodeJSONObject(self)
            return data as? [String : Any]
        } catch let error {
            debugPrint("error : \(error)")
            return nil
        }
    }
    
    func toStringJSONObject() -> String? {
        do {
            let data = try JSONEncoder().encodeJSONObject(self)
            return String(describing: data)
        } catch let error {
            debugPrint("error : \(error)")
            return nil
        }
    }
    
    func toDataObject() -> Data? {
        do {
            let data = try JSONEncoder().encodeJSONObject(self)
            return Data(String(describing: data).utf8)
        } catch let error {
            debugPrint("error : \(error)")
            return nil
        }
    }
}

// MARK : Decodable Convert Object
extension Decodable {
    // MARK :  Mapper
    func map(StringJSON value: String) -> Self? {
        do {
            let data = try JSONDecoder().decode(Self.self, withJSONObject: value)
            return data
        } catch let error {
            debugPrint("error : \(error)")
            return nil
        }
    }
    
    func map(AnyObject value: Any) -> Self? {
        do {
            let data = try JSONDecoder().decode(Self.self, withJSONObject: value)
            return data
        } catch let error {
            debugPrint("error : \(error)")
            return nil
        }
    }
}

extension JSONEncoder {
    func encodeJSONObject<T: Encodable>(_ value: T, options opt: JSONSerialization.ReadingOptions = []) throws -> Any {
        let data = try encode(value)
        return try JSONSerialization.jsonObject(with: data, options: opt)
    }
}

extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, withJSONObject object: Any, options opt: JSONSerialization.WritingOptions = []) throws -> T {
        let data = try JSONSerialization.data(withJSONObject: object, options: opt)
        return try decode(T.self, from: data)
    }
}
