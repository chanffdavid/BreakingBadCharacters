//
//  CharacterRow.swift
//  BreakingBadCharacters
//
//  Created by iovoi on 30/09/2021.
//

import SwiftUI
import SDWebImageSwiftUI

// MARK: View CharacterRow
struct CharacterRow: View {
    
    var name: String
    var url: String
    

    var body: some View {
        
        HStack {
            AnimatedImage(url: URL(string: url)!)
                      .resizable()
                      .frame(width: 60, height: 60)
                      .clipShape(Circle())
                      .shadow(radius: 20)
                      
                      
            VStack(alignment: .leading) {
                Text(name).fontWeight(.heavy)
            }
        }
       
    }
}


struct CharacterRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRow(name: "Walter White", url: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg")
    }
}
