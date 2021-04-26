//
//  ViewController.swift
//  RSS iTunes
//
//  Created by Xiaoping Jia.
//  Copyright © 2021 DePaul University. All rights reserved.
//

import UIKit

let feed = "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=1/json"

class ViewController: UIViewController {
    
    enum SerializationError: Error {
        case missing(String)
        case invalid(String, Any)
    }

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        guard let feedURL = URL(string: feed) else {
            return
        }
        
        let request = URLRequest(url: feedURL)
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let data = data else { return }
            
            print(data)
            
            do {
                if let json =
                    try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                    print(json)
                    guard let feed = json["feed"] as? [String:Any] else {
                        throw SerializationError.missing("feed")
                    }
                    guard let entry = feed["entry"] as? [String:Any] else {
                        throw SerializationError.missing("entry")
                    }
                    guard let nameEntry = entry["im:name"] as? [String:Any] else {
                        throw SerializationError.missing("im:name")
                    }
                    guard let artistEntry = entry["im:artist"] as? [String:Any] else {
                        throw SerializationError.missing("im:artist")
                    }
                    guard let imageArray = entry["im:image"] as? [Any] else {
                        throw SerializationError.missing("im:image")
                    }
                    if let title = nameEntry["label"] as? String,
                        let artist = artistEntry["label"] as? String {
                        
                        DispatchQueue.main.async {
                            self.titleLabel.text = title
                            self.artistLabel.text = artist
                            
                        }
                        if let imageEntry = imageArray.last as? [String:Any],
                            let imageURL = imageEntry["label"] as? String,
                            let url = URL(string:imageURL) {
                            print("Title: \(title)\nArtist: \(artist)\nImage: \(imageURL)")
                            self.loadImage(from: url, in: self.imageView)
                        }
                    }
                }
            } catch SerializationError.missing(let msg) {
                print("Missing \(msg)")
            } catch SerializationError.invalid(let msg, let data) {
                print("Invalid \(msg): \(data)")
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }.resume()
        
    }
    
    func loadImage(from URL: Foundation.URL, in imageView: UIImageView) {
        let request = URLRequest(url: URL)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let imageData = data {
                let image = UIImage(data: imageData)
                DispatchQueue.main.async {
                    imageView.image = image
                }
            }
        }.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

