//
//  HeaderView.swift
//  StudioGhibliApp
//
//  Created by Mariela Andrade on 25/01/21.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    let imageView: UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "Banners_placeholder3"))
        // image size = 500x650
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
    
    let visualEffectView = UIVisualEffectView(effect: nil)
    let animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        
        addSubview(imageView)
        imageView.fillSuperview()
        setupBlur()
    }
    
    func setupBlur(){
        animator.addAnimations {
            self.visualEffectView.effect = UIBlurEffect(style: .regular)
        }
        self.addSubview(visualEffectView)
        visualEffectView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
