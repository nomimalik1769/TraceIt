//
//  MusicController.swift
//  Map Tracing
//
//  Created by Admin on 17/10/2017.
//  Copyright © 2017 Globia Technologies. All rights reserved.
//

import UIKit
import AVFoundation
class MusicController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var songs = ["Music1","Music2","Music3","Music4"]
    var songs1 = ["Sound1","Sound2","Sound3","Sound4"]
    var cataogories = ["Music","Sounds"]
    var audio = AVAudioPlayer()
    @IBOutlet weak var musictableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return cataogories[section]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return cataogories.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var audiopath = ""
        if indexPath.section == 0
        {
            audiopath = Bundle.main.path(forResource: songs[indexPath.row], ofType: "mp3")!
        }
        else
        {
            audiopath = Bundle.main.path(forResource: songs1[indexPath.row], ofType: "mp3")!
        }
        do
        {
            try audio = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audiopath))
            audio.play()
        }
        catch {
            /// Error
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.section == 0
        {
        let cell1 = musictableview.dequeueReusableCell(withIdentifier: "cell") as! MusicViewCell
        cell1.textLabel?.text = self.songs[indexPath.row]
        
        cell = cell1
        }
        
        if indexPath.section == 1
        {
            let cell2 = musictableview.dequeueReusableCell(withIdentifier: "cell") as! MusicViewCell
            cell2.textLabel?.text = self.songs1[indexPath.row]
            
            cell = cell2
        }
        
        
        return cell
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
