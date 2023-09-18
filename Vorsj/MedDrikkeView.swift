//
//  MedDrikkeView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 18/09/2023.
//

import SwiftUI

struct MedDrikkeView: View {
    @State private var searchText = ""
    
    let items = [
        Item(title: "100 spørsmål",
             subtitle: "Snusboks leken, Volume 1-7 og mer",
             destinationView: AnyView(HundredQuestionsListView()),
             image: Image("trym"))
        ,
        Item(title: "Chugg eller sannhet",
             subtitle: "Volume 1-3",
             destinationView: AnyView(ChuggEllerSannhetListView()),
             image: Image("chugg")),
        
        Item(title: "Jeg har aldri",
             subtitle: "Volume 1-9",
             destinationView: AnyView(JegHarAldriListView()),
             image: Image("mats")),
        
        Item(title: "Karaoke",
             subtitle: "Sett en av sangene på, følg teksten og syng når det gjeld..",
             destinationView: AnyView(KaraokeListView()),
             image: Image("pimp")),
        
        Item(title: "Start Nachet",
             subtitle: "Få i gang nachet!",
             destinationView: AnyView(StartNachet(filename: "startnachet.json", title: "Start Nachet")),
             image: Image("anders"))
        
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
    MedDrikkeView()
}
