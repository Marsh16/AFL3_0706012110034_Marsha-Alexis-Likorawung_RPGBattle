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
    func GolemPunch(_ player: Player)-> Bool{
        let newhp = player.hp-20
        if(newhp<0){
            player.hp = 0
            return true
        }else{
            player.hp = player.hp - 20
            return false
        }
    }
}
