//
//  Constants.swift
//  DropDown
//
//  Created by Kevin Hirsch on 28/07/15.
//  Copyright (c) 2015 Kevin Hirsch. All rights reserved.
//

import UIKit

internal struct DPDConstant {

	internal struct KeyPath {

		static let Frame = "frame"

	}

	internal struct ReusableIdentifier {

		static let DropDownCell = "DropDownCell"

	}

	internal struct UI {

		static let TextColor = UIColor.white
		static let TextFont = UIFont.systemFont(ofSize: 15)
		static let BackgroundColor = UIColor(red: 0.0, green: 0.45, blue: 0.78, alpha: 1.0)  //.black.withAlphaComponent(0.2)//(white: 0.94, alpha: 1)
		static let SelectionBackgroundColor = UIColor(red: 0.0, green: 0.45, blue: 0.78, alpha: 1.0)
		static let SeparatorColor = UIColor.clear
		static let CornerRadius: CGFloat = 2
		static let RowHeight: CGFloat = 44
		static let HeightPadding: CGFloat = 20

		struct Shadow {

			static let Color = UIColor.darkGray
			static let Offset = CGSize.zero
			static let Opacity: Float = 0.4
			static let Radius: CGFloat = 8

		}

	}

	internal struct Animation {

		static let Duration = 0.15
		static let EntranceOptions: UIViewAnimationOptions = [.allowUserInteraction, .curveEaseOut]
		static let ExitOptions: UIViewAnimationOptions = [.allowUserInteraction, .curveEaseIn]
		static let DownScaleTransform = CGAffineTransform(scaleX: 0.9, y: 0.9)

	}

}
