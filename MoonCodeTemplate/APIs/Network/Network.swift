//
//  Network.swift
//  MoonCodeTemplate
//
//  Created by Komsit Chusangthong on 8/7/2568 BE.
//

import Foundation
import Alamofire

protocol NetworkProviderType: AnyObject {
    associatedtype Target: TargetType
    func request<D: Decodable>(_ target: Target, mapper: D.Type) async throws -> Result<D, Error>
}

final class Network<Target: TargetType>: NetworkProviderType {
    typealias Target = Target

    func request<D: Decodable>(_ target: Target, mapper: D.Type) async throws -> Result<D, Error> {
        let url = target.baseURL.appendingPathComponent(target.path)
        let dataTask = AF.request(
            url,
            method: target.method,
            parameters: target.parameters,
            encoding: target.encoding,
            headers: target.headers
        )
        .serializingDecodable(D.self)

        let response = await dataTask.response
        switch response.result {
        case .success(let result):
            return .success(result)
        case .failure(let error):
            return .failure(error)
        }
    }
}
