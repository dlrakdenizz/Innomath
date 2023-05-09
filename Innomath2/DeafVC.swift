//
//  DeafVC.swift
//  Innomath2
//
//  Created by Dilara Akdeniz on 29.03.2023.
//

import UIKit
//import AVKit
import AVFoundation

class DeafVC: UIViewController {
    
    @IBOutlet weak var videoView: UIView!
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    
    var isVideoPlaying = false
    
    /*
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //playVideo()
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        guard let path = Bundle.main.path(forResource: "welcome", ofType:"mp4") else {
            debugPrint("welcome.mp4 not found")
            return
        }
        player = AVPlayer(url: URL(fileURLWithPath: path))
        
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resize
        
        videoView.layer.addSublayer(playerLayer)
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        
       
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        player.play()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer.frame = videoView.bounds
    }
    
    /*
    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "welcome", ofType:"mp4") else {
            debugPrint("welcome.mp4 not found")
            return
        }
        player = AVPlayer(url: URL(fileURLWithPath: path))
        
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspect
        
        videoView.layer.addSublayer(playerLayer)
        
    } */
    
    
    
    
    /*
    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "welcome", ofType:"mp4") else {
            debugPrint("welcome.mp4 not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
       let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
            
        }*/
    
    
    @IBAction func playPressed(_ sender: UIButton) {
        if isVideoPlaying {
            player.pause()
            sender.setTitle("Play", for: .normal)
        }else{
            player.play()
            sender.setTitle("Pause", for: .normal)
        }
        
        isVideoPlaying = !isVideoPlaying
    }
    
    
    @IBAction func forwardPressed(_ sender: Any) {
        guard let duration = player.currentItem?.duration else{return}
        let currentTime = CMTimeGetSeconds(player.currentTime())
        let newTime = currentTime + 5.0
        
        if newTime < (CMTimeGetSeconds(duration) - 5.0){
            let time: CMTime = CMTimeMake(value: Int64(newTime*1000), timescale: 1000)
            player.seek(to: time)
        }
    }
    
    
    
    @IBAction func backwardPressed(_ sender: Any) {
        let currentTime = CMTimeGetSeconds(player.currentTime())
        var newTime = currentTime - 5.0
        
        if newTime < 0 {
            newTime = 0
        }
        let time: CMTime = CMTimeMake(value: Int64(newTime*1000), timescale: 1000)
        
    }
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
        performSegue(withIdentifier: "toLevelsVC", sender: nil)
    }
    
    
    
    
    
    
    
    
    
}
