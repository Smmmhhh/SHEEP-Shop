use shoppingMall;

-- 멤버 테이블 생성

create table if not exists members(
    memberId varchar(20) primary key,
    passwd varchar(20) not null,
    memberName varchar(10),
    gender varchar(5),
    phoneNo varchar(20),
    memberAddress varchar(50),
    memberPoint int default 0,
    memberValidity int not null
);

-- 카테고리 테이블 생성

create table if not exists categories(
    ctgID int auto_increment primary key,
    ctgName varchar(20) not null
);

-- 상품 테이블 생성

create table if not exists products(
    prodID int auto_increment primary key,
    ctgID int,
    prodName varchar(10) not null,
    price int not null,
    stock int,
    detail text,
    prodSize varchar(10),
    prodOrigin varchar(10),
    prodDate varchar(20),
    prodValidity int not null,
    foreign key(ctgID) references categories(ctgID) on update cascade
);

-- 주문 테이블 생성

create table if not exists orders(
    orderID int auto_increment primary key,
    memberID varchar(20),
    orderAddress varchar(50),
    orderPhoneNo varchar(20),
    totalPrice int,
    orderValidity int not null,
    foreign key(memberID) references members(memberID) on update cascade
);

-- 장바구니 테이블 생성

create table if not exists carts(
    cartID int primary key,
    memberID varchar(20),
    cartValidity int not null,
    foreign key(memberID) references members(memberID) on update cascade
);

-- 주문상품 테이블 생성

create table if not exists orderProducts(
    orderProdID int auto_increment primary key,
    orderID int,
    prodID int,
    orderQuantity int not null,
    orderProdValidity int not null,
    foreign key(orderID) references orders(orderID) on update cascade,
    foreign key(prodID) references products(prodID) on update no action
);

-- 장바구니상품 테이블 생성

create table if not exists cartProducts(
    cartProdID int auto_increment primary key,
    cartID int,
    prodID int,
    cartQuantity int not null,
    cartProdValidity int not null,
    foreign key(cartID) references carts(cartID) on update cascade,
    foreign key(prodID) references products(prodID) on update no action
);