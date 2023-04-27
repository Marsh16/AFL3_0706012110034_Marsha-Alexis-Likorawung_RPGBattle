//
//  Const.swift
//  AFL3_0706012110034_Marsha Alexis Likorawung_RPGBattle
//
//  Created by Marsha Likorawung  on 26/04/23.
//

import Foundation

//untuk global variable
struct Const{
    static var player = Player("")
    static var golem = Golem("", 0)
    static var troll = Troll("", 0)
    static var damage = 0
    
    static func newGame(){
        Const.player = Player("")
        Const.golem = Golem("", 0)
        Const.troll = Troll("", 0)
        Const.damage = 0
    }
}
