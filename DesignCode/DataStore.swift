//
//  DataStore.swift
//  DesignCode
//
//  Created by EDZ on 2020/5/7.
//  Copyright © 2020 ykq. All rights reserved.
//

import SwiftUI

class DataStore: ObservableObject {
    
    @Published var posts:[Post] = []
   
    
    init(){
        getPosts()
    }
    
    func getPosts(){
        Api().getPosts { (posts) in
            self.posts = posts
        }
    }
}
