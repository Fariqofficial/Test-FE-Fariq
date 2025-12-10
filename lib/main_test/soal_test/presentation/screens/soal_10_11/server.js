import express from 'express';

const app = express();
const PORT = 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const validateHeaders = (req, res, next) => {
  const userId = req.headers['user-id'];
  const scope = req.headers['scope'];

  if (userId === 'ifabula' && scope === 'user') {
    next();
  } else {
    res.status(401).json({
      responseCode: 401,
      responseMessage: "UNAUTHORIZED"
    });
  }
};

// API GET PROFILE : /api/profile
app.get('/api/profile', validateHeaders, (req, res) => {
  res.json({
    responseCode: 200,
    responseMessage: "Success get profile",
    data: {
      name: "Ifabula",
      role: "User",
      email: "ifabula@example.com",
      joined: "2025-01-01"
    }
  });
});

// API SUBMIT TASK TODAY : /api/submit
app.post('/api/submit', validateHeaders, (req, res) => {
  const { task, description } = req.body;

  if (!task || !description) {
    return res.status(422).json({
      responseCode: 422,
      responseMessage: "task dan description wajib diisi"
    });
  }

  res.status(201).json({
    responseCode: 201,
    responseMessage: "Data berhasil disubmit",
    data: {
      task,
      description,
      submittedBy: "ifabula",
      submittedAt: new Date().toISOString()
    }
  });
});

app.use('*', (req, res) => {
  res.status(404).json({
    responseCode: 404,
    responseMessage: "API Not Found"
  });
});

app.listen(PORT, () => {
  console.log(`Server berjalan di http://localhost:${PORT}`);
  console.log(`GET    → http://localhost:${PORT}/api/profile`);
  console.log(`POST   → http://localhost:${PORT}/api/submit`);
});