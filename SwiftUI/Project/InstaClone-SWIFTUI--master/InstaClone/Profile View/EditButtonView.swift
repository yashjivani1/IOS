//
//  EditButtonView.swift
//  InstaClone
//
//  Created by haco on 09/08/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct EditButtonView: View {
    var body: some View {
        Button(action: {
            
        }){
            Text("Edit Profile")
            .bold()
                .foregroundColor(Color(.label))
        }.frame(width : UIScreen.main.bounds.width - 32, height : 50)
            .background(Color(.secondarySystemBackground))
        .cornerRadius(8)
    }
}

struct EditButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EditButtonView()
    }
}
