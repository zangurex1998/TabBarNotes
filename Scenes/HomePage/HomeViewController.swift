//
//  HomeViewController.swift
//  TabBarNotes
//
//  Created by technomix on 07.01.23.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - Outlets
    
    
    @IBOutlet weak var enterName: UITextField!
    @IBOutlet weak var enterPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
    }
    

    @IBAction func didTapSignUpbutton(_ sender: Any) {
        
        NotificationCenter.default.post(name: .notification, object: nil,userInfo: ["userInfo" : enterName.text ?? ""])
    }
    

}

extension Notification.Name{
    static let notification = NSNotification.Name("name")
}
