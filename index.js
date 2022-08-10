const express = require("express");
const app = express();
var mysql = require("mysql");
const cors = require("cors");
const bodyParser = require("body-parser");

var db = mysql.createConnection({
  host: "localhost",
  database: "divergiro2",
  user: "root",
  password: "",
});

app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.post("/api/insert/login", (req, res) => {
  const contrasena = req.body.contrasena;
  const rol = req.body.rol;
  const dni = req.body.dni;
  var sqlInsert = `INSERT into login (dni,contrasena,rol) VALUES (?,?,?)`;
  db.query(sqlInsert, [dni, contrasena, rol], (err, result) => {
    console.log(err);
  });
});

app.post("/api/consultar/login", (req, res) => {
  const dni = req.body.dni;
  db.query(`SELECT * FROM login WHERE DNI=${dni}`, (err, result) => {
    console.log(err);
    res.send(result);
  });
});

app.post("/api/insert/usuario", (req, res) => {
  const dni = req.body.dni;
  const nombres = req.body.nombres;
  const apellidos = req.body.apellidos;
  const email = req.body.correo;
  const celular = req.body.celular;

  var sqlInsert = `INSERT INTO usuario (dni,nombres,apellidos,email,celular) VALUES (?,?,?,?,?)`;
  db.query(
    sqlInsert,
    [dni, nombres, apellidos, email, celular],
    (err, result) => {
      console.log(err);
      res.send(result);
    }
  );
});
app.post("/api/consultar/usuario", (req, res) => {
  const dni = req.body.dni;
  db.query(`SELECT * FROM USUARIO WHERE DNI=${dni}`, (err, result) => {
    console.log(err);
    res.send(result);
  });
});
app.post("/api/insert/boleta", (req, res) => {
  const neto = req.body.neto;
  const dni = req.body.dni;
  const observaciones = req.body.observaciones;
  const direccion_evento = req.body.direccion_evento;
  const metodo_pago = req.body.metodo_pago;
  const fecha_evento = req.body.fecha_evento;
  const fecha_creacion = req.body.fecha_creacion;
  const tiempo_total = req.body.tiempo_total;

  var sqlInsert = `INSERT into boleta (neto,dni,observaciones,direccion_evento,metodo_pago,fecha_evento,fecha_creacion,tiempo_total) VALUES (?,?,?,?,?,?,?,?)
  `;
  db.query(
    sqlInsert,
    [
      neto,
      dni,
      observaciones,
      direccion_evento,
      metodo_pago,
      fecha_evento,
      fecha_creacion,
      tiempo_total,
    ],
    (err, result) => {
      console.log(err);
      db.query(`SELECT * FROM boleta WHERE DNI=${dni}`, (err, result) => {
        console.log(err);
        res.send(result);
      });
    }
  );
});

app.post("/api/consultar/boleta", (req, res) => {
  const dni = req.body.dni;
  db.query(`SELECT * FROM boleta WHERE DNI=${dni}`, (err, result) => {
    console.log(err);
    res.send(result);
  });
});

app.post("/api/insert/servicio_boleta", (req, res) => {
  const id_servicio = req.body.id_servicio;
  const id_boleta = req.body.id_boleta;

  var sqlInsert = `INSERT INTO servicio_boleta (id_servicio,id_boleta) VALUES (?,?)`;
  db.query(sqlInsert, [id_servicio, id_boleta], (err, result) => {
    console.log(err);
    res.send(result);
  });
});
app.post("/api/insert/servicio", (req, res) => {
  const nombre = req.body.nombre;
  const precio = req.body.precio;
  const tiempo = req.body.tiempo;
  const descripcion = req.body.descripcion;
  const Banner_img = req.body.Banner_img;
  const Portada_img = req.body.Portada_img;
  const categoria = req.body.categoria;
  const incluye = req.body.incluye;
  const logo = req.body.logo;

  var sqlInsert = `INSERT into servicio (nombre,precio,tiempo,descripcion,Banner_img,Portada_img,categoria,incluye,logo) VALUES (?,?,?,?,?,?,?,?,?)`;
  db.query(
    sqlInsert,
    [
      nombre,
      precio,
      tiempo,
      descripcion,
      Banner_img,
      Portada_img,
      categoria,
      incluye,
      logo,
    ],
    (err, result) => {
      console.log(err);
      res.send(result);
    }
  );
});

app.post("/api/update/servicio", (req, res) => {
  const nombre = req.body.nombre;
  const precio = req.body.precio;
  const tiempo = req.body.tiempo;
  const descripcion = req.body.descripcion;
  const Banner_img = req.body.Banner_img;
  const Portada_img = req.body.Portada_img;
  const categoria = req.body.categoria;
  const incluye = req.body.incluye;
  const logo = req.body.logo;
  const id_servicio = req.body.id_servicio

  db.query(
    `UPDATE servicio s SET s.nombre = '${nombre}', s.precio = ${precio}, s.tiempo = ${tiempo}, s.descripcion = '${descripcion}', s.Banner_img = '${Banner_img}', s.Portada_img = '${Portada_img}', s.categoria = '${categoria}', s.incluye = '${incluye}', s.logo = '${logo}' WHERE s.id_servicio = ${id_servicio}`,
   (err, result) => {
      console.log(err);
      res.send(result);
    }
  );
});

app.get("/api/consultar/servicio_boleta", (req, res) => {
  var sqlInsert = `SELECT s.nombre, b.id_boleta FROM servicio s INNER JOIN servicio_boleta b on b.id_servicio = s.id_servicio`;
  db.query(sqlInsert, (err, result) => {
    console.log(err);
    res.send(result);
  });
});

app.get("/api/consultar/adicional_boleta", (req, res) => {
  var sqlInsert = `SELECT a.nombre_adicional, b.id_boleta FROM adicional a INNER JOIN adicional_boleta b on b.id_adicional = a.id_adicional`;
  db.query(sqlInsert, (err, result) => {
    console.log(err);
    res.send(result);
  });
});
app.post("/api/insert/adicional_boleta", (req, res) => {
  const id_adicional = req.body.id_adicional;
  const id_boleta = req.body.id_boleta;

  var sqlInsert = `INSERT INTO adicional_boleta (id_adicional,id_boleta) VALUES (?,?)`;
  db.query(sqlInsert, [id_adicional, id_boleta], (err, result) => {
    console.log(err);
    res.send(result);
  });
});

app.post("/api/delete/servicio", (req, res) => {
  const id_servicio = req.body.id_servicio;
  db.query(`Delete FROM servicio where id_servicio=${id_servicio}`, (err, result) => {
    console.log(err);
    res.send(result);
  });
});

app.get("/api/listar/usuario", (req, res) => {
  db.query(`SELECT * FROM USUARIO`, (err, result) => {
    res.send(result);
  });
});

app.get("/api/listar/servicio", (req, res) => {
  db.query("SELECT * FROM SERVICIO", (err, result) => {
    res.send(result);
  });
});
app.get("/api/listar/adicional", (req, res) => {
  db.query("SELECT * FROM adicional", (err, result) => {
    res.send(result);
  });
});
app.get("/api/listar/boleta", (req, res) => {
  db.query("SELECT * FROM BOLETA", (err, result) => {
    res.send(result);
  });
});

app.get("/api/listar/boleta_admin", (req, res) => {
  db.query("SELECT b.id_boleta,b.dni,u.nombres,u.apellidos,u.celular,b.direccion_evento,b.metodo_pago,b.fecha_evento,b.tiempo_total,b.neto  FROM BOLETA b INNER JOIN usuario u WHERE b.dni = u.dni", (err, result) => {
    res.send(result);
  });
});

app.listen(3001, () => {
  console.log("running on port 3001");
});
