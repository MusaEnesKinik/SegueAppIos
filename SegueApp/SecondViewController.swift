//
//  SecondViewController.swift
//  SegueApp
//
//  Created by L60809MAC on 15.02.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var myLabelSecond: UILabel! // 2. ViewController yazan yer
    @IBOutlet weak var nameLabel: UILabel! // İlk sayfada girilen ismin görüneceği yer
    
    var myName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = myName
        
    }
    


}
