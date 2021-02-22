//
//  ViewController.swift
//  ImagePrevNextView
//
//  Created by 최지연 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    var maxImage = 3
    var numImage = 1

    @IBOutlet var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let image = "1.jpeg"
        imgView.image = UIImage(named: image)
    }
    @IBAction func btnPrev(_ sender: UIButton) {
        numImage = numImage - 1
        if ( numImage < 1){
            numImage = maxImage
        }
        let imageName = String(numImage) + ".jpeg"
        imgView.image = UIImage(named: imageName)
    }
    
    @IBAction func brnNext(_ sender: UIButton) {
        numImage = numImage + 1
        if(numImage > maxImage) {
            numImage = 1
        }
        let imageName = String(numImage) + ".jpeg"
        imgView.image = UIImage(named: imageName)
    }
    
}

