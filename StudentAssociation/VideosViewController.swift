//
//  VideosViewController.swift
//  StudentAssociation
//
//  Created by Fatma AlDarwish on 07/11/2023.
//

import AVKit
import AVFoundation
import UIKit
class VideosViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard let path = Bundle.main.path(forResource: "success", ofType: "mp4") else {
            print("Error: Couldn't find the video file")
            return
        }

        let player = AVPlayer(url: URL(fileURLWithPath: path))

        let layer = AVPlayerLayer(player: player)
        layer.frame = view.bounds
        view.layer.addSublayer(layer)
        
        player.pause()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
        tapGesture.numberOfTapsRequired = 2
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleDoubleTap(_ sender: UITapGestureRecognizer) {
        let playerLayer = view.layer.sublayers?.first(where: { $0 is AVPlayerLayer }) as? AVPlayerLayer
        if let player = playerLayer?.player {
            if player.timeControlStatus == .playing {
                player.pause()
            } else {
                player.play()
            }
            
        }
        
        
    }
}
