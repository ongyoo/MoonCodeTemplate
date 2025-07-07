//
//  ExampleAPI.swift
//  MoonCodeTemplate
//
//  Created by Komsit Chusangthong on 8/7/2568 BE.
//

import Foundation
import Alamofire

enum ExampleAPI {
    // https://api.restful-api.dev/objects
    case getExampleObjects(id: String)
}

extension ExampleAPI: TargetType {
    
    var baseURL: URL {
        // Domain
        return URL(string: "https://api.restful-api.dev")!
    }
    
    var path: String {
        switch self {
        case .getExampleObjects(let id):
            return "/objects/\(id)"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters? {
        switch self {
        case .getExampleObjects:
            return nil
        }
    }
    
    var headers: HTTPHeaders? {
        return []
    }
    
    var encoding: any Alamofire.ParameterEncoding {
        URLEncoding.default
    }
}
