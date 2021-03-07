//
//  ContentView.swift
//  DesignCode1
//
//  Created by haco on 26/11/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack{
            BlurView(style: .systemMaterial)
            
            TitleView()
                .blur(radius: show ? 20: 0)
                .animation(.default)
            
            CardBottomView()
                .blur(radius: show ? 20: 0)
                .animation(.default)
            
            CardView()
                .background(show ? Color.red : Color("background9"))
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                .rotation3DEffect(Angle(degrees: show ? 50 : 0), axis:(x: 10, y: 10, z: 10))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.6))
                .offset(x: viewState.width, y: viewState.height)
            
            
            CardView()
            .background(show ? Color("background5") : Color("background8"))
            .cornerRadius(10)
            .shadow(radius: 20)
            .offset(x: 0, y: show ? -200 : -20)
            .scaleEffect(0.9)
            .rotationEffect(Angle(degrees: show ? 10 : 0))
            .rotation3DEffect(Angle(degrees: show ? 40 : 0), axis:(x: 10, y: 10, z: 10))
            .blendMode(.hardLight)
            .animation(.easeInOut(duration: 0.4))
            .offset(x: viewState.width, y: viewState.height)
            
            
            CertificateView()
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                .rotation3DEffect(Angle(degrees: show ? 30 : 0), axis: (x: 10, y: 10, z: 10))
                .animation(.spring())
                .onTapGesture {
                    self.show.toggle()
            }.gesture(
                DragGesture()
                    .onChanged{ value in
                        self.viewState = value.translation
                        self.show = true
                }
                    
                .onEnded{ value in
                    self.viewState = CGSize.zero
                    self.show = false
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View{
    var body: some View{
        VStack{
            Text("Card Back")
                .frame(width: 340, height: 220)
        }
    }
}

struct CertificateView: View{
    var body: some View{
        VStack{
           
            HStack{
                VStack(alignment: .leading){
                    Text("UI Design")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color("accent"))
                        .padding(.top)
                    Text("Certificate")
                        .foregroundColor(.white)
                }
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .padding(.horizontal)
            Spacer()
            Image("Certificate1")
        }
        .frame(width: 340, height: 220)
        .background(Color.black)
        .cornerRadius(10)
        .shadow(radius: 20)
    }
}


struct TitleView: View{
    var body: some View{
        VStack{
            HStack{
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            }
            
            Image("Illustration5")
            Spacer()
        }
        .padding()
    }
}


struct CardBottomView: View{
    
    var body: some View{
        VStack{
            Rectangle()
                .frame(width: 60, height: 6)
                .cornerRadius(3.0)
                .opacity(0.1)
            Text("This is Haco a Counter strike player want to play daily")
                .lineLimit(10)
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .padding(.horizontal)
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(y: 600)
    }
}
