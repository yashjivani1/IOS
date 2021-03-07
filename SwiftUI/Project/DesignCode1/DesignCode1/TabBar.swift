//
//  TabBar.swift
//  DesignCode1
//
//  Created by haco on 09/12/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            Home().tabItem {
                VStack{
                    Image("IconHome")
                    Text("Home")
                }
                
            }.tag(1)
            ContentView().tabItem {
                VStack{
                    Image("IconCards")
                    Text("Certificates")
                }
                
            }.tag(2)
            UpdateList().tabItem {
                VStack{
                    Image("IconSettings")
                    Text("Updates")
                }
                
            }.tag(3)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
