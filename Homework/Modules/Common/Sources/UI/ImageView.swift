//
//  ImageView.swift
//  Common
//
//  Created by 윤재욱 on 6/21/25.
//

import SwiftUI

import Kingfisher

public struct ImageView: View {
    
    let url: URL
    let size: CGSize
    
    public init(_ url: URL, size: CGSize) {
        self.url = url
        self.size = size
    }
    
    public var body: some View {
        KFImage(url)
            .setProcessor(DownsamplingImageProcessor(size: size))
            .scaleFactor(UIScreen.main.scale)
            .cancelOnDisappear(true)
            .resizable()
            .scaledToFill()
            .frame(width: size.width, height: size.height)
            .clipped()
    }
}
