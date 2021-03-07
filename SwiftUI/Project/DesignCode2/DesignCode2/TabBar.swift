//
//  TabBar.swift
//  DesignCode2
//
//  Created by haco on 14/12/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            Home().tabItem{
                VStack{
                    Image(systemName: "play.circle.fill")
                     Text("Home")
                }
            }
            CourseList().tabItem{
                Image(systemName: "rectangle.stack.fill")
                Text("Courses")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
