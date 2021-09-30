//
//  BreakingBadCharactersApp.swift
//  BreakingBadCharacters
//
//  Created by iovoi on 30/09/2021.
//

import SwiftUI

@main
struct BreakingBadCharactersApp: App {
    var body: some Scene {
        let selections = SessionSelection()
        WindowGroup {
            ContentView(sessionSelection: selections)
        }
    }
}
