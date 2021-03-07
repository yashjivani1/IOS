//
//  ImageHomeView.swift
//  InstaClone
//
//  Created by haco on 15/08/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI


struct ImageHomeView: View {
    let image: String
    var body: some View {
       Image(image)
            .resizable()
            
            
        .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width, height: 340)
        .clipped()
    }
}

struct ImageHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ImageHomeView(image: "ak")
    }
}
