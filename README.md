# 🩺 Medical Cost Regression API

> A Machine Learning project that predicts **medical insurance charges** based on patient attributes such as age, BMI, smoking habits, and region — built with **Scikit-Learn**, served through a **FastAPI** backend, and containerized using **Docker**.

---

## 📘 Table of Contents
- [Overview](#-overview)
- [Tech Stack](#-tech-stack)
- [Model Workflow](#-model-workflow)
- [Project Structure](#-project-structure)
- [Installation (Local)](#-installation-local)
- [API Usage](#-api-usage)
- [Docker Deployment](#-docker-deployment)
- [Render Deployment (Free Cloud)](#-render-deployment-free-cloud)
- [Example Prediction](#-example-prediction)
- [Results](#-results)
- [Future Enhancements](#-future-enhancements)
- [Author](#-author)

---

## 🚀 Overview

This project builds a **multiple linear regression model** using the **Insurance dataset** to predict a person’s medical cost (`charges`) based on key demographic and lifestyle factors.  
The trained model is exposed via a **FastAPI** endpoint `/predict`, returning real-time predictions in JSON format.

---

## 🧠 Tech Stack

| Category | Tools / Libraries |
|-----------|------------------|
| **Language** | Python 3.11 |
| **Framework** | FastAPI, Uvicorn |
| **ML / Data** | Scikit-Learn, Pandas, NumPy, Joblib |
| **Deployment** | Docker, Render (Cloud) |
| **Version Control** | Git, GitHub |

---

## 🔬 Model Workflow

1. **Data Loading** — Reads `insurance.csv` dataset.  
2. **Preprocessing** — Encodes categorical features (`sex`, `smoker`, `region`) and scales numeric ones (`age`, `bmi`, `children`).  
3. **Model Training** — Trains a **Ridge Regression** pipeline (`Pipeline + ColumnTransformer`).  
4. **Evaluation** — Calculates RMSE and R² score.  
5. **Exporting Model** — Saves final model as `final_medcost_model.joblib`.  
6. **Serving via FastAPI** — Exposes `/predict` endpoint for real-time inference.

---

## 📂 Project Structure

Medical Cost Regression/
│
├── app.py # FastAPI application
├── final_medcost_model.joblib # Trained model pipeline
├── insurance.csv # Dataset
├── requirements.txt # Python dependencies
├── Dockerfile # Docker container setup
├── Procfile # (For Render deployment)
├── render.yaml # (Render service config)
├── .gitignore # Ignored files for git
└── README.md # Project documentation


---

## 💻 Installation (Local)

Clone the repository and set up a local environment:

```bash
# 1. Clone repo
git clone https://github.com/Shank312/D-Day-09-ML-Projects-Medical-Cost-Regression.git
cd D-Day-09-ML-Projects-Medical-Cost-Regression

# 2. Install dependencies
pip install -r requirements.txt

# 3. Run the FastAPI server
uvicorn app:app --host 0.0.0.0 --port 8000

Now open your browser at:
👉 http://127.0.0.1:8000/docs
 to access Swagger UI.

🔗 API Usage
Endpoint: /predict

Method: POST
Request Body (JSON):
{
  "age": 35,
  "sex": "male",
  "bmi": 28.6,
  "children": 2,
  "smoker": "no",
  "region": "southeast"
}

Response:
{
  "predicted_charges": 6900.0943
}


🐳 Docker Deployment

You can containerize and run the API locally with Docker.
# 1. Build image
docker build -t medcost-api .

# 2. Run container
docker run -p 8000:8000 medcost-api

Then visit:
👉 http://localhost:8000/docs


☁️ Render Deployment (Free Cloud)

Push this project to GitHub (you already did ✅).

Go to https://render.com
 → sign in with GitHub.

Click New Web Service → select your repo.

Render auto-detects the FastAPI app.

Confirm settings:
Build Command: pip install -r requirements.txt
Start Command: gunicorn app:app -k uvicorn.workers.UvicornWorker --bind 0.0.0.0:$PORT


Click Deploy 🎉

Within 2–3 minutes your API will be live at:
👉 https://<your-app-name>.onrender.com/docs


🧪 Example Prediction (via Python Requests)

You can test the API programmatically:
import requests

url = "https://<your-app-name>.onrender.com/predict"

data = {
    "age": 40,
    "sex": "female",
    "bmi": 32.1,
    "children": 3,
    "smoker": "yes",
    "region": "southwest"
}

response = requests.post(url, json=data)
print(response.json())


📈 Results
| Metric        | Value            |
| ------------- | ---------------- |
| **RMSE**      | ~4400            |
| **R² Score**  | ~0.85            |
| **Algorithm** | Ridge Regression |
✅ Model achieves high performance with effective regularization.


🔮 Future Enhancements

Add Lasso & Polynomial Regression comparisons

Integrate Streamlit UI for interactive predictions

Add CI/CD Pipeline for automated testing and deployment

Store model artifacts in AWS S3 / Hugging Face Hub

Log requests using MLflow / Weights & Biases


👨‍💻 Author

Shankar Kumar
AI & Machine Learning Engineer | Software Developer
🌐 GitHub Profile
📧 shankark3121999@gmail.com


🏁 License

This project is open-source under the MIT License.
You are free to use, modify, and distribute it with attribution.
