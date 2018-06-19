//
//  TestViewController.swift
//  One-image Viewer
//
//  Created by Chen Hsin on 2018/6/19.
//  Copyright © 2018年 Chen Hsin. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, UIScrollViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate  {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var changePhotoButton: UIButton!
    
    
    @IBAction func changePhotoButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        changePhotoButton.setTitleColor(UIColor.white, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 2.0
        
       
        
        
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        scrollView.contentSize = CGSize(width:2000, height:2000)
        imageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    
    func viewForZoominInScrollview(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
   
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
