//
//  View+Exstension.swift
//  BlogApp
//
//  Created by Алтын on 9/9/20.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
    
}
