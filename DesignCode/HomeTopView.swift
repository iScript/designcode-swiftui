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
    @State var showUpdate = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                
                Spacer()
                
                AvatarView(showProfile: $showProfile)
                
                Button(action: {
                    self.showUpdate.toggle()
                }) {
                    Image(systemName: "bell")
                        .renderingMode(.original)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 36, height: 36)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                }
                .sheet(isPresented: $showUpdate) {
                    UpdateListView()
                }
            }
            .padding(.horizontal)
            .padding(.leading,14)
            .padding(.top, 30)
            
            HStack(spacing:12) {
                RingView(color1: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), color2: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), width: 44, height: 44, percent: 68, show: .constant(true))
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("6 minutes left ").font(.subheadline).fontWeight(.bold)
                    Text("Watch 10 minutes today").font(.caption)
                }
                
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing:30){
                    ForEach(sectionData) { item in
                        // 一个可以根据其自身大小和坐标空间定义其内容的容器视图。
                        // GeometryReader ?
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(Angle(degrees: Double(geometry.frame(in:.global).minX) / -30 ), axis: (x: 0, y: 10, z: 0))
                        }
                        .frame(width: 275, height: 275)
                    }

                }
                .padding(30)
                .padding(.bottom,30)
            }
            
            
            Spacer()
        }
    }
}

struct HomeTopView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTopView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    
    var section: Section
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
            }
            Text(section.text.uppercased() ).frame( maxWidth: .infinity,  alignment: .leading)
            section.image.resizable().aspectRatio(contentMode: .fit).frame(width:210)
        }
        .padding(.top,20)
        .padding(.horizontal,20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct Section :Identifiable{
    var id = UUID()
    var title:String
    var text:String
    var logo:String
    var image : Image
    var color:Color
}

let sectionData = [
    Section(title: "Prototype design in SwiftUI", text: "18 Section", logo: "Logo1", image: Image("Card1"), color: Color("card1")),
    Section(title: "Build a SwiftUI app", text: "20 Section", logo: "Logo1", image: Image("Card2"), color: Color("card2")),
    Section(title: "SwiftUI Advanced", text: "20 Section", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Background1")), color: Color("card1"))
]

