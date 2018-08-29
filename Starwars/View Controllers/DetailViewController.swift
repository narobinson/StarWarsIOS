//
//  DetailViewController.swift
//  Starwars
//
//  Created by Admin on 7/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Kingfisher
class DetailViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var item:Item?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize.height = 1000
        scrollView.contentSize.width = UIScreen.main.bounds.width
        titleLabel.text = item?.title
        descriptionLabel.text = item?.description
        dateLabel.text = item?.dateString
        let imageURL = URL(string: (item?.image) ?? "")
        imageView.kf.setImage(with: imageURL, placeholder: UIImage(named: "StarWarsDefault"))
        
    }
    @IBAction func shareButton(_ sender: Any) {
        
        let activityVC = UIActivityViewController(activityItems: [item?.description], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
