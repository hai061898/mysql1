CREATE DATABASE ProductShop; 
--- tạo database
Use ProductShop 
--- sử dụng database 
CREATE TABLE person 
(
    uid INT PRIMARY KEY AUTO_INCREMENT
    --tạo khóa chính cho bảng kiểu int , tự động tăng
    firstName VARCHAR(50) NULL,
    -- Varchar là kiểu dự liệu tự hiểu , max 50 ký tự và có thê rỗng (null)
    phone VARCHAR(11) NULL,
	address VARCHAR(90) NULL,
	reference VARCHAR(90) NULL,
	image VARCHAR(250) NULL
) 

CREATE TABLE users 
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	users VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL,
	passwordd VARCHAR(100) NOT NULL,
	token VARCHAR(256) NULL,
	statuss BOOL NULL DEFAULT 1,
    --tạo biến statuss , bool (có 2 trạng thái true: đúng = 0 , flase: sai =1  ), tự gán = 1 
	verified_email BOOL NULL,
	persona_id INT NOT NULL,
	created DATETIME DEFAULT NOW(),
    -- tạo biến thời gian , default tự gán giá trị
	UNIQUE KEY (email),
    --unique key () email chỉ có 1 cái mail là độc nhất 
	FOREIGN KEY (persona_id) REFERENCES person(uid)
    --tạo khóa phụ với trường dữ liệu persona_id , tương tác với bảng person (trường dữ liệu uid)
)

CREATE TABLE Home_carousel
(
	uidCarousel INT PRIMARY KEY AUTO_INCREMENT,
	image VARCHAR(256) NULL,
	category VARCHAR(100) NULL
)

CREATE TABLE Category
(
	uidCategory INT PRIMARY KEY AUTO_INCREMENT,
	category VARCHAR(80),
	picture VARCHAR(100),
	status BOOL DEFAULT 1
)

CREATE TABLE Products
(
	uidProduct INT PRIMARY KEY AUTO_INCREMENT,
	nameProduct VARCHAR(90) NULL,
	description VARCHAR(256) NULL,
	codeProduct VARCHAR(100) NULL,
	stock INT NULL,
	price DOUBLE(18,2) NULL,
    -- tạo biến kiểu double làm tròn 2 chữ số 
	status VARCHAR(80) NULL,
	picture VARCHAR(256) NULL,
	category_id INT,
	FOREIGN KEY (category_id) REFERENCES Category(uidCategory)
)

CREATE TABLE favorite
(
	uidFavorite INT PRIMARY KEY AUTO_INCREMENT,
	product_id INT,
    -- biến không có null là biến bắt buộc phải khai báo
	user_id INT,
	FOREIGN KEY(product_id) REFERENCES Products(uidProduct),
	FOREIGN KEY(user_id) REFERENCES users(persona_id)
)

CREATE TABLE orderBuy
(
	uidOrderBuy INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	receipt VARCHAR(100),
	datee DATETIME,
	amount DOUBLE(11,2),
	FOREIGN KEY(user_id) REFERENCES users(persona_id)
)

CREATE TABLE orderDetails
(
	uidOrderDetails INT PRIMARY KEY AUTO_INCREMENT,
	orderBuy_id INT,
	product_id INT,
	quantity INT,
	price DOUBLE(11,2),
	FOREIGN KEY(orderBuy_id) REFERENCES orderBuy(uidOrderBuy),
	FOREIGN KEY(product_id) REFERENCES Products(uidProduct)
)


