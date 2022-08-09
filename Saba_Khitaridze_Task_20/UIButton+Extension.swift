//
//  UIButton+Extension.swift
//  Saba_Khitaridze_Task_20
//
//  Created by Saba Khitaridze on 09.08.22.
//

import UIKit


extension UIButton {
    func changeTitleIf(isPressed: inout Bool) {
        if isPressed {
            self.setTitle("Calculate Prime Numbers", for: .normal)
            self.tintColor = .systemBlue
            isPressed = false
        } else {
            self.setTitle("Calculating...", for: .normal)
            self.tintColor = .lightGray
            isPressed = true
        }
    }
}
