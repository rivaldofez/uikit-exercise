//
//  ContentView.swift
//  AlertExerciseSwiftUI
//
//  Created by Rivaldo Fernandes on 29/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var simpleAlert = false
    
    
    var body: some View {
        VStack{
            Button(action: {
                simpleAlert.toggle()
            }, label: {
                Text("Simple Alert")
            })
//            .alert(isPresented: $simpleAlert, error: .none, actions: {})
        }
//        .alert("Test Alert", isPresented: self.$simpleAlert, actions: {
//            Text("Test")
//        })
        
        .alert("Kode Produk Tidak Ditemukan", isPresented: $simpleAlert, actions: {
            Button(role: .cancel){
                
            } label: {
                Text("Tidak")
            }
            
            Button {
                
            } label: {
                Text("Tambah")
            }
        }, message: {
            Text("Apakah ingin menambah produk dengan kode ini?")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
