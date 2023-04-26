//
//  HealWoundView.swift
//  AFL3_0706012110034_Marsha Alexis Likorawung_RPGBattle
//
//  Created by Marsha Likorawung  on 26/04/23.
//

import SwiftUI

struct HealWoundView: View {
    @State private var showingAlert = false
    var body: some View {
        NavigationStack{
            VStack {
                ZStack(alignment: .center){
                    Image("bg").resizable()
                    VStack{
                        Text("Your HP is \(Const.player.hp)!").padding().font(.system(size: 18,weight: .heavy, design: .rounded)).foregroundColor(.white).shadow(radius: 20) .multilineTextAlignment(.center)
                        Text("Your Potion is \(Const.player.potion)!").padding().font(.system(size: 18,weight: .heavy, design: .rounded)).foregroundColor(.white).shadow(radius: 20) .multilineTextAlignment(.center)
                        Text("Are you sure want to use 1 potion to heal wound?").padding().font(.system(size: 18,weight: .heavy, design: .rounded)).foregroundColor(.white).shadow(radius: 20) .multilineTextAlignment(.center)
                        Button("Yes"){
                            if (Const.player.potion==10){
                                showingAlert = true}
                            
                        }.buttonStyle(.bordered).tint(.white) .alert(isPresented:$showingAlert) {
                            Alert(
                                title: Text("Potion is full"),
                                message: Text("There is no undo"),
                                primaryButton: .destructive(Text("ok")) {
                                    
                                },
                                secondaryButton: .cancel()
                            )
                        }
                        
                        Spacer()
                    }.padding(.top).padding()
                }
            }
        }
    }
}

struct HealWoundView_Previews: PreviewProvider {
    static var previews: some View {
        HealWoundView()
    }
}
