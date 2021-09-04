const express = require('express')
const router = express.Router()
const bcrypt = require('bcrypt')
const pool = require('../db')
const jwtGenerator = require('../utils/jwtGenerator')
const validator = require('../middleware/validator')
const authorization = require('../middleware/authorization')

router.post(
	'/register',
	validator.registerValidationRules,
	validator.validateRegister,
	async (req, res) => {
		try {
			// Destructure the req.body
			const { firstName, lastName, email, password } = req.body
			// Check if user exists (if user exists throw error)
			const user = await pool.query('SELECT * FROM users WHERE email = $1', [
				email,
			])
			if (user.rows.length !== 0) {
				return res.status(401).json({
					errors: [{ msg: 'This email is already registered' }],
				})
			}
			// Bycrypt the users password
			const saltRounds = 10
			const salt = await bcrypt.genSalt(saltRounds)
			const bcryptPassword = await bcrypt.hash(password, salt)
			const addUserQuery = `
	  INSERT INTO users 
		(firstName, lastName, email, password)
		VALUES ($1, $2, $3, $4) RETURNING *
		`
			const newUser = await pool.query(addUserQuery, [
				firstName,
				lastName,
				email,
				bcryptPassword,
			])
			const token = jwtGenerator(newUser.rows[0].user_id) // Generate the JWT token
			res.json({ token })
		} catch (err) {
			console.error(err.message)
			res.status(500).json({ errors: [{ msg: 'Server Error' }] })
		}
	}
)

// Login Route
router.post(
	'/login',
	validator.loginValidationRules,
	validator.validateLogin,
	async (req, res) => {
		try {
			// Destructure req.body
			const { email, password } = req.body
			// Check if the user doesn't exist
			const user = await pool.query('SELECT * FROM users WHERE email = $1', [
				email,
			])
			if (user.rows.length === 0) {
				return res
					.status(401)
					.json({ errors: [{ msg: 'Incorrect email or password' }] })
			}
			// Check if the incoming password is the same as the database password
			const validPassword = await bcrypt.compare(
				password,
				user.rows[0].password
			)
			if (!validPassword) {
				return res
					.status(401)
					.json({ errors: [{ msg: 'Incorrect email or password' }] })
			}
			// Give the user the jwt token
			const token = jwtGenerator(user.rows[0].user_id)
			res.json({ token })
		} catch (err) {
			console.error(err)
			res.status(500).json({ errors: [{ msg: 'Server Error' }] })
		}
	}
)

router.get('/isverified', authorization, async (req, res) => {
	try {
		res.json({ authorized: true })
	} catch (err) {
		console.error(err)
		res.status(500).send('Server Error')
	}
})

module.exports = router