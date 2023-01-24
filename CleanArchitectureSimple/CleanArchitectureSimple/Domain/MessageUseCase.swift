//
//  MessageUseCase.swift
//  CleanArchitectureSimple
//
//  Created by Rivaldo Fernandes on 24/01/23.
//

import Foundation

protocol MessageUseCase {
    func getMessage(name: String) -> MessageEntity
}

