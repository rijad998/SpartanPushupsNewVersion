//
//  ViewController.swift
//  SpartanPushupsNewVersion
//
//  Created by Rijad Babovic on 25/06/2019.
//  Copyright © 2019 Rijad Babovic. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    fileprivate let mainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.contents = UIImage.loadImageData("bg.png")?.cgImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // layout()
    }
    
    func setup() {
        mainViewModel.delegate = self
    }
}

extension MainViewController: MainViewModelDelegate {
    func returnLevel(level: Level) {
        <#code#>
    }
    
    
}

