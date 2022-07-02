//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        dimUndim(button: sender)
        playSound(note: sender.currentTitle)
    }

    
    func dimUndim(button: UIButton) {
        button.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            // Put your code which should be executed with a delay here
            button.alpha = 1.0
        }
    }
    
    func playSound(note: String?) {
        guard let url = Bundle.main.url(forResource: note, withExtension: "wav") else {
            print("url not found")
            return
        }

        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: "wav")
            player!.play()
            
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
    }
    

}

