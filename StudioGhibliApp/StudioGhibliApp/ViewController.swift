//
//  ViewController.swift
//  StudioGhibliApp
//
//  Created by Mariela Andrade on 27/01/21.
//

import UIKit
import iCarousel

class ViewController: UIViewController, iCarouselDataSource {

    var homeCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .rotary
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeCarousel)
        homeCarousel.dataSource = self
       // homeCarousel.autoscroll = -0.3
        
        homeCarousel.frame = CGRect(x: 0, y: 80, width: view.frame.size.width, height: 400)
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 5
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 350, height: 400))
        view.backgroundColor = .red
        
        let imgView = UIImageView(frame: view.bounds)
        view.addSubview(imgView)
        imgView.contentMode = .scaleToFill
        imgView.image = UIImage(named: "Banners_placeholder\(index+1)")
        return view
    }
}
