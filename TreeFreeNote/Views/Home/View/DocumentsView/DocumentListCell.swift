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
        HStack(content: {
            Image("Document")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.gray)
                .background(Color.gray)
                .frame(width: 80, height: 80)
            
            documentsDetailsView
                .padding(.trailing, 5)
            documentPropertiewView
        })
        .padding(.horizontal, 5)
        .background(Color.clear)
        
    }
}

struct DocumentListCell_Previews: PreviewProvider {
    static var previews: some View {
        DocumentListCell(document: documentModelSamples.first!)
    }
}

private extension DocumentListCell {
    
    private var documentsDetailsView: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Text(document.name)
                .font(.subheadline)
                .fontWeight(.medium)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.primary)
                .padding(.horizontal, 10)
            
            Text(document.dateCreated)
                .font(.subheadline)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.descriptionTextColor)
                .padding(.horizontal, 10)
            
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
                    .padding(.horizontal, 10)
            }
            .padding(.horizontal, 5)
            
        })
    }
    
    var documentPropertiewView: some View {
        VStack(spacing: 10, content: {
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
                    .frame(minWidth: 60)
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
                .padding(5)
                
                CustomLogoButton(imageName: "star") {
                    print("starred action")
                }
                .padding(5)
                
                CustomLogoButton(imageName: "moreIcon") {
                    print("more action")
                }
                .padding(5)
                .padding(.trailing, 10)
            }
        })
        .frame(width: 120)
    }
}
