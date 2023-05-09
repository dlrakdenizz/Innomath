//
//  LevelsVC.swift
//  Innomath2
//
//  Created by Dilara Akdeniz on 29.03.2023.
//

import UIKit


class LevelsVC: UIViewController {
    
    let avatars = ["Ayşe", "Selin", "Eylül", "Azra", "Zeynep", "Faruk", "Mehmet", "Mustafa", "Ahmet"]
    
    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var chooseAvatar: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var nameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
       
    }
    

    @IBAction func easyButton(_ sender: Any) {
        performSegue(withIdentifier: "toEasyVC", sender: nil)
    }
    
    
    @IBAction func intermediateButton(_ sender: Any) {
        performSegue(withIdentifier: "toIntermediateVC", sender: nil)
        
    }
    
    
    @IBAction func hardButton(_ sender: Any) {
        performSegue(withIdentifier: "toHardVC", sender: nil)
    }
    
    
    
}

extension LevelsVC: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return avatars.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return avatars[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chooseAvatar.image = UIImage(named: avatars[row])
    }
    
}

    

