//
//  DogCollectionView.swift
//  iOSTaipei
//
//  Created by 蕭文安 on 2018/1/22.
//  Copyright © 2018年 蕭文安. All rights reserved.
//

import UIKit

protocol DogProtocol {
    
    func dogSelected(_ dogDatas:[String],_ dogIndex:Int,_ position:CGPoint?)
    
}

class DogCollectionView: UICollectionView {
    
    var data : [String] = []
    var dogDelegate:DogProtocol?
    var position:CGPoint?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.registerCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.registerCell()
    }
    
    func registerCell(){
        self.delegate = self
        self.dataSource = self
        self.register(DogCollectionViewCell.self, forCellWithReuseIdentifier: "DoggyCollectionCell")
        self.backgroundColor = UIColor.white
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
    }

}

extension DogCollectionView : UICollectionViewDelegate , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = data[indexPath.row]
        let cell = self.dequeueReusableCell(withReuseIdentifier: "DoggyCollectionCell", for: indexPath) as! DogCollectionViewCell
        cell.imageView.image = UIImage(named: item)
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.dogDelegate?.dogSelected(self.data,indexPath.row,position)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else {
            return
        }
        position = touch.location(in: self.window)
    }
}

