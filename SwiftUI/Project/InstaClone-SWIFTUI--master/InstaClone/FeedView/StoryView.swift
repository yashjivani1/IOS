//
//  StoryView.swift
//  InstaClone
//
//  Created by haco on 15/08/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        VStack{
            LinearGradient(gradient: Gradient(colors: [.orange, .red]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .frame(width: 72, height: 72)
            .clipShape(Circle())
            
            Text("Your story")
        }
    .padding()
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
