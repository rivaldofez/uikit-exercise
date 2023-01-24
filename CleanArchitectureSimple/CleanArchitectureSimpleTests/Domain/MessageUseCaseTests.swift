//
//  MessageUseCaseTests.swift
//  CleanArchitectureSimpleTests
//
//  Created by Rivaldo Fernandes on 24/01/23.
//

import XCTest

@testable import CleanArchitectureSimple
class MessageUseCaseTests: XCTestCase {
    
    static var input: String = "Dicoding"
    static var messageEntity = MessageEntity (welcomeMessage: "Hello \(input) Welcome to Clean Architecture")
    
    func testGetDataFromUseCase() throws {
        //given
        
        let usecase = MessageInteractorMock()
        
        //when
        let result = usecase.getMessage(name: MessageUseCaseTests.input)
        XCTAssert(usecase.verify())
        
        //then
        XCTAssert(
            result.welcomeMessage.contains(MessageUseCaseTests.messageEntity.welcomeMessage)
        )
    }
}

extension MessageUseCaseTests {
    
    class MessageInteractorMock: MessageUseCase {
        var functionWasCalled = false
        
        func getMessage(name: String) -> MessageEntity {
            functionWasCalled = true
            return messageEntity
        }
        
        func verify() -> Bool {
            return functionWasCalled
        }
    }
    
    
}
