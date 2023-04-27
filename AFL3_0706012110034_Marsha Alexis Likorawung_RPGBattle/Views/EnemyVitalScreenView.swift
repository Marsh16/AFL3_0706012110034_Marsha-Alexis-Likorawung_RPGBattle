//
//  EnemyVitalScreenView.swift
//  AFL3_0706012110034_Marsha Alexis Likorawung_RPGBattle
//
//  Created by Marsha Likorawung  on 27/04/23.
//

import SwiftUI

//untuk melihat tampilan enemy vital screen
struct EnemyVitalScreenView: View {
    @Binding var enemyName : String
    @Binding var enemyHp : Int
    var body: some View {
        ScrollView{
            NavigationStack{
                VStack {
                    ZStack(alignment: .center){
                        Image("bg").resizable()
                        VStack{
                            Text("Name: \(enemyName)\n\n HP: \(enemyHp)/100\n\n Attack: 5pt—50pt of damage\n\n").padding().font(.system(size: 18,weight: .heavy, design: .rounded)).foregroundColor(.white).shadow(radius: 20) .multilineTextAlignment(.center)
                            Spacer()
                        }.padding(.top).padding()
                    }
                }
            }
        }
    }
}

//untuk melihat preview tampilan enemy vital screen
struct EnemyVitalScreenView_Previews: PreviewProvider {
    static var previews: some View {
        @State var name: String = "Enemy"
        @State var hp: Int = 100
        EnemyVitalScreenView(enemyName: $name,enemyHp: $hp)
    }
}
