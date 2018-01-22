//
//  NextPageTransitionManager.swift
//  Bextrip
//
//  Created by 蕭文安 on 2017/8/18.
//  Copyright © 2017年 蕭文安. All rights reserved.
//

import UIKit

class ShowDogTransitionManager: NSObject , UIViewControllerAnimatedTransitioning , UIViewControllerTransitioningDelegate {
    
    let duration = 0.35
    var isPresenting = false
    var snapshot:UIView?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from) else {
            return
        }
        
        guard let toView = transitionContext.view(forKey: .to) else {
            return
        }
        
        let container = transitionContext.containerView
        let width = container.frame.width
        let height = container.frame.height
        snapshot = fromView.snapshotView(afterScreenUpdates: true)
        snapshot?.alpha = 0.5
        if isPresenting {
            toView.frame = CGRect(x: 20, y: -height / 2, width: width - 40, height: height / 2)
            toView.layer.cornerRadius = 10
            toView.clipsToBounds = true
            container.addSubview(snapshot!)
            container.addSubview(toView)
        }else{
            container.addSubview(fromView)
        }
        
        UIView.animate(withDuration: duration, animations: {
            if self.isPresenting {
                toView.frame.origin.y = height / 4
            }else{
                fromView.frame.origin.y = -height / 2
            }
        }, completion: { _ in
            if !self.isPresenting {
                self.snapshot?.removeFromSuperview()
            }
            
            transitionContext.completeTransition(true)
        })
        
        
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //        print("forPresented")
        isPresenting = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //        print("forDismissed")n
        isPresenting = false
        return self
    }
    
    
}

