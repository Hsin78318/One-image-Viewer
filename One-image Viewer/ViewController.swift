//
//  ViewController.swift
//  One-image Viewer
//
//  Created by Chen Hsin on 2018/6/19.
//  Copyright © 2018年 Chen Hsin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIScrollViewDelegate, UIImagePickerControllerDelegate {


    @IBOutlet weak var scrollView: UIScrollView!
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        imageView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
        imageView.image = UIImage(named: "icon_photo")
//        imageView.isUserInteractionEnabled = true
        scrollView.addSubview(imageView)
        
    }
    
    
    @IBAction func selectPictureButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        imageView.contentMode = UIViewContentMode.center
        
        imageView.frame = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
        
        scrollView.contentSize = image.size
        
        let scrollViewFrame = scrollView.frame
        let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
       
        let minScale = min(scaleHeight, scaleWidth)
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 1
        scrollView.zoomScale = minScale
        
        centerScrollViewContents()
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    
    func setZoomScale() {
        let imageViewSize = imageView.bounds.size
        let scrollViewSize = scrollView.bounds.size
        let widthScale = scrollViewSize.width / imageViewSize.width
        let heightScale = scrollViewSize.height / imageViewSize.height
        
        scrollView.minimumZoomScale = min(widthScale, heightScale)
        scrollView.zoomScale = 1.0
    }
    
    
    func centerScrollViewContents() {
        let boundsSize = scrollView.bounds.size
        var contentFrame = imageView.frame
        
        if contentFrame.size.width < boundsSize.width {
            contentFrame.origin.x = (boundsSize.width - contentFrame.size.width) / 2
        }
        else {
            contentFrame.origin.x = 0
        }
        
        if contentFrame.size.height < boundsSize.height {
            contentFrame.origin.y = (boundsSize.height - contentFrame.size.height) / 2
            
        }
        else {
            contentFrame.origin.y = 0
        }
        
        imageView.frame = contentFrame
        
    }
    
    
    
    func scrollViewDidZoom( scrollView: UIScrollView) {
        centerScrollViewContents()
    }
    
    func viewForZoominInScrollview(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
//    func imagePickerControllerDidCancel(_ Picker: UIImagePickerController) {
//        dismiss(animated: true, completion: nil)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    



    
    
    
    
    
}

