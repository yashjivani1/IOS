//
//  InfoVStackView.swift
//  InstaClone
//
//  Created by haco on 09/08/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct InfoVStackView: View {
    
    let infos = [
        Info(number: 2, label: "Posts"),
        Info(number: 2, label: "Followers"),
        Info(number: 2, label: "Following")
    ]
    var body: some View {
        HStack{
            ForEach(infos, id: \.self){ info in
                VStack{
                    Text("\(info.number)").bold()
                    Text(info.label).bold()
                }.padding()
            }
        }
    }
}

struct InfoVStackView_Previews: PreviewProvider {
    static var previews: some View {
        InfoVStackView()
    }
}

struct Info: Hashable{
    let number : Int
    let label: String
}
