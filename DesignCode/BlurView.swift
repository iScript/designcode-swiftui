//
//  BlurView.swift
//  DesignCode
//
//  Created by EDZ on 2020/5/8.
//  Copyright © 2020 ykq. All rights reserved.
//

import SwiftUI

struct BlurView : UIViewRepresentable{
    
    var style : UIBlurEffect.Style

    typealias UIViewType = UIView
    
    func makeUIView(context: Context) -> UIView {
        //
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        
        NSLayoutConstraint.activate([
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        //
    }
    
    
}
