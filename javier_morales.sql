

CREATE TABLE `contactos_persona` (
   `nombre` varchar(45) NOT NULL,
   `tipo_contacto` varchar(45) NOT NULL,
   `valor_contacto` varchar(45) NOT NULL,
   `id_persona` int NOT NULL,
   KEY `id_persona_idx` (`id_persona`),
   CONSTRAINT `id_persona` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
 
 
 CREATE TABLE `personas` (
   `id_persona` int NOT NULL,
   `run_persona` varchar(8) NOT NULL,
   `dv_persona` varchar(1) NOT NULL,
   PRIMARY KEY (`id_persona`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
 
 INSERT INTO jav2.personas (id_persona,run_persona,db_persona) VALUES (0001, "13270800", "2");
 INSERT INTO jav2.personas (id_persona,run_persona,db_persona) VALUES (0002, "12128476", "6");
 
 INSERT INTO jav2.contactos_persona (nombre,tipo_contacto,valor_contacto,id_persona) VALUES ("javier", "celular", 991524670, 0001);
 INSERT INTO jav2.contactos_persona (nombre,tipo_contacto,valor_contacto,id_persona) VALUES ("javier", "correo", morales.javier77@gmail.com, 0001);
 INSERT INTO jav2.contactos_persona (nombre,tipo_contacto,valor_contacto,id_persona) VALUES ("marcela", "celular", 998761362, 0002);
 INSERT INTO jav2.contactos_persona (nombre,tipo_contacto,valor_contacto,id_persona) VALUES ("marcela", "correo", marcelagos2014@gmail.com, 0002);
 

SELECT * FROM jav2.personas;
SELECT * FROM jav2.contactos_persona;
SELECT * FROM jav2.personas where run_persona= 13270800;

SELECT c.nombre, c.tipo_contacto, c.valor_contacto, c.id_persona
FROM jav2.personas as p, jav2.contactos_persona as c WHERE p.run_persona = 12128476 AND p.dv_persona = 6 AND p.id_persona = c.id_persona;