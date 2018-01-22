//
//  DogCollectionViewCell.swift
//  iOSTaipei
//
//  Created by 蕭文安 on 2018/1/22.
//  Copyright © 2018年 蕭文安. All rights reserved.
//

import UIKit

class DogCollectionViewCell : UICollectionViewCell {
    
    var imageView : UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setFrame()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setFrame()
    }
    
    func setFrame(){
        self.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        self.imageView.frame.size = CGSize(width: 100, height: 100)
        self.imageView.center = self.center
        self.imageView.image = UIImage(named: "001")
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.clipsToBounds = true
        self.addSubview(imageView)
    }
    
}
