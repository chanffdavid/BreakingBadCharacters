//
//  SessionSelect.swift
//  BreakingBadCharacters
//
//  Created by iovoi on 30/09/2021.
//

import SwiftUI

protocol printEnum {
    var description: String { get }
}

enum Session :Int, printEnum{
    case session1 = 1, session2, session3, session4, session5
    
    var description: String {
        switch self {
        case .session1:
            return "Session 1"
        case .session2:
            return "Session 2"
        case .session3:
            return "Session 3"
        case .session4:
            return "Session 4"
        case .session5:
            return "Session 5"
        }
    }
}


struct SessionSelectionList: View {
    @State var items: [Session] = [.session1, .session2, .session3, .session4, .session5]
    @Binding var selections: [Session]

    var body: some View {
        List {
            ForEach(self.items, id: \.self) { item in
                MultipleSelectionRow(title: item.description, isSelected: self.selections.contains(item)) {
                    if self.selections.contains(item) {
                        self.selections.removeAll(where: { $0 == item })
                    }
                    else {
                        self.selections.append(item)
                    }
                }
            }
        }
    }
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

struct SessionSelectionList_Previews: PreviewProvider {
    @State static var selections: [Session] = [.session1, .session2, .session3, .session4, .session5]
    static var previews: some View {
        SessionSelectionList(selections: $selections)
    }
}

class SessionSelection: ObservableObject{
    @Published var selections: [Session] = [.session1, .session2, .session3, .session4, .session5]
}
