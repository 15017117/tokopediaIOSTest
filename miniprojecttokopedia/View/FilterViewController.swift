//
//  FilterViewController.swift
//  miniprojecttokopedia
//
//  Created by Ivan Lipotan on 10/5/19.
//

import UIKit
import RangeSeekSlider

class FilterViewController: UIViewController {
    
    
    var getMaxValue = 0
    var getMinValue = 0
    
    
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var view3: UIView!
    
    
    @IBOutlet weak var minimumPrice: UILabel!
    @IBOutlet weak var maximumPrice: UILabel!
   
    @IBOutlet fileprivate weak var rangeSlider: RangeSeekSlider!
    
    @IBOutlet weak var wholeSaleSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
      
       setup()
        
        
    }
    private func setup(){
        
        rangeSlider.delegate = self
        
//       maximumPrice.text = ""
//
//        minimumPrice.text = String(getMinValue)
//
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetBtn(_ sender: UIButton) {
        rangeSlider.maxValue = 8000000
        rangeSlider.minValue = 100
       rangeSlider.selectedMinValue = 100
        rangeSlider.selectedMaxValue = 8000000
        
        minimumPrice.text = "100"
        maximumPrice.text = "8000000"
        
        wholeSaleSwitch.isOn = true
        
        
    }
    
    

    @IBAction func applyBtn(_ sender: UIButton) {
        print("GET THE MAX VALUE : \(getMaxValue), GET MIN : \(getMinValue)")
        
        
        
    }

    
    
    
}

extension FilterViewController: RangeSeekSliderDelegate{
    
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        if slider === rangeSlider {
            
            
            let formatter = NumberFormatter()
            formatter.locale = Locale(identifier: "id")
            
            
            maximumPrice.text = formatter.string(from: NSNumber(value: Int(maxValue)))
            
             minimumPrice.text = formatter.string(from: NSNumber(value: Int(minValue)))
            
            minimumPrice.text = String(Int(minValue))
            print("Standard slider updated. Min Value: \(minValue) Max Value: \(maxValue)")
            
            getMaxValue = Int(maxValue)
            getMinValue = Int(minValue)
            
            //        } else if slider === rangeSliderCurrency {
            //            print("Currency slider updated. Min Value: \(minValue) Max Value: \(maxValue)")
            //        } else if slider === rangeSliderCustom {
            //            print("Custom slider updated. Min Value: \(minValue) Max Value: \(maxValue)")
            //        }
        }
        
        func didStartTouches(in slider: RangeSeekSlider) {
            print("did start touches")
        }
        
        func didEndTouches(in slider: RangeSeekSlider) {
            print("did end touches")
        }
        
        
    }
}

