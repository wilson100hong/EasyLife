//
//  ViewController.swift
//  Helloworld
//
//  Created by Wilson Hong on 3/22/16.
//  Copyright © 2016 EasyLife. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputPriceTextField: UITextField!
    @IBOutlet weak var taxedSwitch: UISwitch!
    @IBOutlet weak var finalPriceLabel: UILabel!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    @IBOutlet weak var OuterLabel: UILabel!
    
    @IBAction func onInputPriceChange(sender: UITextField) {
        updateFinalPrice();
    }
    
    @IBAction func onTaxedSwitchChange(sender: UISwitch) {
        updateFinalPrice();
    }
    
    @IBAction func onTipSegmentChange(sender: UISegmentedControl) {
        updateFinalPrice();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        OuterLabel.layer.borderWidth = 0.5;
        OuterLabel.layer.borderColor = UIColor.lightGrayColor().CGColor;
        inputPriceTextField.becomeFirstResponder();
    }

    
    func updateFinalPrice() {
        let caTaxRate = 0.0875;
        if inputPriceTextField.text != nil {
            var oringalPrice = NSString(string: (inputPriceTextField.text)!).doubleValue;
            if (taxedSwitch.on) {
                oringalPrice /= (1.0 + caTaxRate);
            }
            
            let tipRate = Double(tipSegment.selectedSegmentIndex * 5 + 10) / 100.0;
            let finalPrice = oringalPrice * (1.0 + caTaxRate + Double(tipRate));
            
            let formatter = NSNumberFormatter()
            formatter.minimumFractionDigits = 2;
            formatter.maximumFractionDigits = 2;
            finalPriceLabel.text = "$ " + formatter.stringFromNumber(finalPrice)!;
        }

    }
}

