//
//  Enemy.swift
//  AFL3_0706012110034_Marsha Alexis Likorawung_RPGBattle
//
//  Created by Marsha Likorawung  on 26/04/23.
//

import Foundation

//Enemy memakai protokol enemy
class Enemy: ProtocolEnemy{
    var enemyName:String
    var enemyHp: Int
    
    //membuat enemy, dalam constructor mengisi nama dan enemy pada parameter
    init(_ enemyName: String,_ enemyHp: Int) {
        self.enemyName = enemyName
        self.enemyHp = enemyHp
    }
    
    //method attack enemy, damage 15 point ke player
    func EnemyAttack(_ player: Player)->Bool {
        let newhp = player.hp-15
        if(newhp<0){
            player.hp = 0
            return true
        }else{
            player.hp = player.hp-15
            return false
        }
    }
}
