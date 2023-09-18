//
//  HundredQuestionsListView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 15/08/2023.
//

import SwiftUI

struct HundredQuestionsListView: View {
    let buttonsData = [
        ("5050.json", "50/50", "%"),
        ("Volume1.json", "Volume 1", "⭐️"),
        ("Volume2.json", "Volume 2", "💫"),
        ("Volume3.json", "Volume 3", "🎊"),
        ("Volume4.json", "Volume 4 (DRØY)", "🍺"),
        ("Volume41.json", "Volume 4.1 (DRØY)", "🍻"),
        ("Volume5BI.json", "Volume 5 (BI)", "🎓"),
        ("Volume6.json", "Volume 69 (Sambucas)", "🥃"),
        ("Volume7.json", "Volume 7", "👽"),
        ("Kompliment.json", "Kompliment", "💕"),
    ]

    

    @State private var listItemOffset: CGFloat = 50
    @State private var listItemOpacity: Double = 0

        var body: some View {
            NavigationView {
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(0..<buttonsData.count, id: \.self) { index in
                            let (filename, title, emoji) = buttonsData[index]
                            
                            NavigationLink(destination: HundredView(filename: filename, title: title)) {
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
                                .background(Color.blue.opacity(0.1))
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
                    .padding()
                }
                .navigationBarTitle("100 Spørsmål", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Image("trym")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                            Text("100 Spørsmål")
                            Image(systemName: "chevron.right")
                                .font(.system(size: 10))
                        }
                    }
                }
                ComposeArea()
            }
        }
}

struct HundredQuestionsListView_Previews: PreviewProvider {
    static var previews: some View {
        HundredQuestionsListView()
    }
}

