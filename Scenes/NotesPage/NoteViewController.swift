//
//  NoteViewController.swift
//  TabBarNotes
//
//  Created by technomix on 07.01.23.
//

import UIKit

class NoteViewController: UIViewController {
    
    //MARK: - Outlets
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //MARK: - Properties
    
    var noteData = NoteDataSource.shared.notes
    
    //MARK: - required Init()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
            observer()
    }
    
    //MARK: - lifeCylce
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        didTapPlusNote()
        setUpCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
        collectionView.reloadData()
    }
    //MARK: - Methods
    
   private func setUpCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(NotesCollectionViewCell.self, forCellWithReuseIdentifier: "NoteCollection")
        
      
    }

    //MARK: - Button
    private func didTapPlusNote(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "folder.fill.badge.plus"), style: .done, target: self, action: #selector(didTapAdd))
    }
    
    @objc func didTapAdd(){
        let vc = UIStoryboard(name: "NoteDetails", bundle: nil).instantiateViewController(withIdentifier: "details")
        navigationController?.pushViewController(vc, animated: true)
    }
    ////
  
    func observer(){
        NotificationCenter.default.addObserver(self, selector: #selector(submitButtontapped), name: .notification, object: nil)
    }
    
    @objc func submitButtontapped(notification : Notification){
        guard let info = notification.userInfo?["userInfo"] else {return}
        navigationItem.title = "\(info)'s Notes"
    
     }
    

}

//MARK: - extensions


extension NoteViewController  : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "NoteDetails", bundle: nil).instantiateViewController(withIdentifier: "details") as! NoteDetailsViewController
        vc.index = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension NoteViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        NoteDataSource.shared.notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NoteCollection", for: indexPath) as! NotesCollectionViewCell
        cell.configure(with: NoteDataSource.shared.notes[indexPath.row])
        return cell
    
    }
    
    
}
extension NoteViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat = view.frame.width / 4
        let height : CGFloat = 40
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}

