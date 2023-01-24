//
//  MessagePresenterProtocol.swift
//  CleanArchitectureSimple
//
//  Created by Rivaldo Fernandes on 24/01/23.
//

import Foundation

protocol MessagePresenterProtocol {
    func getMessage(name: String) -> MessageEntity
}
