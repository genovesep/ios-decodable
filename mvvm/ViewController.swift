//
//  ViewController.swift
//  mvvm
//
//  Created by Guarneri Ferreira Genovese, Piero on 27/06/18.
//  Copyright © 2018 Piero Genovese. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MainService.sharedInstance.getCourses()
        //let myCourse = Course(id: 1, name: "My Course", link: "some link", imageUrl: "some image url")
        //print(myCourse)
    }


}

