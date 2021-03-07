//
//  BioVIew.swift
//  InstaClone
//
//  Created by haco on 09/08/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct BioView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Haco")
                Text("Don")
            }
            Spacer()
        }.padding()
    }
}

struct BioView_Previews: PreviewProvider {
    static var previews: some View {
        BioView()
    }
}
