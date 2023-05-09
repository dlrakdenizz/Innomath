//
//  ViewController.swift
//  Innomath2
//
//  Created by Dilara Akdeniz on 29.03.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var text = ""
    let synthesizer = AVSpeechSynthesizer()
    
    let userDefaults = UserDefaults.standard
    let shakeKey = "shakeKey"
    
    var timer = Timer()
    var counter = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        speech(text: "Görme yetersizliğiniz varsa lütfen telefonu sallayınız.")
        
                func checkSwiftState(){
            if userDefaults.bool(forKey: shakeKey){
        
            }
        
                
        }
         
         counter = 8 // Uygulama kullanıcının sallama fonksiyonunu gerçekleştirmesi için 8 saniye bekliyor.
         timer = Timer.scheduledTimer(timeInterval: 1, target: self
             ,selector: #selector(timerFunction), userInfo: nil, repeats: true)
        
    }
    
    
    
    
    // Uygulamanın görme engelli kısmında kullanılan sesli dönüt veren metod
    
    func speech(text : String) {
        let utterance = AVSpeechUtterance(string: text)
        //var speechUtterance : AVSpeechUtterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "tr-TR")
        utterance.rate = 0.5
        
        synthesizer.speak(utterance)
    }
    
    
    // Kullanıcının engeline göre uygulamanın gidişatını belirleyen metod
    
    @objc override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if (event?.subtype == UIEvent.EventSubtype.motionShake && counter > 0){
            performSegue(withIdentifier: "toBlindVC", sender: nil)
            timer.invalidate()
            userDefaults.set(true, forKey: shakeKey)
        }
        
        if (event?.subtype != UIEvent.EventSubtype.motionShake && counter == 0){
           timerFunction()
        }
    }
    
    // Kullanıcıya uygulamaya engelini bildirmesi için verilen süreyle alakalı metod
    
    @objc func timerFunction(){
        counter -= 1
        if counter == 0 {
            performSegue(withIdentifier: "toDeafVC", sender: nil)
            userDefaults.set(false, forKey: shakeKey)
        }
     
    }
        
        
        
    }




