//
//  UpdateDetailView.swift
//  DesignCode
//
//  Created by EDZ on 2020/4/30.
//  Copyright © 2020 ykq. All rights reserved.
//

import SwiftUI

struct UpdateDetailView: View {
    
    var update : Update = updateData[0]
    
    var body: some View {
        List {
            VStack {
                Image(update.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                Text(update.text)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationBarTitle(update.title)
        }
        .listStyle(PlainListStyle())
        
        
        
    }
}

struct UpdateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetailView()
    }
}
