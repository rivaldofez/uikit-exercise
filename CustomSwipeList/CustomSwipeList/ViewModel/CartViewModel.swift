//
//  ViewModel.swift
//  CustomSwipeList
//
//  Created by Rivaldo Fernandes on 01/12/22.
//

import SwiftUI

class CartViewModel: ObservableObject {
    @Published var items = [
        Item(name: "Peace Skull Shirt", details: "Gray", image: "test", price: 20.99, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Peace Skull Shirt", details: "Gray", image: "test", price: 20.99, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Peace Skull Shirt", details: "Gray", image: "test", price: 20.99, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Peace Skull Shirt", details: "Gray", image: "test", price: 20.99, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Peace Skull Shirt", details: "Gray", image: "test", price: 20.99, quantity: 1, offset: 0, isSwiped: false)
    ]
}
