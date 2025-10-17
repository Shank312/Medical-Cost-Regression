
from fastapi import FastAPI
from pydantic import BaseModel
import joblib
import pandas as pd

model = joblib.load('final_medcost_model.joblib')
app = FastAPI()

class Patient(BaseModel):
    age: float
    sex: str
    bmi: float
    children: int
    smoker: str
    region: str

@app.post('/predict')
def predict(patient: Patient):
    df = pd.DataFrame([patient.dict()])
    pred = model.predict(df)[0]
    return {'predicted_charges': float(pred)}
