//
//  ContentView.swift
//  SwiftUIComparison
//
//  Created by Rivaldo Fernandes on 12/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            ForEach(movies) { movie in
                MovieItemView(movie: movie)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
