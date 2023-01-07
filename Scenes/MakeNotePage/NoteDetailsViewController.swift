//
//  NoteDetailsViewController.swift
//  TabBarNotes
//
//  Created by technomix on 07.01.23.
//

import UIKit

class NoteDetailsViewController: UIViewController {
    
    //MARK: - extensions
    
    
    @IBOutlet weak var headerTextFiled: UITextField!
    @IBOutlet weak var typeTextView: UITextView!
    
    //MARK: - Properties
    
    var index : Int?
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        configure()
        designingView()
        rightNavigationButton()
    }
    
    
    
    
    
    //MARK: - Methods
    
    func configure(){

        
        if let index = index {
            
            let newNote : Note = NoteDataSource.shared.notes[index]
            headerTextFiled.text = newNote.header
            typeTextView.text = newNote.text
        }
        
    }
    
    func designingView(){
        view.backgroundColor = .black
        headerTextFiled.textColor = .white
        typeTextView.textColor = .white
        typeTextView.backgroundColor = .black
        
    }
    
    //MARK: - Buttons
    
    func rightNavigationButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "pencil.tip.crop.circle.badge.plus"), style: .done, target: self, action: #selector(didTapPlusSign))
    }
    
    @objc func didTapPlusSign (){
        
        guard let headers = headerTextFiled.text,
              let type = typeTextView.text else {return}
        let note = Note(header: headers, text: type)
        
        if let index = index {
            NoteDataSource.shared.notes[index] = note
        }else {
            NoteDataSource.shared.notes.append(note)
        }
        
        
        
        
        
    }
}
