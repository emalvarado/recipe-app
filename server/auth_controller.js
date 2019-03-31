const bcrypt = require(`bcryptjs`);

module.exports = {
  register: async (req, res) => {
    try {
      const db = req.app.get(`db`);
      const { email, password } = req.body;
      const user = await db.find_user({ email });
      if (user[0]) {
        return res.status(401).send({ message: `Email already in use.` });
      }

      const salt = bcrypt.genSaltSync(10);
      const hash = bcrypt.hashSync(password, salt);
      const newUser = await db.create_user({ email, hash });
      req.session.user = {
        id: newUser[0].user_id,
        email: newUser[0].user_email
      };
      res.status(201).send({
          message: "You are now logged in",
          userData: req.session.user,
          loggedIn: true
        });
    } 
    catch (err) {
      console.log(`error:`, err);
    }
  },
  login: async(req, res) => {
    try {
      const db = req.app.get(`db`)
      const {email, password} = req.body
      const user = await db.find_user({email})
      if(!user[0]) {
        return res.status(401).send({message: `Email not found.`})
      }
      const result = await bcrypt.compareSync(password, user[0].user_hash)
      if(!result) {
        return res.status(401).send({message: `Incorrect password.`})
      }
      req.session.user = {
        id: user[0].user_id,
        email: user[0].user_email
      }
      res.status(200).send({message: `You are now logged in`, userData: req.session.user, loggedIn: true})
    } 
    catch (err) {
      console.log(`error: ${err}`)
    }
  }
};
