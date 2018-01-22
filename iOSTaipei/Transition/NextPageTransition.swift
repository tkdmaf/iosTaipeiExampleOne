//
//  NextPageTransitionManager.swift
//  Bextrip
//
//  Created by 蕭文安 on 2017/8/18.
//  Copyright © 2017年 蕭文安. All rights reserved.
//

import UIKit

class NextPageTransitionManager: NSObject , UIViewControllerAnimatedTransitioning , UIViewControllerTransitioningDelegate {
    
    let duration = 0.5
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
        
        let moveLeft = CGAffineTransform(translationX: width, y: 0)
        let moveRight = CGAffineTransform(translationX: width, y: 0)
        if isPresenting {
            toView.transform = moveRight
            snapshot = fromView.snapshotView(afterScreenUpdates: true)
            container.addSubview(toView)
        }
        if snapshot != nil {
            container.addSubview(snapshot!)
        }
        
        //        let animate = CGAffineTransform(translationX: 50, y: 0)
        
        UIView.animate(withDuration: duration, animations: {
            if self.isPresenting {
                self.snapshot?.transform = CGAffineTransform(translationX: -width, y: 0)
                toView.transform =  CGAffineTransform.identity
            }else{
                self.snapshot?.transform = CGAffineTransform(translationX: 0, y: 0)
                fromView.transform = moveLeft
            }
        }, completion: { _ in
            
            self.snapshot?.removeFromSuperview()
            
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
