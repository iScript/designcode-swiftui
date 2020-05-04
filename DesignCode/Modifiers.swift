//
//  Modifiers.swift
//  DesignCode
//
//  Created by EDZ on 2020/5/4.
//  Copyright © 2020 ykq. All rights reserved.
//

import SwiftUI

// 自定义modifier
struct ShadowModifier : ViewModifier{
    
    
    func body(content: Content) -> some View {
        content
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

struct FontModifier : ViewModifier{
    
    var style : Font.TextStyle = .body
    
    func body(content: Content) -> some View {
        content
            .font(.system(style,design:.rounded))
    }
}

// 自定义字体，需要在info.plist里加Fonts provided by application
struct CustomFontModifier : ViewModifier{
    
    var style : Font.TextStyle = .body
    
    func body(content: Content) -> some View {
        content
            .font(.custom("ChelseaMarket-Regular", size: 28))
    }
}

