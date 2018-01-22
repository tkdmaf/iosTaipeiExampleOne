//
//  ShowDogViewController.swift
//  iOSTaipei
//
//  Created by 蕭文安 on 2018/1/23.
//  Copyright © 2018年 蕭文安. All rights reserved.
//

import UIKit

class ShowDogViewController: UIViewController {
    
    @IBOutlet var dogImageView: UIImageView!
    var dogString:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        dogImageView.image = UIImage(named: dogString)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissEvent(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
