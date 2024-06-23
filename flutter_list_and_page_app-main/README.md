# flutter_list_and_page_app

An attempt to answer an interesting flutter [question](https://stackoverflow.com/questions/72179390/how-can-click-list-view-navigate-detail-when-i-click-the-button-in-pageview) on stackoverflow

![Screen Shot 2022-05-11 at 4 54 24 AM](https://user-images.githubusercontent.com/16275252/167843764-afdcc3da-9f8e-4b28-9ec7-a4d943de34cd.png)

## Question breakdown

1. ScreenA has a list of items. ScreenB has the same list of items but as pages (i.e. PageView widget)
2. When one of the items is tapped, user navigates to ScreenB which is a horizontal pageview. 
3. The *catch* => ScreenB needs to know which list item was tapped so it can show data starting at the tapped list item 

## Solution demo gif


![Simulator Screen Recording - iPhone 13 mini - 2022-05-11 at 04 52 47](https://user-images.githubusercontent.com/16275252/167843897-60714f0c-f21e-4d07-aa69-9660a560e8c6.gif)




