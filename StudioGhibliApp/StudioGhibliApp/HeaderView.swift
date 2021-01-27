//
//  HeaderView.swift
//  StudioGhibliApp
//
//  Created by Mariela Andrade on 25/01/21.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    let imageView: UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "Banners_placeholder5"))
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
      
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red
        
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
