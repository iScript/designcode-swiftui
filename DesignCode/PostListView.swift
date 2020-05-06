//
//  PostListView.swift
//  DesignCode
//
//  Created by EDZ on 2020/5/6.
//  Copyright © 2020 ykq. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear(perform: {
                print(11)
                 Api().getPosts()
            })
            
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
