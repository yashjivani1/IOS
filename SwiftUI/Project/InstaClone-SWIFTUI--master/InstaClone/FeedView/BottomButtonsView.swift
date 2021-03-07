//
//  BottomButtonsView.swift
//  InstaClone
//
//  Created by haco on 15/08/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct BottomButtonsView: View {
    
    let buttons = ["heart", "bubble", "paperplane"]
    var body: some View {
        HStack{
            ForEach(buttons, id: \.self){ image in
                Button(action : {
                    
                }){
                    Image(systemName: image)
                        .font(.title)
                        .foregroundColor(Color(.label))
                        .padding(.horizontal)
                }
            }
            Spacer()
            
            Button(action: {
                
            }){
                Image(systemName: "bookmark")
                    .font(.title)
                    .foregroundColor(Color(.label))
            }
        }.padding([.vertical, .trailing])
        
    }
}

struct BottomButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtonsView()
    }
}
