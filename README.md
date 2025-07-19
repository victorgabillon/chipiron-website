# Chipiron Website

Chipiron Website is a web application for playing chess against the Chipiron chess engine. It features a web interface built with Flask and Bootstrap, and integrates the [chipiron](https://github.com/victorgabillon/chipiron) chess engine for move calculation.

## Features

- Play chess in your browser with a graphical board (chessboard.js)
- Move generation and game logic powered by the Chipiron engine
- Responsive UI with Bootstrap
- Move history and PGN display
- "About" page with project information

## Project Structure

```
.
├── app.py                  # Example Flask app (not used in production)
├── app.yaml                # Google Cloud Run deployment config
├── Dockerfile              # Container build instructions
├── requirements.txt        # Python dependencies
├── flaskapp/               # Main Flask application
│   ├── flask_app.py        # Main Flask app entrypoint
│   ├── test_flask_app.py   # Simple test for move endpoint
│   ├── board_test.py       # Example using python-chess
│   ├── static/             # Static files (CSS, JS, chessboard.js)
│   └── templates/          # HTML templates (Jinja2)
├── MakefileForTest.mk      # Data download helper
├── README.md               # This file
└── ...
```

## Getting Started

### Prerequisites

- Python 3.12
- [chipiron](https://github.com/victorgabillon/chipiron) Python package
- (Optional) Docker for containerized deployment

### Local Development

1. **Clone the repository:**
    ```sh
    git clone https://github.com/victorgabillon/chipiron-website.git
    cd chipiron-website
    ```

2. **Install dependencies:**
    ```sh
    pip install -r requirements.txt
    ```

3. **Run the Flask app:**
    ```sh
    python flaskapp/flask_app.py
    ```
    The app will be available at [http://localhost:5000](http://localhost:5000).

### Running with Docker

1. **Build the Docker image:**
    ```sh
    docker build -t chipiron-website .
    ```

2. **Run the container:**
    ```sh
    docker run -p 8080:8080 chipiron-website
    ```
    The app will be available at [http://localhost:8080](http://localhost:8080).

### Deploying to Google Cloud Run

1. **Deploy using gcloud:**
    ```sh
    gcloud run deploy --allow-unauthenticated --source .
    ```
    See [Notes.md](Notes.md) for more deployment tips.

## Usage

- Open the website in your browser.
- Play chess against the Chipiron engine.
- Use the "About" page for more information and contact details.

## License

This project is licensed under the [GNU GPL v3](LICENSE).

## Acknowledgements

- [chipiron](https://github.com/victorgabillon/chipiron) chess engine
- [chessboard.js](https://github.com/oakmac/chessboardjs) for the chessboard UI

---

For questions or contributions, contact
