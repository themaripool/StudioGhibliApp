//
//  ViewController.swift
//  StudioGhibliApp
//
//  Created by Mariela Andrade on 27/01/21.
//

import UIKit
import iCarousel

class HomeViewController: UIViewController, iCarouselDataSource {
    
    var infoTest = ["filme 01", "filme 02", "filme 03", "filme 04", "filme 05" ]
    
    @IBOutlet weak var viewName: UIView!
    

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
        homeCarousel.frame = CGRect(x: 0, y: 150, width: view.frame.size.width, height: 450)
        setupTitle()
        //navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.backgroundColor = .clear
    }
    
    func setupTitle(){
        let label = UILabel(frame: CGRect(x: 0, y: 30, width: 200, height: 50))
        label.center = CGPoint(x: 90, y: 100)
        label.textAlignment = .center
        label.text = "Movies"
        label.font = UIFont(name:"ArialRoundedMTBold", size: 40.0)
        view.addSubview(label)
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 5
    }
    
    @objc func goToDetailView(){
        let newViewController =  HomeCollectionViewController(collectionViewLayout: StretchyHeaderLayout())
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 350, height: 450))
        view.backgroundColor = .red
        
        let imgView = UIImageView(frame: view.bounds)
        view.addSubview(imgView)
        imgView.contentMode = .scaleToFill
        imgView.image = UIImage(named: "Banners_placeholder\(index+1)")
        
        
        let tapGesture = UITapGestureRecognizer(target: self , action: #selector(goToDetailView))
        view.addGestureRecognizer(tapGesture)
        
        return view
    }
}
