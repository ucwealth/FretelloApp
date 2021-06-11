//
//  ViewController.swift
//  FretelloApp
//
//  Created by Decagon on 11/06/2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            getSession()
        }
    
    func getSession(){
        let url = "http://codingtest.fretello.com:3000/data/sessions.json"
        AF.request(url).responseJSON{ response in
            print(response)
        }
    }
}

