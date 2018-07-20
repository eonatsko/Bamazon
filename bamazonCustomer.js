var mysql = require("mysql");
var inquirer = require("inquirer");
const cTable = require("console.table");

// create the connection information for the sql database
var connection = mysql.createConnection({
    host: "localhost",

    port: 3306,

    user: "root",

    password: "password",
    database: "bamazon"
});
connection.connect(function (err) {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);
    afterConnection();
});

function afterConnection() {
    connection.query("SELECT * FROM products", function (err, results) {
        if (err) throw err;
        console.table(results);
        inquirer
            .prompt([
                {
                    name: "buyItem",
                    type: "input",
                    message: "Please enter the ID of the item you would like to purchase"
                },
                {
                    name: "quantity",
                    type: "input",
                    message: "Enter the quantity you would like to purchase"
                }

            ])
            .then(function (answer) {
                if ((answer.buyItem >results.length)||(answer.buyItem <=0)) {
                    console.log('\x1b[31m%s\x1b[0m', 'Invalid item ID, please review information below and try again' );
                    afterConnection();
                }
                for (var i = 0; i < results.length; i++) {
                    if (results[i].item_id == answer.buyItem) {
                        var chosenItem;
                        chosenItem = results[i];
                        if (chosenItem.stock_quantity >= parseInt(answer.quantity)) {
                            var updateStock = parseInt(chosenItem.stock_quantity - answer.quantity);
                            connection.query(
                                "UPDATE products SET ? WHERE ?",
                                [
                                    {
                                        stock_quantity: updateStock
                                    },
                                    {
                                        item_id: chosenItem.item_id
                                    }
                                ],
                               
                            );
                            var updatePrice = parseFloat(chosenItem.price*answer.quantity);
                            console.log("Your total is $"+updatePrice+" thank you for shopping with us");
                            connection.end();

                        }
                        else {
                            //if desired quantity surpasses stock
                            console.log('\x1b[31m%s\x1b[0m','Sorry, there are not enough items in stock to fulfill your request, please review stock qunatity and try again');
                            afterConnection();
                        }
                    }
                }
            });
    })
}
