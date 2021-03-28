//
//  Buttons.swift
//  DesignCode2
//
//  Created by Yash Jivani on 26/03/21.
//  Copyright © 2021 haco. All rights reserved.
//

import SwiftUI

struct Buttons: View {
   
    var body: some View {
        VStack (spacing: 50){
            RectangleButton()
            
            VStack {
                Image(systemName: "sun.max")
                    .font(.system(size: 44, weight: .light))
                
            }
            .frame(width: 100, height: 100, alignment: .center)
            .background(
                ZStack {
                Color.white
                    Circle()
                        .stroke(Color.clear, lineWidth: 10)
                        .shadow(color: Color(#colorLiteral(red: 0.8516774632, green: 0.8982388031, blue: 0.9764705896, alpha: 0.5823048977)), radius: 3, x: -5, y: -5)
            })
            .clipShape(Circle())
            .shadow(color: Color.white, radius: 20, x: -20, y: -20)
            .shadow(color: Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), radius: 20, x: 20, y: 20)
        }
        .frame(maxWidth: .infinity, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color(#colorLiteral(red: 0.1414481996, green: 0.5594741424, blue: 0.9648240436, alpha: 0.1676571069)))
        .edgesIgnoringSafeArea(.all)
        .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}

struct RectangleButton: View {
    @State var tap = false
    @State var press = false
    var body: some View {
        Text("Button")
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .frame(width: 200, height: 60, alignment: .center)
            .background(
                ZStack {
                    Color(press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1): #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .foregroundColor(Color(press ? #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .blur(radius: 4)
                        .offset(x: -8, y: -8)
                    
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8153624675, green: 0.8999434946, blue: 0.9686274529, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .padding(2)
                        .blur(radius: 2)
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(
                HStack{
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 24, weight: .light))
                        .foregroundColor(Color.white.opacity(press ? 0 : 1))
                        .frame(width: press ? 64 : 54, height: press ? 4 : 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)))
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)).opacity(0.3), radius: 10, x: 10, y: 10)
                        .offset(x: press ? 70 : -10, y: press ? 16 : 0)
                    
                    Spacer()
                }
            )
            .shadow(color: Color(press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1): #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), radius: 20, x: 20, y: 20)
            .shadow(color: Color(press ? #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
            .scaleEffect(tap ? 1.2 : 1)
            .gesture(
                LongPressGesture(minimumDuration: 0.5, maximumDistance: 2).onChanged{ value in
                    self.tap = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                        self.tap = false
                    }
                }
                .onEnded{ value in
                    self.press.toggle()
                }
            )
    }
}
