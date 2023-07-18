//
//  MediaPlayerAdaptor.swift
//  DesignPatterns
//
//  Created by chenxing on 2023/6/20.
//

import Foundation

/// 步骤 1: 为媒体播放器和更高级的媒体播放器创建接口。
public protocol IMediaPlayer {
    func play(mediaType: String, fileName: String)
}

public protocol IAdvancedMediaPlayer {
    func playAudio(fileName: String)
    func playVlc(fileName: String)
    func playMp4(fileName: String)
}

/// 步骤 2: 创建实现了 AdvancedMediaPlayer 接口的实体类。
public class AudioPlayer: IAdvancedMediaPlayer {
    
    private let mediaType: String
    
    public init(mediaType: String) {
        self.mediaType = mediaType
    }
    
    public func playAudio(fileName: String) {
        print("Playing \(mediaType) file. Name: \(fileName)")
    }
    
    public func playVlc(fileName: String) {
        // Do nothing.
    }
    
    public func playMp4(fileName: String) {
        // Do nothing.
    }
    
}

public class VlcPlayer: IAdvancedMediaPlayer {
    
    public func playAudio(fileName: String) {
        // Do nothing.
    }
    
    public func playVlc(fileName: String) {
        print("Playing vlc file. Name: \(fileName)")
    }
    
    public func playMp4(fileName: String) {
        // Do nothing.
    }
    
}

public class Mp4Player: IAdvancedMediaPlayer {
    
    public func playAudio(fileName: String) {
        // Do nothing.
    }
    
    public func playMp4(fileName: String) {
        print("Playing mp4 file. Name: \(fileName)")
    }
    
    public func playVlc(fileName: String) {
        // Do nothing.
    }
    
}

/// 步骤 3: 创建实现了 MediaPlayer 接口的适配器类。
public class MediaPlayerAdaptor: IMediaPlayer {
    
    private var advancedMediaPlayer: IAdvancedMediaPlayer?
    
    public func play(mediaType: String, fileName: String) {
        let type = mediaType.lowercased()
        if type == "vlc" {
            advancedMediaPlayer = VlcPlayer()
            advancedMediaPlayer?.playVlc(fileName: fileName)
        } else if type == "mp4" {
            advancedMediaPlayer = Mp4Player()
            advancedMediaPlayer?.playMp4(fileName: fileName)
        } else if type == "mp3" || type == "avi" || type == "acc" {
            advancedMediaPlayer = AudioPlayer(mediaType: mediaType)
            advancedMediaPlayer?.playAudio(fileName: fileName)
        } else {
            print("Invalid media. " + type + " format not supported")
        }
    }
    
}

/// 步骤 4: 创建实现了 MediaPlayer 接口的实体类。
public class MediaPlayer: IMediaPlayer {
    
    private lazy var mediaAdaptor: MediaPlayerAdaptor = MediaPlayerAdaptor()
    
    public func play(mediaType: String, fileName: String) {
        mediaAdaptor.play(mediaType: mediaType, fileName: fileName)
    }
    
}

/// 步骤 5: 使用 AudioPlayer 来播放不同类型的音频格式。
public struct AdaptorPatternDemo {
    
    public static func main() {
        let player = MediaPlayer()
        player.play(mediaType: "mp3", fileName: "beyond the horizon.mp3")
        player.play(mediaType: "mp4", fileName: "alone.mp4")
        player.play(mediaType: "mov", fileName: "loser.mov")
        player.play(mediaType: "vlc", fileName: "far far away.vlc")
        player.play(mediaType: "avi", fileName: "mind me.avi")
        player.play(mediaType: "rmvb", fileName: "plane.rmvb")
    }
    
}

//Output result:
//Playing mp3 file. Name: beyond the horizon.mp3
//Playing mp4 file. Name: alone.mp4
//Invalid media. mov format not supported
//Playing vlc file. Name: far far away.vlc
//Playing avi file. Name: mind me.avi
//Invalid media. rmvb format not supported
