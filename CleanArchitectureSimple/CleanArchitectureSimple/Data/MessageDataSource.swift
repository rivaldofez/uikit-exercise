//
//  MessageDataSource.swift
//  CleanArchitectureSimple
//
//  Created by Rivaldo Fernandes on 24/01/23.
//

import Foundation

class MessageDataSource: MessageDataSourceProtocol {
    func getMessageFromSource(name: String) -> MessageEntity{
        return MessageEntity(welcomeMessage: "Hello \(name) Welcome to Clean Architecture")
    }
}
