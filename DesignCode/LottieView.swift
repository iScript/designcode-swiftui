//
//  LottieView.swift
//  DesignCode
//
//  Created by EDZ on 2020/5/12.
//  Copyright © 2020 ykq. All rights reserved.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    var filename : String
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        //
        let view = UIView(frame: .zero)
        
        let animationView = AnimationView()
        let animation = Animation.named(filename)  //lottie loading.json
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo : view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo : view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        //
    }
    
    typealias UIViewType = UIView
    
    
}

//struct LottieView_Previews: PreviewProvider {
//    static var previews: some View {
//        LottieView()
//    }
//}
