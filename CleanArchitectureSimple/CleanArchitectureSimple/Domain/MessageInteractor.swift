//
//  MessageInteractor.swift
//  CleanArchitectureSimple
//
//  Created by Rivaldo Fernandes on 24/01/23.
//

import Foundation

class MessageInteractor: MessageUseCase {
    private let messageRepository: MessageRepositoryProtocol
    
    
    init(repository: MessageRepositoryProtocol){
        self.messageRepository = repository
    }
    
    func getMessage(name: String) -> MessageEntity {
        return messageRepository.getWelcomeMessage(name: name)
    }
    
    
}
