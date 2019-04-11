from flask import Flask, render_template
app = Flask(__name__)
# 3. Define what to do when a user hits the index route


@app.route("/")
def home():
    print("Server received request for 'Home' page...")
    return render_template('index.html')

if __name__ == "__main__":
    app.run(debug=True)