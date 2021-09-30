//
//  ContentView.swift
//  BreakingBadCharacters
//
//  Created by iovoi on 30/09/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterDetail: View {
    var character: Character

    var body: some View {
      
            VStack(alignment: .leading) {
                AnimatedImage(url: URL(string: character.img)!)
                    .resizable()
                    .shadow(radius: 20)
                Text("\(character.name) (\(character.nickname))")
                    .font(.title)

                VStack(alignment: .leading) {
                    ForEach(character.occupation.indices){
                        Text(character.occupation[$0])
                    }
                }
                
                Text("Status: \(character.status)").font(.body)
               
                HStack() {
                    Text("season")
                    ForEach(character.appearance.indices){
                        Text("\(character.appearance[$0]) ")
                    }
                }

            }
            .padding()
        
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetail(
            character: Character(char_id: 1,
                                 name: "Walter White",
                                 birthday: "09-07-1958",
                                 occupation: [
                                    "High School Chemistry Teacher",
                                    "Meth King Pin"],
                                 img: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg",
                                 status:  "Presumed dead",
                                 nickname: "Heisenberg",
                                 appearance: [1,2,3,4,5],
                                 portrayed: "Bryan Cranston",
                                 category: "Breaking Bad"))
    }
}
