//
//  NextPageTransitionManager.swift
//  Bextrip
//
//  Created by 蕭文安 on 2017/8/18.
//  Copyright © 2017年 蕭文安. All rights reserved.
//

import UIKit

class ShowDogTransitionManager: NSObject , UIViewControllerAnimatedTransitioning , UIViewControllerTransitioningDelegate {
    
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
        let height = container.frame.height
        
//        snapshot?.alpha = 0.5
        if isPresenting {
            snapshot = fromView.snapshotView(afterScreenUpdates: true)
            toView.frame = CGRect(x: 20, y: -height / 2, width: width - 40, height: height / 2)
            toView.layer.cornerRadius = 10
            toView.clipsToBounds = true
            fromView.alpha = 0
            toView.alpha = 0
            container.addSubview(snapshot!)
            container.addSubview(toView)
        }else{
            container.addSubview(toView)
            container.addSubview(fromView)
        }
        
        UIView.animate(withDuration: duration, animations: {
            if self.isPresenting {
                toView.frame.origin.y = height / 4
                self.snapshot?.alpha = 0.5
                toView.alpha = 1.0
            }else{
                fromView.frame.origin.y = -height / 2
                fromView.alpha = 0
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
        isPresenting = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
    
    
}

