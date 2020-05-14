//
//  LoginView.swift
//  DesignCode
//
//  Created by EDZ on 2020/5/11.
//  Copyright © 2020 ykq. All rights reserved.
//

import SwiftUI
import Firebase

struct LoginView: View {
    

    @State var email = ""
    @State var password = ""
    @State var isFocused = false
    @State var showAlert = false
    @State var alertMessage = "somethine want wrong"
    @State var isLoading = false
    @State var isSuccess = false
    @EnvironmentObject var user : UserStore
    
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func login(){
        self.hideKeyboard()
        self.isFocused = false
        self.isLoading = true
        
        // 模拟
//        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
//            self.isLoading = false
//            // self.showAlert = true
//            self.isSuccess = true
//
//            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
//                self.isSuccess = false
//            }
//        }
        
        // firebase 登陆 ，需要模拟器测试
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            self.isLoading = false
            if error != nil {
                self.alertMessage = error?.localizedDescription ?? ""
                self.showAlert = true
            }else{
                self.isSuccess = true
                self.user.isLogin = true
                
                DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                    self.isSuccess = false
                    self.email = ""
                    self.password = ""
                    self.user.showLogin = false
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ZStack(alignment: .top) {
               
                
                Color("background2")
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .edgesIgnoringSafeArea(.bottom)
                
                CoverView()
                
                VStack {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                            .frame(width: 44, height: 44)   //图片大小不变，resizable才会变
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                            .padding(.leading)
                        
                        
                        TextField("Your Email" , text: $email)
                            .keyboardType(.emailAddress)
                            .font(.subheadline)
        //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading)
                            .frame(height:44)
                            .onTapGesture {
                                self.isFocused = true
                            }
                        
                    }
                    
                    Divider().padding(.leading,80)
                    
                    HStack {
                        Image(systemName: "lock.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                            .frame(width: 44, height: 44)   //图片大小不变，resizable才会变
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                            .padding(.leading)
                        
                        
                        SecureField("Password" , text: $password)
                            .keyboardType(.default)
                            .font(.subheadline)
        //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading)
                            .frame(height:44)
                            .onTapGesture {
                                self.isFocused = true
                            }
                    }
                    
                }
                .frame(height:136)
                .frame(maxWidth:.infinity)
                .background(BlurView(style: .systemMaterial))
                .clipShape(RoundedRectangle(cornerRadius: 30,style:.continuous ))
                .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
                .padding(.horizontal)   // 先设置背景再padding，背景也压缩
                .offset(y:460)
                
                //登陆按钮
                HStack {
                    
                    Text("Forget password ?")
                        .font(.subheadline)
                    
                    Button(action: {
                        //
                        
                        self.login()
                        
                        
                        
                    }) {
                        Text("Log in").foregroundColor(.black)
                        
                    }
                    .padding(12)
                    .padding(.horizontal,30)
                    .background(Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)).opacity(0.3), radius: 20, x: 20, y: 0)
                    .alert(isPresented: $showAlert) { () -> Alert in
                        Alert(title: Text("Message"), message: Text(self.alertMessage), dismissButton: .default(Text("Ok")))
                    }
                }
                .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .bottom)
                .padding()
                
                
            }
            .offset(y : isFocused ?  -300 : 0)
            //.animation(.easeInOut)
            .onTapGesture {
                self.isFocused = false
                self.hideKeyboard()
            }
        
            if isLoading {
                LoadingView()
            }
            
            if isSuccess {
                SuccessView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct CoverView: View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    @State var isDragging = false
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                Text("Learn design & code \nfrom scratch ")
                    .font(.system(size: geometry.size.width/10, weight: .bold)) //\(geometry.size.width/10) 37.5
                    .foregroundColor(.white)
            }
            .frame(maxWidth:375,maxHeight: 100)
            .padding(.horizontal,16)
            .offset(x: viewState.width/15,y:viewState.height/15)
            
            
            Text("80 hours of coursed for Swiftui , React and design tools.")
                .font(.subheadline)
                .frame(width:250)
                .offset(x: viewState.width/20,y:viewState.height/20)
            
            
            Spacer()
            
        }
        .multilineTextAlignment(.center)    // 文本居中
        .padding(.top,100)
        .frame(height:477)
        .frame(maxWidth:.infinity)
        .background(
            ZStack {
                Image(uiImage: #imageLiteral(resourceName: "Blob"))
                    .offset(x:-150,y:-200)
                    .rotationEffect(Angle(degrees: show ? 360+90 : 90))
                    .blendMode(.plusDarker)
                    //.animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
                    .animation(nil)
                    .onAppear {
                        self.show = true
                }
                
                Image(uiImage: #imageLiteral(resourceName: "Blob"))
                    .offset(x:-200,y:-250)
                    .rotationEffect(Angle(degrees: show ? 360 : 0),anchor: .leading)
                    .blendMode(.overlay)
                    //.animation(Animation.linear(duration: 100).repeatForever(autoreverses: false))
                    .animation(nil)
            }
        )
        .background(Image(uiImage: #imageLiteral(resourceName: "Card6")).offset(x: viewState.width/25,y:viewState.height/25),alignment: .bottom)
        .background(Color(#colorLiteral(red: 0.4117647059, green: 0.4705882353, blue: 0.9725490196, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .scaleEffect(isDragging ? 0.9 : 1)
        .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
        .rotation3DEffect(Angle(degrees: 5), axis: (x: viewState.width  , y: viewState.height, z: 0))
        .gesture(
            DragGesture().onChanged({ (value) in
                //
                self.isDragging = true
                self.viewState = value.translation
            }).onEnded({ (value) in
                self.isDragging = false
                self.viewState = .zero
            })
        )
    }
}
