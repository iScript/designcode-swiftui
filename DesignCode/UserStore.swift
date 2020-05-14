//
//  UserStore.swift
//  DesignCode
//
//  Created by EDZ on 2020/5/14.
//  Copyright © 2020 ykq. All rights reserved.
//

import SwiftUI
import Combine

class UserStore: ObservableObject {
    @Published var isLogin:Bool = UserDefaults.standard.bool(forKey: "isLogin"){
        didSet{
            //
            print("Property 的值从 \(oldValue) 更改为 \(self.isLogin)")
            UserDefaults.standard.set(self.isLogin, forKey: "isLogin")
        }
    }
    @Published var showLogin = false
    
}

