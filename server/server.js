require(`dotenv`).config()
const express = require(`express`)
const massive = require(`massive`)
const session = require(`express-session`)

const authCtrl = require(`./auth_controller`)


const {SERVER_PORT, SECRET, CONNECTION_STRING } = process.env

const app = express()
app.use(express.json())
app.use(session({
  secret: SECRET,
  resave: false,
  saveUninitialized: false
}))


//auth

app.post(`/auth/register`, authCtrl.register)
app.post(`/auth/login`, authCtrl.login)




massive(CONNECTION_STRING).then( db => {
  app.set(`db`, db)
  console.log(`Connected to database`)
  app.listen(SERVER_PORT, () => {
    console.log(`Listening on port: ${SERVER_PORT}`)
  })
})

