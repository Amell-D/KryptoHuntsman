//
//  CircleButtonAnimationView.swift
//  KryptoHuntsman
//
//  Created by Amel Dizdarevic on 7/21/22.
//

import SwiftUI

struct CircleButtonAnimationView: View {

    @Binding var animate: Bool

    var body: some View {
        Circle()
            .stroke(lineWidth: 4.0)
            .scale(animate ? 1.0 : 0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? .easeOut(duration: 1.0) : .none) // we make it none because it will not animate back that way
    }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView(animate: .constant(false))
            .frame(width: 100, height: 100)
            .previewLayout(.sizeThatFits)
    }
}
