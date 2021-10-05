//
//  ContentView.swift
//  BreakingBadCharacters
//
//  Created by iovoi on 30/09/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var obs = BreakingBadApiObserver()
    @ObservedObject var sessionSelection:SessionSelection
    
    
    @State private var showingPopover = false
   
    
    
    var body: some View {
        
        NavigationView {
            if obs.datas.count > 0
            {
                FilterList(ListItems(obs.sessionSelected(sessionSelection.selections)), filterKeys:\.name) { character in
                NavigationLink(destination: CharacterDetail(character: character)) {
                    CharacterRow(name: character.name, url: character.img)
                }
                   }
                   .navigationBarItems(leading:
                                       //This is your made up title, put in the leading view so it is up top aligned with the plus button
                                       Text("Breaking Bad").font(.largeTitle).bold()
                                       //This is the plus button, on the right side, aka trailing view
                                       , trailing: Button(action: {
                                            showingPopover = true
                                       }, label: {
                                               Image(systemName: "gear.circle")
                                       }))
                
            }

               }
        .popover(isPresented: $showingPopover) {
            SessionSelectionList(selections: $sessionSelection.selections)
        }
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var selections = SessionSelection()
    static var previews: some View {
        ContentView(sessionSelection: selections)
    }
}


