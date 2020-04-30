//
//  UpdateListView.swift
//  DesignCode
//
//  Created by EDZ on 2020/4/30.
//  Copyright © 2020 ykq. All rights reserved.
//

import SwiftUI

struct UpdateListView: View {
    
    @ObservedObject var store = UpdateStore()

    func addUpdate(){
        store.updates.append(Update( image: "Card1", title: "new 111", text: "hello world", date: "nov 11"))
    }
    
    var body: some View {
        NavigationView{
            List(store.updates){ update in
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    NavigationLink(destination: UpdateDetailView(update:update)) {
                        HStack {
                            Image(update.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .background(Color.black)
                            .cornerRadius(20)
                            .padding(.trailing, 4)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(update.title)
                                    .font(.system(size: 20, weight: .bold))
                                Text(update.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text(update.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
            .navigationBarTitle(Text("Updates"))
            .navigationBarItems(leading:
                Button(action: {
                    self.addUpdate()
                }){
                    Text("Add Update")
                }
            )
           
        }
    }
}

struct UpdateListView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateListView()
    }
}

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "Card1", title: "SwiftUI Advance", text: "SwiftUI Advance SwiftUI Advance Text", date: "Jun 1"),
    Update(image: "Card2", title: "Webflow", text: "Webflow Webflow Webflow WebflowText", date: "Jun 2"),
    Update(image: "Card3", title: "ProtoPie", text: "ProtoPie SwiftUISwiftUISwiftUI  ProtoPie ProtoPie ProtoPieText", date: "Jun 3"),
    Update(image: "Card4", title: "SwiftUI", text: "SwiftUI SwiftUI SwiftUI SwiftUI Text", date: "Jun 3"),
    Update(image: "Card5", title: "Framer Playground", text: "Framer Playground Framer Playground Text", date: "Jun 4")
]
