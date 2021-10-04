//
//  ContentView.swift
//  Tonder
//
//  Created by Justin747 on 10/1/21.
//

import SwiftUI

struct ContentView: View {
    
   
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
            
            CardView()
            
            
            
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

struct CardView: View {
    
    let cardGradient = Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.5)])
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image("p0")
                .resizable()
            LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom)
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    HStack{
                        Text("Username")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("23")
                            .font(.title)
                    }
                    
                    Text("Hello World")
                }
                .padding()
                .foregroundColor(.white)
            }
        }
    }
}
