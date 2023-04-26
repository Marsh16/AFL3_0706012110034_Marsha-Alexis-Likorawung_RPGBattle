//
//  ProtocolPlayer.swift
//  0706012110034_Marsha Alexis Likorawung_AFL 1
//
//  Created by Marsha Likorawung  on 04/04/23.
//

import Foundation

//untuk protokol player
protocol ProtocolPlayer{
    
    func Meteor(_ enemy: Enemy) -> (damage:Int,showingAlert: Bool,condition: String)
    
    func Shield(_ enemy: Enemy) -> (showingAlert: Bool,condition: String)
    
    func PhysicalAttack(_ enemy: Enemy) -> (damage:Int,showingAlert: Bool,condition: String)
    
    func UseElixer() -> (showingAlert: Bool,condition: String)
    
    func UsePotion() -> (showingAlert: Bool,condition: String)
    
    func enemyVitalScreen(_ enemy: Enemy) -> (enemyName: String,enemyHp: Int)
    
    func Afterlosing() -> (showingAlert: Bool,condition: String)
}

