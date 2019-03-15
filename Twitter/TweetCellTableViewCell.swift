//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Aly Traore on 3/7/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favButton: UIButton!
    
    var favorited:Bool = false
    var tweetId:Int = -1
    var retweeted:Bool = false
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorite = !favorited
        if (toBeFavorite) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Unfavorite did not succeed: \(error)")
            })
        }
        
    }
    
    @IBAction func retweetButton(_ sender: Any) {
        TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
            self.retweetButton( true)
        }, failure: { (error) in
            print("Error is retweeting: \(error)")
        })
        
    }
   
    func setRetweeted( isFavorite:Bool) {
        favorited = isFavorite
        if (favorited){
            favButton.setImage(UIImage (named: "favor-icon-red"), for: UIControl.State.normal)
        } else{
            favButton.setImage(UIImage (named: "fovor-icon"), for: UIControl.State.normal)
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setRetweeted(_ isRetweeted:Bool){
        if (isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for:
                UIControl.State.normal)
            retweetButton.isEnabled = false
        } else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for:
                UIControl.State.normal)
            retweetButton.isEnabled = true
            
        }
    }
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
