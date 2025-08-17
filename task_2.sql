
USE alx_book_store;

-- AUTHORS TABLE
CREATE TABLE IF NOT EXISTS Authors (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  author_name VARCHAR(215) NOT NULL
) ENGINE=INNODB;

-- CUSTOMERS TABLE
CREATE TABLE IF NOT EXISTS Customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215) NOT NULL,
  address TEXT,
  UNIQUE KEY uq_customers_email (email)
) ENGINE=INNODB;

-- BOOKS TABLE
CREATE TABLE IF NOT EXISTS Books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(130) NOT NULL,
  author_id INT NOT NULL,
  price DOUBLE NOT NULL CHECK (price >= 0),
  publication_date DATE,
  CONSTRAINT fk_books_author
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=INNODB;

-- ORDERS TABLE
CREATE TABLE IF NOT EXISTS Orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  INDEX idx_orders_customer_id (customer_id)
) ENGINE=INNODB;

-- ORDER_DETAILS TABLE
CREATE TABLE IF NOT EXISTS Order_Details (
  orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  book_id INT NOT NULL,
  quantity DOUBLE NOT NULL CHECK (quantity > 0),
  CONSTRAINT fk_orderdetails_order
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_orderdetails_book
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  UNIQUE KEY uq_order_book (order_id, book_id)
) ENGINE=INNODB;
