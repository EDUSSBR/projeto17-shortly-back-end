import Joi from 'joi';

const urlSchema = Joi.object({
	url: Joi.string()
    .regex(/^(?:https?:\/\/)?(w{3}\.)?[\w_-]+((\.\w{2,}){1,2})(\/([\w\._-]+\/?)*(\?[\w_-]+=[^\?\/&]*(\&[\w_-]+=[^\?\/&]*)*)?)?$/)
    .required()
});

export { urlSchema };
