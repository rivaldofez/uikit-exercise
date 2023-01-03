////
////  CartView.swift
////  CustomSwipeList
////
////  Created by Rivaldo Fernandes on 01/12/22.
////
//
//import Foundation
//import SwiftUI
//
//
//
//struct CartView: View {
//    @StateObject var cartData = CartViewModel()
//    
//    
//    var body: some View {
//        VStack {
//            HStack(spacing: 20) {
//                Button(action: {}, label: {
//                    Image(systemName: "chevron.left")
//                        .font(.system(size: 28, weight: .heavy))
//                        .foregroundColor(.black)
//                })
//                
//                Text("My Cart")
//                    .font(.title)
//                    .fontWeight(.heavy)
//                
//                Spacer()
//            }
//            .padding()
//            
//            
//            ScrollView(.vertical, showsIndicators: false){
//                LazyVStack(spacing: 0) {
//                    ForEach(cartData.items){ item in
//                        ItemView(item: $cartData.items[getIndex(item: item)], items: <#T##Binding<[Item]>#>)
//                    }
//                }
//            }
//            
//            VStack {
//                HStack {
//                    Text("Total")
//                        .foregroundColor(.gray)
//                        .fontWeight(.heavy)
//                    
//                    Spacer()
//                    
//                    Text(calculateTotalPrice())
//                        .font(.title)
//                        .foregroundColor(.black)
//                        .fontWeight(.heavy)
//                }
//                .padding([.top, .horizontal])
//                
//                Button(action: {}, label: {
//                    Text("Check Out")
//                        .font(.title2)
//                        .fontWeight(.heavy)
//                        .foregroundColor(.white)
//                        .padding(.vertical)
//                        .frame(width: UIScreen.main.bounds.width - 30)
//                        .background(
//                            LinearGradient(gradient: .init(colors: [.gray, .blue]), startPoint: .leading, endPoint: .trailing)
//                        )
//                        .cornerRadius(15)
//                })
//            }
//            .background(Color.white)
//            
//        }
//        .background(Color("gray").ignoresSafeArea())
//    }
//    
//    func getIndex(item: Item) -> Int {
//        return cartData.items.firstIndex {(item1) -> Bool in
//            return item.id == item1.id
//        } ?? 0
//    }
//    
//    func calculateTotalPrice()-> String{
//        var price: Float = 0
//        
//        cartData.items.forEach{ (item) in
//            price += Float(item.quantity) * item.price
//        }
//        
//        return getPrice(value: price)
//    }
//}
//
