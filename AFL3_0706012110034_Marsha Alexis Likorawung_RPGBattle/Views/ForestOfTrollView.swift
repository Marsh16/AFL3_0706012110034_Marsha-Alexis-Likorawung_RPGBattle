//
//  ForestOfTrollView.swift
//  AFL3_0706012110034_Marsha Alexis Likorawung_RPGBattle
//
//  Created by Marsha Likorawung  on 26/04/23.
//

import SwiftUI

struct ForestOfTrollView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Nice to meet you \(Const.player.name)!")
                Text("Your HP \(Const.player.hp)!")
                Text("Your HP \(Const.player.potion)!")
                Text("Your HP \(Const.player.mana)!")
                Text("Your HP \(Const.player.elixer)!")
                Spacer()
            }
        }
    }
}

struct ForestOfTrollView_Previews: PreviewProvider {
    static var previews: some View {
        ForestOfTrollView()
    }
}
