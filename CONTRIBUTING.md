# Tie-In
an app to eliminate all the logistic hassle of group travel

## Basic Git Flow
1. Pull to update your local master
- Work in a feature branch (e.g. feature-[name of feature], feature-user-auth)
- Your work should happen in a series of small and concise commit messages.
- Rebase frequently to incorporate upstream changes on development
- Continuously push your branch to github.
- When you're done with your feature, interactive rebase and squash your commits as appropriate
- Force push your cleaned up branch to Github
- Submit a pull request to have your work reviewed and merged

## Code Review Workflow

1. **Every** pull request must be reviewed by another team mate and writes code comments on Github (Camille, our GitMaster)
2. You make the desired changes
3. Repeat #1-2 until teammate has no more changes that need to be made
4. GitMaster merges feature to **development** (GitMaster names temporary GM when they own the PR)
5. GitMaster announces an **updated** development
6. GitMaster announces all merges to **master**.

## Styleguide
The project will use the following styleguides
  - [AirBnB Ruby Styleguide](https://github.com/airbnb/ruby)
  - [AirBnB JavaScript Styleguide](https://github.com/airbnb/javascript)

## Testing
- Travis CI
- rspec-rails
- factory_girl
- shoulda_matchers
- capybara


## Deployment and QA
- deploy to Heroku [sitelink](this will be a link to the site)
- add bugs or GitHub issue tracker and add priority labels
