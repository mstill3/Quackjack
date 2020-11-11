//
//  FullScreenModalView.swift
//  Blackjack2
//
//  Created by Matt Stillwell on 11/9/20.
//

import SwiftUI

struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("This is a modal view")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct FullScreenModalView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenModalView()
    }
}
