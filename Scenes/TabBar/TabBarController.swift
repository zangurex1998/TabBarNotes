//
//  TabBarController.swift
//  TabBarNotes
//
//  Created by technomix on 07.01.23.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }
}

extension TabBarController :  UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is NoteViewController{
            
            return false
        }
        return true
    }
}
