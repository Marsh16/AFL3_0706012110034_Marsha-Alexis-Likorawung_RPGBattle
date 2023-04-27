//
//  ReloadViewHelper.swift
//  AFL3_0706012110034_Marsha Alexis Likorawung_RPGBattle
//
//  Created by Marsha Likorawung  on 27/04/23.
//

import Foundation

//untuk melakukan reload view
class ReloadViewHelper: ObservableObject {
    func reloadView() {
        objectWillChange.send()
    }
}
