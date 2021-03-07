//
//  Home.swift
//  DesignCode1
//
//  Created by haco on 07/12/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var show = false
    @State var showProfile = false
    var body: some View {
        ZStack{
            HomeList()
                .blur(radius: show ? 20 : 0)
                .scaleEffect(showProfile ? 0.95 : 1)
                .animation(.default)
            
            ContentView()
            .cornerRadius(30)
            .shadow(radius: 20)
                .animation(.spring())
                .offset(y: showProfile ? 40 : UIScreen.main.bounds.height)
            
            MenuButton(show: $show)
                .offset(x: -30, y: showProfile ? 0 : 80)
                .animation(.spring())
            
            MenuRight(show: $showProfile)
                .offset(x: -16, y: showProfile ? 0 : 88)
                .animation(.spring())
            
            MenuView(show: $show)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct Menu: Identifiable{
    var id = UUID()
    var title: String
    var icon: String
}

struct MenuRow: View{
    var image = "creaditcard"
    var text = "My Account"
    var body: some View{
        HStack{
            Image(systemName: image)
                .imageScale(.large)
            .foregroundColor(Color("icons"))
                .frame(width: 32, height: 32)
            
            Text(text)
                .font(.headline)
            Spacer()
        }
    }
}

let menuData = [
    Menu(title: "My account", icon: "person.crop.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.and.person"),
    Menu(title: "Sign Out", icon: "arrow.uturn.down"),
]

struct MenuView: View{
    var menuItems = ["My Account","Billing","Team","Sign Out"]
    var menu = menuData
    
    @Binding var show : Bool
    
    var body: some View{
        VStack(alignment: .leading, spacing: 20){
            ForEach(menu){ item in
                MenuRow(image: item.icon, text: item.title)
            }
            Spacer()
        }
        .padding(.top, 20)
    .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(BlurView(style: .systemMaterial))
    .cornerRadius(30)
        .padding(.trailing, 60)
        .shadow(radius: 20)
        .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10, z: 0))
        .animation(.default)
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
        .onTapGesture{
            self.show.toggle()
        }
    }
}

struct CircleButton: View{
    var icon = "person.crop.circle"
    
    var body: some View{
        HStack{
            Image(systemName: icon)
                .foregroundColor(.primary)
        }
        .frame(width: 44, height: 44)
        .background(BlurView(style: .systemThickMaterial))
    .cornerRadius(30)
        .shadow(color: Color("buttonShadow"),radius: 10, x: 0, y: 10)
    }
}

struct MenuButton: View{
    @Binding var show: Bool
    var body: some View{
        ZStack{
            Button(action: { self.show.toggle() }){
                HStack{
                    Spacer()
                    Image(systemName: "list.dash")
                        .foregroundColor(.primary)
                }
                .padding(.trailing, 20)
                .frame(width: 90, height: 60)
                .background(BlurView(style: .systemThickMaterial))
            .cornerRadius(30)
            .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
            }
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct MenuRight: View{
    @Binding var show: Bool
    var body: some View{
        ZStack{
            HStack{
                Button(action: {
                    self.show.toggle()
                }){
                    CircleButton(icon: "person.crop.circle")
                }
                Button(action: {
                    self.show.toggle()
                }){
                    CircleButton(icon: "bell")
                }
            }
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
    }
}
