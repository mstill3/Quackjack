//
//  GalleryItemView.swift
//  Quackjack
//
//  Created by Matt Stillwell on 11/26/20.
//

import SwiftUI

struct GalleryItemView: View {
    var item: Duck;
    
    var body: some View {
        HStack {
            Text(item.name)
            Image(item.image)
                .resizable()
                .frame(width: 75/2, height: 60/2, alignment: .center)
        }
    }
}

struct GalleryItemView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryItemView(item: Duck(name: "basic duck", cost: 10))
    }
}
