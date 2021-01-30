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
    @IBOutlet weak var infoDate: UILabel!
    @IBOutlet weak var infoRating: UILabel!
    
    
    var currentIndex: Int = -1
    
    var infoTest = [MovieItem(title: "Meu Amigo Totoro", release_date: "2001", rt_score: "78/100"),
                    MovieItem(title: "Castelo Animado", release_date: "1986", rt_score: "95/100"),
                    MovieItem(title: "Castelo Animado 2", release_date: "1986", rt_score: "95/100"),
                    MovieItem(title: "Vidas ao Vento", release_date: "1993", rt_score: "76/100"),
                    MovieItem(title: "Porco Rosso", release_date: "1976", rt_score: "87/100")]
    
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
        homeCarousel.frame = CGRect(x: 0, y: 150, width: view.frame.size.width, height: 450)
        setupTitle()
        navigationController?.navigationBar.isHidden = true
        infoView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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
        
        let gradientView = UIImageView(frame: view.bounds)
        view.addSubview(gradientView)
        gradientView.contentMode = .scaleToFill
        gradientView.image = UIImage(named: "gradient")
      
        
        infoTitle.text = infoTest[0].title
        infoDate.text = infoTest[0].release_date
        infoRating.text = infoTest[0].rt_score
        
        let tapGesture = UITapGestureRecognizer(target: self , action: #selector(goToDetailView))
        view.addGestureRecognizer(tapGesture)
        return view
    }
    
    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
        currentIndex = carousel.currentItemIndex
        infoTitle.text = infoTest[carousel.currentItemIndex].title
        infoDate.text = infoTest[carousel.currentItemIndex].release_date
        infoRating.text = infoTest[carousel.currentItemIndex].rt_score
       // print(carousel.currentItemIndex)
    }
}

struct MovieItem{
    var title: String
    var release_date: String
    var rt_score: String
    
    init(title: String, release_date: String, rt_score: String) {
        self.title = title
        self.release_date = release_date
        self.rt_score = rt_score
    }
    
}
