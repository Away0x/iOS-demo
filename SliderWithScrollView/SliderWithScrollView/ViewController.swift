//
//  ViewController.swift
//  SliderWithScrollView
//
//  Created by 吴彤 on 2021/4/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [SlideView] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = createSlides()
        setupSlidesScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl) // view 推到最前层级
    }

    func createSlides() -> [SlideView] {
        let slide1 = Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)?.first as! SlideView
        slide1.imageView.image = UIImage(named: "ic_onboarding_1")
        slide1.titleView.text = "A real-life bear"
        slide1.descView.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        let slide2 = Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)?.first as! SlideView
        slide2.imageView.image = UIImage(named: "ic_onboarding_2")
        slide2.titleView.text = "A real-life bear"
        slide2.descView.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        let slide3 = Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)?.first as! SlideView
        slide3.imageView.image = UIImage(named: "ic_onboarding_3")
        slide3.titleView.text = "A real-life bear"
        slide3.descView.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        let slide4 = Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)?.first as! SlideView
        slide4.imageView.image = UIImage(named: "ic_onboarding_4")
        slide4.titleView.text = "A real-life bear"
        slide4.descView.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        
        let slide5 = Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)?.first as! SlideView
        slide5.imageView.image = UIImage(named: "ic_onboarding_5")
        slide5.titleView.text = "A real-life bear"
        slide5.descView.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        return [slide1, slide2, slide3, slide4, slide5]
    }
    
    func setupSlidesScrollView(slides: [SlideView]) {
        scrollView.contentSize.width = view.frame.width * CGFloat(slides.count)
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: scrollView.frame.width * CGFloat(i), y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
}

extension ViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
    
        /* below code scales the imageview on paging the scrollview */
        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        
        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
            
            slides[0].imageView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
            slides[1].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
            
        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
            slides[1].imageView.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
            slides[2].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
            
        } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
            slides[2].imageView.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
            slides[3].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
            
        } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
            slides[3].imageView.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
            slides[4].imageView.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
        }
    }
  
}
