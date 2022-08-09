//
//  ViewController.swift
//  Saba_Khitaridze_Task_20
//
//  Created by Saba Khitaridze on 09.08.22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var calculateBtn: UIButton!
    
    //MARK: - Vars
    private let numArray = Array(1...100_000)
    private let backgroudnQueue = DispatchQueue.global(qos: .background)
    private var isCalculating = false
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBActions
    
    @IBAction func CalculatePrimeNumbers(_ sender: UIButton) {
        calculateBtn.changeTitleIf(isPressed: &isCalculating)
        calculateBtn.isUserInteractionEnabled = false
        backgroudnQueue.async {
            self.getPrimeNumbersFrom(array: self.numArray)
        }
        
    }
    
    //MARK: - Methods
    
    private func getPrimeNumbersFrom(array: [Int]) {
        for element in array {
            guard checkPrime(num: element) else { continue }
            //sleep(1)
            print(element)
        }
        DispatchQueue.main.async {
            self.calculateBtn.changeTitleIf(isPressed: &self.isCalculating)
            self.calculateBtn.isUserInteractionEnabled = true
        }
    }
    
    private func checkPrime(num: Int) -> Bool {
        guard num != 2 else { return true }
        guard num >= 2, num % 2 != 0 else { return false }
        return !stride(from: 3, through: Int(sqrt(Double(num))), by: 2).contains { num % $0 == 0 }
    }
    
}
