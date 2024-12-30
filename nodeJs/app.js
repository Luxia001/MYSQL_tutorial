const mysql = require("mysql2/promise");
const dotenv = require("dotenv");
const express = require("express");
const bodyParser = require("body-parser");

dotenv.config();

const db = require("./dbConect");
const { createData, generateFakeData, getAllUsers } = require("./dataService");

const app = express();
app.use(express.json());
app.set("view engine", "ejs");
app.use(express.static("public"));
app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", async (req, res) => {
  const [result] = await db.query("SELECT COUNT(*) as count FROM users");
  const [email] = await db.query(
    "SELECT * FROM users order by created_at desc"
  );
  const count = result[0].count; // Extract the count value
  res.render("home", { data: count, emails: email });
});

// Retrieve all users
app.get("/getUsers", async (req, res) => {
  try {
    const result = await getAllUsers();
    res.status(200).json({
      code: 200,
      status: "success",
      message: "Data retrieved successfully",
      data: result.length,
    });
  } catch (error) {
    res.status(500).json({
      code: 500,
      status: "error",
      message: "Failed to retrieve data",
      error: error.message,
    });
  }
});

// Add users
app.post("/register", async (req, res) => {
  const { email } = req.body;

  try {
    db.query("insert into users (email) values (?)", email, (err, res) => {
      if (err) throw err;
    });
    res.redirect("/");
  } catch (error) {
    res.status(500).json({
      code: 500,
      message: "register failed",
    });
  }
});

app.post("/createUsers", async (req, res) => {
  try {
    const count = req.body.count || 100;
    const data = generateFakeData(Number(count));
    const result = await createData(data);

    res.status(200).json({
      code: 200,
      message: "Data created successfully",
      rowsAffected: result[0].affectedRows,
    });
  } catch (error) {
    res.status(404).json({
      code: 404,
      message: "Error importing data",
      error: error.message,
    });
  }
});

app.use((req, res, next) => {
  const error = new Error("Can not find route");
  res.status(500).json({
    code: 500,
    message: error.message,
  });
});

app.listen(5000, () => {
  console.log("Server running on http://localhost:5000");
});
