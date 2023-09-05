//
//  ChuggEllerSannhetListView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 16/08/2023.
//

import SwiftUI


struct ChuggEllerSannhetListView: View {
    let buttonsData = [
        ("ChuggEllerSannhetVolume1.json", "Volume 1", "1", Color.red),
        ("ChuggEllerSannhetVolume2.json", "Volume 2", "2", Color.green),
        ("ChuggEllerSannhetVolume3.json", "Volume 3", "3", Color.blue)
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(buttonsData, id: \.0) { data in
                        NavigationLink(destination: ChuggEllerSannhetVolume(filename: data.0, title: "Vol \(data.2)")) {
                            ListItem(data: data)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image("anders")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                        Text("Chugg eller sannhet")
                        Image(systemName: "chevron.right")
                            .font(.system(size: 10))
                    }
                }
            }
            
            ComposeArea()
            
        }
    }
    
    func ListItem(data: (String, String, String, Color)) -> some View {
        HStack {
            Image(systemName: "folder.fill")
                .foregroundStyle(.yellow)
            
            VStack(alignment: .leading) {
                Text("Chugg eller Sannhet \(data.1)")
                
                HStack {
                    Text(data.2 == "1" ? "30/06/2023" : "19/04/2023")
                        .font(.caption)
                    Text("1. Hvem er mest...")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

struct ChuggEllerSannhetListView_Previews: PreviewProvider {
    static var previews: some View {
        ChuggEllerSannhetListView()
    }
}
