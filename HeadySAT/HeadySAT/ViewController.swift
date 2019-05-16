//
//  ViewController.swift
//  HeadySAT
//
//  Created by Ravindra Kumbhar on 16/05/19.
//  Copyright © 2019 Ravindra Kumbhar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    private let apiService = APIService()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        apiService.fetchCategories(by:URL(string: BASE_URL)!) { (apiResult) in
            print("result \(apiResult)")
        }
    }
    
}

