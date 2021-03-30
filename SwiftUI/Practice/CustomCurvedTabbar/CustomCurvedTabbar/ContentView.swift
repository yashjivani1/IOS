//
//  ContentView.swift
//  CustomCurvedTabbar
//
//  Created by Yash Jivani on 30/03/21.
//

import SwiftUI

struct ContentView: View {
    @State var index = 0
    var body: some View {
        VStack{
            ZStack{
                Color.red
            }
            .padding(.bottom , -35)
            CustomTabs(index: $index)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
            ContentView()
        }
    }
}


struct CustomTabs: View{
    
    @Binding var index: Int
    
    var body: some View{
        HStack{
           
            Button(action:{
                self.index = 0
            }){
                Image("home")
                    .resizable()
                    .frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .foregroundColor(Color.black.opacity(self.index == 0 ? 1 : 0.1))
            .padding(.top, 10)
            
            
            
            Spacer(minLength: 0)
            
            Button(action:{
                self.index = 1
            }){
                Image("home")
                    .resizable()
                   
                    .frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .foregroundColor(Color.black.opacity(self.index == 1 ? 1 : 0.1))
            
            .padding(.top, 10)
            
            Spacer(minLength: 0)
            
            Button(action: {
                
            }){
                Image("home")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }.offset(y: -25)
            
            Spacer(minLength: 0)
            
            Button(action:{
                self.index = 2
            }){
                Image("home")
                    .resizable()
                    .frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .foregroundColor(Color.black.opacity(self.index == 2 ? 1 : 0.1))
            .padding(.top, 10)
            
            Spacer(minLength: 0)
            
            Button(action:{
                self.index = 3
            }){
                Image("home")
                    .resizable()
                    .frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .foregroundColor(Color.black.opacity(self.index == 3 ? 1 : 0.1))
            .padding(.top, 10)
        }
        .padding(.horizontal, 35)
        .padding(.top, 40)
        .background(Color.white)
        .clipShape(CShape())
        
        
    }
}


struct CShape: Shape{
    func path(in rect: CGRect) -> Path {
        return Path{ path in
            path.move(to: CGPoint(x: 0, y: 35))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 35))
            
            path.addArc(center: CGPoint(x: (rect.width / 2) , y: 35), radius: 35, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
        }
    }
}
