//
//  NextPageTransitionManager.swift
//  Bextrip
//
//  Created by 蕭文安 on 2017/8/18.
//  Copyright © 2017年 蕭文安. All rights reserved.
//

import UIKit

class FadeInTransitionManager: NSObject , UIViewControllerAnimatedTransitioning , UIViewControllerTransitioningDelegate {
    
    let duration = 0.75
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
        let scaleOut = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        if isPresenting {
            snapshot = fromView.snapshotView(afterScreenUpdates: true)
            
            toView.frame = CGRect(x: 20, y:  height / 4, width: width - 40, height: height / 2)
            toView.layer.cornerRadius = 10
            toView.clipsToBounds = true
            fromView.alpha = 0
            toView.alpha = 0
            toView.transform = scaleOut
            container.addSubview(snapshot!)
            container.addSubview(toView)
        }else{
            container.addSubview(toView)
            container.addSubview(fromView)
        }
        
        
        
        UIView.animate(withDuration: duration, animations: {
            if self.isPresenting {
                self.snapshot?.alpha = 0.5
                toView.alpha = 1.0
                toView.transform = CGAffineTransform.identity
            }else{
                fromView.alpha = 0
                fromView.transform = scaleOut
                toView.alpha = 1.0
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


