//
//  PhotoViewModel.swift
//  MVVM
//
//  Created by Nishant Shrestha on 1/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation
import RxSwift

struct PhotoViewModel {
    
    private var photo: Photo
    private let userViewModel: UserViewModel
    
    let titleText: String
    let photoURL: URL
    let description: String
    
    init(photo: Photo) {
        self.photo = photo
        self.userViewModel = UserViewModel(user: photo.user)
        
        self.titleText = photo.name ?? "N/A"
        
        // guard let url = URL(string: photo.imageURL ?? "") else { return }
        self.photoURL = URL(string: photo.imageURL ?? "")!
        self.description = photo.description ?? "No description"
    }
    
    func getPhotoID() -> Int {
        return photo.id ?? 0
    }
    
    func getUserAvatarURL() -> URL {
        return userViewModel.avatarURL
    }
    
    func getUserName() -> String {
        return userViewModel.getUsername()
    }
    
    func viewCountText() -> String {
        return "\(formattedViewCount()) views"
    }
    
    func uploadDateText() -> String {
        let result = formatSecondsToDuration(seconds: secondsSinceTimestamp(timestamp: getUnixtimestampForUpload()))
        return "\(result.value) \(result.unit)\(result.value > 1 ? "s" : "") ago".uppercased()
    }
    
    private func formattedViewCount() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        
        return formatter.string(from: NSNumber(value: photo.timesViewed)) ?? "0"
    }
    
    private func getUnixtimestampForUpload() -> Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssxxxxx"
        let date = formatter.date(from: photo.createdAt)
        
        return Int(date?.timeIntervalSince1970 ?? 0)
    }
    
    private func secondsSinceTimestamp(timestamp: Int) -> Int {
        let currentDate = Date()
        let currentTimestamp = Int(currentDate.timeIntervalSince1970)
        
        let seconds = currentTimestamp - getUnixtimestampForUpload()
        
        return seconds
    }
    
    private func formatSecondsToDuration(seconds: Int) -> (value: Int, unit: String) {
        let secondsInMinute = 60
        let secondsInHour = 60 * secondsInMinute
        let secondsInDay = 24 * secondsInHour
        let secondsInWeek = 7 * secondsInDay
        let secondsInYear = 52 * secondsInWeek
        
        if seconds >= secondsInYear {
            return (Int(seconds/secondsInYear), "year")
        } else if seconds >= secondsInWeek {
            return (Int(seconds/secondsInWeek), "week")
        } else if seconds >= secondsInDay {
            return (Int(seconds/secondsInDay), "day")
        } else if seconds >= secondsInHour {
            return (Int(seconds/secondsInHour), "hour")
        } else if seconds >= secondsInMinute {
            return (Int(seconds/secondsInMinute), "minute")
        } else {
            return (seconds, "second")
        }
    }
    
}
