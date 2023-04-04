//
//  ViewController.swift
//  Ikai Unit Yantra
//
//  Created by Dinesh Sharma on 04/04/23.
//

import UIKit

class LengthViewController: UIViewController {
    
    enum fromUnit {
        case Meter
        case KiloMeter
        case Centimeter
        case Millimeter
    }
    
    enum toUnit {
        case Meter
        case KiloMeter
        case Centimeter
        case Millimeter
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
        
        txtFieldLength.delegate = self
    }
    
    
    @IBAction func btnFromMeterTapped(_ sender: Any) {
        btnMainFromUnit.setTitle("From Meter", for: .normal)
        fromUnitValue = fromUnit.Meter
        animateButtons(btn: btnsMenu)
    }
    
    @IBAction func btnFromKiloTapped(_ sender: Any) {
        btnMainFromUnit.setTitle("From KiloMeter", for: .normal)
        fromUnitValue = fromUnit.KiloMeter
        animateButtons(btn: btnsMenu)
    }
    
    @IBAction func btnFromCentiTapped(_ sender: Any) {
        btnMainFromUnit.setTitle("From CentiMeter", for: .normal)
        fromUnitValue = fromUnit.Centimeter
        animateButtons(btn: btnsMenu)
    }
    
    @IBAction func btnFromMilliTapped(_ sender: Any) {
        btnMainFromUnit.setTitle("From MilliMeter", for: .normal)
        fromUnitValue = fromUnit.Millimeter
        animateButtons(btn: btnsMenu)
    }
    
    //***********************
    
    
    @IBAction func btnToMeterTapped(_ sender: Any) {
        btnConvertToUnit.setTitle("To Meter", for: .normal)
        toUnitValue = toUnit.Meter
        animateButtons(btn: btnsToUnitValues)
    }
    
    @IBAction func btnToKiloTapped(_ sender: Any) {
        btnConvertToUnit.setTitle("To Kilometer", for: .normal)
        toUnitValue = toUnit.KiloMeter
        animateButtons(btn: btnsToUnitValues)
    }

    @IBAction func btnToCentiTapped(_ sender: Any) {
        btnConvertToUnit.setTitle("To Centimeter", for: .normal)
        toUnitValue = toUnit.Centimeter
        animateButtons(btn: btnsToUnitValues)
    }
    
    @IBAction func btnToMilliTapped(_ sender: Any) {
        btnConvertToUnit.setTitle("To Millimeter", for: .normal)
        toUnitValue = toUnit.Millimeter
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
    
    private func convert(length: Double, fromUnit: fromUnit, toUnit: toUnit) -> Double {
        switch fromUnit {
        case .Meter:
            switch  toUnit {
            case .Meter:
                return length
            case .Millimeter:
                return length * 1000
            case .Centimeter:
                return length * 100
            case .KiloMeter:
                return length * 0.001
            }
        case .Millimeter:
            switch  toUnit {
            case .Meter:
                return length * 0.001
            case .Millimeter:
                return length
            case .Centimeter:
                return length * 0.1
            case .KiloMeter:
                return length * 0.000001
            }
        case .Centimeter:
            switch  toUnit {
            case .Meter:
                return length * 0.01
            case .Millimeter:
                return length * 10
            case .Centimeter:
                return length
            case .KiloMeter:
                return length * 0.00001
            }
        case .KiloMeter:
            switch  toUnit {
            case .Meter:
                return length * 1000
            case .Millimeter:
                return length * 1000000
            case .Centimeter:
                return length * 100000
            case .KiloMeter:
                return length
            }
        }
    }
    
    
    @IBAction func btnConvertNowTapped(_ sender: Any) {
        if let text = txtFieldLength.text, let _ = Double(text),
           let _ = fromUnitValue, let _ = toUnitValue{
            performSegue(withIdentifier: "toLengthResultVC", sender: self)
        } else {
            print("not a double")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLengthResultVC" {
            if let resultVC = segue.destination as? LengthResultViewController {
                if let text = txtFieldLength.text, let fromValue = Double(text),
                    let fromUnit = fromUnitValue, let toUnit = toUnitValue{
                    resultVC.fromUnit = String(describing: fromUnit)
                    resultVC.toUnit = String(describing: toUnit)
                    resultVC.fromValue = fromValue
                    resultVC.toValue = convert(length: fromValue, fromUnit: fromUnit, toUnit: toUnit)
                }
            }
        }
    }
    
}

extension LengthViewController: UITextFieldDelegate {
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//
//    }
}

