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
        ("Volume1.json", "Utgave 1", "⭐️"),
        ("Volume2.json", "Utgave 2", "💫"),
        ("Volume3.json", "Utgave 3", "🎊"),
        ("Volume4.json", "Utgave 4 (DRØY)", "🍺"),
        ("Volume41.json", "Utgave 8 (DRØY) ", "👙"),
        ("Volume5BI.json", "Utgave 5 (BI)", "🎓"),
        ("Volume6.json", "Utgave 69 (Sambucas)", "🥃"),
        ("Volume7.json", "Utgave 7", "👽"),
        ("Kompliment.json", "Kompliment", "💕"),
    ]

    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]

    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(0..<buttonsData.count, id: \.self) { index in
                        let (filename, title, emoji) = buttonsData[index]
                        NavigationLink(destination: HundredView(filename: filename, title: title)) {
                            HStack {
                                Text(emoji)
                                Text(title)
                            }
                        }
                    }
                }
            }
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
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            ComposeArea()
        }
    }
}

struct HundredQuestionsListView_Previews: PreviewProvider {
    static var previews: some View {
        HundredQuestionsListView()
    }
}

