//
//  LocationTableViewCell.swift
//  FaceGPS
//
//  Created by Zhenjiang Liu on 2018-09-09.
//  Copyright © 2018 zhenjiang. All rights reserved.
//

import UIKit

class LocationTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var message2Label: UILabel!
    
    override class var cellHeight: CGFloat { return 60.0 }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(location: Location)
    {
        messageLabel.text = "latitude: \(location.coordinate.latitude)"
        message2Label.text = "longitude: \(location.coordinate.longitude)"
        dateLabel.text = "\(location.timestamp)"
    }
    
}
