//
//  TestConnection.swift
//  ExerciseAPISwiftUI
//
//  Created by Rivaldo Fernandes on 29/11/22.
//

import Foundation
import SwiftUI

struct TestNetwork : View {
    @ObservedObject var monitor = NetworkMonitor()
    
    var body: some View {
        VStack {
            Image(systemName: monitor.isConnected ? "wifi" : "wifi.slash")
                .font(.system(size: 56))
        }
    }
}
