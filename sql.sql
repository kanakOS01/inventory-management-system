CREATE SCHEMA inventorySystem;

CREATE TABLE `inventory_system`.`products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `uom_id` INT NOT NULL,
  `price_per_unit` DOUBLE NULL,
  PRIMARY KEY (`product_id`));

INSERT INTO `inventory_system`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('1', 'toothpaste', '1', '50');
INSERT INTO `inventory_system`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('2', 'rice', '2', '120');
INSERT INTO `inventory_system`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('3', 'flour', '2', '70');
INSERT INTO `inventory_system`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('4', 'pulses', '2', '120');
INSERT INTO `inventory_system`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('5', 'shampoo', '1', '200');
INSERT INTO `inventory_system`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('6', 'soap', '1', '40');
INSERT INTO `inventory_system`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('7', 'detergent', '1', '300');
INSERT INTO `inventory_system`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('8', 'mop', '1', '150');
INSERT INTO `inventory_system`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('9', 'apple', '2', '160');
INSERT INTO `inventory_system`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('10', 'banana', '2', '60');
INSERT INTO `inventory_system`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('11', 'okra', '2', '100');
INSERT INTO `inventory_system`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('12', 'tomato', '2', '40');
INSERT INTO `inventory_system`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('13', 'onion', '2', '40');


CREATE TABLE `inventory_system`.`uom` (
  `uom_id` INT NOT NULL AUTO_INCREMENT,
  `uom_name` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`unit_id`));

INSERT INTO `inventory_system`.`units` (`uom_id`, `uom_name`) VALUES ('1', 'each');
INSERT INTO `inventory_system`.`units` (`uom_id`, `uom_name`) VALUES ('2', 'kg');

-- adding foreign key to connect units to products
ALTER TABLE `inventory_system`.`products` 
ADD CONSTRAINT `fk_uom_id`
  FOREIGN KEY (`uom_id`)
  REFERENCES `inventory_system`.`uom` (`uom_id`)
  ON DELETE NO ACTION
  ON UPDATE RESTRICT;


-- order table
CREATE TABLE `inventory_system`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `cust_name` VARCHAR(45) NOT NULL,
  `total` DOUBLE NOT NULL,
  `datetime` DATETIME NOT NULL,
  PRIMARY KEY (`order_id`));


-- order details table
CREATE TABLE `inventory_system`.`order_details` (
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` DOUBLE NOT NULL,
  `total_price` DOUBLE NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_product_id_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `inventory_system`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `inventory_system`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE RESTRICT);


