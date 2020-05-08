//
//  TabbarView.swift
//  DesignCode
//
//  Created by EDZ on 2020/5/4.
//  Copyright © 2020 ykq. All rights reserved.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView{
            HomeView().tabItem {
                Image(systemName: "play.circle.fill")
                Text("Home")
            }
            CourseListView().tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("Courses")
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView().previewDevice("iPhone 8")
    }
}
