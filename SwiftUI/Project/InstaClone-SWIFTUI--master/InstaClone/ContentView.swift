//
//  ContentView.swift
//  InstaClone
//
//  Created by haco on 09/08/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            TabView{
                
                Text("Tab content 2").tabItem{ Image(systemName: "heart")}
                
            }
        }.navigationBarTitle("Instagram", displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
