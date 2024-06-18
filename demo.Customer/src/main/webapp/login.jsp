<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .container { max-width: 400px; margin: auto; padding: 20px; border: 1px solid #ccc; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; }
        .form-group input { width: 100%; padding: 8px; box-sizing: border-box; }
        .form-group button { width: 100%; padding: 10px; background-color: #007BFF; color: white; border: none; cursor: pointer; }
        .error { color: red; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form id="loginForm" action="/login" method="post">
            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" id="phone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
                
            </div>
            <div class="form-group">
                <button type="submit">Login</button>
            </div>
        </form>
        <div id="message" class="error">${message}</div>
    </div>

    <script>
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            e.preventDefault();

            const phone = document.getElementById('phone').value;
            const email = document.getElementById('email').value;

            fetch('/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ phone, email })
            })
            .then(response => {
                if (response.redirected) {
                    window.location.href = response.url;
                } else {
                    return response.text().then(text => { throw new Error(text); });
                }
            })
            .catch(error => {
                document.getElementById('message').innerText = error.message;
            });
        });
    </script>
</body>
</html>