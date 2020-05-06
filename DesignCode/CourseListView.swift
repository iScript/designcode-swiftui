//
//  CourseListView.swift
//  DesignCode
//
//  Created by EDZ on 2020/5/5.
//  Copyright © 2020 ykq. All rights reserved.
//

import SwiftUI

struct CourseListView: View {
    @State var show = false
    @State var show2 = false
    
    
    var body: some View {
        ScrollView {
            VStack(spacing:30) {
                CourseView(show: $show)
                GeometryReader {geometry in
                    CourseView(show: self.$show2)
                        .offset(y:self.show2 ? -geometry.frame(in:.global).minY : 0 )   //获取全局的frame？
                }
                .frame(height: show2 ? screen.height : 280)
                .frame(maxWidth: show2 ?  .infinity : screen.width-60)
            }
            .frame(width:screen.width)
        }
    }
}

struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}

struct CourseView: View {
    
    @Binding var show:Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            
            VStack(alignment: .leading, spacing: 30.0) {
                Text("Design Code is fun. This is haoboxuxu learning SwiftUI to be pro. haoboxuxu has app on the App Store. Search Machine Learning hub")
                Text("About Machine Learning hub")
                    .font(.title).bold()
                
                Text("Design Code is fun. This is haoboxuxu learning SwiftUI to be pro. haoboxuxu has app on the App Store. Search Machine Learning hub!Design Code is fun. This is haoboxuxu learning SwiftUI to be pro. haoboxuxu has app on the App Store. Search Machine Learning hub.Design Code is fun. This is haoboxuxu learning SwiftUI to be pro. haoboxuxu has app on the App Store. Search Machine Learning hub")
                
                Text("Design Code is fun. This is haoboxuxu learning SwiftUI to be pro. haoboxuxu has app on the App Store. Search Machine Learning hub, Design Code is fun. This is haoboxuxu learning SwiftUI to be pro. haoboxuxu has app on the App Store. Search Machine Learning hub")
            }
            .padding(30)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 280, alignment: .top)  // 内容隐藏在后面
            .offset(y: show ? 460 : 0)  // 460为展开后卡片的高度
            .background(Color("background2"))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .opacity(show ? 1 : 0)
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("SwiftUI Advanced").font(.system(size: 24, weight: .bold)).foregroundColor(.white)
                        Text("20 sections").foregroundColor(Color.white.opacity(0.7))
                    }
                    Spacer()
                    VStack {
                        Image(uiImage: #imageLiteral(resourceName: "Logo1")).opacity(show ? 0 : 1)
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16 , weight: .medium))
                                .foregroundColor(.white)
                        }
                        .frame(width: 36, height: 36)
                        .background(Color.black)
                        .clipShape(Circle())
                        .opacity(show ? 1 : 0)
                    }
                }
                Spacer()
                Image(uiImage: #imageLiteral(resourceName: "Card1"))
                    .resizable()
                    .aspectRatio(contentMode: .fit )
                    .frame(maxWidth:.infinity)
                    .frame(height:140,alignment: .top)
                
            }
            .padding(show ? 30 : 20)
            .padding(.top, show ? 30 : 0 )  // 在上面基础上再添加
            //.frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 280)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280 )
            .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
            
            .onTapGesture {
                self.show.toggle()
            }
           
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
         .edgesIgnoringSafeArea(.all)
    
    }
}
