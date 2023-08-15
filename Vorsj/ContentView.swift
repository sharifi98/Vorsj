//
//  ContentView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 15/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: HundredView(filename: "5050.json", title: "50/50")) {
                Text("50/50")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
