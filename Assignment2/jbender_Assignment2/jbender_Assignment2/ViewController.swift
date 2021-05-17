//
//  ViewController.swift
//  jbender_Assignment2
//
//  Created by Jessica Bender on 4/14/21.
//

import UIKit
import SwiftyJSON
import Alamofire


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        makeCTArequest()
    }
    

    func makeCTArequest() {
        let key = "key=94c40c326dfc44e5813ebad17c7b2501"
        let rout = "rt=red"
        let mapid = "mapid=41230"
        var url = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?outputType=JSON&"
        url.append(key)
        url.append("&")
        url.append(rout)
        url.append("&")
        url.append(mapid)
        
        AF.request(url).responseJSON{ response in debugPrint(response)
            
            print(response.request)
            
        }
        
        


}
}
