
<!DOCTYPE html>
<html>
<head>
    <title>Customer Management</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .container { max-width: 800px; margin: auto; padding: 20px; border: 1px solid #ccc; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; }
        .form-group input, .form-group select { width: 100%; padding: 8px; box-sizing: border-box; }
        .form-group button { width: 100%; padding: 10px; background-color: #007BFF; color: white; border: none; cursor: pointer; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        table, th, td { border: 1px solid #ccc; }
        th, td { padding: 8px; text-align: left; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Customer Management</h2>

        <h3>Add Customer</h3>
        <form id="addCustomerForm">
            <div class="form-group">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName" required>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="lastName" required>
            </div>
            <div class="form-group">
                <label for="street">Street:</label>
                <input type="text" id="street" name="street" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required>
            </div>
            <div class="form-group">
                <label for="city">City:</label>
                <input type="text" id="city" name="city" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" id="phone" name="phone" required>
            </div>
            <div class="form-group">
                <button type="submit">Add Customer</button>
            </div>
        </form>

        <h3>Update Customer</h3>
        <form id="updateCustomerForm">
            <div class="form-group">
                <label for="updatePhone">Phone:</label>
                <input type="text" id="updatePhone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="updateFirstName">First Name:</label>
                <input type="text" id="updateFirstName" name="firstName" required>
            </div>
            <div class="form-group">
                <label for="updateLastName">Last Name:</label>
                <input type="text" id="updateLastName" name="lastName" required>
            </div>
            <div class="form-group">
                <label for="updateStreet">Street:</label>
                <input type="text" id="updateStreet" name="street" required>
            </div>
            <div class="form-group">
                <label for="updateAddress">Address:</label>
                <input type="text" id="updateAddress" name="address" required>
            </div>
            <div class="form-group">
                <label for="updateCity">City:</label>
                <input type="text" id="updateCity" name="city" required>
            </div>
            <div class="form-group">
                <label for="updateEmail">Email:</label>
                <input type="email" id="updateEmail" name="email" required>
            </div>
            <div class="form-group">
                <button type="submit">Update Customer</button>
            </div>
        </form>

<h3>Delete Customer</h3>
        <form id="deleteCustomerForm">
            <div class="form-group">
                <label for="deletePhone">Phone:</label>
                <input type="text" id="deletePhone" name="phone" required>
            </div>
            <div class="form-group">
                <button type="submit">Delete Customer</button>
            </div>
        </form>

        <h3>Customer List</h3>
        <button id="refreshCustomers">Refresh List</button>
        <table>
            <thead>
                <tr>
                    <th>Phone</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Street</th>
                    <th>Address</th>
                    <th>City</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody id="customerList"></tbody>
        </table>
    </div>

    <script>
        // Function to add a customer
        document.getElementById('addCustomerForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const customer = {
                firstName: document.getElementById('firstName').value,
                lastName: document.getElementById('lastName').value,
                street: document.getElementById('street').value,
                address: document.getElementById('address').value,
                city: document.getElementById('city').value,
                email: document.getElementById('email').value,
                phone: document.getElementById('phone').value,
            };
            fetch('/create', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(customer)
            })
            .then(response => response.text())
            .then(data => {
                alert(data);
                refreshCustomerList();
            });
        });

        // Function to update a customer
        document.getElementById('updateCustomerForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const phone = document.getElementById('updatePhone').value;
            const customer = {
                firstName: document.getElementById('updateFirstName').value,
                lastName: document.getElementById('updateLastName').value,
                street: document.getElementById('updateStreet').value,
                address: document.getElementById('updateAddress').value,
                city: document.getElementById('updateCity').value,
                email: document.getElementById('updateEmail').value,
                phone: phone,
            };
            fetch(/update/${phone}, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(customer)
            })
            .then(response => response.text())
            .then(data => {
                alert(data);
                refreshCustomerList();
            });
        });

        // Function to delete a customer
        document.getElementById('deleteCustomerForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const phone = document.getElementById('deletePhone').value;
            fetch(/delete/${phone}, {
                method: 'DELETE'
            })
            .then(response => response.text())
            .then(data => {
                alert(data);
                refreshCustomerList();
            });
        });

        // Function to refresh the customer list
        document.getElementById('refreshCustomers').addEventListener('click', function() {
            refreshCustomerList();
        });

function refreshCustomerList() {
            fetch('/get')
            .then(response => response.json())
            .then(data => {
                const customerList = document.getElementById('customerList');
                customerList.innerHTML = '';
                data.forEach(customer => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${customer.phone}</td>
                        <td>${customer.firstName}</td>
                        <td>${customer.lastName}</td>
                        <td>${customer.street}</td>
                        <td>${customer.address}</td>
                        <td>${customer.city}</td>
                        <td>${customer.email}</td>
                    `;
                    customerList.appendChild(row);
                });
            });
        }

        // Initial load of customer list
        refreshCustomerList();
    </script>
</body>
</html>