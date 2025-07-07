//
//  ExampleRepository.swift
//  MoonCodeTemplate
//
//  Created by Komsit Chusangthong on 8/7/2568 BE.
//
import Foundation

protocol ExampleRepository {
    func getExampleObjects(id: String) async throws -> Result<ExampleResponse, Error>
}

final class ExampleRepositoryImpl: ExampleRepository {
    private let netwrokProvider = Network<ExampleAPI>()
    
    func getExampleObjects(id: String) async throws -> Result<ExampleResponse, Error> {
        return try await netwrokProvider
            .request(.getExampleObjects(id: id), mapper: ExampleResponse.self)
    }
}
