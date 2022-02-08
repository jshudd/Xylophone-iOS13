//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

/* orignial code
import UIKit
import AVFoundation //allows audio

class ViewController: UIViewController {
    
    var player : AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    
    @IBAction func keyPressed(_ sender: UIButton) {
        
        playSound()
        
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "C", withExtension: "wav") else { return }
        
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default) //allows sound to play despite silent mode
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* the following line is required for the player to work on iOS 11.
             Change the file type accordingly*/
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint:
                AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
*/

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
               
        playSound(soundName: sender.currentTitle!) /* ! means won't be null */
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    
    func playSound(soundName : String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
