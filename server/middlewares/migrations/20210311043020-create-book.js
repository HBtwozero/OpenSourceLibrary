'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Books', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      title: {
        type: Sequelize.STRING,
         allowNull: false,
        validate: {
          len: [2, 100],
        },
      },
     
      cover: {
        type: Sequelize.BLOB
      },
      description: {
        type: Sequelize.STRING,
          allowNull: false,
        validate: {
          len: [10, 250],
        },
      },
      genre: {
        type: Sequelize.STRING,
         values: [
          'Tragedy',
          'Adventure',
          'Fiction',
          'Fable',
          'Mystery',
          'Mythology',
          'Biography',
          'Memoir',
          'Essay',
          'Textbook',
        ],
        defaultValue: 'Essay',
      },
      isbnNo: {
        type: Sequelize.STRING,
         allowNull: false,
        validate: {
          len: [10, 13],
        },
      },
      pages: {
        type: Sequelize.INTEGER,
         allowNull: true,
        validate: {
          isInt: true,
        },
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('Books');
  }
};