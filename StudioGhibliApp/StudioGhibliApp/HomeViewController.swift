//
//  ViewController.swift
//  StudioGhibliApp
//
//  Created by Mariela Andrade on 27/01/21.
//

import UIKit
import iCarousel

class HomeViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {

    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var infoTitle: UILabel!
    @IBOutlet weak var infoCategory: UILabel!
    
    var currentIndex: Int = -1
    
    var infoTest = ["Meu Amigo Totoro", "Castelo Animado", "Castelo Animado 2", "Vidas ao Vento", "Porco Rosso"]
    
    var homeCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .rotary
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeCarousel)
        homeCarousel.dataSource = self
        homeCarousel.delegate = self
       // homeCarousel.autoscroll = -0.3
        homeCarousel.frame = CGRect(x: 0, y: 150, width: view.frame.size.width, height: 450)
        setupTitle()
        navigationController?.navigationBar.isHidden = true
        infoView.backgroundColor = #colorLiteral(red: 0.4813390544, green: 0.4813390544, blue: 0.4813390544, alpha: 1)
        infoView.layer.cornerRadius = 30
        
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
        let newViewController =  DetailsCollectionViewController(collectionViewLayout: StretchyHeaderLayout())
        self.navigationController?.pushViewController(newViewController, animated: true)
        print("Banners_placeholder\(currentIndex)")
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 350, height: 450))
        view.backgroundColor = .red
        
        let imgView = UIImageView(frame: view.bounds)
        view.addSubview(imgView)
        imgView.contentMode = .scaleToFill
        imgView.image = UIImage(named: "Banners_placeholder\(index+1)")
        
        infoTitle.text = infoTest[0]
        infoCategory.text = "Ação " + "*" + " Aventura"
        
        let tapGesture = UITapGestureRecognizer(target: self , action: #selector(goToDetailView))
        view.addGestureRecognizer(tapGesture)
        
        return view
    }
    
    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
        currentIndex = carousel.currentItemIndex
        infoTitle.text = infoTest[carousel.currentItemIndex]
        print(carousel.currentItemIndex)
    }
    
    
}
