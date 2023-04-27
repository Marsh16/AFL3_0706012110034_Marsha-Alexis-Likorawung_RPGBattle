//
//  MountainOfGolemView.swift
//  AFL3_0706012110034_Marsha Alexis Likorawung_RPGBattle
//
//  Created by Marsha Likorawung  on 26/04/23.
//

import SwiftUI

//untuk melihat tampilan mountain of golem
struct MountainOfGolemView: View {
    @ObservedObject var reloadViewHelper = ReloadViewHelper()
    @State private var showingAlert = false
    @State private var showingView = false
    @State private var condition = ""
    @State private var damage = 0
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    ZStack(alignment: .center){
                        Image("bg").resizable()
                        VStack{
                            ForEach (Const.player.enemy) { golem1 in
                                if golem1 is Golem {
                                    @State var name = golem1.enemyName
                                    @State var hp = golem1.enemyHp
                                    Group{
                                        Text("As you enter the forest, you feel a sense of unease wash over you. Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.\n \n👿 Name: \(golem1.enemyName)\n👿 Health: \(golem1.enemyHp) \n").padding().font(.system(size: 16,weight: .heavy, design: .rounded)).foregroundColor(.white).shadow(radius: 20)
                                    }
                                    Group{
                                        Text("Choose your action:").padding().font(.system(size: 16,weight: .heavy, design: .rounded)).foregroundColor(.white).shadow(radius: 20) .multilineTextAlignment(.center)
                                    }
                                    Group{
                                        Button("Physical Attack. Use 15pt of MP. Deal 5pt of damage."){
                                            let result =  Const.player.PhysicalAttack(golem1)
                                            let damage = result.damage
                                            let alert = result.showingAlert
                                            let conditions = result.condition
                                            showingAlert = alert
                                            condition = conditions
                                            Const.damage = damage
                                            switch(Int.random(in: 1..<3)){
                                            case 1:
                                                if (Const.player.hp > 0 || Const.player.enemy[0].enemyHp > 0){
                                                    let resultcase1 = Const.golem.GolemPunch(Const.player)
                                                    let alert = resultcase1.showingAlert
                                                    let conditions = resultcase1.condition
                                                    showingAlert = alert
                                                    condition = conditions
                                                }
                                                break
                                            case 2:
                                                if (Const.player.hp > 0 || Const.player.enemy[0].enemyHp > 0){
                                                    let resultcase2 = Const.golem.EnemyAttack(Const.player)
                                                    let alert = resultcase2.showingAlert
                                                    let conditions = resultcase2.condition
                                                    showingAlert = alert
                                                    condition = conditions
                                                }
                                                break
                                            default:
                                                if (Const.player.hp > 0 || Const.player.enemy[0].enemyHp > 0){
                                                    let resultcase2 = Const.golem.EnemyAttack(Const.player)
                                                    let alert = resultcase2.showingAlert
                                                    let conditions = resultcase2.condition
                                                    showingAlert = alert
                                                    condition = conditions
                                                }
                                                break
                                            }
                                            reloadViewHelper.reloadView()
                                        }.buttonStyle(.bordered).tint(.white).font(.system(size: 16,weight: .heavy, design: .rounded)) .alert(isPresented:$showingAlert) {
                                            Alert(
                                                title: Text(condition),
                                                message: Text("There is no undo"),
                                                primaryButton: .destructive(Text("Yes")) {
                                                    if (Const.player.hp == 0){
                                                        print("lose")
                                                        showingView = true}
                                                },
                                                secondaryButton: .cancel()
                                            )
                                        } .navigationDestination(
                                            isPresented: $showingView) {
                                                ContentView()
                                                Text("Continue?")
                                                    .hidden()
                                            }
                                    }
                                    Group{
                                        Button("Meteor. Use 15pt of MP. Deal 50pt of damage."){
                                            let result =  Const.player.Meteor(golem1)
                                            let damage = result.damage
                                            let alert = result.showingAlert
                                            let conditions = result.condition
                                            showingAlert = alert
                                            condition = conditions
                                            Const.damage = damage
                                            switch(Int.random(in: 1..<3)){
                                            case 1:
                                                if (Const.player.hp > 0 || Const.player.mana > 0 || Const.player.enemy[0].enemyHp > 0){
                                                    let resultcase1 = Const.golem.GolemPunch(Const.player)
                                                    let alert = resultcase1.showingAlert
                                                    let conditions = resultcase1.condition
                                                    showingAlert = alert
                                                    condition = conditions
                                                }
                                                break
                                            case 2:
                                                if (Const.player.hp > 0 || Const.player.mana > 0 || Const.player.enemy[0].enemyHp > 0){
                                                    let resultcase2 = Const.golem.EnemyAttack(Const.player)
                                                    let alert = resultcase2.showingAlert
                                                    let conditions = resultcase2.condition
                                                    showingAlert = alert
                                                    condition = conditions
                                                }
                                                break
                                            default:
                                                if (Const.player.hp > 0 || Const.player.mana > 0 || Const.player.enemy[0].enemyHp > 0){
                                                    let resultcase2 = Const.golem.EnemyAttack(Const.player)
                                                    let alert = resultcase2.showingAlert
                                                    let conditions = resultcase2.condition
                                                    showingAlert = alert
                                                    condition = conditions
                                                }
                                                break
                                            }
                                            reloadViewHelper.reloadView()
                                        }.buttonStyle(.bordered).tint(.white).font(.system(size: 16,weight: .heavy, design: .rounded)) .alert(isPresented:$showingAlert) {
                                            Alert(
                                                title: Text(condition),
                                                message: Text("There is no undo"),
                                                primaryButton: .destructive(Text("Yes")) {
                                                    if (Const.player.hp == 0){
                                                        print("lose")
                                                        showingView = true}
                                                },
                                                secondaryButton: .cancel()
                                            )
                                        } .navigationDestination(
                                            isPresented: $showingView) {
                                                ContentView()
                                                Text("Continue?")
                                                    .hidden()
                                            }
                                    }
                                    Group{
                                        Button("Shield. Use 15pt of MP. Block enemy's attack in 1 turn."){
                                            let result =  Const.player.Shield(golem1)
                                            let alert = result.showingAlert
                                            let conditions = result.condition
                                            showingAlert = alert
                                            condition = conditions
                                            reloadViewHelper.reloadView()
                                        }.buttonStyle(.bordered).tint(.white).font(.system(size: 16,weight: .heavy, design: .rounded)) .alert(isPresented:$showingAlert) {
                                            Alert(
                                                title: Text(condition),
                                                message: Text("There is no undo"),
                                                primaryButton: .destructive(Text("Yes")) {
                                                    
                                                },
                                                secondaryButton: .cancel()
                                            )
                                        }
                                    }
                                    Text("\n")
                                    Group{
                                        NavigationLink(destination:  HealWoundView()) {
                                            Text("Use Potion to heal wound.")
                                        }.buttonStyle(.bordered).tint(.white).font(.system(size: 16,weight: .heavy, design: .rounded))
                                    }
                                    Group{
                                        NavigationLink(destination:  EnemyVitalScreenView(enemyName: $name,enemyHp: $hp)) {
                                            Text("Scan enemy's vital.")
                                        }.buttonStyle(.bordered).tint(.white).font(.system(size: 16,weight: .heavy, design: .rounded))
                                    }
                                    Group{
                                        NavigationLink(destination:  FleeFromBattleView()) {
                                            Text("Flee from battle.")
                                        }.buttonStyle(.bordered).tint(.white).font(.system(size: 16,weight: .heavy, design: .rounded))
                                    }
                                    Spacer()
                                }
                            }
                        }.padding(.top).padding()
                    }
                }
            }
        }
    }
}

//untuk melihat preview tampilan mountain of golem
struct MountainOfGolemView_Previews: PreviewProvider {
    static var previews: some View {
        MountainOfGolemView()
    }
}
