//
//  SwiftUIView.swift
//  InstaClone
//
//  Created by haco on 09/08/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView(.vertical){
            TopView()
            BioView()
            EditButtonView()
            HButtonView()
            ImageView()
            CompleteYourProfileView()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
