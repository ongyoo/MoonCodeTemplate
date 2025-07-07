//
//  NetworkProvider.swift
//  MoonCodeTemplate
//
//  Created by Komsit Chusangthong on 8/7/2568 BE.
//

import Foundation
import Alamofire

protocol TargetType {
    /// The target's base `URL`.
    var baseURL: URL { get }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }

    /// The HTTP method used in the request.
    var method: HTTPMethod { get }

    /// The type of HTTP task to be performed.
    var parameters: Parameters? { get }

    /// The headers to be used in the request.
    var headers: HTTPHeaders? { get }
    
    /// The encoding param to be used in the request.
    var encoding: any ParameterEncoding { get }
}
