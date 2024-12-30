const { faker } = require("@faker-js/faker");
const db = require("./dbConect"); // Import the DB connection

const createData = async (data) => {
  const query = `INSERT INTO users (email, created_at) VALUES ?`;
  try {
    const [result] = await db.query(query, [data]);
    return result;
  } catch (error) {
    throw new Error("Failed to insert data: " + error.message);
  }
};

const generateFakeData = (count) => {
  const data = [];
  for (let i = 0; i < count; ++i) {
    data.push([faker.internet.email(), faker.date.past()]);
  }
  return data;
};

const getAllUsers = async () => {
  const query = `SELECT * FROM users`;
  try {
    const [result] = await db.query(query);
    return result;
  } catch (error) {
    throw new Error("Failed get All Users" + error.message);
  }
};

module.exports = { createData, generateFakeData, getAllUsers };
