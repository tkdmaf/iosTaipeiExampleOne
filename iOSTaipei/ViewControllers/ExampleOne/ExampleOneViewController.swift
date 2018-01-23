//
//  ExampleOneViewController.swift
//  iOSTaipei
//
//  Created by 蕭文安 on 2018/1/21.
//  Copyright © 2018年 蕭文安. All rights reserved.
//

import UIKit

class ExampleOneViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let datas:[[String]] = [
        ["001","002","003","004","005"],
        ["011","012","013","014","015"],
        ["021","022","023","024","025"],
        ["006","007","008","009","010"],
        ["016","017","018","019","020"],
        ["026","027","028","029","030"],
        ["001","002","003","004","005"],
        ["011","012","013","014","015"],
        ["021","022","023","024","025"],
        ["006","007","008","009","010"],
        ["016","017","018","019","020"],
        ["026","027","028","029","030"],
        ["001","002","003","004","005"],
        ["011","012","013","014","015"],
        ["021","022","023","024","025"],
        ["006","007","008","009","010"],
        ["016","017","018","019","020"],
        ["026","027","028","029","030"],
        ["001","002","003","004","005"],
        ["011","012","013","014","015"],
        ["021","022","023","024","025"],
        ["006","007","008","009","010"],
        ["016","017","018","019","020"],
        ["026","027","028","029","030"]
    ]
    
    var collectionViewResult:[DogCollectionView] = []
    var transitionManager:UIViewControllerTransitioningDelegate!
//    let transitionManager = ShowDogTransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 130
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissEvent(_ sender: UIBarButtonItem) {
        if self.navigationController != nil {
            self.navigationController?.dismiss(animated: true, completion: nil)
        }else{
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

extension ExampleOneViewController : DogProtocol {
    
    func dogSelected(_ dogDatas:[String],_ dogIndex:Int,_ position:CGPoint?) {
        AppCache.touchPosition = position
        if let destination = self.storyboard?.instantiateViewController(withIdentifier: "ShowDogViewController") as? ShowDogViewController {
            destination.dogsDatas = dogDatas
            destination.dogIndex = dogIndex
            destination.transitioningDelegate = transitionManager
            self.present(destination, animated: true, completion: nil)
        }
    }
    
}

extension ExampleOneViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        let cell = UITableViewCell()
        let collection = showCollection(indexPath.row)
        cell.addSubview(collection)
        return cell
    }
    
    func showCollection(_ index:Int) -> DogCollectionView{
        guard collectionViewResult.count <= index else {
            print("reuse")
            return collectionViewResult[index]
        }
        print("create")
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.scrollDirection = .horizontal
        let collectionFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 130)
        let collection = DogCollectionView(frame: collectionFrame, collectionViewLayout: layout)
        collection.dogDelegate = self
        collection.contentInsetAdjustmentBehavior = .never
        collection.data = datas[index]
        collection.reloadData()
        collectionViewResult.append(collection)
        return collection
    }
    
}


