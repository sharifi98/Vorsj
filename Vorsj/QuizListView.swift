//
//  QuizListView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 18/09/2023.
//

import SwiftUI

struct QuizListView: View {
    
    
    let buttonsData = [("Level1.json", "Nivå 1: Vil du bli tusinær?", "💸"),
                       ("Level2.json", "Nivå 2: Er du smartere enn en paradise hotel deltaker?", "🏩"),
                       ("Level3.json", "Nivå 3: Er du Smartere enn en 5. klassing?", "👶🏼"),
                       ("Level4.json", "Nivå 4: Superkviss på NRK super", "📺"),
                       ("Level4.json", "Nivå 5: Er du smartere enn amerikanerene?", "📺"),
                       ("Level4.json", "Nivå 6: Huskestue på TV2", ""),
    ]
    
    @State private var listItemOffset: CGFloat = 50
    @State private var listItemOpacity: Double = 0
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                Text("Quiz!")
                    .font(.title)
                
                LazyVStack {
                    ForEach(0..<buttonsData.count, id: \.self) { index in
                        let (filename, title, emoji) = buttonsData[index]
                        
                        NavigationLink(destination: QuizView(filename: filename, title: title)) {
                            HStack {
                                Text(emoji)
                                    .font(.largeTitle)
                                    .padding(.leading, 20)
                                Text(title)
                                    .fontWeight(.semibold)
                                    .padding(.trailing, 20)
                                Spacer()
                            }
                            .padding(.vertical, 10)
                            .background(Color.pink.opacity(0.5))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .opacity(listItemOpacity)
                        .offset(y: listItemOffset)
                        .onAppear {
                            withAnimation(Animation.spring().delay(0.05 * Double(index))) {
                                listItemOpacity = 1
                                listItemOffset = 0
                            }
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    QuizListView()
}
