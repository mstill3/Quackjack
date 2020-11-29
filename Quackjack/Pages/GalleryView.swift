//
//  GalleryView.swift
//  Quackjack
//
//  Created by Matt Stillwell on 11/26/20.
//

import SwiftUI
    
struct GalleryView: View {
    
    @State var galleryItems: [Duck] = []
    
    func onMount() {
        galleryItems = Store.getMyDucks()
    }
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
            
            VStack {
                List {
                    ForEach(galleryItems) { item in
                        GalleryItemView(item: item)
                    }
                }
            }
            .navigationTitle("My Gallery")
            .offset(x: 0, y: -50)
    
        }.onAppear {
            onMount()
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
