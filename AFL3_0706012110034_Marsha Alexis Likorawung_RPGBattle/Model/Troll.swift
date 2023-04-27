//
//  Troll.swift
//  AFL3_0706012110034_Marsha Alexis Likorawung_RPGBattle
//
//  Created by Marsha Likorawung  on 26/04/23.
//

import Foundation

//merupakan subclass dari class enemy ada protocol troll
class Troll: Enemy,ProtocolTroll {
    override init(_ enemyName: String, _ enemyHp: Int) {
        super.init(enemyName,enemyHp)
    }
    
    //untuk troll shield
    func TrollShield(_ player: Player, _ damage: Int)->(showingAlert: Bool, condition: String) {
        let mpbaru = player.mana-15
        if(mpbaru<0){
            return (true,"mana empty")
        }
        else if(player.hp == 0){
            return (true,"You are dead, you lose")
        }
        else if(player.mana == 0){
            return (true,"mana empty")
        }
        else if(enemyHp == 0){
            return (true,"enemy dead")
        }else{
            enemyHp = enemyHp + damage
            return (true, "The \(enemyName) uses their SHIELD and regain their HP from you Attack. \n**HP+ HP+ HP+** 🛡️🛡️\nThe \(enemyName) HP RETURNS TO \(enemyHp)")
        }
        
    }
}
