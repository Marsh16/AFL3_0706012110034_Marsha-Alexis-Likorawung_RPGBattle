//
//  FleeFromBattleView.swift
//  AFL3_0706012110034_Marsha Alexis Likorawung_RPGBattle
//
//  Created by Marsha Likorawung  on 27/04/23.
//

import SwiftUI

//untuk melihat tampilan flee from battle
struct FleeFromBattleView: View {
    @State private var showingAlert = false
    @State private var showingView = false
    var body: some View {
        ScrollView{
            NavigationStack{
                VStack {
                    ZStack(alignment: .center){
                        Image("bg").resizable()
                        VStack{
                            Text("You feel that if you don't escape soon, you won't be able to continue the fight.\nYou look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.\n \nYou're safe, for now.\n").padding().font(.system(size: 18,weight: .heavy, design: .rounded)).foregroundColor(.white).shadow(radius: 20) .multilineTextAlignment(.center)
                            Button("Play Again"){
                                Const.newGame()
                                showingAlert = true
                            }.buttonStyle(.bordered).tint(.white).font(.system(size: 16,weight: .heavy, design: .rounded)) .alert(isPresented:$showingAlert) {
                                Alert(
                                    title: Text("Play Again?"),
                                    message: Text("There is no undo"),
                                    primaryButton: .destructive(Text("Yes")) {
                                        showingView = true
                                    },
                                    secondaryButton: .cancel()
                                )
                            }
                            .navigationDestination(
                                isPresented: $showingView) {
                                    ContentView()
                                    Text("New Game")
                                        .hidden()
                                }
                            Spacer()
                        }.padding(.top).padding()
                    }
                }
            }
        }
    }
}

//untuk melihat tampilan flee from battle preview
struct FleeFromBattleView_Previews: PreviewProvider {
    static var previews: some View {
        FleeFromBattleView()
    }
}
