//
//  HomeView.swift
//  DesignCode2
//
//  Created by haco on 13/12/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    @Binding var showContent : Bool
    var body: some View {
        ScrollView {
            VStack {
                HStack{
                    Text("Watching")
                        //.font(.system(size: 28, weight: .bold))
                        .modifier(CustomFontModifier(size: 28))
                    Spacer()
                    
                    AvatarView(showProfile: $showProfile)
                    Button(action: { self.showUpdate.toggle()}){
                        Image(systemName: "bell")
//                            .renderingMode(.original)
                            .foregroundColor(.primary)
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(Color("background3"))
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 0)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    }.sheet(isPresented: $showUpdate){
                        UpdateList()
                    }
                }
                .padding(.horizontal)
                .padding(.leading, 14)
                .padding(.top, 30)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    WatchRingsView()
                        .padding(.horizontal, 30)
                        .padding(.bottom, 30)
                        .onTapGesture {
                            self.showContent = true
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (spacing: 30){
                        ForEach(sectionData) { item in
                            SectionView(section: item)
                        }
                    }
                    .padding(30)
                    .padding(.bottom, 30)
                }
                .offset(y: -30)
                HStack{
                    Text("Courses")
                        .font(.title).bold()
                    Spacer()
                }
                .padding(.leading, 30)
                .offset(y: -60)
                SectionView(section: sectionData[0], width: screen.width - 60, height: 275)
                .offset(y: -60)
                Spacer()
            }
            .frame(width: screen.width)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showContent: .constant(false))
    }
}

struct SectionView: View {
    var section : Section
    var width: CGFloat = 275
    var height: CGFloat = 275
    
    var body: some View {
        VStack {
            HStack(alignment: .top){
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                Spacer()
                Image(section.logo)
            }
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(uiImage: section.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(Color(section.color))
        .cornerRadius(30)
        .shadow(color: Color(section.color).opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct Section: Identifiable{
    var id = UUID()
    var title : String
    var text : String
    var logo : String
    var image : UIImage
    var color : UIColor
}

let sectionData = [
   Section(title: "Prototype designs in SwiftUI", text: "18 Sections", logo: "Logo", image: #imageLiteral(resourceName: "Card5"), color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)),
    Section(title: "Build a SwiftUI app", text: "20 Sections", logo: "Logo", image: #imageLiteral(resourceName: "Card4"), color: #colorLiteral(red: 0.968627451, green: 0.2156862745, blue: 0.3411764706, alpha: 1)),
    Section(title: "SwiftUI Advanced", text: "18 Sections", logo: "Logo", image: #imageLiteral(resourceName: "Card3"), color: #colorLiteral(red: 0.07843137255, green: 0.7450980392, blue: 0.9921568627, alpha: 1)),
    Section(title: "UI Design for Developers", text: "14 Sections", logo: "Logo3", image: #imageLiteral(resourceName: "Card2"), color: #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)),
    Section(title: "Build a full site in Webflow", text: "14 Sections", logo: "Logo2", image: #imageLiteral(resourceName: "Background1"), color: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)),
    Section(title: "Design for iOS 13", text: "20 Sections", logo: "Logo3", image: #imageLiteral(resourceName: "Card6"), color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
]

struct WatchRingsView: View {
    var body: some View {
        HStack (spacing: 30){
            HStack(spacing: 12){
                RingView(color1: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), color2: #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1), width: 44, height: 44, percent: 68, show: .constant(true))
                VStack(alignment: .leading, spacing: 4){
                    Text("6 minutes left")
                        .bold()
                        .modifier(FontModifier(style: .subheadline))
                    
                    Text("Watched 10 mins today")
                        .modifier(FontModifier(style: .caption))
                    
                }
                .modifier(FontModifier())
            }
            .padding(8)
            .background(Color("background3"))
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack(spacing: 12){
                RingView(color1: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), color2: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), width: 32, height: 32, percent: 70, show: .constant(true))
                
            }
            .padding(8)
            .background(Color("background3"))
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack(spacing: 12){
                RingView(color1: #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1), color2: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), width: 32, height: 32, percent: 70, show: .constant(true))
                
            }
            .padding(8)
            .background(Color("background3"))
            .cornerRadius(20)
            .modifier(ShadowModifier())
        }
    }
}
