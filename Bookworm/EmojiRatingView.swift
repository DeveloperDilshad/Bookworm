//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Dilshad P on 23/12/24.
//

import SwiftUI

struct EmojiRatingView: View {
    
    var rating:Int16
    
    var body: some View {
        switch rating {
        case 1:
            return Text("⭐️")
        case 2:
            return Text("⭐️⭐️")
        case 3:
            return Text("⭐️⭐️⭐️")
        case 4:
            return Text("⭐️⭐️⭐️⭐️")
        case 5:
            return Text("⭐️⭐️⭐️⭐️⭐️")
        default:
            return Text("⭐️⭐️⭐️⭐️⭐️")
        }
    }
}

#Preview {
    EmojiRatingView(rating:3)
}
