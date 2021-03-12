/**
 /------------------------------------
 / Developers Controller
 /-------------------------------------
 / Holds all basic operations
 / of the developer
 */

// const callbacks = require('../config/callbacks.js');
const Developer = require('../middlewares/models/').Developer;

// require('dotenv').config();
// var secret = process.env.SECRET;
//get some fake data for example
const faker = require('faker');

const email = faker.internet.email();
const password = faker.internet.password();
const fullName  = faker.name.lastName();
const body = {fullname: fullName, email: email, password: password  };

class DeveloperController{
        // Developer welcome message
    static welcome(req, res){
        res.json({message: "Welcome to developer endpoint."});
    }


    // Developer login operation
    static login(req, res){
        try{
            let { email,password } = req.body;
            Developer.findAll({
                where:{email: email}
            })
                .then(developer=>{
                    if(developer.length == 0){
                        res.send(400).json({message: "Sorry, developer does not exist."});
                    }else{
                        var passwordIsValid = bcrypt.compareSync(req.body.password, developer[0].dataValues.password.trim());

                        if (passwordIsValid){
                            var devDetails = {
                                id: developer[0].dataValues.id,
                                fullname: developer[0].dataValues.fullname,
                                email: developer[0].dataValues.email,
                                is_auth: 'developer'
                            }
                            var token = jwt.sign({
                                developer: devDetails
                            }, secret, {
                                expiresIn: '1d'
                            });

                            res.send(200).json({
                                success: true,
                                developer: devDetails,
                                message: "Login successful. Token generated successfully.",
                                token: token
                            });
                        }else{
                            res.send(401).json({
                                success: false,
                                message: 'Authentication failed. Wrong password'
                            });
                        }
                    }
                })
                .catch(e=>{
              //  res.status(500);
                res.status(500).send('Internal Server Error')
            })

        }catch (e) {
              res.status(500).send('Internal Server Error')

//              res.sendStatus(200) // equivalent to res.status(200).send('OK')
// res.sendStatus(403) // equivalent to res.status(403).send('Forbidden')
// res.sendStatus(404) // equivalent to res.status(404).send('Not Found')
// res.sendStatus(500) // equivalent to res.status(500).send('Internal Server Error')
        }
    }

    static create(req, res){
        //create a user
        // const{firstName, email, password} = req.body;
        return Developer.create(body).then(userData=>
            res.status(201).send({
                message: `Your User with the title ${fullName} has been created successfully `,
                userData
            })
            )
        

    }

    
}

// export const getDevelopper =(req, res)=>{
//         res.json({message: "Welcome to developer endpoint."});
// }

module.exports = DeveloperController;
