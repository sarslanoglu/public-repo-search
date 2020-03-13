## Description

Basic rails view to search through public repositories on Github using Github API v3

## Install

### Clone the repository

```shell
git clone git@github.com:sarslanoglu/public-repo-search.git
cd public-repo-search
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.7.0`

If not, install the right ruby version using [rvm](https://github.com/rvm/rvm) (it could take a while):

```shell
rvm install 2.7.0
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle install
```

## Serve

```shell
rails s
```

## Testing

For rubocop to run

```shell
bundle exec rubocop
```
