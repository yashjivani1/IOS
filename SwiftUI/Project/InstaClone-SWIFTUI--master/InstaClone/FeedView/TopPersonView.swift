//
//  TopPersonView.swift
//  InstaClone
//
//  Created by haco on 15/08/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct TopPersonView: View {
    var body: some View {
        HStack{
            Image(systemName : "person.crop.circle")
                .font(.title)
            Text("Haco")
            
            Spacer()
            
            Button( action : {
                
            }){
                Image(systemName : "ellipse")
                    .font(.title)
                    .foregroundColor(Color(.label))
            }
        }.padding()
    }
}

struct TopPersonView_Previews: PreviewProvider {
    static var previews: some View {
        TopPersonView()
    }
}
