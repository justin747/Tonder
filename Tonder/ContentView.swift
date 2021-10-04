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
            
            ZStack {
                ForEach(Card.data) { card in
                    CardView(card: card)
                        .padding(8)
                }
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

struct CardView: View {
    
    let card: Card
    let cardGradient = Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.5)])
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image(card.imageName)
                .resizable()
            LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom)
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    HStack{
                        Text(card.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text(String(card.age))
                            .font(.title)
                    }
                    
                    Text(card.bio)
                }
                .padding()
                .foregroundColor(.white)
            }
        }
        .cornerRadius(8)
    }
}
