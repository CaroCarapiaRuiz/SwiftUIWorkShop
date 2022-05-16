//
//  BookBuyCard.swift
//  SwiftUIWorkshop
//
//  Created by Carolina Carapia Ruiz on 13/05/22.
//

import SwiftUI

struct BookBuyCardCell: View {
    var body: some View {
		HStack(spacing:10) {
			Image("BookImage")
				.resizable()
				.frame(width: 60, height: 100)
				.cornerRadius(10)
			VStack(alignment: .leading) {
				Text("The Fellowship of the Ring")
				Text("$18.85")
					.font(.title2)
			}
			Text("x1")
				.padding()
				.overlay(
					RoundedRectangle(cornerRadius: 30)
						.stroke(Color.gray, lineWidth: 1)
				)
		}
    }
}

struct BookBuyCardCell_Previews: PreviewProvider {
    static var previews: some View {
        BookBuyCardCell()
    }
}
