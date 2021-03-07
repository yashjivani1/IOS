//
//  HomeList.swift
//  DesignCode1
//
//  Created by haco on 07/12/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    var courses = coursesData
    @State var showContent = false
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("Courses")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Text("22 Courses")
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding(.leading, 70)
            
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 30){
                    ForEach(courses){ item in
                        Button(action: { self.showContent.toggle() }){
                            GeometryReader { geometry in
                                CourseView(title: item.title, image: item.image, color: item.color, shadowColor: item.shadowColor).sheet(isPresented: self.$showContent){
                                    ContentView()
                                }
                                .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 40) / -20), axis: (x: 0, y: 10, z: 0))
                            }
                        .frame(width: 246, height: 150)
                        }
                    }
                    .padding(.leading, 40)
                    .padding(.top, 30)
                     Spacer()
                }
                .frame(height: 450)
               
            }
            .padding(.top, 78.0)
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourseView: View{
    var title = "Build an app with swiftui"
    var image = "Illustration1"
    var color = Color("background3")
    var shadowColor = Color("backgroundShadow3")
    
    var body: some View{
        VStack(alignment: .leading){
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            .padding(30)
            .lineLimit(4)
                .padding(.trailing, 50)
            Spacer()
            Image(image)
            .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
            .frame(width: 246, height: 150)
                .padding(.bottom, 30)
        }
    .background(color)
    .cornerRadius(30)
    .frame(width: 246, height: 360)
        .shadow(color: shadowColor,radius: 20,x: 0, y: 20)
    }
}

struct Course: Identifiable{
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}

let coursesData = [
    Course(title: "Build an app with SwiftUI", image: "Illustration1", color: Color("background3"), shadowColor: Color("backgroundShadow3")),
    Course(title: "Design Course", image: "Illustration2", color: Color("background4"), shadowColor: Color("backgroundShadow4")),
    Course(title: "Build an app with SwiftUI", image: "Illustration1", color: Color("background3"), shadowColor: Color("backgroundShadow3")),
    Course(title: "Design Course", image: "Illustration2", color: Color("background4"), shadowColor: Color("backgroundShadow4")),
    Course(title: "Build an app with SwiftUI", image: "Illustration1", color: Color("background3"), shadowColor: Color("backgroundShadow3")),
    Course(title: "Design Course", image: "Illustration2", color: Color("background4"), shadowColor: Color("backgroundShadow4"))
]
