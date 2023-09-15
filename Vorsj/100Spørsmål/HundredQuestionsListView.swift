//
//  HundredQuestionsListView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 15/08/2023.
//

import SwiftUI

struct HundredQuestionsListView: View {
    // MARK: - Data
    let buttonsData = [
        ("5050.json", "50/50", "%", Color.red),
        ("Volume1.json", "Utgave 1", "⭐️", Color.green),
        ("Volume2.json", "Utgave 2", "💫", Color.blue),
        ("Volume3.json", "Utgave 3", "🎊", Color.orange),
        ("Volume4.json", "Utgave 4 (DRØY)", "🍺", Color.yellow),
        ("Volume41.json", "Utgave 8 (DRØY) ", "👙", Color.yellow),
        ("Volume5BI.json", "Utgave 5 (BI)", "🎓", Color.purple),
        ("Volume6.json", "Utgave 69 (Sambucas)", "6️⃣", Color.yellow),
        ("Volume7.json", "Utgave 7", "👽", Color.pink),
        ("Kompliment.json", "Kompliment", "💕", Color.pink)
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            mainListView
                .toolbar(toolbarContent)
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
            ComposeArea()
        }
    }
    
    // MARK: - Main List View
    private var mainListView: some View {
        List {
            Section {
                ForEach(0..<buttonsData.count, id: \.self) { index in
                    NavigationLink(destination: HundredView(filename: buttonsData[index].0, title: buttonsData[index].1)) {
                        listItem(for: index)
                    }
                }
                .listRowBackground(Color(#colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1607843137, alpha: 1)))
            }
        }
    }
    
    // MARK: - List Item
    private func listItem(for index: Int) -> some View {
        HStack {
            Text(buttonsData[index].2)
            Text(buttonsData[index].1)
        }
    }
    
    // MARK: - Toolbar Content
    private var toolbarContent: some View {
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
}

// MARK: - Preview
struct HundredQuestionsListView_Previews: PreviewProvider {
    static var previews: some View {
        HundredQuestionsListView()
    }
}
