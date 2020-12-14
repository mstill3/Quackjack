//
//  DropView.swift
//  Quackjack
//
//  Created by Matt Stillwell on 12/6/20.
//

import SwiftUI

struct DropView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
            /*@START_MENU_TOKEN@*/Text("1").tag(1)/*@END_MENU_TOKEN@*/
            /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
        }
    }
}

struct DropView_Previews: PreviewProvider {
    static var previews: some View {
        DropView()
    }
}
