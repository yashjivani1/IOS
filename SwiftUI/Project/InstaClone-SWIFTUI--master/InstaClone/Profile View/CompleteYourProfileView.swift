//
//  CompleteYourProfileView.swift
//  InstaClone
//
//  Created by haco on 09/08/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct CompleteYourProfileView: View {
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    
                    Text("Complete your profile")
                    .bold()
                    
                    Text("3 of 4")
                        .foregroundColor(.green)
                    Text("Complete")
                }
                Spacer()
            }.padding()
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(0 ..< 5){ _ in
                        CardView()
                    }
                }
            }
        }
    }
}

struct CompleteYourProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteYourProfileView()
    }
}
