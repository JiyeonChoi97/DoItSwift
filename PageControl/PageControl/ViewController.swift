//
//  ViewController.swift
//  PageControl
//
//  Created by 최지연 on 2021/04/13.
//

import UIKit

var images = [ "1.jpg", "2.jpg", "3.jpg", "4.jpg",
               "5.jpg", "6.jpg", "7.jpg"]

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = images.count // 페이지 컨트롤의 전체 페이지 수
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        imgView.image = UIImage(named: images[0])
    }

    @IBAction func pageChanges(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
}

