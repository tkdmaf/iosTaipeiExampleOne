//
//  DogCollectionViewController.swift
//  iOSTaipei
//
//  Created by 蕭文安 on 2018/1/22.
//  Copyright © 2018年 蕭文安. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class DogCollectionViewController: UICollectionViewController {
    
    var data:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return data.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DogCollectionCell", for: indexPath)
    
        // Configure the cell
        let imageView = cell.viewWithTag(20) as! UIImageView
        imageView.image = UIImage(named: data[indexPath.row])
    
        return cell
    }

}
