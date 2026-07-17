import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import { pool } from "./db/connection";

dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());

const PORT = process.env.PORT || 4000;

app.get("/health", (_req, res) => {
  res.json({ status: "ok", service: "buscotattoo-api" });
});

app.get("/categories", async (_req, res) => {
  try {
    const result = await pool.query("SELECT * FROM categories ORDER BY id_categories");
    res.json(result.rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error al consultar categorías" });
  }
});

app.listen(PORT, () => {
  console.log(`API corriendo en http://localhost:${PORT}`);
});
