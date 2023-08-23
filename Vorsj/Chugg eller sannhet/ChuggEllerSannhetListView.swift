//
//  ChuggEllerSannhetListView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 16/08/2023.
//

import SwiftUI

struct ChuggEllerSannhetListView: View {
    
    let buttonsData = [
        ("ChuggEllerSannhetVolume1.json", "Volume 1", Color.red),
        ("ChuggEllerSannhetVolume2.json", "Volume 2", "1", Color.green),
        ("ChuggEllerSannhetVolume3.json", "Volume 2", "2", Color.blue)
    ]
    
    var body: some View {
        

        
        ChuggEllerSannhetVolume1(filename: "ChuggEllerSannhetVolume1.json", title: "Volume 1")
    }
}

struct ChuggEllerSannhetListView_Previews: PreviewProvider {
    static var previews: some View {
        ChuggEllerSannhetListView()
    }
}
