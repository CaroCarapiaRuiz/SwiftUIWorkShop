//
//  BuyCardView.swift
//  SwiftUIWorkshop
//
//  Created by Carolina Carapia Ruiz on 13/05/22.
//

import SwiftUI

struct BuyCardView: View {
	
	@Binding var showModal: Bool
	@State var showingAlert = false
	@State var jiggling = false
	@State var jiggling_counter = 0
	
	var scale_effect = 1.2
	let rotation_angle_base = 15
	@State private var rotation_angle = 0
	
	init(showModal: Binding<Bool>) {
		self._showModal = showModal
		self.rotation_angle = -rotation_angle
	}
	
	var body: some View {
		VStack() {
			Text("Your bag")
				.font(.largeTitle)
			Text("1 item")
				.font(.subheadline)
				.foregroundColor(.gray)
			BookBuyCardCell()
				.frame(width:300)
				.rotationEffect(.degrees(jiggling ? Double(rotation_angle) : 0))
				.scaleEffect(jiggling ? scale_effect : 1)
				.animation(.linear(duration: 0.15), value: jiggling)
			HStack(spacing: 20) {
				Image("free-shipping")
					.resizable()
					.frame(width: 60, height: 60, alignment: .trailing)
					.cornerRadius(10)
				VStack(alignment: .leading) {
					Text("Total")
						.font(.title3)
						.foregroundColor(.gray)
						.opacity(0.6)
					Text("$18.85")
				}
				Spacer(minLength: 20)
			}
			.frame(width: 300)
			.rotationEffect(.degrees(jiggling ? Double(rotation_angle) : 0))
			.scaleEffect(jiggling ? scale_effect : 1)
			.animation(.linear(duration: 0.15), value: jiggling)
			
			Divider()
			
			BuyButtonView(text: "Checkout", buttonColor: Color.yellow)
				.onTapGesture {
					showingAlert.toggle()
				}
		}
		.onAppear() {
			jiggle_shipping_icon(apply_delay: true)
		}
		.alert(isPresented: $showingAlert) {
			Alert(title: Text("Order confirmed"),
				  message: Text("Thank you for your purchase."),
				  dismissButton: .default(Text("Done")) {
				self.showModal.toggle()
				
			})
		}
	}
}

struct BuyCardView_Previews: PreviewProvider {
	static var previews: some View {
		BuyCardView(showModal: .constant(false))
	}
}

extension BuyCardView {
	func jiggle_shipping_icon(apply_delay: Bool) {
		DispatchQueue.main.asyncAfter(deadline: .now() + (apply_delay ? 1 : 0)) {
			withAnimation() {
				jiggling.toggle()
			}
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
				withAnimation() {
					jiggling.toggle()
				}
				jiggling_counter += 1
				
				if(jiggling_counter == 4){
					jiggling_counter = 0
					rotation_angle = -rotation_angle_base
				} else {
					if(rotation_angle < 0){
						rotation_angle = rotation_angle_base
					} else {
						rotation_angle = -rotation_angle_base
					}
					jiggle_shipping_icon(apply_delay: false)
				}
			}
		}
	}
}
