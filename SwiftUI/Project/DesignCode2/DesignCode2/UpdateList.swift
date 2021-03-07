//
//  UpdateList.swift
//  DesignCode2
//
//  Created by haco on 14/12/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    @ObservedObject var store = UpdateStore()
    func addUpdate(){
        store.updates.append(Update(image: "Card1", title: "New Item", text: "Text", date: "Jan 30"))
    }
    var body: some View {
        NavigationView{
            List{
                ForEach(store.updates) { update in
                    NavigationLink(destination: UpdateDetail(update: update)){
                        HStack{
                            Image(update.image)
                            .resizable()
                                .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                                .background(Color.black)
                            .cornerRadius(20)
                                .padding(.trailing, 4)
                            
                            VStack(alignment: .leading, spacing: 0.8){
                                Text(update.title)
                                    .font(.system(size: 20, weight: .bold))
                                
                                Text(update.text)
                                .lineLimit(2)
                                    .font(.subheadline)
                                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                                
                                Text(update.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .onDelete{ index in
                    self.store.updates.remove(at: index.first!)
                }
                .onMove{ (source: IndexSet, destination: Int) in
                    self.store.updates.move(fromOffsets: source, toOffset: destination)
                }
            }
        .navigationBarTitle(Text("Updates"))
            .navigationBarItems(leading: Button(action: addUpdate){
                Text("Add Update")
            }, trailing: EditButton())
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable{
    var id = UUID()
    var image : String
    var title : String
    var text : String
    var date : String
}

let updateData = [
    Update(image: "Card1", title: "SWiftUI Advanced", text: "Take your swiftUI app to the App store with advanced techniques like api data", date: "JAN 1"),
    Update(image: "Card2", title: "SWiftUI Advanced", text: "Take your swiftUI app to the App store with advanced techniques like api data", date: "JAN 1"),
    Update(image: "Card3", title: "SWiftUI Advanced", text: "Take your swiftUI app to the App store with advanced techniques like api data", date: "JAN 1"),
    Update(image: "Card4", title: "SWiftUI Advanced", text: "Take your swiftUI app to the App store with advanced techniques like api data", date: "JAN 1"),
    Update(image: "Card5", title: "SWiftUI Advanced", text: "Take your swiftUI app to the App store with advanced techniques like api data", date: "JAN 1")
]
