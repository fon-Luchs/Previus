# Previus

## Install

### Clone repository

```
git clone https://github.com/fon-Luchs/Previus.git
```

### Install gems

```
cd Previus
```

```
bundle install
```

### Run migrations

```
rake db:migrate
```

### Run specs

```
rake
```

### Run server

```
rails s
```

## API documentation

### Sign Up

```
 curl -H 'Accept: application/json' \
          -d 'user[email]=simple_mail@test.com&user[password]=111111&user[password_confirmation]=111111&user[name]=simple_name' \
          localhost:3000/api/profile

```

### Sign In

```
curl -H 'Accept: application/json' \
     -d 'session[email]=simple_mail@test.com&session[password]=111111' \
     localhost:3000/session
```