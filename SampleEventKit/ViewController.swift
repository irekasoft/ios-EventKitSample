//
//  ViewController.swift
//  SampleEventKit
//
//  Created by Muhammad Hijazi on 25/02/2018.
//  Copyright © 2018 iReka Soft. All rights reserved.
//

import UIKit

import EventKit
import EventKitUI

class ViewController: UIViewController {
  
  var eventKitManager : EventKitManager!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    eventKitManager = EventKitManager()
    eventKitManager.setup()
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func createEvent(_ sender: Any) {
    
    let eventVC = EKEventEditViewController.init()
    eventVC.event = EKEvent.init(eventStore: eventKitManager.eventStore)
    eventVC.eventStore = eventKitManager.eventStore
    eventVC.editViewDelegate = self
    present(eventVC, animated: true, completion: nil)
    
    
  }
  
}

extension ViewController : EKEventViewDelegate {
  
  func eventViewController(_ controller: EKEventViewController, didCompleteWith action: EKEventViewAction) {
    
    dismiss(animated: true, completion: nil)
    
  }
  
  
}

extension ViewController : EKEventEditViewDelegate {
  
  func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
    
    controller.dismiss(animated: true, completion: nil)
    
  }
  
}

