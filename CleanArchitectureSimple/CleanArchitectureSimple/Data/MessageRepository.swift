//
//  MessageRepository.swift
//  CleanArchitectureSimple
//
//  Created by Rivaldo Fernandes on 24/01/23.
//

import Foundation

class MessageRepository: MessageRepositoryProtocol {
    private let messageDataSource: MessageDataSourceProtocol
    
    init(dataSource: MessageDataSourceProtocol){
        self.messageDataSource = dataSource
    }
    
    func getWelcomeMessage(name: String) -> MessageEntity {
        messageDataSource.getMessageFromSource(name: name)
    }
}
