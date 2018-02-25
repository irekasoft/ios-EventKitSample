//
//  EventKitManager.swift
//  SampleEventKit
//
//  Created by Muhammad Hijazi on 25/02/2018.
//  Copyright © 2018 iReka Soft. All rights reserved.
//

import UIKit
import EventKit

class EventKitManager: NSObject {
  
  var eventStore: EKEventStore!
  
  static var calendarArray:[EKCalendar]!
  static var reminderStore:EKEventStore!
  
  func setup(){
    
    eventStore = EKEventStore.init()
    
    eventStore.requestAccess(to: .event) { (granted, error) in
      
      if granted {
        
        print("granted")
        
      } else {
        
        print("not granted")
        
      }
      
    }
    
    func fetchEvents(){
      
      let now = Date()
      let calendar = Calendar.current
      
      var dateComponents = DateComponents.init()
      dateComponents.day = 60
      
      let futureDate = calendar.date(byAdding: dateComponents, to: now)
      
      let eventPredicate = self.eventStore.predicateForEvents(withStart: now, end: futureDate!, calendars: nil)
      
      let events = self.eventStore.events(matching: eventPredicate)
      
      for event in events {
        print("\(event.title)")
      }
      
      
    }
    
  
  }

}
