//
//  TimeView.swift
//  InstaClone
//
//  Created by haco on 15/08/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct TimeView: View {
    var body: some View {
        HStack{
            Text("22 hourse ago")
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
