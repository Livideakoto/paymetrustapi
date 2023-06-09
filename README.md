# Pre-requisites
- Install [Node.js](https://nodejs.org/en/) version 8.0.0


# Getting started
- Clone the repository
```
git clone  https://github.com/Livideakoto/paymetrustapi.git
```
- Install dependencies
```
cd paymetrustApi
npm install
```
- Build and run the project
```
npm start
```
- Set up database (put correct credentials in .env file)

```
PGUSER=yourusername
PGPASSWORD=
PGHOST=yourserver
PGDATABASE=paymetrustapi
PGPORT=5432

JWTSECRET=pmetrust524@
PORT=4000
```

  Navigate to `http://localhost:4000`