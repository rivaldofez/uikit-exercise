//
//  MessageDataSourceProtocol.swift
//  CleanArchitectureSimple
//
//  Created by Rivaldo Fernandes on 24/01/23.
//

import Foundation

protocol MessageDataSourceProtocol {
    func getMessageFromSource(name: String) -> MessageEntity
}
