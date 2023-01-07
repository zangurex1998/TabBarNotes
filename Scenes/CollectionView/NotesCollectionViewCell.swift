//
//  NotesCollectionViewCell.swift
//  TabBarNotes
//
//  Created by technomix on 07.01.23.
//

import UIKit

class NotesCollectionViewCell: UICollectionViewCell {
 
    let label = UILabel()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpLabel()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLabel()
    }
    
    
    func setUpLabel(){
        addSubview(label)
        label.textAlignment = .center
        label.backgroundColor = .gray
        label.textColor = .white
      
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.frame = .init(x: 0, y: 4, width: frame.width  , height: 40)
        
    }
    
    
    func configure(with : Note) {
        label.text = with.header
    }
    
    
    
}
