//
//  ContentView.swift
//  BreakingBadCharacters
//
//  Created by iovoi on 30/09/2021.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var obs = Observer()
    
    var body: some View {
        NavigationView {
            FilterList(obs.datas, filterKeys:\.name) { i in
                NavigationLink(destination: CharacterDetail(character: i)) {
                    CharacterRow(name: i.name, url: i.img)
                }
                
                   }
                   .navigationBarTitle("Breaking Bad")
               }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: Observer
class Observer: ObservableObject {
    @Published var datas = [Character]()
    
    init() {
        
        if !Connectivity.isConnectedToInternet() {
               print("internet is not available.")
               // do some tasks..
            return;
        }
        
        // MARK: Network Call
        //-----------------GET Call----------------------
        //pass model to the network call - get call
        BreakingBadApi(data: [:], service: .characters, method: .get, isJSONRequest: false).executeQuery(){

                  (result: Result<[Character],Error>) in
                  switch result{
                  case .success(let response):
                      print(response)
                      self.datas = response
                  case .failure(let error):
                      print(error)
                    
            }
        }
    }
}
