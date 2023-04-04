//
//  IntroViewController.swift
//  Ikai Unit Yantra
//
//  Created by Dinesh Sharma on 04/04/23.
//

import UIKit

class IntroViewController: UIViewController {
    
    let scrollView = UIScrollView()
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var btnStart: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnStart.isEnabled = false
        pageControl.isUserInteractionEnabled = true
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_sender:)), for: .valueChanged)
        scrollView.backgroundColor = .clear
//        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        scrollView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: pageControl.frame.minY)
        
        if scrollView.subviews.count == 2 {
            configureScrollView()
        }
    }
    
    @objc private func pageControlDidChange(_sender: UIPageControl) {
        
        let current = _sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
        
    }
    
    private func configureScrollView() {
        
        
        scrollView.contentSize = CGSize(width: view.frame.size.width * 3, height: scrollView.frame.size.height)
        
        scrollView.isPagingEnabled = true
        
        let introImages: [String] = [
            "intro1",
            "intro2",
            "intro3"
        ]
        
        let introLabels: [String] = [
            "Interactive User Interface for Data Input!",
            "Gives back one word Answer without making things complicated!",
            "Having beatiful Wallpapers with nice animation effects which you can share!"
        ]
        
        for x in 0..<3 {
            
            let page = UIView()
            page.backgroundColor = .clear
            
            
            
            page.frame = CGRect(x: CGFloat(x) * view.frame.size.width, y: 0, width: view.frame.size.width, height: pageControl.frame.maxY-100)
            
            let imageName = introImages[x]
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image)
            
            imageView.frame = CGRect(x: 0, y: view.frame.height * 0.10, width: view.frame.size.width, height: view.frame.height * 0.5)
            imageView.contentMode = .scaleAspectFit
            page.addSubview(imageView)
            

            let introLabel = UILabel()
            
            introLabel.text = introLabels[x]
            introLabel.frame = CGRect(x: 30, y: Int(imageView.frame.maxY) , width: Int(view.frame.size.width * 0.8), height: 100)
            
            introLabel.numberOfLines = 0
            introLabel.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
            introLabel.textAlignment = .center
            introLabel.textColor = .white
            
            
           
            page.addSubview(introLabel)
            
            scrollView.addSubview(page)
            
                
                
            
        }
            
            
    }
    
    
    
    

}

extension IntroViewController: UIScrollViewDelegate {

    // for changing the page number (dots below) when user scrolls.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x)) / Float(scrollView.frame.size.width))
        if(pageControl.currentPage == 2) {
            btnStart.isEnabled = true
        }
        
    }


    

}
