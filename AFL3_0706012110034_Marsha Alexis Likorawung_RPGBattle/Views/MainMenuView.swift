//
//  MainMenuView.swift
//  AFL3_0706012110034_Marsha Alexis Likorawung_RPGBattle
//
//  Created by Marsha Likorawung  on 26/04/23.
//

import SwiftUI

//untuk menampilkan mainmenu
struct MainMenuView: View {
    @State private var showingAlert = false
    @State private var showingView = false
    @State private var condition: String = ""
    var body: some View {
        ScrollView{
            NavigationStack{
                VStack {
                    ZStack(alignment: .center){
                        Image("bg").resizable()
                        VStack{
                            Text("Nice to meet you \(Const.player.name)!").padding().font(.system(size: 18,weight: .heavy, design: .rounded)).foregroundColor(.white).shadow(radius: 20) .multilineTextAlignment(.center)
                            
                            Text(" From here, you can....").padding().font(.system(size: 18,weight: .heavy, design: .rounded)).foregroundColor(.white).shadow(radius: 20) .multilineTextAlignment(.center)
                            Group{
                                NavigationLink(destination:  CheckHealthStatsView()) {
                                    Text("[C]heck your health and stats")
                                }.buttonStyle(.bordered).tint(.white).font(.system(size: 16,weight: .heavy, design: .rounded))
                            }
                            Group{
                                NavigationLink(destination:  HealWoundView()) {
                                    Text("[H]eal your wounds with potion")
                                }.buttonStyle(.bordered).tint(.white).font(.system(size: 16,weight: .heavy, design: .rounded))
                            }
                            Group{
                                NavigationLink(destination:  UseElixerView()) {
                                    Text("[E]lixir for mana")
                                }.buttonStyle(.bordered).tint(.white).font(.system(size: 16,weight: .heavy, design: .rounded))
                            }
                            Text("...or choose where you want to go").padding().font(.system(size: 18,weight: .heavy, design: .rounded)).foregroundColor(.white).shadow(radius: 20) .multilineTextAlignment(.center)
                            Group{
                                NavigationLink(destination:  ForestOfTrollView()) {
                                    Text("[F]orest of Troll")
                                }.buttonStyle(.bordered).tint(.white).font(.system(size: 16,weight: .heavy, design: .rounded))
                            }
                            Group{
                                NavigationLink(destination:  MountainOfGolemView()) {
                                    Text("[M]ountain of Golem")
                                }.buttonStyle(.bordered).tint(.white).font(.system(size: 16,weight: .heavy, design: .rounded))
                            }
                            Group{
                                NavigationLink(destination:  FleeFromBattleView()) {
                                    Text("[Q]uit game")
                                }.buttonStyle(.bordered).tint(.white).font(.system(size: 16,weight: .heavy, design: .rounded))
                            }
                           Spacer()
                            
                        
                        }.padding(.top).padding()
                    }
                }
            }.navigationBarBackButtonHidden(true)
                .onAppear{
                let result = Const.player.Afterlosing()
                let alert = result.showingAlert
                let conditions = result.condition
                showingAlert = alert
                condition = conditions
            }.alert(isPresented:$showingAlert) {
                Alert(
                    title: Text(condition),
                    message: Text("Are you sure want to continue?"),
                    primaryButton: .destructive(Text("Yes")) {
                        showingView = true
                    },
                    secondaryButton: .cancel()
                )
            }.navigationDestination(
                isPresented: $showingView) {
                    ContentView()
                    Text("Continue?")
                        .hidden()
                }
        }
    }
}

//untuk menampilkan mainmenu preview
struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
