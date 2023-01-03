//
//  ContentView.swift
//  ExerciseAPISwiftUI
//
//  Created by Rivaldo Fernandes on 29/11/22.
//

import SwiftUI


struct Quote: Codable {
    var quote_id: Int
    var quote: String
    var author: String
//    var series: String
}


struct Product: Codable {
    var id: Int
    var barcode: String
    var nama: String
}


struct AutoCompleteView: View {
    @State private var product : Product?
    
    var body: some View {
        NavigationView{
            if(product == nil){
                Text("Nil")
            }else{
                VStack {
                    Text(product?.nama ?? "")
                        .font(.headline)
                        .foregroundColor(Color("skyBlue"))
                    Text(product?.barcode ?? "")
                        .font(.body)
                }
            }
        }
        .task {
            await fetchData()
        }
    }
    
    func fetchData() async {
        //create url
        guard let url = URL(string: "https://ikipiro.artesia.id/api/barcode/899999939952888") else {
            print("Hey man, THIS URL NOT WORK")
            return
        }
        
        
        //fetch data from that url
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            //decode that data
            if let decodedResponse = try? JSONDecoder().decode(Product.self, from: data){
                product = decodedResponse
            }
        } catch {
            print("bad news, not valid data")
        }
        
        
        
        // decode that data
    }
}

struct ContentView: View {
    @State private var quotes = [Quote]()
    
    var body: some View {
        NavigationView{
            List(quotes, id: \.quote_id){ quote in
                VStack(alignment: .leading){
                    Text(quote.author)
                        .font(.headline)
                        .foregroundColor(Color("skyBlue"))
                    Text(quote.quote)
                        .font(.body)
                }
            }
        }.navigationTitle("Quotes")
            .task {
                await fetchData()
            }
    }
    
    func fetchData() async {
        //create url
        guard let url = URL(string: "https://breakingbadapi.com/api/quotes") else {
            print("Hey man, THIS URL NOT WORK")
            return
        }
        
        
        //fetch data from that url
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            //decode that data
            if let decodedResponse = try? JSONDecoder().decode([Quote].self, from: data){
                quotes = decodedResponse
            }
        } catch {
            print("bad news, not valid data")
        }
        
        
        
        // decode that data
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
