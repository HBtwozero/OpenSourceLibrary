'use strict';
module.exports = {
  up: queryInterface =>
    queryInterface.bulkInsert('developers', [
      {
        fullName: 'johndoe',
        email:'kangrand@ycp.edu',
        password: 'dontstorepasswordsthisway',
        createdAt: new Date().toDateString(),
        updatedAt: new Date().toDateString()
      },
     
    ], {}),
  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('developers', null, {});
  }
};