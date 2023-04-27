//
//  JourneyScreenView.swift
//  AFL3_0706012110034_Marsha Alexis Likorawung_RPGBattle
//
//  Created by Marsha Likorawung  on 26/04/23.
//

import SwiftUI

//untuk tampilan journey screen
struct JourneyScreenView: View {
    @State private var showingAlert = false
    @State private var showingView = false
    @State private var username: String = ""
    @State private var condition: String = ""
    var body: some View {
        ScrollView{
            NavigationStack{
                VStack {
                    ZStack(alignment: .center){
                        Image("bg").resizable()
                        VStack{
                            Text("Welcome to the world of magic! 🧙‍♂️🧌You have been chosen to embark on an epic journey as a young wizard on the path to becoming a master of the arcane arts. Your adventures will take you through forests 🌲, mountains ⛰️, and dungeons 🏰, where you will face challenges, make allies, and fight enemies.").padding().font(.system(size: 18,weight: .heavy, design: .rounded)).foregroundColor(.white).shadow(radius: 20) .multilineTextAlignment(.center)
                            Text("May I know your name, a young wizard?").padding().font(.system(size: 18,weight: .heavy, design: .rounded)).foregroundColor(.white).shadow(radius: 20) .multilineTextAlignment(.center)
                            TextField(
                                "May I know your name, a young wizard?",
                                text: $username
                            )
                            .textFieldStyle(.roundedBorder
                            )
                            .padding()
                            .disableAutocorrection(true)
                            Button("Next"){
                                Const.player = Player(username)
                                if   Const.player.name.isEmpty {
                                    condition = "Your name is empty!"
                                    Const.player = Player("Unknown")
                                    Const.golem = Golem("Golem Hitler", 100)
                                    Const.troll = Troll("Troll Chaplin", 100)
                                    Const.player.enemy.append(Const.golem)
                                    Const.player.enemy.append(Const.troll)
                                    showingAlert = true
                                }else{
                                    Const.golem = Golem("Golem Hitler", 100)
                                    Const.troll = Troll("Troll Chaplin", 100)
                                    Const.player.enemy.append(Const.golem)
                                    Const.player.enemy.append(Const.troll)
                                    condition = "Your name is \(Const.player.name)"
                                    showingAlert = true
                                }
                            }
                            .buttonStyle(.bordered).tint(.white).font(.system(size: 16,weight: .heavy, design: .rounded)) .alert(isPresented:$showingAlert) {
                                Alert(
                                    title: Text(condition),
                                    message: Text("Are you sure want to continue?"),
                                    primaryButton: .destructive(Text("Yes")) {
                                        showingView = true
                                    },
                                    secondaryButton: .cancel()
                                )
                            }
                            .navigationDestination(
                                isPresented: $showingView) {
                                    MainMenuView()
                                    Text("Continue?")
                                        .hidden()
                                }.navigationBarBackButtonHidden(true)
                            Spacer()
                        }.padding(.top).padding()
                    }
                }
            }
        }
    }
}

//untuk tampilan journey screen preview
struct JourneyScreenView_Previews: PreviewProvider {
    static var previews: some View {
        JourneyScreenView()
    }
}
