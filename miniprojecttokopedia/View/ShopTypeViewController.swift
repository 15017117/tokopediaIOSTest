//
//  ShopTypeViewController.swift
//  miniprojecttokopedia
//
//  Created by Ivan Lipotan on 14/5/19.
//

import UIKit
import  DLRadioButton

class ShopTypeViewController: UIViewController {

    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
//        checkButton.iconSize = 20
//        checkButton.isIconSquare = true
//        checkButton.iconColor = UIColor.gray
//        checkButton.indicatorColor = UIColor.black
//        checkButton1.iconSize = 20
//        checkButton1.isIconSquare = true
//        checkButton1.iconColor = UIColor.gray
//        checkButton1.indicatorColor = UIColor.black
//
        
    }
    
    
    var unchecked = true
    
    @IBAction func tick(sender: UIButton) {
        if unchecked {
         sender.setImage(UIImage(named:"check.png"), for: .normal)
            unchecked = false
        }
        else {
            sender.setImage( UIImage(named:"uncheck.png"), for: .normal)
            unchecked = true
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
