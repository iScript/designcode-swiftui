//
//  Data.swift
//  DesignCode
//
//  Created by EDZ on 2020/5/6.
//  Copyright © 2020 ykq. All rights reserved.
//

import SwiftUI

struct Post : Codable,Identifiable{
    let id = UUID()
    var title : String
    var body : String
}

class Api{
    func getPosts(){
        print(1100)
        guard let url = URL(string: "http://jsonplaceholder.typicode.com/posts") else{ return }
        URLSession.shared.dataTask(with: url) { (data, _ , _) in
            //
            print(22)
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            print(posts)
            print(33)
        }
        .resume()   //激活请求任务
    }
}

// 记得开启允许http
