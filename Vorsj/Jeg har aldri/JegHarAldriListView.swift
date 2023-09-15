//
//  JegHarAldriListView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 31/08/2023.
//

import SwiftUI

struct JegHarAldriListView: View {
    
    let buttonsData = [
        ("JegHarAldriVolume1.json", "Volume 1"),
        ("JegHarAldriVolume2.json", "Volume 2"),
        ("JegHarAldriVolume3.json", "Volume 3"),
        ("JegHarAldriVolume4.json", "Volume 4"),
        ("JegHarAldriVolume5.json", "Volume 5"),
        ("JegHarAldriS3XEdition.json", "S😘X Edition"),
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(buttonsData, id: \.0) { data in
                        NavigationLink(destination: JegHarAldri(filename: data.0, title: "\(data.1)")) {
                            ListItem(data: data)
                        }
                    }
                }
            }
        }
        ComposeArea()
    }
    
    func ListItem(data: (String, String)) -> some View {
        HStack {
            Image(systemName: "folder")
                .foregroundStyle(.yellow)
            
            VStack(alignment: .leading) {
                Text("Jeg Har Aldri \(data.1)")
                
            }
        }
    }
}

struct JegHarAldriListView_Previews: PreviewProvider {
    static var previews: some View {
        JegHarAldriListView()
    }
}


