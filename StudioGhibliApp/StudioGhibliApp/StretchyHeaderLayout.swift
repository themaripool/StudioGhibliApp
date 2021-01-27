//
//  StretchyHeaderLayout.swift
//  StudioGhibliApp
//
//  Created by Mariela Andrade on 25/01/21.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ (attributes) in
            
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader{
                
                guard let collectionView = collectionView else {return}
                
                let contentOffsetY = collectionView.contentOffset.y
                print(contentOffsetY)
                
                let width = collectionView.frame.width
                
                let heigh = attributes.frame.height - contentOffsetY
                
                attributes.frame = CGRect(x: 0, y: 0, width: width, height: heigh)
                
            }
        })
        
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
}
