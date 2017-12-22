# Course Management System

## Dependencias

* Git
* Bundler gem
* PostgreSQL

## Setup

Lo primero que se debe hacer es clonar el repositorio y moverse al nuevo directorio

```bash
$ git clone git@github.com:pedrobrost/Course-Management.git
$ cd Course-Management
```

Luego se debe instalar las gemas requeridas por el proyecto mediante `Bundler`

```bash
$ bundle install
```

Si se encuentra en un entorno corriendo `Ubuntu`, es muy probable que necesite instalar lo siguiente:

```bash
$ sudo apt install libpq-dev
```

Para especificar las credenciales de la base de datos se utiliza `Figaro` por lo tanto primero se debe ejecutar:

```bash
$ bundle exec figaro install
```

El comando anterior genera dentro de la carpeta `config` un archivo llamado `application.yml` donde se deben especificar las credenciales para conectarse a la base de datos `PostgreSQL`. Para esto se debe ingresar algo del estilo:

```yml
# ./config/application.yml

development:
  DB_USERNAME: #nombre de usuario
  DB_PASSWORD: #contraseña
```

Al tratarse de una base de datos PostgreSQL, si existe un `rol` con nuestro mismo nombre de usuario, no es necesario configurar ninguna credencial.

La preparación de la base de datos se realiza ejecutando:

```bash
$ bin/rails db:setup # crea la base de datos, carga el esquema e inicializa los datos seed
```

Por último para encender el servidor web:

```bash
$ bin/rails s
```

El comando anterior enciende un servidor web que escucha por defecto en la interfaz `0.0.0.0` en el puerto `3000`.

Se puede acceder al sitio usando las siguientes credenciales:

* Email: `admin@gmail.com`
* Contraseña: `123456`

## Tests

Para correr todos los tests se debe ejecutar:

```bash
$ bin/rails test
```

Además es posible ejecutar los tests de forma separada:

```bash
$ bin/rails test test/models/course_test.rb
$ bin/rails test test/models/exam_test.rb
$ bin/rails test test/models/result_test.rb
$ bin/rails test test/models/student_test.rb
```