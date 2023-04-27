//
//  HealWoundView.swift
//  AFL3_0706012110034_Marsha Alexis Likorawung_RPGBattle
//
//  Created by Marsha Likorawung  on 26/04/23.
//

import SwiftUI

//untuk melihat tampilan heal wound preview
struct HealWoundView: View {
    @ObservedObject var reloadViewHelper = ReloadViewHelper()
    @State private var showingAlert = false
    @State private var condition = ""
    var body: some View {
        ScrollView{
            NavigationStack{
                VStack {
                    ZStack(alignment: .center){
                        Image("bg").resizable()
                        VStack{
                            Text("Your HP is \(Const.player.hp)!\nYour Potion is \(Const.player.potion)!\n").padding().font(.system(size: 18,weight: .heavy, design: .rounded)).foregroundColor(.white).shadow(radius: 20) .multilineTextAlignment(.center)
                            Text("Are you sure want to use 1 potion to heal wound?").padding().font(.system(size: 18,weight: .heavy, design: .rounded)).foregroundColor(.white).shadow(radius: 20) .multilineTextAlignment(.center)
                            Button("Yes"){
                                let result =  Const.player.UsePotion()
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
                            Spacer()
                        }.padding(.top).padding()
                    }
                }
            }
        }
    }
}

//untuk melihat tampilan heal wound preview
struct HealWoundView_Previews: PreviewProvider {
    static var previews: some View {
        HealWoundView()
    }
}
