//
//  HomeTopScrollView.swift
//  InstaClone
//
//  Created by haco on 15/08/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct HomeTopScrollView: View {
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(0 ..< 5){ _ in
                    StoryView()
                }
            }
        }
    }
}

struct HomeTopScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTopScrollView()
    }
}
