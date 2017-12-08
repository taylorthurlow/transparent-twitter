<img src="https://user-images.githubusercontent.com/761640/32705667-8c4ecf88-c7cb-11e7-9344-04b5472311fc.png" align="center" />

<p align="center">a small web application which uses IBM's watson to determine the linguistic tone of the people you follow on Twitter</p>

## Deployment instructions
-----
### Prerequisites
* A recent version of `ruby`, 2.0 or later will 'probably' work, we used `2.3.1`
* A functioning, local installation of `PostgreSQL` that your local user account has read/modify priveleges for
* An app registered with Twitter, needed to obtain a Twitter API key and secret ([register here](http://apps.twitter.com/))
* A valid IBM Watson/Bluemix account, with an added Tone Analysis instance (student trial should work)

### Deployment steps
1. Clone this repository into a directory of your choosing
2. Ensure that you have `ruby` installed, and run `gem install bundler`
3. Inside the project root directory, run `bundle --path=vendor`
4. Create a `.env` file in the project root directory containing these environment variables and their proper values ([usage instructions here](https://github.com/bkeepers/dotenv)):
  * `CONSUMER_KEY`: Your Twitter app API key
  * `CONSUMER_SECRET`: Your Twitter app secret
  * `IBM_USERNAME`: The username provided by IBM Bluemix for your Watson Tone Analysis instance
  * `IBM_PASSWORD`: The password provided by IBM Bluemix for your Watson Tone Analysis instance
5. Run the following command to prepare the database: `bundle exec rake db:create db:migrate`
6. Run the Rails server using: `bundle exec rails server`
7. Use the app at `http://localhost:3000/`

### Deploying to a 3rd party:
  Deploying to a 3rd party service like Heroku is generally as simple as configuring the aforementioned environment variables through the provided web configuration interface, also ensuring that the service is set to use PostgreSQL as the database.
