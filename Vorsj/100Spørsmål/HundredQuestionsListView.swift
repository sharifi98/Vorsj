//
//  HundredQuestionsListView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 15/08/2023.
//

import SwiftUI

struct HundredQuestionsListView: View {
    
    // Sample data for demonstration. You can replace it with actual data.
    let buttonsData = [
        ("5050.json", "50/50", "%", Color.red),
        ("Volume1.json", "Volume 1", "📖", Color.green),
        ("Volume2.json", "Volume 2", "📚", Color.blue),
        ("Volume3.json", "Volume 3", "📘", Color.orange),
        ("Volume5BI.json", "Volume 5 (BI)", "🎓", Color.purple),
        ("Volume6.json", "Volume 6", "📕", Color.yellow),
        ("Volume5BI.json", "Volume 7", "📗", Color.pink),
        ("Volume5BI.json", "Parleken", "📓", Color.gray)
    ]
    
    // Define the grid layout with 2 columns.
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                VStack {
                    Text("HUNDRE")
                        .foregroundColor(.secondary)
                        .font(.largeTitle)
                    Text("SPØRSMÅL.")
                        .foregroundColor(.pink)
                        .font(.largeTitle)
                }
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(buttonsData, id: \.0) { (filename, title, emoji, color) in
                        NavigationLink(destination: HundredView(filename: filename, title: title)) {
                            VStack {
                                Text(emoji)
                                    .font(.largeTitle)
                                Text(title)
                            }
                            .padding()
                            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 150, maxHeight: .infinity)
                            .background(color)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .shadow(color: Color.black.opacity(0.7), radius: 10, x: 0, y: 10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black.opacity(0.1), lineWidth: 0.5)
                            )
                            .scaleEffect(1.03) // Slight scaling to give the hovering effect
                        }

                    }
                }
                .padding()
            }
        }
    }
}

struct HundredQuestionsListView_Previews: PreviewProvider {
    static var previews: some View {
        HundredQuestionsListView()
    }
}

