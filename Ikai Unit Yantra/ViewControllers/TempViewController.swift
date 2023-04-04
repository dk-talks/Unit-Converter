//
//  TempViewController.swift
//  Ikai Unit Yantra
//
//  Created by Dinesh Sharma on 04/04/23.
//

import UIKit

class TempViewController: UIViewController {

    enum fromUnit {
        case Celcius
        case Kelvin
        case Fahrenheit
    }
    
    enum toUnit {
        case Celcius
        case Kelvin
        case Fahrenheit
    }
    
    var fromUnitValue: fromUnit?
    var toUnitValue: toUnit?
    
    
    @IBOutlet weak var txtFieldLength: UITextField!
    
    @IBOutlet weak var btnMainFromUnit: UIButton!
    
    @IBOutlet weak var btnConvertToUnit: UIButton!
    
    @IBOutlet var btnsMenu: [UIButton]!
    
    
    
    @IBOutlet var btnsToUnitValues: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func btnFromMeterTapped(_ sender: Any) {
        btnMainFromUnit.setTitle("From Celcius", for: .normal)
        fromUnitValue = fromUnit.Celcius
        animateButtons(btn: btnsMenu)
    }
    
    @IBAction func btnFromKiloTapped(_ sender: Any) {
        btnMainFromUnit.setTitle("From Kelvin", for: .normal)
        fromUnitValue = fromUnit.Kelvin
        animateButtons(btn: btnsMenu)
    }
    
    @IBAction func btnFromCentiTapped(_ sender: Any) {
        btnMainFromUnit.setTitle("From CentiMeter", for: .normal)
        fromUnitValue = fromUnit.Fahrenheit
        animateButtons(btn: btnsMenu)
    }
    
    
    //***********************
    
    
    @IBAction func btnToMeterTapped(_ sender: Any) {
        btnConvertToUnit.setTitle("To Celcius", for: .normal)
        toUnitValue = toUnit.Celcius
        animateButtons(btn: btnsToUnitValues)
    }
    
    @IBAction func btnToKiloTapped(_ sender: Any) {
        btnConvertToUnit.setTitle("To Kilometer", for: .normal)
        toUnitValue = toUnit.Kelvin
        animateButtons(btn: btnsToUnitValues)
    }

    @IBAction func btnToCentiTapped(_ sender: Any) {
        btnConvertToUnit.setTitle("To Fahrenheit", for: .normal)
        toUnitValue = toUnit.Fahrenheit
        animateButtons(btn: btnsToUnitValues)
    }
   
    
    @IBAction func btnFromUnit(_ sender: UIButton) {
        animateButtons(btn: btnsMenu)
    }
    
    
    @IBAction func btnToUnitTapped(_ sender: Any) {
        animateButtons(btn: btnsToUnitValues)
    }
    
    private func animateButtons(btn: [UIButton]) {
        UIView.animate(withDuration: 0.3) {
            btn.forEach { button in
                button.isHidden = !button.isHidden
            }
        }
    }
    
    private func convert(temperature: Double, fromUnit: fromUnit, toUnit: toUnit) -> Double {
        switch fromUnit {
        case .Celcius:
            switch  toUnit {
            case .Celcius:
                return temperature
            case .Fahrenheit:
                return (temperature * 1.8) + 32
            case .Kelvin:
                return temperature + 273.15
            }
        case .Fahrenheit:
            switch  toUnit {
            case .Celcius:
                return (temperature - 32) / 1.8
            case .Fahrenheit:
                return temperature
            case .Kelvin:
                let celcius = (temperature - 32) / 1.8
                return celcius + 273.15
            }
        case .Kelvin:
            switch  toUnit {
            case .Celcius:
                return temperature - 273.15
            case .Fahrenheit:
                return (temperature-273.15) * 1.8 + 32
            case .Kelvin:
                return temperature
            }
        }
    }
    
    
    @IBAction func btnConvertNowTapped(_ sender: Any) {
        if let text = txtFieldLength.text, let _ = Double(text),
           let _ = fromUnitValue, let _ = toUnitValue{
            performSegue(withIdentifier: "toTempResultVC", sender: self)
        } else {
            print("not a double")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTempResultVC" {
            if let resultVC = segue.destination as? TempResultViewController {
                if let text = txtFieldLength.text, let fromValue = Double(text),
                    let fromUnit = fromUnitValue, let toUnit = toUnitValue{
                    resultVC.fromUnit = String(describing: fromUnit)
                    resultVC.toUnit = String(describing: toUnit)
                    resultVC.fromValue = fromValue
                    resultVC.toValue = convert(temperature: fromValue, fromUnit: fromUnit, toUnit: toUnit)
                }
            }
        }
    }
    
}
