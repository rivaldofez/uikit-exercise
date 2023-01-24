//
//  Injection.swift
//  CleanArchitectureSimple
//
//  Created by Rivaldo Fernandes on 24/01/23.
//

import Foundation

final class Injection: NSObject {
    private func provideDataSource() -> MessageDataSourceProtocol {
        return MessageDataSource()
    }
    
    private func provideRepository() -> MessageRepositoryProtocol {
        let messageDataSource = provideDataSource()
        return MessageRepository(dataSource: messageDataSource)
    }
    
    func provideUseCase() -> MessageUseCase {
        let messageRepository = provideRepository()
        return MessageInteractor(repository: messageRepository)
    }
}
