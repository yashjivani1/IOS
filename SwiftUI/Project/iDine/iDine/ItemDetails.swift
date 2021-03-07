//
//  ItemDetails.swift
//  iDine
//
//  Created by haco on 01/10/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct ItemDetails: View {
    @EnvironmentObject var order: Order
    var item: MenuItem
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                    Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -20, y: -5)
            }
            
            Text(item.description).padding()
            Button("Order This"){
                self.order.add(item: self.item)
            }.font(.headline)
            
            Spacer()
        }.navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        NavigationView{
            ItemDetails(item: MenuItem.example).environmentObject(order)
        }
    }
}
