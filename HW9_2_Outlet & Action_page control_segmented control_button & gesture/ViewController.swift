//
//  ViewController.swift
//  HW9_2_Outlet & Action_page control_segmented control_button & gesture
//
//  Created by Dawei Hao on 2023/3/19.
//

import UIKit

class ViewController: UIViewController {
    
    let pics = ["product_1", "product_2", "product_3", "product_4"]
    let coverPics = ["Cover_1", "Cover_2", "Cover_3"]
    var index = 0
  
    @IBOutlet weak var productImageVIew: UIImageView! {
        didSet{
            productImageVIew.layer.cornerRadius = 15
        }
    }
    
    @IBOutlet weak var coverImagview: UIImageView! {
        didSet {
            coverImagview.layer.cornerRadius = 15
            
        }
    }
    
    @IBOutlet weak var coverPageControl: UIPageControl!
    @IBOutlet weak var productPageControl: UIPageControl!
    @IBOutlet weak var choiceSegmentedControl: UISegmentedControl! {
        didSet {
            //設置segmentControl 顏色
            let normalAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemPink]
            let selectedAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            choiceSegmentedControl.setTitleTextAttributes(normalAttributes, for: .normal)
            choiceSegmentedControl.setTitleTextAttributes(selectedAttributes, for: .selected)
        }
    }
    @IBOutlet weak var perviousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //func for update segment ontrol/page control/button
    func UIUpdateOne() {
        productImageVIew.image = UIImage(named: pics[index])
        choiceSegmentedControl.selectedSegmentIndex = index
        productPageControl.currentPage = index
    }
    // Action for next page for productImageView
    @IBAction func next(_ sender: Any) {
        index = ( index + 1 ) % pics.count
        UIUpdateOne()
        print(index)
    }
    // Action for previous page for productImageView
    @IBAction func pre(_ sender: Any) {
        index = ( index + pics.count - 1 ) % pics.count
        UIUpdateOne()
        print(index)
    }

    @IBAction func coverPageChange(_ sender: UIPageControl) {
        index = sender.currentPage
        let display = coverPics[index]
        print(index, display)
        coverImagview.image = UIImage(named: display)
    }

    @IBAction func coverPagePre(_ sender: Any) {
        index = (index + coverPics.count - 1 ) % coverPics.count
        let display = coverPics[index]
        UIUpdateTwo()
        print(index, display)
    }
    
    @IBAction func coverPageNext(_ sender: Any) {
        index = (index + 1 ) % coverPics.count
        let display = coverPics[index]
        UIUpdateTwo()
        print(index, display )
    }
    func UIUpdateTwo() {
        coverImagview.image = UIImage(named: coverPics[index])
    }
}

