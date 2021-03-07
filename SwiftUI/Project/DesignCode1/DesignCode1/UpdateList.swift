//
//  UpdateList.swift
//  DesignCode1
//
//  Created by haco on 07/12/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    var updates = updateData
    @ObservedObject var store = UpdateStore()
    @State var showSettings = false
    
    func addUpdate(){
        store.updates.append(Update(image: "Certificate1", title: "New Title", text: "New text", date: "JUL 1"))
       
    }
    
    func move(from source: IndexSet, to destination: Int){
        store.updates.swapAt(source.first!, destination)
    }
    
    var body: some View {
        NavigationView{
            
          
            
            VStack {
                Button(action: addUpdate){
                              Text("Add Update")
                                .foregroundColor(.white)
                }.padding(8)
                    .background(Color("background3"))
                    .cornerRadius(8)
                List{
                    ForEach(store.updates) { item in
                        NavigationLink(destination: UpdateDetail(title: item.title, text: item.text, image: item.image)){
                            HStack (spacing: 12){
                                Image(item.image)
                                .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                    .background(Color("background"))
                                    .cornerRadius(20)
                                
                                VStack(alignment: .leading){
                                    Text(item.title)
                                        .font(.headline)
                                    
                                    Text(item.text)
                                    .lineLimit(3)
                                        .font(.system(size: 15))
                                    .lineSpacing(4)
                                        .frame(height: 50)
                                    
                                    Text(item.date)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .padding(.vertical, 8)
                    }.onDelete{ index in
                        self.store.updates.remove(at: index.first!)
                    }
                    .onMove(perform: move)
                }
            .navigationBarTitle(Text("Updates"))
                .navigationBarItems(trailing: EditButton()
//                    Button(action: { self.showSettings.toggle() }){
//                        Image(systemName: "gear")
//                            .sheet(isPresented: self.$showSettings){
//                                Text("Settings")
//                        }
//                    }
                )
            }
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
    var image: String
    var title: String
    var text: String
    var date: String
}


let updateData = [
    Update(image: "Illustration1", title: "SwiftUI", text: "Take your static design to the next level and build real apps with the simplicity of a prototpying tool. The best way to beginners to learn code, and the most efficient way for developers to learn design.", date: "JUN 26"),
    Update(image: "Illustration2", title: "Framer X", text: "Framer makes it incredibly easy to add complex user interactions inside your prototype, taking your design and code components to the next level. Playground allows you to quickly test new concepts within the all - new in -app code editor. You can combine your current app flow with new code components created in Playground.", date: "JUN 11"),
    Update(image: "Illustration3", title: "CSS Layout", text: "Learn how to combine CSS Grid, Flexbox, animations and responsive design to create a beautiful prototype in CodePen.", date: "MAY 26"),
    Update(image: "Illustration4", title: "React Native", text: "Learn how to implement gestures, Lottie animations and Firebase login.", date: "MAY 15"),
    Update(image: "Certificate1", title: "Unity", text: "Unity course teaching basics, C#, assets, level design and gameplay", date: "MAR 19")
]
