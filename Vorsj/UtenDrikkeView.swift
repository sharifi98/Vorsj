//
//  UtenDrikkeView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 18/09/2023.
//

import SwiftUI

struct UtenDrikkeView: View {
    
    @State private var searchText = ""
    
    let items = [Item(title: "Venneleken",
                      subtitle: "Venneleken 123",
                      destinationView: AnyView(HundredQuestionsListView()),
                      image: Image("trym")),
    ]
    
    var filteredItems: [Item] {
        items.filter { item in
            searchText.isEmpty || item.title.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        VStack {
            HeaderView(searchText: $searchText)
            List {
                Section {
                    ForEach(filteredItems) { item in
                        NavigationLink(destination: item.destinationView) {
                            HStack {
                                item.image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .font(.headline)
                                    Text(item.subtitle)
                                        .foregroundColor(.secondary)
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    UtenDrikkeView()
}
