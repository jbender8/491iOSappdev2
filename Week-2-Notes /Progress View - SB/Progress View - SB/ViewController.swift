//
//  ViewController.swift
//  Progress View - SB
//
//  Created by Xiaoping Jia on 3/24/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var progress: UIProgressView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func start(_ sender: UIButton) {
        indicator.startAnimating()
        let queue = DispatchQueue.global(qos: .background)
        queue.async {
            for i in 0 ... 100 {
                DispatchQueue.main.async {
                    self.progress.progress = Float(i) / 100
                    self.label.text = "\(i)%"
                    if (i == 100) {
                        self.indicator.stopAnimating()
                    }
                }
                usleep(100_000) // microseconds
            }
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = "0%"
    }


}

