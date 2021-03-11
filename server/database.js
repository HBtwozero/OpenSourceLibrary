const Pool = require ("pg").Pool;

const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'opensourcelibrary',
  password: 'Lemahatma2807*',
  port: 5432,
  acquireTimeoutMillis: 30000,
  idleTimeoutMillis: 200000,
})




module.exports = pool;