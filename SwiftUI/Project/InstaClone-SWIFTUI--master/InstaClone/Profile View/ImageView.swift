//
//  ImageView.swift
//  InstaClone
//
//  Created by haco on 09/08/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        HStack(spacing: 2){
            ForEach(0 ..< 3){_ in
                LinearGradient(gradient: Gradient( colors: [.orange, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(height: 138)
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
