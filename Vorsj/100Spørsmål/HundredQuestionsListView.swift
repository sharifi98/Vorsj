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
        ("5050.json", "50/50"),
        ("5050.json", "50/50"),
        ("5050.json", "50/50"),
        ("5050.json", "50/50"),
        ("5050.json", "50/50"),
        ("5050.json", "50/50"),
        ("5050.json", "50/50"),
        ("5050.json", "50/50"),
    ]
    
    // Define the grid layout with 2 columns.
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(buttonsData, id: \.0) { (filename, title) in
                        NavigationLink(destination: HundredView(filename: filename, title: title)) {
                            Text(title)
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .shadow(radius: 5)
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
