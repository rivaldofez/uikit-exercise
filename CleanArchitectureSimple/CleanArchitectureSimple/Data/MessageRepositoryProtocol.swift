//
//  MessageRepositoryProtocol.swift
//  CleanArchitectureSimple
//
//  Created by Rivaldo Fernandes on 24/01/23.
//

import Foundation

protocol MessageRepositoryProtocol {
    func getWelcomeMessage(name: String) -> MessageEntity
}
