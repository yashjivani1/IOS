//
//  Models.swift
//  Instagram-Clone(Firebase)
//
//  Created by haco on 11/11/20.
//  Copyright © 2020 haco. All rights reserved.
//

import Foundation
enum Gender{
    case male, female, other
}
struct User{
    let username: String
    let name: (first: String, last: String)
    let birthDate: Date
    let gender: Gender
    let counts: UserCount
    let joinDate: Date
}

struct UserCount{
    let followers: Int
    let following: Int
    let posts: Int
}

public enum UserPostType{
    case photo, video
}
public struct UserPost{
    let identifier: String
    let postType : UserPostType
    let thumbnailImage: URL
    let postURL: URL
    let caption: String?
    let likeCount: [PostLikes]
    let comment: [PostComment]
    let createdDate: Date
    let taggedUsers: [String]
}

struct PostLikes{
    let username: String
    let postIdentifier: String
}

struct CommentLike{
    let username: String
    let commentIdentifier: String
}

struct PostComment{
    let username: String
    let text: String
    let createDate: Date
    let likes: [CommentLike]
}

