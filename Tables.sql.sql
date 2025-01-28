-- db: bookservice

CREATE TABLE Usuario(
    UsuarioId INTEGER NOT NULL AUTO_INCREMENT,
    NickName VARCHAR(50),
    Password VARCHAR(64),
    PRIMARY KEY (UsuarioId)
);

CREATE TABLE Marca(
    MarcaId INTEGER NOT NULL AUTO_INCREMENT,
    NombreMarca VARCHAR(50),
    PRIMARY KEY (MarcaId)
);
CREATE TABLE Unidad(
    UnidadId INTEGER NOT null AUTO_INCREMENT,
    NombreUnidad VARCHAR(50),
    Descripcion VARCHAR(50),
    PRIMARY KEY (UnidadId)
);
CREATE TABLE Proveedor(
    ProveedorId INTEGER NOT null AUTO_INCREMENT,
    Compania VARCHAR(50),
    NombreProveedor VARCHAR(50),
    Direccion VARCHAR(50),
    Celular VARCHAR(10),
    PRIMARY KEY (ProveedorId)
);
CREATE TABLE Precio (
    PrecioId INTEGER NOT NULL AUTO_INCREMENT,
    PrecioCompra FLOAT(5,1),
    PrecioVenta FLOAT(5,1),
    Active BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (PrecioId)
);
CREATE TABLE FacturaCompra(
    FacturaCompraId INTEGER NOT NULL AUTO_INCREMENT,
    FechaCompra DATETIME DEFAULT CURDATE(),
    ProveedorId INTEGER,
    PRIMARY KEY (FacturaCompraId)
);
CREATE TABLE MarcaProveedor (
    MarcaProveedorId INTEGER NOT NULL AUTO_INCREMENT,
    MarcaId INTEGER,
    ProveedorId INTEGER,
    FOREIGN KEY (MarcaId) REFERENCES Marca(MarcaId),
    FOREIGN KEY (ProveedorId) REFERENCES Proveedor(ProveedorId),
    PRIMARY KEY (MarcaProveedorId)
);

CREATE TABLE Cliente(
    ClienteId INTEGER NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Direccion VARCHAR(50),
    Celular VARCHAR(10),
    PRIMARY KEY (ClienteId)
);
CREATE TABLE FacturaVenta(
    FacturaVentaId INTEGER NOT NULL AUTO_INCREMENT,
    FechaVenta DATETIME DEFAULT CURDATE(),
    ClienteId INTEGER,
    PRIMARY KEY (FacturaVentaId),
    FOREIGN KEY (ClienteId) REFERENCES Cliente(ClienteId)
);
CREATE TABLE Imagen(
    ImagenId INTEGER NOT NULL AUTO_INCREMENT,
    Ruta VARCHAR(70),
    Nombre VARCHAR(70),
    PRIMARY KEY (ImagenId)
);

CREATE TABLE Producto(
    ProductoId INTEGER NOT NULL AUTO_INCREMENT,
    Descripcion VARCHAR(50),
    Codigo VARCHAR(10),
    MarcaId INTEGER,
    PrecioId INTEGER,
    UnidadId INTEGER,
    ImagenId INTEGER,
    ProveedorId INTEGER,
    FOREIGN KEY (MarcaId) REFERENCES Marca(MarcaId),
    FOREIGN KEY (PrecioId) REFERENCES Precio(PrecioId),
    FOREIGN KEY (UnidadId) REFERENCES Unidad(UnidadId),
    FOREIGN KEY (ImagenId) REFERENCES Imagen(ImagenId),
    FOREIGN KEY (ProveedorId) REFERENCES Proveedor(ProveedorId),
    PRIMARY KEY (ProductoId)
);
CREATE TABLE ProductoFactura(
    ProductoFacturaId INTEGER NOT NULL AUTO_INCREMENT,
    ProductoId INTEGER,
    FOREIGN KEY (ProductoId) REFERENCES Producto(ProductoId),
    PRIMARY KEY (ProductoFacturaId)
);

CREATE TABLE ProductoProveedor(
    ProductoProveedorId INTEGER NOT NULL AUTO_INCREMENT,
    ProductoId INTEGER,
    ProveedorId INTEGER,
    FOREIGN KEY (ProductoId) REFERENCES Producto(ProductoId),
    FOREIGN KEY (ProveedorId) REFERENCES Proveedor(ProveedorId),
    PRIMARY KEY (ProductoProveedorId)
);

CREATE TABLE ProductoImagen(
    ProductoImagenId INTEGER NOT NULL AUTO_INCREMENT,
    ProductoId INTEGER,
    ImagenId INTEGER,
    FOREIGN KEY (ProductoId) REFERENCES Producto(ProductoId),
    FOREIGN KEY (ImagenId) REFERENCES Imagen(ImagenId),
    PRIMARY KEY (ProductoImagenId)
);

INSERT INTO Usuario (NickName, Password) VALUES ('admin', 'admin');