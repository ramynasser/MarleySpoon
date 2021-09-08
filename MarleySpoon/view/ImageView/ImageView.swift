//
//  ImageView.swift
//  MarleySpoon (iOS)
//
//  Created by Ramy Nasser on 07/09/2021.
//

import SwiftUI
import Combine

struct ImageView: View {
  @ObservedObject var imageLoader: ImageLoader
  @State var image: UIImage = UIImage()
  
  private let maxWidth: CGFloat
  private let maxHeight: CGFloat
  
  init(url: String?, maxWidth: CGFloat, maxHeight: CGFloat) {
    guard let urlString = url else {
        imageLoader = ImageLoader(urlString: "")
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
        return
    }
    imageLoader = ImageLoader(urlString: urlString)
    
    self.maxWidth = maxWidth
    self.maxHeight = maxHeight
  }
  
  var body: some View {
    VStack {
      Image(uiImage: image)
        .resizable()
        .scaledToFill()
        .frame(maxWidth: maxWidth,
               maxHeight: maxHeight,
               alignment: .center)
        .clipped()
    }.onReceive(imageLoader.didChange) { data in
      self.image = UIImage(data: data) ?? UIImage()
    }
  }
    
}
