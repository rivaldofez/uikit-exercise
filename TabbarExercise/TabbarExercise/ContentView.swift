//
//  ContentView.swift
//  TabbarExercise
//
//  Created by Rivaldo Fernandes on 29/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var index = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            CustomTabs(index:  self.$index)
        }
        .background(.black.opacity(0.2)).edgesIgnoringSafeArea(.all)
    }
}

struct CustomTabs: View {
    @Binding var index: Int
    
    var body: some View{
        HStack {
            
            Spacer(minLength: 0)
            
            Button(action : {
                self.index = 1
            }){
                VStack {
                    Image("box")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 40)
                    Text("Beranda")
                }
                .frame(width: 100)
            }
            .foregroundColor(Color.black.opacity(self.index == 1 ? 1 : 0.1))
            
            Spacer(minLength: 0)
            
            Button(action: {
                
            }){
                VStack(spacing: 0) {
                    Image("pindai")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 50)
                    Text("Pindai")
                }
                .frame(width: 90, height: 90)
                .background(.black)
                .clipShape(Circle())
                
            }
            .offset(y: -30)
            
            Spacer(minLength: 0)
            
            Button(action : {
                self.index = 2
            }){
                VStack {
                    Image("person")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 40)
                    Text("pengaturan")
                }
                .frame(width: 100)
            }
            .foregroundColor(Color.black.opacity(self.index == 2 ? 1 : 0.1))
            
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 35)
        .padding(.top, 60)
        .background(Color.white)
        .clipShape(CShape())
        
        
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        
        let pathOut = Path { path in
            path.move(to: CGPoint(x: 30, y: 60)) //Sudut 1
            path.addLine(to: CGPoint(x: 0, y: 90)) // Sudut 1,3
            
            //Rounded Left
            path.addArc(center: CGPoint(x: 30, y: 100), radius: 40, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: -180), clockwise: true)
            
            path.addLine(to: CGPoint(x: 0, y: rect.height)) // Sudut 3
            path.addLine(to: CGPoint(x: (rect.width) , y: rect.height)) // Sudut 4
            
            //Rounded Right
            path.addArc(center: CGPoint(x: (rect.width - 30), y: 100), radius: 40, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: -90), clockwise: true)
            
            path.addLine(to: CGPoint(x: (rect.width), y: 90)) // sudut 2,4
            path.addLine(to: CGPoint(x: (rect.width-30), y: 60)) // sudut 1,2
        
            
            path.addLine(to: CGPoint(x: ((rect.width/2) + 30), y: 60)) // sudut O left
            path.addArc(center: CGPoint(x: (rect.width / 2), y: (rect.height / 2)), radius: 60, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: -180), clockwise: true)
            
            path.addLine(to: CGPoint(x: ((rect.width/2) - 30), y: 60)) // sudut O right
        }
        return pathOut
    }
}
