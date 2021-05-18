//
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
    
    @IBOutlet weak var txtBuildingCode: UILabel!
    
    @IBOutlet weak var txtCarPlateNo: UILabel!
    
    @IBOutlet weak var txtHoursParked: UILabel!
    
    @IBOutlet weak var txtSuitNoOfHost: UILabel!
    
    @IBOutlet weak var txtParkingLocation: UILabel!
    
    @IBOutlet weak var txtDateTime: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
