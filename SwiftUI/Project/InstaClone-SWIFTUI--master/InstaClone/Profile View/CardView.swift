//
//  CardView.swift
//  InstaClone
//
//  Created by haco on 09/08/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        VStack{
            Image(systemName: "bubble.right")
                .font(.system(size:38))
                .overlay(CircleView())
            .padding()
                .padding(.top)
            
            Text("Add bio")
            .bold()
            .padding()
            
            Text("Tell about yourself")
                .multilineTextAlignment(.center)
            
            Button(action: {
                
            }){
                Text("Add bio")
                .bold()
                    .foregroundColor(.white)
            }.padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Color.blue)
                .padding(.top, 32)
        }.padding()
            .background(Color(.secondarySystemBackground))
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}

struct CircleView: View{
   
    var body: some View{
        Circle().stroke(Color.primary, lineWidth: 4)
            .frame(width: 72, height: 72)
    }
}
