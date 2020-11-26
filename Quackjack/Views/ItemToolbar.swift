import SwiftUI

struct ItemToolbar: ToolbarContent {
    let add: () -> Void
    let sort: () -> Void
    let filter: () -> Void

    var body: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            Button("Add", action: add)
        }

        ToolbarItemGroup(placement: .bottomBar) {
            Button("Sort", action: sort)
            Button("Filter", action: filter)
        }
    }
}
