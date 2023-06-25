//
//  DocumentListCell.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 30/05/23.
//

import SwiftUI

struct DocumentListCell: View {
    var document: DocumentModel
    
    var body: some View {
        HStack(spacing: 2, content: {
            ZStack {
                HStack {
                    Image("Document")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                    .allowsHitTesting(false)
                }
                .padding(.all, 10)
                .background(Color.red)
                
                BadgeView(title: "222", padding: 5, radius: 0, rotation: 0, xOffset: 30, yOffset: -35)
                    .frame(width: 50, height: 25)

            }
            documentsDetailsView
                .padding(.trailing, -30)
            documentPropertiewView
        })
    }
}

struct DocumentListCell_Previews: PreviewProvider {
    static var previews: some View {
        DocumentListCell(document: documentModelSamples.first!)
    }
}

private extension DocumentListCell {
    
    private var documentsDetailsView: some View {
        VStack(alignment: .leading, spacing: 16, content: {
                Text(document.name)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.primary)
                .padding(.horizontal, 5)
                
                Text(document.dateCreated)
                    .font(.subheadline)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.descriptionTextColor)
                    .padding(.horizontal, 5)
            HStack{
                Image("driveIcon")
                    .resizable()
                    .font(.footnote)
                    .aspectRatio(CGSize(width: 15, height: 15), contentMode: .fit)
                    .frame(width: 20, height: 20)

                Text(document.dateCreated)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.secondaryTextColor)
                    .padding(.horizontal, 5)
            }
            .frame(height: 20)
            .padding(.bottom, 2)
            .padding(.horizontal, 5)
            
        })
        .padding(.vertical, 5)
    }
    
    var documentPropertiewView: some View {
        VStack(alignment: .trailing, spacing: 10, content: {
            HStack {
                Spacer()
                
                CustomLogoButton(imageName: "share") {
                    print("share action")
                }
                .padding(5)
            }
            HStack {
                Spacer()
                Text(document.documentFolderName)
                    .font(.system(size: 10,weight: .light))
                    .frame(height: 25)
                    .padding(.horizontal, 6)
                    .background(Color.descriptionTextColor.opacity(0.15))
                    .foregroundColor(Color.secondaryTextColor)
                    .clipShape(Capsule())
            }
            HStack(spacing: 5){
                Spacer()
                CustomLogoButton(imageName: "syncIcon") {
                    print("sync action")
                }
                
                CustomLogoButton(imageName: "star") {
                    print("starred action")
                }
                CustomLogoButton(imageName: "moreIcon") {
                    print("more action")
                }
            }
        })
        .padding(.trailing, 5)
    }
}

struct BadgeView: View {
    var title: String
    var padding: CGFloat
    var radius: CGFloat
    var rotation: Double
    var xOffset: CGFloat
    var yOffset: CGFloat
    
    var body: some View {
        Text(title)
            .font(.callout)
            .fontWeight(.bold)
            .multilineTextAlignment(.trailing)
            .padding(padding)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(radius)
            .rotationEffect(.degrees(rotation))
            .offset(x: xOffset, y: yOffset)
    }
}
