const jwt = require('jsonwebtoken')
require('dotenv').config()

const authorization = async (req, res, next) => {
	try {
		const jwtToken = req.header('token')
		if (!jwtToken) {
			return res.status(403).json({ errors: [{ authorized: false }] })
		}
		const payload = jwt.verify(jwtToken, process.env.jwtSecret)
		req.user = payload.user
		next()
	} catch (err) {
		console.error(err)
		return res
			.status(500)
			.json({ errors: [{ token: false, msg: 'Server Error' }] })
	}
}

module.exports = authorization
