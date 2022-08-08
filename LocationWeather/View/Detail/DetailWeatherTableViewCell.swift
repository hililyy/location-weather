//
//  DetailWeatherTableViewCell.swift
//  LocationWeather
//
//  Created by 강조은 on 2022/08/09.
//

import UIKit

class DetailWeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var dataInfo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
