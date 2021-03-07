//
//  HomeView.swift
//  InstaClone
//
//  Created by haco on 15/08/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView(.vertical){
            HomeTopScrollView()
            Divider()
            ImageCell()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
