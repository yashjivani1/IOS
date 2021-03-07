//
//  ContentItemView.swift
//  SpotifyClone
//
//  Created by Haco on 14/04/20.
//  Copyright © 2020 Haco. All rights reserved.
//

import SwiftUI

struct ContentItemView: View {
    
    var topSpacerHeight:CGFloat = 440
    @State var playerButton_offset:CGFloat = 320
    var reusableColor = Color.init(red: 51/255, green: 79/255, blue: 105/255)
    
    var body: some View {
        ZStack{
            //Layer 0
            LinearGradient(gradient: Gradient(colors: [
            
                reusableColor,
                Color.black,
                Color.black,
            ]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            //Layer 1
            VStack{
                Spacer()
                    .frame(height:50)
                Image("kohinoor")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text("Title")
                    .foregroundColor(Color.white)
                    .font(.system(size: 24, weight: .bold))
                
                Text("Subtitle")
                    .foregroundColor(.init(red: 0.5, green: 0.5, blue: 0.5))
                Spacer()
            }
            //Layer 2
            ScrollView{
                GeometryReader{ geo -> AnyView? in
                    let thisOffset = geo.frame(in: .global).minY
                    if thisOffset > -300{
                        self.playerButton_offset = thisOffset
                    }else{
                        self.playerButton_offset = -300
                    }
                    
                    return nil
                }
                VStack(spacing:0){
                    HStack{
                        Spacer()
                            .frame(height: topSpacerHeight)
                            .background(LinearGradient(gradient: Gradient(colors:  [
                                Color.clear,
                                Color.black
                            ]), startPoint: .top, endPoint: .bottom))
                    }
                    VStack{
                        ForEach(0..<30){ indicator in
                            HStack{
                                LimageTextRImage()
                                Spacer()
                            }
                        }
                    }.background(Color.black)
                    
                }.background(Color.clear)
            }
            
            VStack{
                LinearGradient(gradient: Gradient(colors: [
                    reusableColor, Color.clear
                ]), startPoint: .top, endPoint: .bottom)
                    .frame(height: 300)
                Spacer()
            }.edgesIgnoringSafeArea(.all)
            //Layer 3
            VStack {
                Spacer()
                    .frame(height: playerButton_offset + 350)
                
                HStack{
                    if playerButton_offset > -300{
                        Text("Play")
                    }else{
                        Image(systemName: "play.fill")
                    }
                    
                }
                    
                .foregroundColor(.white)
                .frame(width: get_playButtonWitdth(), height: 50)
                .background(Color.init(red: 30/255, green: 215/255, blue: 96/255))
                .cornerRadius(25)
                .font(.system(size:20, weight:.bold))
                Spacer()
            }
            
            //Layer 4
            VStack{
                HStack{
                    Image(systemName: "chevron.left")
                    Spacer()
                    Image(systemName: "ellipsis")
                }
                .foregroundColor(.white)
            .padding()
                Spacer()
            }
        
            
            
            
        }
    }
    
    func get_playButtonWitdth() -> CGFloat{
        if playerButton_offset > -150{
            return 240
        }else if playerButton_offset <= -300{
            return 50
        }else{
            var width:CGFloat = 240 - (190 * (((-1 * playerButton_offset) - 150) / 150))
            return width
        }
        
    }
}

struct ContentItemView_Previews: PreviewProvider {
    static var previews: some View {
        ContentItemView()
    }
}
