//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Nuray Nurlankyzy on 10/30/26.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    // MARK: - Outlets
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!

    // MARK: - Properties
    private let tracks = TrackLibrary.tracks
    private var currentIndex = 0
    private var audioPlayer: AVAudioPlayer?
    private var isPlaying = false

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        coverImageView.layer.cornerRadius = 16
        coverImageView.clipsToBounds = true
        loadTrack(at: currentIndex, shouldPlay: false)
    }

    // MARK: - Player Logic
    private func loadTrack(at index: Int, shouldPlay: Bool) {
        guard !tracks.isEmpty else { return }
        let track = tracks[index]

        titleLabel.text = track.title
        artistLabel.text = track.artist
        coverImageView.image = UIImage(named: track.coverImageName)

        audioPlayer?.stop()

       
        let url = Bundle.main.url(forResource: track.fileName, withExtension: "mp3", subdirectory: "Audio")
            ?? Bundle.main.url(forResource: track.fileName, withExtension: "mp3")

        guard let audioURL = url else {
            print("Файл не найден: \(track.fileName).mp3")
            showAlert(message: "Файл «\(track.fileName).mp3» не найден в бандле.")
            isPlaying = false
            updatePlayPauseIcon()
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()

            if shouldPlay {
                audioPlayer?.play()
                isPlaying = true
            } else {
                isPlaying = false
            }
        } catch {
            print("Ошибка AVAudioPlayer: \(error.localizedDescription)")
            showAlert(message: "Не удалось воспроизвести трек: \(track.title)")
            isPlaying = false
        }

        updatePlayPauseIcon()
    }

    private func updatePlayPauseIcon() {
        let iconName = isPlaying ? "pause.fill" : "play.fill"
        playPauseButton.setImage(UIImage(systemName: iconName), for: .normal)
    }

    // MARK: - Actions
    @IBAction func playPauseTapped(_ sender: UIButton) {
        guard let player = audioPlayer else { return }

        if isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            isPlaying = true
        }
        updatePlayPauseIcon()
    }

    @IBAction func nextTapped(_ sender: UIButton) {
        currentIndex = (currentIndex + 1) % tracks.count
        loadTrack(at: currentIndex, shouldPlay: isPlaying)
    }

    @IBAction func previousTapped(_ sender: UIButton) {
        currentIndex = (currentIndex - 1 + tracks.count) % tracks.count
        loadTrack(at: currentIndex, shouldPlay: isPlaying)
    }

    // MARK: - AVAudioPlayerDelegate
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            currentIndex = (currentIndex + 1) % tracks.count
            loadTrack(at: currentIndex, shouldPlay: true)
        }
    }

    // MARK: - Helper
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default))
        present(alert, animated: true)
    }
}
