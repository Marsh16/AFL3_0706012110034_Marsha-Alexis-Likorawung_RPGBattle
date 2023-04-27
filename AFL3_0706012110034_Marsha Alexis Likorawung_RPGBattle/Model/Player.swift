//
//  Player.swift
//  AFL3_0706012110034_Marsha Alexis Likorawung_RPGBattle
//
//  Created by Marsha Likorawung  on 26/04/23.
//

import Foundation

//class player memakai protokol player
class Player: ProtocolPlayer{
    var name:String
    var hp: Int
    var potion: Int
    var mana: Int
    var elixer: Int
    var enemy: [Enemy] = []
    
    init(_ name: String){
        self.name = name
        self.hp = 100
        self.potion = 10
        self.mana = 50
        self.elixer = 15
        self.enemy = []
    }
    
    //untuk player mengaktifkan meteor attack, yang terjadi: hp enemy akan berkurang 50 point dan mana player berkurang 15
    func Meteor(_ enemy: Enemy) -> (damage:Int,showingAlert: Bool,condition: String){
        let hpbaru = enemy.enemyHp - 50
        let mpbaru = mana-15
        if(mpbaru<0){
            return (0,true,"mana empty")
        }else if(enemy.enemyHp==0){
            return (0,true,"enemy dead")
        }else if(hp == 0){
            return (0,true,"You are dead, you lose")
        }else{
            if(hpbaru<0){
                enemy.enemyHp = 0
                return (0,true,"enemy dead")
            }else{
                mana =  mana - 15
                enemy.enemyHp = enemy.enemyHp - 50
                return (50,false,"")
            }
        }
    }
    
    //untuk player mengaktifkan shield, yang terjadi: mana berkurang 15 point dan enemy tidak bisa attack anda
    func Shield(_ enemy: Enemy) -> (showingAlert: Bool,condition: String){
        let mpbaru = mana-15
        if(mpbaru<0){
            return (true,"mana empty")
        }else if(enemy.enemyHp==0){
            return (true,"enemy dead")
        }else if(hp == 0){
            return (true,"You are dead, you lose")
        }
        else{
            mana-=15
            return (false,"")
        }
    }
    
    //untuk player melakukan physical attack, damagenya 5 dan tidak memakai mana
    func PhysicalAttack(_ enemy: Enemy) -> (damage:Int,showingAlert: Bool,condition: String) {
        let hpbaru = enemy.enemyHp - 5
        if(hpbaru<0){
            enemy.enemyHp = 0
            return (0,true,"enemy dead")
        }else if(enemy.enemyHp==0){
            return (0,true,"enemy dead")
        }else if(hp == 0){
            return (0,true,"You are dead, you lose")
        }else{
            enemy.enemyHp = enemy.enemyHp - 5
            return (5,false,"")
        }
    }
    
    //untuk memakai elixer, menambah mana anda
    func UseElixer() -> (showingAlert: Bool,condition: String) {
        let elixirbaru = elixer - 1
        let manabaru = mana + 15
        if(elixirbaru <= 0){
            return (true,"Elixer is empty")
        }else if(manabaru>=50){
            mana = 50
            return (true,"Mana is full")
        }else{
            elixer = elixer - 1
            mana = mana + 15
            return (false,"")
        }
    }
    
    //untuk memakai potion, manambah health anda
    func UsePotion() -> (showingAlert: Bool,condition: String) {
        let hpbaru = hp + 20
        if(potion<1){
            return (true,"No potions left")
        }else if(hp == 100){
            return (true,"Cannot consume any potions, your hp is full")
        }
        else{
            if (hpbaru >= 100){
                let sisa = hpbaru-100
                potion-=1
                hp = hp + 20 - sisa
                return (false,"")
            }else{
                potion-=1
                hp+=20
                return (false,"")
            }
        }
    }
    
    //untuk melihat enemy vital
    func enemyVitalScreen(_ enemy: Enemy) -> (enemyName: String,enemyHp: Int) {
        return (enemy.enemyName,enemy.enemyHp)
    }
    
    //untuk cek kalau hp enemy sudah 0 semua maka anda menang
    func Afterlosing() -> (showingAlert: Bool,condition: String) {
        for golem in enemy {
            for troll in enemy {
                if golem is Golem && troll is Troll{
                    if( golem.enemyHp == 0 && troll.enemyHp == 0){
                        return (true,"You Win, Play Again?")
                    }else{
                        return (false,"")
                    }
                }
            }
        }
        return (false,"")
    }
}
