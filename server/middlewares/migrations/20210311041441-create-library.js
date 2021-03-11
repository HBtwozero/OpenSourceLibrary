'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Libraries', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      library_name: {
        type: Sequelize.STRING
      },
      alias: {
        type: Sequelize.STRING
      },
      logo: {
        type: Sequelize.BLOB
      },
      email: {
        type: Sequelize.STRING
      },
      phone: {
        type: Sequelize.STRING
      },
      location: {
        type: Sequelize.STRING
      },
      address: {
        type: Sequelize.STRING
      },
      established: {
        type: Sequelize.STRING
      },
      password: {
        type: Sequelize.STRING
      },
      long: {
        type: Sequelize.BIGINT
      },
      lat: {
        type: Sequelize.BIGINT
      },
      dev_id: {
        type: Sequelize.INTEGER
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
    await queryInterface.dropTable('Libraries');
  }
};