//
//  TermTableViewCell.swift
//  Starwars
//
//  Created by Admin on 7/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

final class TermTableViewCell:RxCollectionCell {
    
    let identifier = "CollectionCell"
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(with item: Item){
        titleLabel.text = item.title
        dateLabel.text = item.dateString
        locationLabel.text = (item.locationline1 ?? "Na") + ", " + (item.locationline2 ?? "Na")
        let imageURL = URL(string: (item.image) ?? "")
        imageView.kf.setImage(with: imageURL , placeholder:UIImage(named: "placeholder_nomoon-2"))
    }

}
