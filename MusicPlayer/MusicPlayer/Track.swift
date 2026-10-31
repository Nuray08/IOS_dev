//
//  Track.swift
//  MusicPlayer
//
//  Created by Nuray Nurlankyzy on 10/30/26.
//

import Foundation

struct Track {
    let title: String
    let artist: String
    let fileName: String
    let coverImageName: String
}

struct TrackLibrary {
    static let tracks: [Track] = [
        Track(title: "Coming Up Roses", artist: "Harry Styles", fileName: "song1_Harry Styles - Coming Up Roses", coverImageName: "cover1"),
        Track(title: "Demons", artist: "Imagine Dragons", fileName: "song2_Imagine Dragons - Demons", coverImageName: "cover2"),
        Track(title: "Every Breath You Take", artist: "The Police", fileName: "song3_The Police - Every Breath You Take", coverImageName: "cover3"),
        Track(title: "Feeling Good", artist: "Michael Buble", fileName: "song4_Michael Buble - Feeling Good", coverImageName: "cover4"),
        Track(title: "Bang Bang", artist: "K'NAAN", fileName: "song5_K'NAAN feat. Adam Levine - Bang Bang", coverImageName: "cover5"),
        Track(title: "Sunflower", artist: "Post Malone", fileName: "song6_Post Malone & Swae Lee - Sunflower (OST Человек-паук Через Вселенные)", coverImageName: "cover6"),
        Track(title: "Young and Beautiful", artist: "Lana Del Rey", fileName: "song7_Lana Del Rey - Young And Beautiful (OST Великий Гэтсби)", coverImageName: "cover7"),
        Track(title: "Summertime Sadness", artist: "Lana Del Rey", fileName: "song8_Lana Del Rey - Summertime Sadness", coverImageName: "cover8"),
        Track(title: "Rolling In The Deep", artist: "Adele", fileName: "song9_Adele - Love In The Dark", coverImageName: "cover9"),
        Track(title: "Someone Like You", artist: "Adele", fileName: "song10_Adele - Someone Like You", coverImageName: "cover10")
    ]
}
