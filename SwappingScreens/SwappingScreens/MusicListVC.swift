//
//  MusicListVC.swift
//  SwappingScreens
//
//  Created by Leonidas on 26/04/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import UIKit

class MusicListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

            view.backgroundColor = UIColor.blue
    }

    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func load3rdScreenPressed(_ sender: Any) {
        
        let songTitle = "some song"
        performSegue(withIdentifier: "PlaySongVC", sender: songTitle)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as?
            PlaySongVC{
            
            if let song = sender as? String{
                    destination.selectedSong = song
            }
        }
    }
}
