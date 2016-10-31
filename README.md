![Build Status](https://codeship.com/projects/1a9a4f20-77a0-0134-e1bb-426e7deb1a75/status?branch=master)

# Year End

Year End was developed as a capstone project for Launch Academy, a ten-week intensive coding bootcamp based in Boston, MA. While the app's intended usage is to allow users the ability to keep track of new music they listen to over the course of a year, it can be utilized to track any listening habits, really.

The project uses the following components:

* Ruby on Rails
* CarrierWave/Fog
* React
* AJAX
* Javascript
* Spotify and YouTube APIs

## Demo
For a demo of the site, please visit the Heroku page here: [Year End](http://year-end.herokuapp.com/).


## Setup
The app uses Ruby 2.3.1 and was developed on Ruby on Rails 5.0.  React is served up
in Node.js using webpack 1.13.2.

To install, please run the following in your terminal:

### First, set up Rails
```
git clone https://github.com/michaelcwalsh/year-end.git
cd year-end
bundle install
rake db:create
rake db:migrate
```

### Now set up webpack
`npm install`

To store image attachments, you will need to sign up for an Amazon Web Services.
Once you have your AWS secret keys, create a .env file in the root directory,
and add your AWS secret keys with the following format:

```
AWS_ACCESS_KEY_ID=<YOUR_ACCESS_KEY>
AWS_SECRET_ACCESS_KEY=<YOUR_SECRET_ACCESS_KEY>
S3_BUCKET=<YOUR_S3_BUCKET>
```

To generate YouTube embeds, you will need to generate a YouTube Data API.
Once you have your YouTube API key, add it to the .env along with your AWS keys.

```
YOUTUBE_API_KEY=<YOUR_YOUTUBE_API_KEY>
```

## Running the application
To run Year End, please run the following commands in your terminal from the
`year-end` directory:

```
rails s
npm start
```

Now open your browser and enter `localhost:3000` in your address bar.

## Testing
To run the test suite, please enter the following command from the `year-end`
root directory:

`rspec`
