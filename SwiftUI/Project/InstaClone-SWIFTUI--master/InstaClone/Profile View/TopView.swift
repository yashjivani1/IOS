//
//  TopView.swift
//  InstaClone
//
//  Created by haco on 09/08/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        HStack{
            Image(systemName: "person.crop.circle.badge.plus")
                .font(.system(size: 52))
                .padding(.horizontal)
            
            InfoVStackView()
            
        }
        
        .padding(.top, 44)
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
