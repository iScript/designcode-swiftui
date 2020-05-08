//
//  PostListView.swift
//  DesignCode
//
//  Created by EDZ on 2020/5/6.
//  Copyright © 2020 ykq. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    
    //@State var posts :[Post] = []
    @ObservedObject var store = DataStore()
    
    var body: some View {
        List(store.posts) { post in
            VStack(alignment: .leading, spacing: 8) {
                Text(post.title).font(.system(.title, design: .serif)).bold()
                Text(post.body).font(.subheadline).foregroundColor(.secondary)
            }
           
                
        }
//        .onAppear(perform: {
//            print(11)
//            Api().getPosts { (posts) in
//                self.posts = posts
//            }
//        })
            
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
