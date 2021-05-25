// Group no. : 10
// Members:
//    - Maitri Modi (101318200)
//    - Jainam Shah (101277989)

//  ParkingTableViewCell.swift
//  carpa
//
//  Created by maitri Modi on 2021-05-18.
//  Copyright © 2021 carpark. All rights reserved.
//

import UIKit

class ParkingTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBOutlet weak var txtStreetAddress: UILabel!
    @IBOutlet weak var txtHoursParked: UILabel!
    @IBOutlet weak var txtCarPlateNo: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
