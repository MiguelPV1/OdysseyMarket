drop database if exists ODYSSEYMARKET_DB;
create database ODYSSEYMARKET_DB;
use ODYSSEYMARKET_DB;

-- -----------------------------------TABLES-------------------------------------------

CREATE TABLE usuario(
	id_us int NOT NULL,
	contrasenia varchar(30),
	nombre varchar(30),
	tipo nvarchar(25),
	apellidop varchar(45),
	apellidom varchar(45),
    email varchar(45),
	sexo nvarchar(25) ,
	delegacion varchar(45),
	colonia varchar(45),
	calle varchar(60),
	num varchar(15),
	codpost integer,
	foto varchar(100),
	    
	CONSTRAINT usuario_pk PRIMARY KEY (id_us)
);

---------------------------------------------------
CREATE TABLE tarjeta(
	id_tarjeta int not null primary key,
    fecha_ven nvarchar(30),
    nombre nvarchar(50),
    no_tarjeta nvarchar(50),
    id_us int not null,
    
    CONSTRAINT tarjeta__usuariofk FOREIGN KEY (id_us) REFERENCES usuario(id_us)
);

---------------------------------------------------
CREATE TABLE producto(
	id_prod varchar(10) not null primary key,
	nombre varchar (70),
	id_us int NOT NULL,
	marca varchar(30),
	precio double precision,
	descuento integer CHECK (descuento>=0 AND descuento<100),
	cant_almacen integer,
	categoria varchar(20),
	foto nvarchar(100),
	descripcion nvarchar(100),
	
    CONSTRAINT producto_proveedor FOREIGN KEY (id_us) REFERENCES usuario(id_us)
);

--------------------------------------------------
create table calificacion(
	id_cal int not null primary key,
    estrellas int,
    comentario  nvarchar(300),
    fecha date,
    id_us int not null,
    id_prod varchar(10) not null,
    
    CONSTRAINT usuario_cal FOREIGN KEY (id_us) REFERENCES usuario(id_us),
    CONSTRAINT prod_cal FOREIGN KEY (id_prod) REFERENCES producto(id_prod)

);

--------------------------------------------------
CREATE TABLE repartidor(
	id_rep varchar(10) not null primary key,
	nombre varchar(30),
	tel varchar(12)
	
);

--------------------------------------------------
CREATE TABLE comprar(
	id_compra varchar(10) primary key,
	cantidad int not null,
	delegacion varchar(45),
	colonia varchar(45),
	calle varchar(60),
	num varchar(15),
	codpost integer,
	fecha_compra date,
	fecha_entrega date,
	estatus int,
	total double,

	id_rep varchar(10) not null,
    id_us int not null,
    id_prod varchar(10),
    id_tarj int not null,
    
	CONSTRAINT usuario_comprar FOREIGN KEY (id_us) REFERENCES usuario(id_us),
	CONSTRAINT producto_comprar FOREIGN KEY (id_prod) REFERENCES producto(id_prod),
    CONSTRAINT repartirdor_comprar FOREIGN KEY (id_rep) REFERENCES repartidor(id_rep),
    CONSTRAINT tarjeta_comprar FOREIGN KEY (id_tarj) REFERENCES tarjeta(id_tarjeta)
);

------------------------------------------------
create table carrito(
	id_car int not null primary key,
    id_us int not null,
    id_prod varchar(10) not null,
    
    CONSTRAINT idus_fk FOREIGN KEY (id_us) REFERENCES usuario(id_us),
	CONSTRAINT idprod_fk FOREIGN KEY (id_prod) REFERENCES producto(id_prod)
    
);

-- -----------------------------------INSERTS-------------------------------------------

-- INSERTS USUARIO
INSERT INTO usuario VALUES (1,"abcdef","Danny","Comprador","Boy","Chop","danny@hotmail.com","Hombre","Nezahualcoyotl","Virgenes","Deseperacion","15","15020","usuariosImg/dany.jpg");
INSERT INTO usuario VALUES (2,"fedcba","Cardd","Vendedor","Papi","Culo","cardd@gmail.com","Hombre","Zapata","Tezozomoc","Alonso","20","30201","usuariosImg/card.jpg");
INSERT INTO usuario VALUES (3,"wewry","Quadri","Comprador","Villapando","Enfermo","quadriq@outlook.com","Mujer","Venustiano Carranza","Balbuena","Morelos","83","15032","usuariosImg/quadri.jpg");
INSERT INTO usuario VALUES (4,"sony123","SONY","Vendedor","SA de CV","","sony@outlook.com","-","Miguel H","Puebla","calle 100","502","15032","usuariosImg/sony.jpg");
INSERT INTO usuario VALUES (5,"mixup123","Mixup","Vendedor","SA de CV","","mixup@outlook.com","-","Coyoacán","Portales","calle 546","5","155421","usuariosImg/mixup.jpg");
INSERT INTO usuario VALUES (6,"fender123","Fender","Vendedor","SA de CV","","fender@outlook.com","-","Coyoacán","Portales","calle 200","52","155451","usuariosImg/fender.jpg");
INSERT INTO usuario VALUES (7,"tama123","Tama","Vendedor","SA de CV","","tama@outlook.com","-","Zapata","Tezozomoc","calle 20","2","15251","usuariosImg/tama.jpg");
INSERT INTO usuario VALUES (8,"nintendo123","Nintendo","Vendedor","SA de CV","","nintendo@outlook.com","-","Iztacalco","Coyuya","calle 255","25","12850","usuariosImg/nintendo.jpg");
INSERT INTO usuario VALUES (9,"xbox123","XBOX","Vendedor","SA de CV","","xbox@outlook.com","-","Nezahualcoyotl","Virgenes","calle 4","23","15650","usuariosImg/xbox.jpg");
INSERT INTO usuario VALUES (10,"wilson123","Wilson","Vendedor","SA de CV","","wilson@outlook.com","-","Venustiano C.","Puebla","calle 45","230","15750","usuariosImg/wilson.jpg");
INSERT INTO usuario VALUES (11,"lenovo123","Lenovo","Vendedor","SA de CV","","lenovo@outlook.com","-","Venustiano C.","Puebla","Av. Principal","2302","15050","usuariosImg/lenovo.jpg");
INSERT INTO usuario VALUES (12,"microsoft123","Microsoft","Vendedor","SA de CV","","microsoft@outlook.com","-","Gustavo A madero","Rosales","Insurgentes Norte","2","15550","usuariosImg/microsoft.jpg");


-- INSERTS TARJETA
INSERT INTO tarjeta VALUES(1,"2025/5/10","DANNY BOY CHOP","5790456864457896",1);
INSERT INTO tarjeta VALUES(2,"2019/12/15","CARDD PAPI CULO","7854539565223599",2);
INSERT INTO tarjeta VALUES(3,"2024/1/4","QUADRI VILLALPANDO ENFERMO", "8529637852145894",3);
INSERT INTO tarjeta VALUES(4,"2030/5/24","SONY SA de CV","1789632159874153",4);
INSERT INTO tarjeta VALUES(5,"2023/3/18","MIXUP SA de CV","7458598525258965",5);
INSERT INTO tarjeta VALUES(6,"2020/3/4","FENDER SA de CV","3456127898767657",6);
INSERT INTO tarjeta VALUES(7,"2023/8/12","TAMA SA de CV","8754852359146598",7);
INSERT INTO tarjeta VALUES(8,"2022/10/23","NINTENDO SA de CV","8585185695689613",8);
INSERT INTO tarjeta VALUES(9,"2024/7/14","XBOX SA de CV","8524567896321477",9);
INSERT INTO tarjeta VALUES(10,"2027/9/7","WILSON SA de CV","4569874183695485",10);
INSERT INTO tarjeta VALUES(11,"2023/2/22","LENOVO SA de CV","3214598465874856",11);
INSERT INTO tarjeta VALUES(12,"2028/4/13","MICROSOFT SA de CV","6578521488963218",12);


-- INSERTS PRODUCTO
-- categoria musica
INSERT INTO producto VALUES("M001","SONY WH-1000M3","4","SONY",5000,10,5,"Musica","images_pro/M001.jpg","Los SONY WH-1000M3 ");
INSERT INTO producto VALUES("M002","MELO CD","5","ABBY ROAD",100,0,20,"Musica","images_pro/M002.jpg","CD melo de alta calidad");
INSERT INTO producto VALUES("M003","JAZZBASS FENDER","6","FENDER",15000,70,3,"Musica","images_pro/M003.jpg","Bajo perrón, cómpralo ya");
INSERT INTO producto VALUES("M004","BATERIA TAMA","7","TAMA",20000,0,13,"Musica","images_pro/M004.jpg","Batería de muy buena calidad");
-- categoria videojuegos
INSERT INTO producto VALUES("V001","Red Dead Redemption 2 PS4","4","Rockstar",1500,15,50,"Videojuegos","images_pro/V001.jpg","Increible, con más de 200 horas de juego. Graficos de alta calidad.");
INSERT INTO producto VALUES("V002","Zelda Breath of The Wild Nintendo Switch","8","Nintendo",1300,10,25,"Videojuegos","images_pro/V002.jpg","Sumérjete en una increíble aventura con esta entrega de Nintendo.");
INSERT INTO producto VALUES("V003","Gears of War 5","9","XBOX",1500,10,500,"Videojuegos","images_pro/V003.jpg","Emocionante juego de acción.");
-- categoria deportes
INSERT INTO producto VALUES("D001","Balón Fútbol Americano","10","Wilson",700,0,11,"Deportes","images_pro/D001.jpg","Balón de cuero de alta durabilidad.");
INSERT INTO producto VALUES("D002","Balón Fútbol Soccer","10","Wilson",500,0,13,"Deportes","images_pro/D002.jpg","Balón de fútbol soccer de la mejor calidad.");
-- categoria computacion
INSERT INTO producto VALUES("C001","Laptop Lenovo","11","Lenovo",1900,10,5,"Computo","images_pro/C001.jpg","Laptop Lenovo con procesador intel core i-7 de 5ta gen.");
INSERT INTO producto VALUES("C002","Mouse inalámbrico","12","Microsoft",300,0,21,"Computo","images_pro/C002.jpg","Mouse inalámbrico microsoft.");


-- INSERTS CALIFICACION
INSERT INTO calificacion VALUES(1,5,"Tremendo juego para el Nintendo switch!","2018/10/15",3,"V002");
INSERT INTO calificacion VALUES(2,4,"Just got it. It felt good. After playing it for a while, I could rate its quality","2019/10/21",3,"D001");
INSERT INTO calificacion VALUES(3,5,"I'm a bit of a collector of Audio Equipment and have 3 other, High End Headphones. My experience with closed headphones has never been very good so I expected poor performance. I was wrong. These headphones are accurate and the noise cancellation is as good as any other. I highly recommend.","2019/11/22",2,"M001");
INSERT INTO calificacion VALUES(4,5,"AWESOMEEEEEEEEEEEEEEEE! :)","2019/12/06",1,"M002");
INSERT INTO calificacion VALUES(5,3,"xD :)","2019/12/01",1,"M002");


-- INSERTS REPARTIDOR
INSERT INTO repartidor VALUES("R003E","Juan","5589461269");
INSERT INTO repartidor VALUES("R103E","Alfonso","5556871423");
INSERT INTO repartidor VALUES("R0000","Sin Asignar","-");

-- INSERTS COMPRA
INSERT INTO comprar VALUES("A1879",2,"Virgenes","Deseperacion","Obo","15","15020","2019/10/20","2019/11/20",1,"10000","R003E",1,"M001",1);
INSERT INTO comprar VALUES("A1880",1,"Venustiano Carranza","Balbuena","Morelos","83","15032","2018/10/10","2018/10/14",5,"1000","R103E",3,"V002",3);
INSERT INTO comprar VALUES("A1881",1,"Venustiano Carranza","Balbuena","Morelos","83","15032","2019/10/19","2019/10/21",2,"700","R103E",3,"D001",3);
INSERT INTO comprar VALUES("A1882",2,"Virgenes","Deseperacion","Obo","15","15020","2019/09/20","2019/12/2",1,"200","R003E",1,"M002",1);


-- INSERTS CARRITO
INSERT INTO carrito VALUES(1,1,"C001");
INSERT INTO carrito VALUES(2,1,"C002");

-- -----------------------------------PROCEDURES-------------------------------------------

-- --------------------------USUARIO---------------------------------------------
drop procedure if exists sp_Register;
delimiter <j
create procedure sp_Register(

in pass varchar(30),
in nameX varchar(30),
in	tipe varchar(25) ,
in surnameP varchar(45),
in surnameM varchar(45),
in mail varchar(45),
in sex varchar(25),
in dele varchar(45),
in col varchar(45),
in street varchar(60),
in numbe varchar(15),
in post integer
)
begin
	declare msj nvarchar(30);
    declare maxDNI int;
    declare proof int;
    
    
    set proof = (select count(usuario.id_us) from usuario where usuario.email = mail);
    if(proof = 0)then
		set maxDNI = (select ifnull(max(usuario.id_us), 0) +1 from usuario );
        insert into usuario(id_us, contrasenia,nombre, tipo, apellidop, apellidom, email, sexo, delegacion, colonia, calle, num, codpost) values(
       maxDNI, pass , nameX ,tipe , surnameP, surnameM ,mail , sex , dele ,col ,street,numbe ,post );
		set msj = 'Usuario registrado con exito';
    else
    set msj = 'La direccion de Correo electronico ya esta registrada';
    end if;
    
select proof as flag;

end <j
delimiter ;


drop procedure if exists sp_Update;
delimiter <j
create procedure sp_Update(
in idX int,
in pass varchar(30),
in nameX varchar(30),
in surnameP varchar(45),
in surnameM varchar(45),
in mail varchar(45),
in sex varchar(25),
in dele varchar(45),
in col varchar(45),
in street varchar(60),
in numbe varchar(15),
in post integer
)
begin
	declare msj nvarchar(30);
    declare maxDNI int;
    declare proof int;
    
    
    set proof = (select count(usuario.id_us) from usuario where usuario.id_us = idX);
    if(proof = 1)then
		
	 
	update usuario set 
       usuario.contrasenia= pass , usuario.nombre= nameX , usuario.apellidop=surnameP, 
       usuario.apellidom=surnameM ,usuario.email=mail , usuario.sexo=sex , usuario.delegacion=dele ,
       usuario.colonia=col ,usuario.calle=street,usuario.num=numbe ,usuario.codpost=post where usuario.id_us = idX;
		set msj = 'Usuario modificado exitosamente!';
    else
		set msj = 'Usuario pudo ser modificado modificar.';
    end if;
    
select msj as msj;

end <j
delimiter ;

drop procedure if exists logValidation;
delimiter <j
create procedure logValidation(in psw nvarchar(30), in usr nvarchar(45))
begin
declare id int;
declare flag int;
declare nm nvarchar(30);
	set flag = (select count(*) from usuario where usuario.email=usr and usuario.contrasenia = psw);
	if(flag = 1)then
    set id = (select usuario.id_us from usuario where usuario.email=usr and usuario.contrasenia = psw);
    set nm = (select usuario.nombre from usuario where usuario.email=usr and usuario.contrasenia = psw);
    else
		set id=0;
    end if;
select flag as proof, id as identifier, nm as named;

end <j
delimiter ;

drop procedure if exists obtenerUsuarioInfo;
delimiter $t
create procedure obtenerUsuarioInfo(in id int)
begin
    SELECT foto, nombre, apellidop, apellidom, sexo, email, contrasenia, delegacion, colonia, calle, num, codpost
    FROM usuario
    WHERE usuario.id_us=id;
end$t
delimiter ;

drop procedure if exists verificacionVendedor;		-- Agregar a lo de Jeo
delimiter $t
create procedure verificacionVendedor(in id int)
begin
	declare flag nvarchar(1);
    declare role nvarchar(20);
    
	set role = (SELECT tipo FROM usuario WHERE id_us=id);
    
    if(role='Vendedor') then
		set flag='1';
	else
		set flag='0';
    end if;
    
    SELECT flag AS flag;
end$t
delimiter ;



-- --------------------------TARJETA-----------------------------------------------------
drop procedure if exists crearTarjeta;	-- Pasar a Jeo
delimiter $t
create procedure crearTarjeta(in fecven nvarchar(30), 
in nm nvarchar(50), 
in num nvarchar(50), 
in id int)
begin
	declare msj nvarchar(50);
    declare veri int;
    declare flag int;
    declare maxID int;
    
    set veri = (SELECT COUNT(usuario.id_us) FROM usuario WHERE usuario.id_us=id);
    
    if(veri=1) then
		set maxID = (SELECT ifnull(max(tarjeta.id_tarjeta), 0) +1 FROM tarjeta);
		
        set veri = (SELECT COUNT(tarjeta.id_tarjeta) FROM tarjeta WHERE tarjeta.id_us=id AND tarjeta.no_tarjeta=num);
        
        if(veri=0) then 
			INSERT INTO tarjeta VALUES (maxID, fecven, nm, num, id);
			set msj = 'Tarjeta registrada exitosamente!';
			set flag=1;
        else
			set msj = 'Tarjeta ya registrada.';
			set flag=0;
            set maxID=0;
        end if;
    else
		set msj = 'Error al registrar Tarjeta.';
		set flag=0;
        set maxID=0;
    end if;
    
    SELECT flag AS flag , msj AS msj, maxID AS id;
end$t
delimiter ;

drop procedure if exists modificarTarjeta;	-- Agregar a lo de Jeo
delimiter $t
create procedure modificarTarjeta(in idt int,
in fec nvarchar(30),
in nom  nvarchar(50),
in num nvarchar(50),
in id int)
begin
    declare msj nvarchar(50);
    declare flag int;
    declare veri int;
    
    set veri = (SELECT COUNT(id_tarjeta) FROM tarjeta WHERE id_us=id AND id_tarjeta=idt);
    
    if(veri = 1) then
		UPDATE tarjeta SET fecha_ven=fec, nombre=nom, no_tarjeta=num 
        WHERE (tarjeta.id_us=id AND tarjeta.id_tarjeta=idt);
        set msj = 'Tarjeta modificada exitosamente!';
		set flag = 1;
    else
		set msj = 'Tarjeta no encontrada.';
        set flag = 0;
    end if;
    
    SELECT flag AS flag , msj AS msj;
end$t
delimiter ;

drop procedure if exists borrarTarjeta; -- Agregar a lo de Jeo
delimiter $t
create procedure borrarTarjeta(in idu int, in idt int)
begin
	declare msj nvarchar(50);
    declare veri int;
    declare flag int;
    
	set veri = (SELECT COUNT(tarjeta.id_tarjeta) FROM tarjeta WHERE tarjeta.id_us=idu AND tarjeta.id_tarjeta=idt);
	
    if(veri = 1) then
        DELETE FROM comprar WHERE (comprar.id_tarj=idt AND comprar.id_us=idu);
		DELETE FROM tarjeta WHERE (tarjeta.id_tarjeta=idt AND tarjeta.id_us=idu);
        set msj = 'Tarjeta borrada exitosamente!';
		set flag = 1;
    else
		set msj = 'Tarjeta no encontrada.';
        set flag = 0;
    end if;
    
    SELECT flag AS flag , msj AS msj;
end$t
delimiter ;

drop procedure if exists obtenerTarjetas;
delimiter $t
create procedure obtenerTarjetas(in id int)
begin
    SELECT no_tarjeta, fecha_ven, nombre, id_tarjeta
    FROM tarjeta
    WHERE tarjeta.id_us=id;
end$t
delimiter ;

drop procedure if exists tarjeta_info;
delimiter $t
create procedure tarjeta_info(in id int, in idt int)
begin
	SELECT tarjeta.nombre AS nombre, tarjeta.fecha_ven AS fecha, tarjeta.no_tarjeta AS numero, tarjeta.id_tarjeta AS id
    FROM tarjeta WHERE tarjeta.id_us=id AND tarjeta.id_tarjeta=idt;
end$t
delimiter ;



-- --------------------------PRODUCTO-----------------------------------------------------
drop procedure if exists crearProducto;	-- Pasar a Jeo
delimiter $t
create procedure crearProducto(in nm varchar(70),
in id int, 
in marc varchar(30), 
in prec double, 
in descu integer, 
in cant integer, 
in cat varchar(20), 
in fot nvarchar(100), 
in descr nvarchar(100))
begin
	declare msj nvarchar(50);
    declare role nvarchar(25);
    declare veri int;
    declare flag int;
    declare maxID int;
    declare idFirst varchar(2);
    declare idFinal varchar(10);
    
    set role = (SELECT tipo FROM usuario WHERE id_us=id);
    
    if(role = 'Vendedor') then
		set maxID = (SELECT count(producto.id_prod)+1 FROM producto WHERE producto.categoria=cat);
		set idFirst = (SELECT SUBSTRING(cat, 1, 1));
		
		if(maxID < 10) then set idFinal = (SELECT CONCAT(idFirst,'0','0',maxID));
		elseif(maxID >= 10 & maxID < 100) then set idFinal = (SELECT CONCAT(idFirst,'0',maxID));
		elseif(maxID >= 100) then set idFinal = (SELECT CONCAT(idFirst,maxID));
		end if;
		
        set veri = (SELECT COUNT(id_prod) FROM producto WHERE id_prod=idFinal);
        if(veri>0) then set idFinal = (SELECT CONCAT(idFirst,idFinal)); end if;
        
        INSERT INTO producto VALUES (idFinal, nm, id, marc, prec, descu, cant, cat, fot, descr);
		set msj = 'Producto registrado exitosamente!';
		set flag=1;
        
    else
		set msj = 'Error al registrar producto.';
		set flag=0;
    end if;
    
    SELECT flag AS flag , msj AS msj, idFinal as id;
end$t
delimiter ;

drop procedure if exists modificarProducto;
delimiter $t
create procedure modificarProducto(in idp varchar(10),
in nm varchar(70),
in id int, 
in marc varchar(30), 
in prec double, 
in descu integer, 
in cant integer, 
in cat varchar(20), 
in fot nvarchar(100), 
in descr nvarchar(100))
begin
	declare msj nvarchar(50);
    declare veri int;
    declare flag int;
    
    set veri = (SELECT COUNT(id_prod) FROM producto WHERE id_us=id AND id_prod=idp);
	
    if(veri > 0) then
		UPDATE producto SET nombre=nm, id_us=id, marca=marc, precio=prec, descuento=descu, cant_almacen=cant, categoria=cat, foto=fot, descripcion=descr 
        WHERE (producto.id_prod=idp AND producto.id_us=id);
        set msj = 'Producto modificado exitosamente!';
		set flag = 1;
    else
		set msj = 'Producto no encontrado.';
        set flag = 0;
    end if;
    
    SELECT flag AS flag , msj AS msj;
end$t
delimiter ;

drop procedure if exists borrarProducto; -- Agregar a lo de Jeo
delimiter $t
create procedure borrarProducto(in idp varchar(10), in id int)
begin
	declare msj nvarchar(50);
    declare veri int;
    declare flag int;
    
	set veri = (SELECT COUNT(id_prod) FROM producto WHERE id_us=id AND id_prod=idp);
	
    if(veri = 1) then
		DELETE FROM calificacion WHERE (calificacion.id_prod=idp);
        DELETE FROM comprar WHERE (comprar.id_prod=idp);
        DELETE FROM carrito WHERE (carrito.id_prod=idp);
		DELETE FROM producto WHERE (producto.id_prod=idp AND producto.id_us=id);
        set msj = 'Producto borrado exitosamente!';
		set flag = 1;
    else
		set msj = 'Producto no encontrado.';
        set flag = 0;
    end if;
    
    SELECT flag AS flag , msj AS msj;
end$t
delimiter ;

drop procedure if exists productos_cat;
delimiter $t
create procedure productos_cat(in cat varchar(20))
begin
	if(cat='Ofertas') then
		SELECT Q1.foto, T1.nombre AS proveedor, Q1.nombre, Q1.precio, Q1.descuento, Q1.id_prod FROM
			(SELECT * 
			 FROM producto 
			 WHERE descuento>0) AS Q1
		JOIN
			usuario AS T1
		ON T1.id_us=Q1.id_us;
    else
		SELECT Q1.foto, T1.nombre AS proveedor, Q1.nombre, Q1.precio, Q1.descuento, Q1.id_prod FROM
			(SELECT * 
			 FROM producto 
			 WHERE categoria=cat) AS Q1
		JOIN
			usuario AS T1
		ON T1.id_us=Q1.id_us;
    end if;
end$t
delimiter ;

drop procedure if exists producto_edit;		-- Agregar a Jeo
delimiter $t
create procedure producto_edit(in idu int, in id varchar(10))
begin
	SELECT Q1.nombre, T1.nombre AS proveedor, Q1.marca, Q1.precio, Q1.descuento, Q1.cant_almacen, Q1.categoria, Q1.foto, Q1.descripcion  FROM
		(SELECT nombre, id_us AS proveedor,marca, precio, descuento, cant_almacen, categoria,foto, descripcion 
		FROM producto 
		WHERE id_prod=id) AS Q1
	JOIN
		usuario AS T1
	WHERE T1.id_us=Q1.proveedor AND T1.id_us=idu;
end$t
delimiter ;


drop procedure if exists producto_info;
delimiter $t
create procedure producto_info(in id varchar(10))
begin
	SELECT Q1.nombre, T1.nombre AS proveedor, Q1.marca, Q1.precio, Q1.descuento, Q1.cant_almacen, Q1.categoria, Q1.foto, Q1.descripcion  FROM
		(SELECT nombre, id_us AS proveedor,marca, precio, descuento, cant_almacen, categoria,foto, descripcion 
		FROM producto 
		WHERE id_prod=id) AS Q1
	JOIN
		usuario AS T1
	WHERE T1.id_us=Q1.proveedor;
end$t
delimiter ;

drop procedure if exists misProductos;		-- Agregar a lo de Jeo
delimiter $t

create procedure misProductos(in id int)
begin
	SELECT Q1.foto, T1.nombre AS proveedor, Q1.nombre, Q1.precio, Q1.descuento, Q1.id_prod FROM
		(SELECT * 
		 FROM producto 
		 WHERE producto.id_us=id) AS Q1
	JOIN
		usuario AS T1
	ON T1.id_us=Q1.id_us;
end$t
delimiter ;

drop procedure if exists busquedaProducto;		-- Agregar a lo de Jeo
delimiter $t
create procedure busquedaProducto(in texto varchar(50))
begin
SELECT Q3.foto, Q3.proveedor, Q3.nombre, Q3.precio, Q3.descuento, Q3.id_prod FROM
	(SELECT Q2.foto, Q2.proveedor, Q2.nombre, Q2.precio, Q2.descuento, Q2.id_prod, Q2.descripcion, Q2.marca, Q2.categoria FROM
		(SELECT T1.foto, T2.nombre AS proveedor, T1.nombre, T1.precio, T1.descuento, T1.id_prod, T1.descripcion, T1.marca, T1.categoria FROM
			(SELECT * 
			 FROM producto) AS T1
		JOIN
			usuario AS T2
		ON T1.id_us=T2.id_us) AS Q2
	WHERE Q2.nombre LIKE texto OR Q2.descripcion LIKE texto OR Q2.marca LIKE texto OR Q2.categoria LIKE texto OR Q2.proveedor LIKE texto)
    AS Q3;
end$t
delimiter ;

drop procedure if exists todoProductos;		-- Agregar a lo de Jeo
delimiter $t
create procedure todoProductos()
begin
SELECT T1.foto, T2.nombre AS proveedor, T1.nombre, T1.precio, T1.descuento, T1.id_prod FROM
	(SELECT * 
	 FROM producto) AS T1
JOIN
	usuario AS T2
ON T1.id_us=T2.id_us;
end$t
delimiter ;


-- --------------------------CALIFICACION--------------------------------------------------
drop procedure if exists agregarComentario;		-- Agregar a lo de Jeo
delimiter $t
create procedure agregarComentario(in estre int, in comen varchar(50), in idu int, in idp varchar(10))
begin
	declare maxID int;
    declare fec date;
    declare proof1 int;
    declare proof2 int;
    declare msj nvarchar(50);
    declare flag int;
    
	set proof1 = 0;
    set proof2 = 0;
    set maxID = (SELECT ifnull(max(calificacion.id_cal), 0)+1 FROM calificacion);
    set fec = (SELECT CURDATE());

    set proof1 = (SELECT COUNT(usuario.id_us) FROM usuario WHERE usuario.id_us=idu);
    set proof2 = (SELECT COUNT(producto.id_prod) FROM producto WHERE producto.id_prod=idp);
    
    if(proof1=1 AND proof2=1) then
		INSERT INTO calificacion VALUES (maxID, estre, comen, fec, idu, idp);
        set msj = 'Comentario creado exitosamente!';
        set flag = 1;
	else
		set msj = 'Comentario no se pudo crear.';
        set flag = 0;
    end if;
    
    SELECT flag AS flag , msj AS msj;
    
end$t
delimiter ;

drop procedure if exists producto_comen;
delimiter $t
create procedure producto_comen(in id varchar(10))
begin
	SELECT T1.nombre, Q1.estrellas, Q1.comentario, Q1.fecha FROM
		(SELECT id_us, estrellas, comentario, fecha 
		FROM calificacion
		WHERE id_prod=id) AS Q1
	JOIN
		usuario AS T1
	WHERE T1.id_us=Q1.id_us;
end$t
delimiter ;



-- --------------------------REPARTIDOR----------------------------------------------------




-- ---------------------------COMPRAR------------------------------------------------------
drop procedure if exists comprar; -- Agregar a lo de Jeo
delimiter $t
create procedure comprar(in cant int, in dele varchar(45), in colo varchar(45), in cal varchar(60),
in num varchar(15), in cod integer, in tot double, in idu int, in idp varchar(10), in idt int)
begin
	declare msj nvarchar(50);
    declare rolee nvarchar(25);
    declare ver int;
    declare veri int;
    declare flag int;
    declare maxID int;
    declare idFirst varchar(2);
    declare idFinal varchar(10);
    declare feccom date;
    declare fecent date;
    
    set rolee = (SELECT tipo FROM usuario WHERE id_us=idu);
    set ver = (SELECT COUNT(carrito.id_car) FROM carrito WHERE carrito.id_us=idu AND carrito.id_prod=idp);
    
    if(rolee = 'Comprador' AND ver=1) then
		set maxID = (SELECT count(comprar.id_compra)+1 FROM comprar);
		set idFirst='A';
		
		if(maxID < 10) then set idFinal = (SELECT CONCAT(idFirst,'0','0',maxID));
		elseif(maxID >= 10 & maxID < 100) then set idFinal = (SELECT CONCAT(idFirst,'0',maxID));
		elseif(maxID >= 100) then set idFinal = (SELECT CONCAT(idFirst,maxID));
		end if;
		
        set veri = (SELECT COUNT(id_prod) FROM producto WHERE id_prod=idFinal);
        if(veri>0) then set idFinal = (SELECT CONCAT(idFirst,idFinal)); end if;
        
        set feccom = (SELECT CURDATE());
        set fecent = '2025/12/30';
        
        INSERT INTO comprar VALUES (idFinal, cant, dele, colo, cal, num, cod, feccom, fecent,0, tot, "R0000", idu, idp, idt);
        DELETE FROM carrito WHERE (carrito.id_prod=idp AND carrito.id_us=idu);
        UPDATE producto SET cant_almacen=(cant_almacen-cant) WHERE (producto.id_prod=idp);
        
		set msj = 'Compra realizada exitosamente!';
		set flag=1;
        
    else
		set msj = 'Error al realizar Compra.';
		set flag=0;
    end if;
    
    SELECT flag AS flag , msj AS msj;

end$t
delimiter ;

drop procedure if exists compras; -- Agregar id de tarjeta
delimiter $t
create procedure compras(in id int)
begin
	SELECT Q2.id_compra,  Q2.fecha_compra, Q2.fecha_entrega, Q2.nombre, T2.nombre AS proveedor, Q2.total, Q2.estatus FROM 
		(SELECT Q1.id_compra,  Q1.fecha_compra, Q1.fecha_entrega, nombre, T1.id_us, Q1.total, Q1.estatus FROM
			(SELECT id_compra, id_us, id_prod AS id_p, fecha_compra, fecha_entrega, estatus, total 
			 FROM comprar 
			 WHERE id_us=id) AS Q1
		JOIN
			producto AS T1
		ON id_prod=Q1.id_p) AS Q2
	JOIN
		usuario AS T2
	ON T2.id_us=Q2.id_us;
end$t
delimiter ;


drop procedure if exists sp_orders;
delimiter <J
create procedure sp_orders(in idu int)
begin

select producto.foto, usuario.nombre AS proveedor, producto.nombre, producto.precio, producto.descuento, producto.id_prod 
from odysseymarket_db.comprar inner join producto on comprar.id_prod = producto.id_prod 
inner join usuario on producto.id_us = usuario.id_us where comprar.id_us = idu and comprar.estatus != '5';
end <J
delimiter ;

drop procedure if exists sp_orderstatus;
delimiter <J
create procedure sp_orderstatus(in  idu int, in idp nvarchar(10))
begin
select producto.nombre, usuario.nombre as proveedor,producto.marca, producto.precio, producto.descuento, comprar.cantidad, producto.categoria,
    producto.foto, producto.descripcion, comprar.delegacion, comprar.colonia, comprar.calle, comprar.num, comprar.codpost, comprar.fecha_compra,
    comprar.fecha_entrega, comprar.estatus, comprar.total, repartidor.nombre as repartidor, repartidor.tel
    from comprar 
    inner join producto 
    on comprar.id_prod = producto.id_prod
    inner join usuario
    on producto.id_us = usuario.id_us
    inner join repartidor
    on comprar.id_rep = repartidor.id_rep
    where comprar.id_us = idu and comprar.id_prod =  idp;
end <J
delimiter ;

drop procedure if exists sp_sales;
delimiter <j
create procedure sp_sales(in idu int)
begin
select producto.foto, producto.nombre, producto.precio, producto.descuento, producto.id_prod 
from comprar 
inner join producto 
on comprar.id_prod = producto.id_prod
inner join usuario
on producto.id_us = usuario.id_us
where usuario.id_us=idu;
end<j
delimiter ;

drop procedure if exists sp_orderven;
delimiter <J
create procedure sp_orderven(in  idu int, in idp nvarchar(10))
begin
	select producto.nombre, usuario.nombre as proveedor,producto.marca, producto.precio, producto.descuento, comprar.cantidad, producto.categoria,
    producto.foto, producto.descripcion, comprar.delegacion, comprar.colonia, comprar.calle, comprar.num, comprar.codpost, comprar.fecha_compra,
    comprar.fecha_entrega, comprar.estatus, comprar.total, repartidor.nombre as repartidor, repartidor.tel
    from comprar 
    inner join producto 
    on comprar.id_prod = producto.id_prod
    inner join usuario
    on producto.id_us = usuario.id_us
    inner join repartidor
    on comprar.id_rep = repartidor.id_rep
    where usuario.id_us = idu and producto.id_prod = idp;
end<J
delimiter ;

drop procedure if exists sp_updateStatus;
delimiter <J
create procedure sp_updateStatus(in  idu int, in idp nvarchar(10), in statX int)
begin
declare msj nvarchar (25);
declare idX nvarchar (25);
declare fecent date;

	if(idu != 0 && statX !=0 && statX <6 && idp !='')then
    set msj = "Realizado";
    
    set idX = (select comprar.id_compra
    from comprar 
    inner join producto 
    on comprar.id_prod = producto.id_prod
    inner join usuario
    on producto.id_us = usuario.id_us
    inner join repartidor
    on comprar.id_rep = repartidor.id_rep
    where usuario.id_us = idu and producto.id_prod = idp);
    
    if(statX=5) then set fecent = (SELECT CURDATE());
    else set fecent = (SELECT comprar.fecha_entrega FROM comprar WHERE usuario.id_us = idu AND producto.id_prod = idp);
	end if;
    
    update comprar set comprar.estatus=statX, comprar.fecha_entrega=fecent where comprar.id_compra = idX;
    else
    set msj = "Error";
    end if;
    select msj;
end<J
delimiter ;

-- ---------------------------CARRITO-------------------------------------------------------
drop procedure if exists agregarProdCarrito;		-- Agregar a lo de Jeo
delimiter $t
create procedure agregarProdCarrito(in idu int, in idp varchar(10))
begin
	declare maxID int;
    declare proof1 int;
    declare proof2 int;
    declare msj nvarchar(50);
    declare flag int;
    declare veri int;
    
	set proof1 = 0;
    set proof2 = 0;
    
    set proof1 = (SELECT COUNT(usuario.id_us) FROM usuario WHERE usuario.id_us=idu AND usuario.tipo='Comprador');
    set proof2 = (SELECT COUNT(producto.id_prod) FROM producto WHERE producto.id_prod=idp);
    
    if(proof1=1 AND proof2=1) then
		 set maxID = (SELECT ifnull(max(carrito.id_car), 0)+1 FROM carrito);
		 set veri = (SELECT COUNT(carrito.id_car) FROM carrito WHERE carrito.id_prod=idp AND carrito.id_us=idu);
         
         if(veri=0) then
			INSERT INTO carrito VALUES (maxID, idu, idp);
			set msj = 'Producto agregado al Carrito exitosamente!';
			set flag = 1;
		else
			set msj = 'Producto ya agregado al Carrito';
			set flag = 0;
        end if;
	else
		set msj = 'No se pudo agregar el producto al Carrito.';
        set flag = 0;
    end if;
    
    SELECT flag AS flag , msj AS msj;
end$t
delimiter ;

drop procedure if exists borrarProdCarrito; -- Agregar a lo de Jeo
delimiter $t
create procedure borrarProdCarrito(in idu int, in idp varchar(10))
begin
	declare msj nvarchar(50);
    declare veri int;
    declare flag int;
    declare proof1 int;
    declare proof2 int;
    
    set proof1 = 0;
    set proof2 = 0;
    
	set veri = (SELECT COUNT(id_car) FROM carrito WHERE id_us=idu AND id_prod=idp);
    set proof1 = (SELECT COUNT(usuario.id_us) FROM usuario WHERE usuario.id_us=idu AND usuario.tipo='Comprador');
    set proof2 = (SELECT COUNT(producto.id_prod) FROM producto WHERE producto.id_prod=idp);
    
    if(veri=1 AND proof1=1 AND proof2=1) then
        DELETE FROM carrito WHERE (carrito.id_prod=idp AND carrito.id_us=idu);
        set msj = 'Producto borrado del Carrito exitosamente!';
		set flag = 1;
    else
		set msj = 'Producto no encontrado.';
        set flag = 0;
    end if;
    
    SELECT flag AS flag , msj AS msj;
end$t
delimiter ;

drop procedure if exists miCarrito;		-- Agregar a lo de Jeo
delimiter $t
create procedure miCarrito(in id int)
begin
	SELECT Q2.foto, T2.nombre AS proveedor, Q2.nombre, Q2.precio, Q2.descuento, Q2.id_prod FROM
		(SELECT T1.foto, T1.id_us, T1.nombre, T1.precio, T1.descuento, T1.id_prod
        FROM 
			(SELECT carrito.id_us, carrito.id_prod 
			 FROM carrito 
			 WHERE carrito.id_us=id) AS Q1
        JOIN
			producto AS T1
         ON T1.id_prod=Q1.id_prod) AS Q2
	JOIN
		usuario AS T2
	ON T2.id_us=Q2.id_us;
end$t
delimiter ;

drop procedure if exists sp_history;
delimiter <J
create procedure sp_history(in idu int)
begin

select producto.foto, usuario.nombre AS proveedor, producto.nombre, producto.precio, producto.descuento, producto.id_prod 
from odysseymarket_db.comprar inner join producto on comprar.id_prod = producto.id_prod 
inner join usuario on producto.id_us = usuario.id_us where comprar.id_us = idu and comprar.estatus = 5;
end <J
delimiter ;


drop procedure if exists sp_uploadImage;
delimiter <J
create procedure sp_uploadImage(in idp varchar(10),in imagePath nvarchar(100))
begin
	declare msj nvarchar(25);
    if(idp != "" && imagePath !="") then
		update producto set producto.foto = imagePath where producto.id_prod = idp;
        set msj = "realizado";
	else
		set msj = "Error";
    end if;
end <J
delimiter ;

drop procedure if exists sp_uploadAvatar;
delimiter <J
create procedure sp_uploadAvatar(in idu int,in imagePath nvarchar(100))
begin
	declare msj nvarchar(25);
    if(idu != "" && imagePath !="") then
		update usuario set usuario.foto = imagePath where usuario.id_us = idu;
        set msj = "realizado";
	else
		set msj = "Error";
    end if;
end <J
delimiter ;

