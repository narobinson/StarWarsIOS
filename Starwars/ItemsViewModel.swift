//
//  TermsViewModel.swift
//  Starwars
//
//  Created by Admin on 7/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


final class ItemsViewModel{
    
    
    let terms = BehaviorRelay<[Item]>(value: [])
    
    let viewController:UIViewController?
    
    init(parent:UIViewController){
        self.viewController = parent
        NetworkService.shared.getItems(){ items, error in
            //TODO: publish error
            self.terms.accept(items)
        }
    }
    
    
    func showItem(at ip: IndexPath){
        let item = terms.value[ip.row]
        viewController?.performSegue(withIdentifier: "ShowDetail", sender: item)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard
                let nav = segue.destination as? UINavigationController,
                let vc = nav.topViewController as?  DetailViewController,
                let item = sender as? Item
                else{
                    return
            }
        vc.item = item
}

}

