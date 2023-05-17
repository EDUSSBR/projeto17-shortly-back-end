import Joi from 'joi';

const signUpSchema = Joi.object({
	name: Joi.string().min(3).max(100).required(),
	email: Joi.string().email({ minDomainSegments: 2 }).required(),
	password: Joi.string().min(3).required(),
	confirmPassword: Joi.string().min(3).required()
});

export { signUpSchema };