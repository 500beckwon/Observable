//
//  ViewController.swift
//  Observable
//
//  Created by ByungHoon Ann on 2022/12/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    
    var viewModel = MyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.title.subscribe { value in
            DispatchQueue.main.async { [weak self] in
                self?.testLabel.text = value
            }
        }
        
        // 1초 후에 viewModel.title.value 값 변경해서 label 값 바뀌는 것 확인
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.viewModel.title.value = "500beckwon"
        }
    }
    
    
}

