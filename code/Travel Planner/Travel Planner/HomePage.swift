//
//  HomePage.swift
//  Travel Planner
//
//  Created by Sugandhi Hansika Kalansooriya on 2023-04-24.
//



import UIKit
import SwiftyGif

class HomePage: UIViewController {

    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet var cardView: UIView!
    
    let logoAnimationView = LogoAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Travel Planner"
        
        logoAnimationView.pinEdgesToSuperView()
        logoAnimationView.logoGifImageView.delegate = self

        // Set up background image
        let backgroundImage = UIImage(named: "images (2)")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(backgroundImageView, at: 0)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        cardView.layer.cornerRadius = 30
        cardView.layer.cornerCurve = .continuous
        blurView.layer.cornerRadius = 30
        blurView.layer.cornerCurve = .continuous

        blurView.layer.masksToBounds = true
        cardView.layer.shadowOpacity = 0.5
        cardView.layer.shadowOffset = CGSize(width: 0, height: 10)
        cardView.layer.shadowRadius = 20
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logoAnimationView.logoGifImageView.startAnimatingGif()
    }
}


extension HomePage: SwiftyGifDelegate {
    func gifDidStop(sender: UIImageView) {
        logoAnimationView.isHidden = true
    }
}
