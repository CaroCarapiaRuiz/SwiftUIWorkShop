//
//  ContentView.swift
//  SwiftUIWorkshop
//
//  Created by Carolina Carapia Ruiz on 13/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		BookDetailView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.preferredColorScheme(.light)
			.previewDevice("iPhone 12 Pro Max")
    }
}
