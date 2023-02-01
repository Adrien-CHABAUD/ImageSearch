<!--
  Title: Image Search
  Description: iOS App allowing its user to make a picture search using SwiftUI
  Author: Adrien CHABAUD
 -->
 
 <img src="/Documentation/Adrien_banner_01.png">
 
 
 # ImageSearch ![iOS Badge](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white) ![Swift Badge](https://img.shields.io/badge/Swift%20Version-5-orange) 

## Table of contents
* [General Info](#general-info)
* [Technologies](#technologies)


## General Info

This app. is an image finder/visualizer. Allowing its users to make an image search and see different images corresponding to the query being displayed. 
The user can interact with the pictures by touching them, allowing them to see the image in bigger dimensions but also see different informations about it (e.g. number of likes, author, a description, and the size of the image)

<p align="center">
  <img src="/Documentation/imageSearch_screenshot_1.png" width=300 hspace=20><img src="/Documentation/imageSearch_screenshot_gif.gif" width=300><img src="/Documentation/imageSearch_screenshot_2.png" width=300 hspace=20>
</p>

This app uses a ``LazyVGrid`` nested in a ``ScrollView`` for its main display of images, once the query written, the app is using an API from ***unsplash*** to fetch 100 pictures and display them.
Every single picture has a possibility to interact with (mainly to see it bigger and see the informations related to it).
The navigation is made through ``NavigationLink``.

## Technologies

This project uses:
* *Xcode: 14.0.1*
* *Swift: 5.7*

Link for the API of ***unsplash***: https://unsplash.com/developers

<p align="center">
  <img src="Documentation/readme-end-banner.png">
</p>
