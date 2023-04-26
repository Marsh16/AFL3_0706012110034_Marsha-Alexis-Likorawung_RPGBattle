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
    func TrollShield(_ damage: Int){
        enemyHp = enemyHp + damage
    }
}
