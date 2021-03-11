'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Lecturer extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  Lecturer.init({
    firstname: DataTypes.STRING,
    lastname: DataTypes.STRING,
    middlename: DataTypes.STRING,
    gender: DataTypes.STRING,
    dob: DataTypes.STRING,
    email: DataTypes.STRING,
    phone: DataTypes.STRING,
    location: DataTypes.STRING,
    address: DataTypes.STRING,
    religion: DataTypes.STRING,
    matric_no: DataTypes.STRING,
    password: DataTypes.STRING,
    picture: DataTypes.BLOB,
    dept_id: DataTypes.INTEGER,
    level_id: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'Lecturer',
  });
  return Lecturer;
};