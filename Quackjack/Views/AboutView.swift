//
//  AboutView.swift
//  Quackjack
//
//  Created by Matt Stillwell on 11/11/20.
//

import SwiftUI

enum PAGE_STATE {
    case ON_PAGE
    case BACK
}

    
struct AboutView: View {
    
    @State var state: PAGE_STATE = PAGE_STATE.ON_PAGE

    func onBackButtonClick() -> Void {
        state = PAGE_STATE.BACK
    }
    
    var body: some View {
        Group {
            if (state == PAGE_STATE.BACK) {
               StartMenuView()
            } else {
                NavigationView {
                    pageBody
                }
                .padding(.top, 0.0)
            }
        }

    }
    
    var pageBody: some View {
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .toolbar {
                     ToolbarItem(placement: .navigationBarLeading) {
                         HStack {
                             Button(action: onBackButtonClick, label: {
                                 Text("Back")
                                     .foregroundColor(.white)
                             })
                         }}
                     
                    
                     }
            
            VStack {
            
                Image("duck")
                    .resizable()
                    .frame(width: 75, height: 60, alignment: .center)
                
                Text("Quackjack")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
                
                Text("This is an app written by Natt Stilwell")
            }
            
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
