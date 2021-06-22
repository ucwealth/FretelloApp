//
//  SecondViewController.swift
//  FretelloApp
//
//  Created by Decagon on 13/06/2021.
//

import UIKit
import SnapKit

class newView : UIView {
    
    var label: UILabel!
    var label2: UILabel!
    var label3: UILabel!
    var image: UIImageView!
    
    init(label: UILabel, label2: UILabel, label3: UILabel, image:UIImageView) {
        super.init(frame: .zero)
        self.image = image
        self.label = label
        self.label2 = label2
        self.label3 = label3
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews() {
        label.text = "wonderful"
        label.backgroundColor = .blue
        label.textColor = .white
        addSubview(label)
    }
        
    }


