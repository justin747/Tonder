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
                ForEach(Card.data.reversed()) { card in
                    CardView(card: card)
                        .padding(8)
                }
            }.zIndex(1)
            
            
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
    
    @State var card: Card
    let cardGradient = Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.5)])
    
    var body: some View {
        ZStack(alignment: .topLeading) {
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
            }
            .padding()
            .foregroundColor(.white)
            
            HStack {
                Image("yes")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .opacity(Double(card.x/20 - 1))
                
                Spacer()
                
                Image("nope")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .opacity(Double(card.x/20 * -1 - 1))
            }
        }
        .cornerRadius(8)
        .offset(x: card.x, y: card.y)
        .rotationEffect(.init(degrees: card.degree))
        
        .gesture(
            
            DragGesture()
            
                .onChanged { value in
                    withAnimation(.default) {
                        card.x = value.translation.width
                        card.y = value.translation.height
                        card.degree = 7 * (value.translation.width > 0 ? 1 : -1 )
                    }
                }
            
                .onEnded { value in
                    withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
                        switch value.translation.width {
                        case 0...200:
                            card.x = 0; card.degree = 0; card.y = 0
                        case let x where x > 200:
                            card.x = 500; card.degree = 12
                        case (-200)...(-1):
                            card.x = 0; card.degree = 0; card.y = 0;
                        case let x where x < 200:
                            card.x = -500; card.degree = -12
                        default : card.x = 0; card.y = 0
                        }
                    }
                }
        )
    }
}
