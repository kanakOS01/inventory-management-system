from sql_connection import get_sql_connection

def get_all_products(conn):
    cursor = conn.cursor()
    query = ("select products.product_id, products.name, products.uom_id, products.price_per_unit, uom.uom_name "
             "from products inner join uom on products.uom_id = uom.uom_id;")
    cursor.execute(query)

    response = []

    for (product_id, name, uom_id, price_per_unit, uom_name) in cursor:
        # print(product_id, name, uom_id, price_per_unit, uom_name)
        response.append({
            'product_id': product_id,
            'name': name,
            'uom_id': uom_id,
            'price_per_unit': price_per_unit,
            'uom_name': uom_name
        })
    # for tuple in cursor:
    #     print(tuple)
    return response

def add_product(conn, product):
    cursor = conn.cursor()
    query = ("INSERT INTO `inventory_system`.`products` (`name`, `uom_id`, `price_per_unit`) VALUES (%s, %s, %s)")
    data = (product['name'], product['uom_id'], product['price_per_unit'])
    cursor.execute(query, data)
    conn .commit()

    return cursor.lastrowid

def delete_product(conn, product_id):
    cursor = conn.cursor()
    query = ("DELETE FROM products WHERE product_id = " + str(product_id))
    cursor.execute(query)
    conn.commit()

if __name__ == "__main__": 
    conn = get_sql_connection()

    # print(get_all_products(conn))
    # print(add_product(conn, {
    #     'name': 'cabbage',
    #     'uom_id': '1',
    #     'price_per_unit': '10'
    # }))
    delete_product(conn, 17)

    conn.close()
