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
    
    // js : getPosts(function(post){ })
    // escaping 逃逸，执行这个匿名函数的时候主函数已经执行完了
    func getPosts(completion : @escaping ([Post]) -> () ){
        print(1100)
        guard let url = URL(string: "http://jsonplaceholder.typicode.com/posts") else{ return }
        URLSession.shared.dataTask(with: url) { (data, _ , _) in
            
            // guard let 和if let一样，解包不为空
            guard let data = data else{ return }
            
            let posts = try! JSONDecoder().decode([Post].self, from: data)
            print(posts.count)

            DispatchQueue.main.async {
                completion(posts)
            }
            
            
        }
        .resume()   //激活请求任务
    }
}

// 记得开启允许http
