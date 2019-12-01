//
//  ViewController.swift
//  study
//
//  Created by Мария on 03.11.2019.
//  Copyright © 2019 Мария. All rights reserved.
//



//this is an educational project. Its aim is to try different features.
import UIKit

class ViewController: UIViewController {
    
    //A Switch object is claimed
    let newSwitch = UISwitch()
//
//    // Another Switch object is claimed
//    let anotherSwitch = UISwitch()
    
    
    // Picker is claimed - a range of choices
    let picker = UIPickerView()
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // For picker
        self.picker.center = self.view.center
        self.view.addSubview(self.picker)
        self.picker.dataSource = self
        self.picker.delegate = self
        
        //A Switch object is created. Its' place on the screen is set
        self.newSwitch.frame = CGRect(x: 100, y: 100, width: 0, height: 0)
        self.view.addSubview(self.newSwitch)
//
//        //Creation of anotherSwitch
//        self.anotherSwitch.frame = CGRect.zero
//        self.view.addSubview(self.anotherSwitch)
//
//        //Determination of the aSw position
//        self.anotherSwitch.center = self.view.center
//
//        //Changing properties od aSw
//        self.anotherSwitch.tintColor = UIColor.magenta
//        self.anotherSwitch.thumbTintColor = UIColor.green
//        self.anotherSwitch.onTintColor = UIColor.blue
//
        // newSwitch is set on at the start
        self.newSwitch.setOn(true, animated: true)
        
        // Target is claimed
        self.newSwitch.addTarget(self, action: #selector(modeChanged(paramTarg:)), for: .valueChanged)
    }
    
    // new method: reflects the change in the Switch mode
    @objc func modeChanged(paramTarg: UISwitch) {
        // Check of the Sw mode
        if paramTarg.isOn {
            print("Sw is on")
        } else {
            print("Sw is off")
        }
    }
    
    //button is added
    @IBAction func alertButton(_ sender: Any) {
        //label is added
        self.resultLabel.text = "Ваше ФИО: "
        //method "allert" is called
        self.alert(title: "Обязательное поле", text: "Введите свои ФИО", style: .alert)
    }
    
    //method "allert"
    func alert(title: String, text: String, style: UIAlertControllerStyle) {
        
        let alertController = UIAlertController(title: title, message: text, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default) { (alertAction) in
            self.resultLabel.text! += (alertController.textFields?.first?.text)! + "."
        }
        alertController.addTextField { (text) in
            
        }
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
}

// create an extension
extension ViewController:  UIPickerViewDataSource {
    //number of components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //number of rows in the components
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = "row = \(row)"
        
        return result
    }
}
