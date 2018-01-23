//
//  ViewController.swift
//  iOSTaipei
//
//  Created by 蕭文安 on 2018/1/21.
//  Copyright © 2018年 蕭文安. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var exampleOneButton: UIButton!
    @IBOutlet var fadeInDogButton: UIButton!
    @IBOutlet var fadeInLocationButton: UIButton!
    
    
    let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    let transitionManager = NextPageTransitionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextPageEvent(_ sender: UIButton) {
        switch sender {
            
        case exampleOneButton:
            self.exampleOnePage(ShowDogTransitionManager())
            
        case fadeInDogButton:
            self.exampleOnePage(FadeInTransitionManager())
            
        case fadeInLocationButton:
            self.exampleOnePage(FadeInLocationTransitionManager())
            
        default:
            return
        }
        
    }
    
    func exampleOnePage(_ transition:UIViewControllerTransitioningDelegate) {
        let destination = mainSB.instantiateViewController(withIdentifier: "ExampleOneViewController") as! ExampleOneViewController
        destination.transitionManager = transition
        let nav = UINavigationController(rootViewController: destination)
        nav.transitioningDelegate = transitionManager
        self.present(nav, animated: true, completion:nil )
    }

}

