//
//  ContentView.swift
//  AFL3_0706012110034_Marsha Alexis Likorawung_RPGBattle
//
//  Created by Marsha Likorawung  on 26/04/23.
//

import SwiftUI

//tampilan awal saat baru di run
struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                ZStack(alignment: .center){
                    Image("bg").resizable()
                    Text("Warrior Frontier").font(.system(size: 64,weight: .heavy, design: .rounded)).offset(x: -0, y: -200).foregroundColor(.white).shadow(radius: 20) .multilineTextAlignment(.center)
                    NavigationLink(destination: JourneyScreenView()){
                        Image("Play").shadow(radius: 10)
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

//menampilkan content view preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
