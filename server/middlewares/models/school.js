'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class School extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  School.init({
    school_name: DataTypes.STRING,
    alias: DataTypes.STRING,
    logo: DataTypes.BLOB,
    email: DataTypes.STRING,
    phone: DataTypes.STRING,
    location: DataTypes.STRING,
    address: DataTypes.STRING,
    established: DataTypes.STRING,
    password: DataTypes.STRING,
    long: DataTypes.BIGINT,
    lat: DataTypes.BIGINT,
    dev_id: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'School',
  });
  return School;
};