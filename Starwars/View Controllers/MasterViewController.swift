//
//  ViewController.swift
//  Starwars
//
//  Created by Admin on 7/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa



class MasterViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    lazy var viewModel = ItemsViewModel(parent: self)
    
    private let disposeBag = DisposeBag()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView
        .rx
        .itemSelected
            .subscribe(onNext: { [weak self] ip in
                self?.viewModel.showItem(at: ip)
                }
        ).disposed(by: disposeBag)
        
        viewModel
            .terms
            .bind(to: collectionView.rx.items(
                cellIdentifier: "CollectionCell",
                cellType: TermTableViewCell.self))
            { row, item, cell in
                cell.configure(with: item)
        }.disposed(by: disposeBag)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        viewModel.prepare(for: segue, sender: sender)
    }


}



