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
    @State private var username: String = ""
    var body: some View {
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
                        Text("Press the save name button befor continuing!").padding().font(.system(size: 18,weight: .heavy, design: .rounded)).foregroundColor(.white).shadow(radius: 20) .multilineTextAlignment(.center)
                        Button("Save Name"){
                            Const.player = Player(username)
                            if   Const.player.name.isEmpty {
                                showingAlert = true
                            }
                        }.buttonStyle(.bordered).tint(.white) .alert(isPresented:$showingAlert) {
                            Alert(
                                title: Text("Name is Empty! Are you sure you want to continue this?"),
                                message: Text("There is no undo"),
                                primaryButton: .destructive(Text("Yes")) {
                                },
                                secondaryButton: .cancel()
                            )
                        }
                        NavigationLink(destination:  MainMenuView()) {
                            Text("Next")
                        }.buttonStyle(.bordered).tint(.white)
                        
                        Spacer()
                    }.padding(.top).padding()
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
