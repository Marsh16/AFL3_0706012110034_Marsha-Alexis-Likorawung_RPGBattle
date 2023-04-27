//
//  Golem.swift
//  AFL3_0706012110034_Marsha Alexis Likorawung_RPGBattle
//
//  Created by Marsha Likorawung  on 26/04/23.
//

import Foundation

//merupakan subclass dari class enemy ada protocol golem
class Golem: Enemy,ProtocolGolem {
    override init(_ enemyName: String, _ enemyHp: Int) {
        super.init(enemyName,enemyHp)
    }
    
    //untuk attack dari golem yaitu damagenya ke player sebanyak 20 point
    func GolemPunch(_ player: Player)->(showingAlert: Bool, condition: String) {
        let newhp = player.hp-20
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
        }
        else if(newhp<0){
            player.hp = 0
            return (true,"You are dead, you lose")
        }else{
            player.hp = player.hp - 20
            return (true, "The \(enemyName) raises their FIST and begins to PUNCH you. \n**POW POW POW** 💥💥\nYou are wounded.\nYour HP is now: \(player.hp)")
        }
    }
}
