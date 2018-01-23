//
//  ShowDogViewController.swift
//  iOSTaipei
//
//  Created by 蕭文安 on 2018/1/23.
//  Copyright © 2018年 蕭文安. All rights reserved.
//

import UIKit

class ShowDogViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dogImageView: UIImageView!
    
    var dogIndex : Int = 0
    var dogsDatas : [String]!
    var windowWidth : CGFloat!
    var snapShot: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = "\(dogIndex + 1) / \(dogsDatas.count)"
        dogImageView.image = UIImage(named: dogsDatas[dogIndex])
        self.setSwipeDirection()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissEvent(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setSwipeDirection() {
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeAction(_:)))
        leftSwipe.direction = .left
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeAction(_:)))
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(leftSwipe)
        self.view.addGestureRecognizer(rightSwipe)
    }
    
    @objc func swipeAction(_ sender:UISwipeGestureRecognizer) {
        windowWidth = (self.view.window?.frame.width)!
        snapShot = self.view.snapshotView(afterScreenUpdates: true)
        self.view.window?.addSubview(snapShot!)
        snapShot?.frame = self.view.frame
        
        switch sender.direction {
            
        case .left:
            self.leftAnimation()
            
            
        case .right:
            self.rightAnimation()
            
        default:
            return
        }
        
    }
    
    func leftAnimation(){
        guard dogIndex < (dogsDatas.count - 1) else {
            dogIndex = dogsDatas.count - 1
            snapShot?.removeFromSuperview()
            return
        }
        dogIndex += 1
        self.executeAnimation(width: windowWidth)
    }
    
    func rightAnimation(){
        guard dogIndex > 0 else {
            dogIndex = 0
            snapShot?.removeFromSuperview()
            return
        }
        dogIndex -= 1
        self.executeAnimation(width: -windowWidth)
    }
    
    func executeAnimation(width:CGFloat) {
        self.titleLabel.text = "\(dogIndex + 1) / \(dogsDatas.count)"
        self.dogImageView.image = UIImage(named: dogsDatas[dogIndex])
        self.view.frame.origin.x = width + 20
        
        UIView.animate(withDuration: 0.35, animations: {
            self.view.frame.origin.x = 20
            self.snapShot?.frame.origin.x = -width + 20
        },completion:{ _ in
            self.snapShot?.removeFromSuperview()
        })
    }
    
}
