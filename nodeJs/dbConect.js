const mysql = require("mysql2/promise");
const dotenv = require("dotenv");

dotenv.config();

const connection = mysql.createPool({
  host: "localhost" || process.env.DB_host,
  user: "root",
  password: "12345678" || process.env.DB_password,
  database: "join_us" || process.env.DB_database,
});

module.exports = connection;
