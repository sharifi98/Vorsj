//
//  HeaderView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 22/08/2023.
//

import SwiftUI
import Foundation

struct  HeaderView: View {
    @Binding var searchText: String

    var body: some View {
        NavigationView{
            Text("Søker etter \(searchText)?")
                .searchable(text: $searchText)
                .navigationTitle("Vorsj-spill")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    leading: Button {
                        print("Pressed edit button")
                    } label: {
                        Text("Edit")
                    },

                    trailing: Button {
                            print("Pressed compose button")
                        } label: {
                            Image(systemName: "square.and.pencil")
                        }
                )
        }
        .frame(height: 80)
    }
}

struct  HeaderView_Previews: PreviewProvider {
    @State static var dummySearchText: String = ""
    static var previews: some View {
        HeaderView(searchText: $dummySearchText)
            .preferredColorScheme(.dark)
    }
}

