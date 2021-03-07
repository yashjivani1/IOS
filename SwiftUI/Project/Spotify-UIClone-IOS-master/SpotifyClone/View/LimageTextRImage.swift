//
//  LimageTextRImage.swift
//  SpotifyClone
//
//  Created by Haco on 14/04/20.
//  Copyright © 2020 Haco. All rights reserved.
//

import SwiftUI

struct LimageTextRImage: View {
    var body: some View {
        HStack{
            Image(systemName: "timelapse").padding(.trailing, 10)
            Text("title")
            Spacer()
            Image(systemName: "ellipsis")
            }.padding(15)
        .background(Color.black)
            .foregroundColor(Color .white)
    }
}

struct LimageTextRImage_Previews: PreviewProvider {
    static var previews: some View {
        LimageTextRImage()
    }
}
