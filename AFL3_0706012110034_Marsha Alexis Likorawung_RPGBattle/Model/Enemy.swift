//
//  Enemy.swift
//  AFL3_0706012110034_Marsha Alexis Likorawung_RPGBattle
//
//  Created by Marsha Likorawung  on 26/04/23.
//

import Foundation

//Enemy memakai protokol enemy
class Enemy: ProtocolEnemy,Identifiable{
    var enemyName:String
    var enemyHp: Int
    
    //membuat enemy, dalam constructor mengisi nama dan enemy pada parameter
    init(_ enemyName: String,_ enemyHp: Int) {
        self.enemyName = enemyName
        self.enemyHp = enemyHp
    }
    
    //method attack enemy, damage 15 point ke player
    func EnemyAttack(_ player: Player)->(showingAlert: Bool, condition: String) {
        let newhp = player.hp-15
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
            player.hp = player.hp-15
            return (true, "The \(enemyName) raises their giant axe and begins to strike you. \n**SLAM** 💥💥\nYou are wounded.\nYour HP is now: \(player.hp)")
        }
    }
}
