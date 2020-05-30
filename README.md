# A Completed Functional Flutter App - FindSeat (BLoC + Json API + Unit Test + Firebase Auth)

![Banner](https://raw.githubusercontent.com/KhoaSuperman/findseat/apply_bloc/sample_data/github_screenshots/YoutubeBanner_v2_medium.png)

## I. Introduction
I’m Android Developer and I’m working in a software company in Vietnam. I have experience in both kind project: outsourcing project and product project. I decided to study Flutter, because I believe it’s promised in future. As experienced developer, I care about clean architecture, testing, performance and maintainability that why I keep searching for an example of completed application. Unfortunately, community now full of project such as speedcode, UI challenges, … it’s just small pieces of real world application. In fact, most of the project doesn’t have fancy UI like that.
That why I build this project by myself and now share it to the community, I hope you can get something from it then apply to your work.

The first version of project (v1.0) is just about UI + simple logic. In this version v2.0, I applied BloC pattern by using Flutter Bloc to project and also have unit tests for it. I also built simple Mock API for the app, it just static json file uploaded to a my private hosting. I hope I have time to do cache local data by SQLite but I have not, so hope next version will be soon available.

[Check Video Demo](https://youtu.be/cxUiyI4h2Ug)

## II. Showcase
#### 2.1. Home
In Home screen, it just simply load then show data to UI. What you can try
###### 2.1.1. Screen: Home 1
![Home_1](https://raw.githubusercontent.com/KhoaSuperman/findseat/apply_bloc/sample_data/github_screenshots/Home_1.png)
- (0) is about me :D
- (1) is carousel slider for displaying banners, it’s automatically animate each 1 second. You can swipe left or right to see next/previous item
- (2) is list seat categories. If you click on a category, app will open All shows screen. It’s horizontal list so you can swipe to reach more item
- (3) is recommended seats. Click on item app will open Show details screen
###### 2.1.2. Screen: Home 2
![Home_2](https://raw.githubusercontent.com/KhoaSuperman/findseat/apply_bloc/sample_data/github_screenshots/Home_2.png)
- (4) is nearby theatres. There’s nothing special to try here, it’s just simple map with highlighted cine’s locations
- (5) (6) is list shows by each category. Same with recommended seats, you can click on item to open Show details screen
#### 2.2. All Shows
###### 2.2.1. Screen: All Shows 1
![AllShows_1](https://raw.githubusercontent.com/KhoaSuperman/findseat/apply_bloc/sample_data/github_screenshots/AllShows_1.png)
- (1) click to open search field. Basically support search by name
- (2) click to open sort option. Basically support sort by rating and name
- (3) there’re 3 tabs: Now showing, Coming soon and Exclusive. You can swipe left/right to view content of each tab
- (4) Display list show in gridview
###### 2.2.2. Screen: All Shows 2
![AllShows_2](https://raw.githubusercontent.com/KhoaSuperman/findseat/apply_bloc/sample_data/github_screenshots/AllShows_2.png)
- Sort options dialog
###### 2.2.3. Screen: All Shows 3
![AllShows_3](https://raw.githubusercontent.com/KhoaSuperman/findseat/apply_bloc/sample_data/github_screenshots/AllShows_3.png)
- App will perform search after stop typing for 400 milliseconds, technically it’s debounce technique.
Try to click on item, app will open Show details screen
#### 2.3. Show info
###### 2.3.1. Screen: Show Info 1
![ShowInfo_1](https://raw.githubusercontent.com/KhoaSuperman/findseat/apply_bloc/sample_data/github_screenshots/ShowInfo_1.png)
- (1) is trailer of show from Youtube link
- (2) show’s description
- (3) is offer section. This is not static content, it can be changed in mock API
###### 2.3.2. Screen: Show Info 2
![ShowInfo_2](https://raw.githubusercontent.com/KhoaSuperman/findseat/apply_bloc/sample_data/github_screenshots/ShowInfo_2.png)
- (4) is user’s review section. Basically write review function is not available yet
- (5) is casts section. It’s horizontal listview, you can swipe to reach more content.
- (6) Click Book seats then app will open Book Time Slot screen
#### 2.4. Book Time Slot
###### 2.4.1. Screen: Book Time Slot 1
![BookTimeSlot_1](https://raw.githubusercontent.com/KhoaSuperman/findseat/apply_bloc/sample_data/github_screenshots/BookTimeSlot_1.png)
- (1) Click to open search field. Basically support search by Cine’s name
- (2) List cine with time slots. Gray item is time slot that is not available.
###### 2.4.2. Screen: Book Time Slot 2
![BookTimeSlot_2](https://raw.githubusercontent.com/KhoaSuperman/findseat/apply_bloc/sample_data/github_screenshots/BookTimeSlot_2.png)
- App will perform search after stop typing for 400 milliseconds, technically it’s debounce technique.
Click on item time slot, app will open Book Seat Type screen.
#### 2.5. Book Seat Type
![BookSeatType](https://raw.githubusercontent.com/KhoaSuperman/findseat/apply_bloc/sample_data/github_screenshots/BookSeatType_1.png)
- (1) choose number of seats
- (2) choose seat type
#### 2.6. Book Seat Slot
![BookSeatSlot](https://raw.githubusercontent.com/KhoaSuperman/findseat/apply_bloc/sample_data/github_screenshots/BookSeatSlot_1.png)
- (1) is count of number booked seats
- (2) Booked seats. You can click to select then click again to deselect seat.
- Validate: For example in screen Book Seat Type you chosen 3 seats, type is Jack that mean
  - You cannot select Queen or King seat
  - You cannot book more than 3 seats
#### 2.7. Make payment
###### 2.7.1. Screen: Make payment 1
![MakePayment_1](https://raw.githubusercontent.com/KhoaSuperman/findseat/apply_bloc/sample_data/github_screenshots/MakePayment_1.png)
- App integrated with Stripe SDK, currently for testing when you click on any method Debit/UDI/Net banking, app only show option pay by input card to the form.

###### 2.7.2. Screen: Make payment 2
![MakePayment_2](https://raw.githubusercontent.com/KhoaSuperman/findseat/apply_bloc/sample_data/github_screenshots/MakePayment_2.png)
- For testing, please use following information:
  - Card number: 4242 4242 4242 4242
  - Expiration date: 04/24
  - CVC: 424 or 242
###### 2.7.3. Screen: Make payment 3
![MakePayment_3](https://raw.githubusercontent.com/KhoaSuperman/findseat/apply_bloc/sample_data/github_screenshots/MakePayment_3.png)
- After Stripe verified the payment information, app will show your booking information.
#### 2.8. Login
![Login](https://raw.githubusercontent.com/KhoaSuperman/findseat/apply_bloc/sample_data/github_screenshots/Login_1.png)
- Basically app provide login by user’s email and password. Login by Google and Facebook will be available soon.
- Test account: khoaha+dev2@mailinator.com / 123456
#### 2.9. Register
![Register](https://raw.githubusercontent.com/KhoaSuperman/findseat/apply_bloc/sample_data/github_screenshots/Register_1.png)
- I did validation in this form using Bloc pattern, you can look at this to study how to do form validation in Bloc.

## III. Mock API
https://superman-academy.com/api/findseat

API | Usage
------------ | -------------
/home.json | Return data for Home screen
/all_shows_by_type.json | Return data for All Shows screen
/booking_time_slot_by_cine.json | Return data for Book Time Slot screen
/book_seat_slot_by_time_slot.json | Return data for Book Seat Slot screen

## IV. Plugins
Plugin | Usage
------------ | -------------
[retrofit](https://pub.dev/packages/retrofit#-readme-tab-) | For working with restful API, generated model
[json_annotation](https://pub.dev/packages/json_annotation#-readme-tab-) | Same as above (SAA)
[dio](https://pub.dev/packages/dio) | SAA
[build_runner](http://build_runner) | SAA
[flutter_bloc](https://pub.dev/packages/flutter_bloc) | For build app architecture
[carousel_slider](https://pub.dev/packages/carousel_slider#-readme-tab-) | Use for section banner in Home screen
[freezed](https://pub.dev/packages/freezed) | Working with State of bloc
[equatable](https://pub.dev/packages/equatable) | SAA
[meta](https://pub.dev/packages/meta) | SAA
[intl](https://pub.dev/packages/intl) | Format date time and other formats
[youtube_player_flutter](https://pub.dev/packages/youtube_player_flutter) | Display trailer from Youtube link
[shared_preferences](https://pub.dev/packages/shared_preferences) | For caching user’s session
[flutter_svg](https://pub.dev/packages/shared_preferences) | Display svg icon
[google_maps_flutter](https://pub.dev/packages/google_maps_flutter) | Display address of cine
[dotted_border](https://pub.dev/packages/dotted_border) | Display dot border of offer ticket in Show details screen
[shimmer](https://pub.dev/packages/shimmer) | Animate image place holder
[stripe_payment](https://pub.dev/packages/stripe_payment) | Use in booking feature
[firebase_core](https://pub.dev/packages/firebase_core) | For register account and login using Firebase
[google_sign_in](https://pub.dev/packages/google_sign_in) | SAA
[firebase_auth](https://pub.dev/packages/firebase_auth) | SAA
[test](https://pub.dev/packages/test) | Try to use unit testing, most of the cases come from Bloc
[bloc_test](https://pub.dev/packages/bloc_test) | SAA

## V. Design credit
##### Author: [Dinu Dinesh](https://www.uplabs.com/getdineshonline)
##### Design link: [Movie & events ticket booking app](https://www.uplabs.com/posts/movie-events-ticket-booking-app)

## Support
- If you wanna get updates in next version, please give me a ⭐ to the repo 👍
- If you love my work and want to support, [buy me a coffee here](https://www.paypal.me/khoahoang1012/1). Thank you so much 👍

