//
//  AddCommentView.swift
//  InstaClone
//
//  Created by haco on 15/08/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct AddCommentView: View {
    var body: some View {
        HStack{
            Image(systemName: "person.crop.circle")
                .font(.title)
            Text("Add comment..")
                .foregroundColor(.secondary)
            
            Spacer()
            
            
            Image(systemName: "plus.circle")
        }
    .padding()
    }
}

struct AddCommentView_Previews: PreviewProvider {
    static var previews: some View {
        AddCommentView()
    }
}
