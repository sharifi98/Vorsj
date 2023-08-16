//
//  ChuggEllerSannhetListView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 16/08/2023.
//

import SwiftUI

struct ChuggEllerSannhetListView: View {
    
    let buttonsData = [
        ("ChuggEllerSannhetVolume1.json", "Volume 1", "%", Color.red),
        ("ChuggEllerSannhetVolume2", "Volume 2", "1", Color.green),
        ("ChuggEllerSannhetVolume3", "Volume 2", "2", Color.blue)
    ]
    
    var body: some View {
        Text("HEllo")
    }
}

struct ChuggEllerSannhetListView_Previews: PreviewProvider {
    static var previews: some View {
        ChuggEllerSannhetListView()
    }
}
