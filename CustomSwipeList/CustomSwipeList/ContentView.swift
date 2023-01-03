//
//  ContentView.swift
//  CustomSwipeList
//
//  Created by Rivaldo Fernandes on 01/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack{
                Text("Produk")
            }
                
                .frame(width: 100, height: 50)
                .background(.gray)
                .cornerRadius(10)
                .offset(x:30, y: -20)
                
        }
        .frame(width: 120, height: 70)
        .background(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
