//
//  CourseDetailView.swift
//  DesignCode
//
//  Created by EDZ on 2020/5/6.
//  Copyright © 2020 ykq. All rights reserved.
//

import SwiftUI

struct CourseDetailView: View {
    
    var course : Course
    @Binding var show : Bool
    @Binding var active : Bool
    @Binding var activeIndex : Int
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(course.title).font(.system(size: 24, weight: .bold)).foregroundColor(.white)
                            Text(course.subtitle).foregroundColor(Color.white.opacity(0.7))
                        }
                        Spacer()
                        ZStack {
                            //Image(uiImage: course.logo).opacity(show ? 0 : 1)
                            VStack {
                                Image(systemName: "xmark")
                                    .font(.system(size: 16 , weight: .medium))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 36, height: 36)
                            .background(Color.black)
                            .clipShape(Circle())
                            //.opacity(show ? 1 : 0)
                            .onTapGesture {
                                self.show = false
                                self.active = false
                                self.activeIndex = -1
                            }
                        }
                    }
                    Spacer()
                    Image(uiImage: course.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit )
                        .frame(maxWidth:.infinity)
                        .frame(height:140,alignment: .top)
                    
                }
                .padding(show ? 30 : 20)
                .padding(.top, show ? 30 : 0 )  // 在上面基础上再添加
                //.frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 280)
                .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280 )
                    .background(Color(course.color))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: Color(course.color).opacity(0.3), radius: 20, x: 0, y: 20)
                
                VStack(alignment: .leading, spacing: 30.0) {
                    Text("Design Code is fun. This is haoboxuxu learning SwiftUI to be pro. haoboxuxu has app on the App Store. Search Machine Learning hub")
                    Text("About Machine Learning hub")
                        .font(.title).bold()
                    
                    Text("Design Code is fun. This is haoboxuxu learning SwiftUI to be pro. haoboxuxu has app on the App Store. Search Machine Learning hub!Design Code is fun. This is haoboxuxu learning SwiftUI to be pro. haoboxuxu has app on the App Store. Search Machine Learning hub.Design Code is fun. This is haoboxuxu learning SwiftUI to be pro. haoboxuxu has app on the App Store. Search Machine Learning hub")
                    
                    Text("Design Code is fun. This is haoboxuxu learning SwiftUI to be pro. haoboxuxu has app on the App Store. Search Machine Learning hub, Design Code is fun. This is haoboxuxu learning SwiftUI to be pro. haoboxuxu has app on the App Store. Search Machine Learning hub")
                }
                .padding(30)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(course: courseData[0], show: .constant(true),active: .constant(true),activeIndex: .constant(-1))
    }
}
