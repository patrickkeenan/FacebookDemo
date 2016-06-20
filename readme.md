## Dropbox

The purpose of this homework is to use Xcode to implement the flow between the screens of an application. We're going to use the techniques from this week to implement the Dropbox app from the signed out state to the basic signed in state.

Time spent: `5 hours`

### Features

#### Required

- [x] User can swipe through the 3 welcome screens.
- [x] User can follow the create user flow.
  - [x] On the create user form, the user can tap the back button to go to the page where they can sign in or create an account.
  - [ ] Before creating the account, user can choose to read the terms of service.
  - [x] After creating the account, user can view the placeholders for Files, Photos, and Favorites as well as the Settings screen.
  - [x] User can log out from the Settings screen.
- [x] User can follow the sign in flow.
  - [x] User can tap the area for "Having trouble signing in?".
  - [x] User can log out from the Settings screen.

#### Optional

- [ ] Add a detail view for one of the files and implement favoriting the file.
- [ ] Add UITextFields for the forms so you can actually type in them and handle dismissing the keyboard.
- [x] You should be able to swipe through the welcome screens instead of just tapping them.

#### The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Swiping using a gesture object (not a scroll view)
2. Having a modal transition where the background drops out, rather than foreground comes up.

### Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://github.com/patrickkeenan/CodepathDropboxDemo/blob/master/Demo.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

* Couldn't get the launch screen working