//
//  DropdownButton.swift
//  Quackjack
//
//  Created by Matt Stillwell on 12/5/20.
//

import SwiftUI

let dropdownCornerRadius: CGFloat = 10.0

struct DropdownOption: Hashable {
    public static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        return lhs.key == rhs.key
    }

    var key: String
    var val: String
}

struct DropdownOptionElement: View {
    var val: String
    var key: String
    var onSelect: ((_ key: String) -> Void)?

    var body: some View {
        Button(action: {
            if let onSelect = self.onSelect {
                print("SSSSSS \(self.key)")
                onSelect(self.key)
            }
        }) {
            Text(self.val)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
    }
}

struct Dropdown: View {
    var options: [DropdownOption]
    var onSelect: ((_ key: String) -> Void)?

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(self.options, id: \.self) { option in
                DropdownOptionElement(val: option.val, key: option.key, onSelect: self.onSelect)
            }
        }

        .background(Color.white)
        .cornerRadius(dropdownCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: dropdownCornerRadius)
                .stroke(Color.blue, lineWidth: 1)
        )
    }
}

struct DropdownButton: View {
    @State var shouldShowDropdown = false
    @Binding var displayText: String
    var options: [DropdownOption]
    var onSelect: ((_ key: String) -> Void)?

    let buttonHeight: CGFloat = 30
    var body: some View {
        Button(action: {
            self.shouldShowDropdown.toggle()
        }) {
            HStack {
                Text(displayText)
                Spacer()
                    .frame(width: 20)
                Image(systemName: self.shouldShowDropdown ? "chevron.up" : "chevron.down")
            }
        }
        .padding(.horizontal)
        .cornerRadius(dropdownCornerRadius)
        .frame(height: self.buttonHeight)
        .overlay(
            RoundedRectangle(cornerRadius: dropdownCornerRadius)
                .stroke(Color.red, lineWidth: 1)
        )
        .overlay(
            VStack {
                if self.shouldShowDropdown {
                    Spacer(minLength: buttonHeight + 10)
                    Dropdown(options: self.options, onSelect: onSelect)
                }
            }, alignment: .topLeading
        )
        .background(
            RoundedRectangle(cornerRadius: dropdownCornerRadius).fill(Color.white)
        )
    }
}

struct DropdownButton_Previews: PreviewProvider {
    static let options = [
        DropdownOption(key: "week", val: "This week"),
        DropdownOption(key: "month", val: "This month"),
        DropdownOption(key: "year", val: "This year")
    ]

    static let onSelect = { (key: String) in
        print("GOOOOSE: \(key)")
    }

    static var previews: some View {
        Group {
            VStack(alignment: .leading) {
                DropdownButton(displayText: .constant("This month"), options: options, onSelect: onSelect)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .foregroundColor(Color.red)
        }
    }
}
