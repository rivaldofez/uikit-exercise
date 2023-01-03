////
////  ItemView.swift
////  CustomSwipeList
////
////  Created by Rivaldo Fernandes on 01/12/22.
////
//
//import Foundation
//import SwiftUI
//
//struct ItemView: View {
//    @Binding var item: Item
//    @Binding var items: Item[]
//    
//    var body: some View {
//        ZStack {
//            LinearGradient(gradient: .init(colors: [.gray, .blue]), startPoint: .leading, endPoint: .trailing)
//            
//            //Delete Button
//            HStack {
//                Spacer()
//                
//                Button(action: {}, label: {
//                    Image(systemName: "trash")
//                        .font(.title)
//                        .foregroundColor(.white)
//                        .frame(width: 90, height: 50)
//                })
//            }
//            
//            HStack(spacing: 15) {
//                Image(item.image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 130, height: 130)
//                    .cornerRadius(15)
//                
//                VStack(alignment: .leading, spacing: 10) {
//                    Text(item.name)
//                        .fontWeight(.semibold)
//                        .foregroundColor(.black)
//                    
//                    Text(item.details)
//                        .fontWeight(.semibold)
//                        .foregroundColor(.gray)
//                    
//                    HStack(spacing: 15) {
//                        Text(getPrice(value: item.price))
//                            .font(.title2)
//                            .fontWeight(.heavy)
//                            .foregroundColor(.black)
//                        
//                        Spacer()
//                        
//                        Button (action: {
//                            if item.quantity > 1 {
//                                item.quantity -= 1
//                            }
//                            
//                        }, label: {
//                            Image(systemName: "minus")
//                                .font(.system(size: 16, weight: .heavy))
//                                .foregroundColor(.black)
//                        })
//                        
//                        Text("\(item.quantity)")
//                            .fontWeight(.heavy)
//                            .foregroundColor(.black)
//                            .padding(.vertical, 5)
//                            .padding(.horizontal, 10)
//                            .background(Color.black.opacity(0.06))
//                        
//                        Button (action: {
//                            item.quantity += 1
//                            
//                        }, label: {
//                            Image(systemName: "plus")
//                                .font(.system(size: 16, weight: .heavy))
//                                .foregroundColor(.black)
//                        })
//                    }
//                }
//            }
//                .padding()
//                .background(.gray)
//                .contentShape(Rectangle())
//                .offset(x: item.offset)
//                .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
//        }
//    }
//    
//    func onChanged(value: DragGesture.Value){
//        if value.translation.width < 0 {
//            if item.isSwiped {
//                item.offset = value.translation.width - 90
//            }else{
//                item.offset = value.translation.width
//            }
//        }
//    }
//    
//    func onEnd(value: DragGesture.Value){
//        withAnimation(.easeOut){
//            if value.translation.width < 0 {
//                //checking
//                
//                if -value.translation.width > UIScreen.main.bounds.width / 2 {
//                    item.offset = -1000
//                }else if -item.offset > 50 {
//                    //updating is Swiping
//                    item.isSwiped = true
//                    item.offset = -90
//                }else{
//                    item.isSwiped = false
//                    item.offset = 0
//                }
//            }else{
//                item.isSwiped = false
//                item.offset = 0
//            }
//        }
//    }
//    
//    //removing Item
//    func deleteItem(item: Item){
//        
//    }
//    
//    
//}
//
//
//
//
//func getPrice(value: Float) -> String {
//    let format = NumberFormatter()
//    format.numberStyle = .currency
//    
//    return format.string(from: NSNumber(value: value)) ?? ""
//}
