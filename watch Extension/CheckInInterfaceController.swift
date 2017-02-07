//
//  CheckInInterfaceController.swift
//  WatchTest
//
//  Created by 김준호 on 2017. 2. 6..
//  Copyright © 2017년 JHsoft. All rights reserved.
//

import WatchKit
import Foundation


class CheckInInterfaceController: WKInterfaceController {
    
    @IBOutlet var backgroundGroup: WKInterfaceGroup!
    @IBOutlet var originLabel: WKInterfaceLabel!
    @IBOutlet var destinationLabel: WKInterfaceLabel!
    
    var flight: Flight? {
        didSet {
            if let flight = flight {
                originLabel.setText(flight.origin)
                destinationLabel.setText(flight.destination)
            }
        }
    }
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        if let flight = context as? Flight { self.flight = flight }
    }
    
    @IBAction func checkInButtonTapped() {
        // 1
        let duration = 0.35
        
        let delay = DispatchTime.now() + 0.4
        
        // 2
        backgroundGroup.setBackgroundImageNamed("Progress")
        // 3
        backgroundGroup.startAnimatingWithImages(in: NSRange(location: 0, length: 10), duration: duration, repeatCount: 1)
        // 4
        DispatchQueue.main.asyncAfter(deadline: delay) { () -> Void in
            // 5
            self.flight?.checkedIn = true
            self.dismiss()
        }
        
    }
}
