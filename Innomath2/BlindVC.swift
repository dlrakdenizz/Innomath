//
//  BlindVC.swift
//  Innomath2
//
//  Created by Dilara Akdeniz on 29.03.2023.
//

import UIKit
import AVFoundation
import Speech

class BlindVC: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    var text = ""
    let synthesizer = AVSpeechSynthesizer()
    
    let audioEngine = AVAudioEngine()
    let speechRecognizer : SFSpeechRecognizer? = SFSpeechRecognizer()
    let request = SFSpeechRecognizer()
    var task : SFSpeechRecognitionTask!
    var isStart : Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()

        speech(text: "Merhaba ben Ayşe. Senin yanında olacağım. Seninle arkadaş olmak istiyorum. Senin de adını öğrenebilir miyim?")
        
    }
    
    
    func speech(text : String) {
        let utterance = AVSpeechUtterance(string: text)
        //var speechUtterance : AVSpeechUtterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "tr-TR")
        utterance.rate = 0.5
        
        synthesizer.speak(utterance)
    }
    
    func requestPermission() {
        SFSpeechRecognizer.requestAuthorization { (authState) in
            OperationQueue.main.addOperation{
                
            }
        }
    }
    
}
