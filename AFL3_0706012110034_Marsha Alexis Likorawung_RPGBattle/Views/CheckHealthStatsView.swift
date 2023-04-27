//
//  CheckHealthStatsView.swift
//  AFL3_0706012110034_Marsha Alexis Likorawung_RPGBattle
//
//  Created by Marsha Likorawung  on 26/04/23.
//

import SwiftUI

//untuk menampilkan cek health dan stats
struct CheckHealthStatsView: View {
    var body: some View {
        ScrollView{
            NavigationStack{
                VStack {
                    ZStack(alignment: .center){
                        Image("bg").resizable()
                        VStack{
                            Text("Your Name \(Const.player.name)!\nYour HP \(Const.player.hp)!\nYour Potion \(Const.player.potion)!\nYour Mana \(Const.player.mana)!\nYour Elixer \(Const.player.elixer)!\n\n").padding().font(.system(size: 18,weight: .heavy, design: .rounded)).foregroundColor(.white).shadow(radius: 20) .multilineTextAlignment(.center)
                            Text("Magic:\n- Physical Attack. Use 15pt of MP. Deal 5pt of damage.\n- Meteor. Use 15pt of MP. Deal 50pt of damage.\n- Shield. Use 15pt of MP. Block enemy's attack in 1 turn.\n\nItems:\n- Potion x20. Heal 20pt of your HP.\n- Elixir x5. Add 10pt of your MP.").padding().font(.system(size: 18,weight: .heavy, design: .rounded)).foregroundColor(.white).shadow(radius: 20) .multilineTextAlignment(.center)
                            Spacer()
                        }.padding(.top).padding()
                    }
                }
            }
        }
    }
}

//untuk menampilkan cek health dan stats preview
struct CheckHealthStatsView_Previews: PreviewProvider {
    static var previews: some View {
        CheckHealthStatsView()
    }
}
