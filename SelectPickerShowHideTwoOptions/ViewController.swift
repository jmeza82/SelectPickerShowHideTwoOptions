//
//  ViewController.swift
//  SelectPickerShowHideTwoOptions
//
//  Created by Juan Meza on 5/3/18.
//  Copyright © 2018 Tech-IN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    
    let models = ["iPhone 7", "iPhone 7 Plus"]
    let colors = ["Gold", "Rose Gold", "Black", "Jet Black", "Silver"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let modelPickerView = UIPickerView()
        
        modelPickerView.delegate = self
        
        modelPickerView.tag = 1
        
        modelTextField.inputView = modelPickerView
        
        let colorPickerView = UIPickerView()
        
        colorPickerView.delegate = self
        
        colorPickerView.tag = 2
        
        colorTextField.inputView = colorPickerView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 1 {
            return models.count
        } else if pickerView.tag == 2 {
            return colors.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 1{
            return models[row]
        } else if pickerView.tag == 2 {
            return colors[row]
        }
        
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            modelTextField.text = models[row]
        }else if pickerView.tag == 2 {
            colorTextField.text = colors[row]
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }


}

