//
//  TabbarViewController.swift
//  MyProject
//
//  Created by Anton Akhmedzyanov on 28.03.2023.
//

import UIKit

final class TabbarViewController: UITabBarController {

    var person: Person!
    override func viewDidLoad() {
        super.viewDidLoad()
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let formTableVC = viewControllers?.first as? FormTableViewController else { return }
        guard let recomentVC = viewControllers?.last as? RecomentViewController else { return }
        formTableVC.person = person
    }
    

}
