//
//  File.swift
//  TabbarExercise
//
//  Created by Rivaldo Fernandes on 29/11/22.
//

import Foundation
import SwiftUI


struct ArcView: View {
    var body: some View {
        ArcSample()
            .frame(width: 200, height: 200)
    }
}

struct ArcSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(center: CGPoint(x: rect.midY, y: rect.midY), radius: rect.height / 2, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: -30), clockwise: false)
        }
    }
}

struct ArcView_Previews: PreviewProvider {
    static var previews: some View {
        ArcView()
    }
}
