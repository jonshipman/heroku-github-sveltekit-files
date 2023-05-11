# SvelteKit -> Github -> Heroku

1. Rename _github to .github (I don't want actions on this repo)
2. Add HEROKU_EMAIL, HEROKU_API_KEY, and HEROKU_APP_NAME to the secrets in Github.
3. (optional) if you have any environment vars, you can add them to Github as well. The example I provide uses "ENV" and passes that as "ARG_ENV" to the Dockerfile. The Dockerfile then converts the ARG_ENV back to an ENV. You can have as many variables as you like.
4. Make sure that your heroku-deploy.yml has the on.push.branches[0] set to the branch you need pushed.
5. Be sure your Heroku app is set to container by way of `heroku stack:set container --app <<app-name>>`.

That should be it. The only negative I can see is that you need to enter your env variables in Github Actions as well as Heroku, but it's better than committing .env files.
