//
//  HomeTopView.swift
//  DesignCode
//
//  Created by EDZ on 2020/4/29.
//  Copyright © 2020 ykq. All rights reserved.
//

import SwiftUI

struct HomeTopView: View {
    
    @Binding var showProfile : Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                
                Spacer()
                
                AvatarView(showProfile: $showProfile)
            }
            .padding(.horizontal)
            .padding(.top, 30)
            
            VStack {
                HStack(alignment: .top) {
                    Text("Prototype design in swiftUI")
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: 160, alignment: .leading)
                    Spacer()
                    Image("Logo1")
                }
                Text("18 Sections".uppercased() ).frame( maxWidth: .infinity,  alignment: .leading)
                Image("Card1").resizable().aspectRatio(contentMode: .fit).frame(width:210)
            }
            .padding(.top,20)
            .padding(.horizontal,20)
            .frame(width: 275, height: 275)
            .background(Color("card1"))
            
            Spacer()
        }
    }
}

struct HomeTopView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTopView(showProfile: .constant(false))
    }
}
