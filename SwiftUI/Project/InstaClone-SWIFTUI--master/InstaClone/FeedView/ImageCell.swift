//
//  ImageCell.swift
//  InstaClone
//
//  Created by haco on 15/08/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct ImageCell: View {
    var images = ["ak", "ak", "ak", "ak"]
    var body: some View {
        ScrollView(.vertical){
            ForEach(images, id: \.self){ image in
                VStack{
                    TopPersonView()
                    Divider()
                    ImageHomeView(image: image)
                    BottomButtonsView()
                    LikesView()
                    PostTextView()
                    AddCommentView()
                    TimeView()
                }
                
            }
        }
    }
}

struct ImageCell_Previews: PreviewProvider {
    static var previews: some View {
        ImageCell()
    }
}
