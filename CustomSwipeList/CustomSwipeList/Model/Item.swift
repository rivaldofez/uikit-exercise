//
//  Item.swift
//  CustomSwipeList
//
//  Created by Rivaldo Fernandes on 01/12/22.
//

import Foundation


struct Item: Identifiable {
    var id = UUID().uuidString
    var name: String
    var details: String
    var image: String
    var price: Float
    var quantity: Int
    var offset: CGFloat
    var isSwiped: Bool
}
