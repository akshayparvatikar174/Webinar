package 'apache2' do
  action :install
end

# Start and enable Apache service
service 'apache2' do
  action [:enable, :start]
end

# Create a custom webpage
file '/var/www/html/index.html' do
  content <<-HTML
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Progress Chef Webinar</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(to right, #4facfe, #00f2fe);
        color: white;
        text-align: center;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
        overflow: hidden;
      }
      h1 {
        font-size: 3rem;
        margin: 0.5em 0;
        text-shadow: 2px 2px #00203F;
      }
      p {
        font-size: 1.5rem;
        margin: 0.5em 0;
        text-shadow: 1px 1px #00203F;
      }
      footer {
        margin-top: 2em;
        font-size: 1rem;
        opacity: 0.8;
      }
    </style>
  </head>
  <body>
    <h1>Welcome to Progress Chef Webinar</h1>
    <p>Your Presenter for today: <strong>Kurt Jung</strong></p>
    <footer>&copy; #{Time.now.year} Progress Chef</footer>
  </body>
  </html>
  HTML
  action :create
end
