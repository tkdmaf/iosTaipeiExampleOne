//
//  ShowViewController.swift
//  iOSTaipei
//
//  Created by 蕭文安 on 2018/1/23.
//  Copyright © 2018年 蕭文安. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        print(contentView.frame)
        scrollView.addSubview(contentView)
        contentView.frame.size.width = self.view.frame.width
        scrollView.contentSize = contentView.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
