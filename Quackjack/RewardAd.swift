//
//  Rewarded.swift
//  Quackjack
//
//  Created by Matt Stillwell on 11/29/20.
//

import SwiftUI
import GoogleMobileAds
import UIKit
    
final class Rewarded: UIViewController, GADRewardedAdDelegate {
    
    // app id
    var rewardedAd: GADRewardedAd?
    // REAL ca-app-pub-2785921596663813~9218501006
    // FAKE ca-app-pub-3940256099942544/1712485313
    
    var rewardFunction: (() -> Void)? = nil
    
    
    /// Tells the delegate that the user earned a reward.
    func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
      print("Reward received with currency: \(reward.type), amount \(reward.amount).")
    }
    /// Tells the delegate that the rewarded ad was presented.
    func rewardedAdDidPresent(_ rewardedAd: GADRewardedAd) {
      print("Rewarded ad presented.")
    }
    /// Tells the delegate that the rewarded ad was dismissed.
    func rewardedAdDidDismiss(_ rewardedAd: GADRewardedAd) {
      print("Rewarded ad dismissed.")
      self.rewardedAd = createAndLoadRewardedAd()
    }
    /// Tells the delegate that the rewarded ad failed to present.
    func rewardedAd(_ rewardedAd: GADRewardedAd, didFailToPresentWithError error: Error) {
      print("Rewarded ad failed to present.")
    }
    
    
    override func viewDidLoad() {
      super.viewDidLoad()
      rewardedAd = createAndLoadRewardedAd()
    }

    func createAndLoadRewardedAd() -> GADRewardedAd? {
      rewardedAd = GADRewardedAd(adUnitID: "ca-app-pub-3940256099942544/1712485313")
      rewardedAd?.load(GADRequest()) { error in
        if let error = error {
          print("Loading failed: \(error)")
        } else {
          print("Loading Succeeded")
        }
      }
      return rewardedAd
    }
        
    
    func showAd(rewardFunction: @escaping () -> Void){
        
        if rewardedAd?.isReady == true {
              rewardedAd?.present(fromRootViewController: self, delegate:self)
           }else{
           print("Not Ready")
           Store.incrementCredits(num: 25)
       }
    }
    
}
