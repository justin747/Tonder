//
//  ContentView.swift
//  Tonder
//
//  Created by Justin747 on 10/1/21.
//

import SwiftUI

struct ContentView: View {
    
    let cardGradient
    var body: some View {
        VStack {
            
            //MARK: - Top HStack
            
            HStack {
                
                Button(action: {}) {
                    Image("profile")
                }
                
                Spacer()
                
                
                Button(action: {}) {
                    Image("tinder-icon")
                        .resizable().aspectRatio(contentMode: .fit)
                        .frame(height: 45)
                }
                
                
                Spacer()
                
                Button(action: {}) {
                    Image("chats")
                }
            }.padding(.horizontal)
            
            
            //MARK: - Card View
            
            ZStack {
                Image("p0")
                    .resizable()
                LinearGradient(gradient: <#T##Gradient#>, startPoint: .top, endPoint: .bottom)
            }
            
            
            
            //MARK: - Bottom HStack
            
            HStack(spacing: 0 ) {
                
                Button(action: {}) {
                    Image("refresh")
                }
                Button(action: {}) {
                    Image("dismiss")
                }
                Button(action: {}) {
                    Image("super_like")
                }
                Button(action: {}) {
                    Image("like")
                }
                Button(action: {}) {
                    Image("boost")
                }
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
