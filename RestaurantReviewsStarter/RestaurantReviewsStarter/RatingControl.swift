//
//  RatingControl.swift
//  RestaurantReviewsStarter
//
//  Created by Susan Stevens on 2/17/19.
//  Copyright © 2019 Susan Stevens. All rights reserved.
//

import UIKit

protocol RatingControlDelegate: class {
    func ratingControl(_ ratingControl: RatingControl,
                       didSelectRating rating: Int)
}

class RatingControl: UIStackView {
    
    weak var delegate: RatingControlDelegate?
    
    @IBOutlet var stars: [UIButton]!
    
    private let emptyStarImage = UIImage(imageLiteralResourceName: "star")
    private let filledStarImage = UIImage(imageLiteralResourceName: "star-filled")
    
    @IBAction func didTapStar(_ selectedStar: UIButton) {
        
        var rating = stars.count
        
        for (index, star) in stars.enumerated() {
            if rating < index {
                star.setImage(emptyStarImage, for: .normal)
            } else {
                star.setImage(filledStarImage, for: .normal)
                rating = (selectedStar == star) ? index : stars.count
            }
        }
        
        delegate?.ratingControl(self, didSelectRating: rating)
    }
}
