const { validationResult, check } = require('express-validator')

const registerValidationRules = [
	check('email')
		.isEmail()
		.withMessage('Please enter a valid email'),
	check('password')
		.isLength({ min: 8 })
		.withMessage('Your password must be at least 8 characters long'),
	check('firstName')
		.matches(/^[A-Za-z\s]+$/)
		.withMessage('Your name must only contain letters'),
	check('lastName')
		.matches(/^[A-Za-z\s]+$/)
		.withMessage('Your name must only contain letters'),
]

const validateRegister = (req, res, next) => {
	const errors = validationResult(req)
	if (errors.isEmpty()) {
		return next()
	}
	return res.status(401).json({ errors: errors.array() })
}

const loginValidationRules = [
	check('password').isLength({ min: 8 }),
	check('email').isEmail(),
]

const validateLogin = (req, res, next) => {
	const errors = validationResult(req)
	if (errors.isEmpty()) {
		return next()
	}
	return res
		.status(401)
		.json({ errors: [{ msg: 'Incorrect email or password' }] })
}

module.exports = {
	registerValidationRules,
	validateRegister,
	loginValidationRules,
	validateLogin,
}
