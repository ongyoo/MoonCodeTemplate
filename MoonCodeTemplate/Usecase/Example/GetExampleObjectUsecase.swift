//
//  GetExampleObjectUsecase.swift
//  MoonCodeTemplate
//
//  Created by Komsit Chusangthong on 8/7/2568 BE.
//

import Foundation

protocol GetExampleObjectUsecase {
    func execute(id: String) async throws -> Result<ExampleResponse, Error>
}

final class GetExampleObjectUsecaseImpl: GetExampleObjectUsecase {
    private var exampleRepository: ExampleRepository!
    init(repository: ExampleRepository? = ExampleRepositoryImpl()) {
        self.exampleRepository = repository
    }
    
    func execute(id: String) async throws -> Result<ExampleResponse, Error> {
        return try await self.exampleRepository.getExampleObjects(id: id)
    }
}
