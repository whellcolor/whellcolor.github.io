from flask import Flask, jsonify, render_template, request
from flask_cors import CORS
from main import WhellcolorSASTEngine

app = Flask(__name__)
CORS(app)  # Mengizinkan akses dari domain luar (termasuk GitHub Pages)

# Inisialisasi engine SAST
sast_engine = WhellcolorSASTEngine()


@app.route("/", methods=["GET"])
def home():
  # Jika ingin merender HTML untuk halaman utama, gunakan baris di bawah:
  # return render_template('index.html')

  # Atau jika ingin mengembalikan JSON API info, gunakan ini:
  return jsonify({
      "status": "online",
      "service": "Whellcolor Fortify SAST API",
      "supported_languages_count": len(sast_engine.supported_tech),
  })


@app.route("/api/scan", methods=["POST"])
def scan_code():
  data = request.json
  if not data or "filename" not in data:
    return jsonify({"error": "Invalid input, 'filename' is required"}), 400

  filename = data.get("filename")
  content = data.get("content", "")

  # Jalankan analisis dari main.py
  result = sast_engine.analyze(filename, content)
  return jsonify(result)


if __name__ == "__main__":
  # Menjalankan server lokal pada port 5000
  app.run(host="0.0.0.0", port=5000, debug=True)
