from fastapi import FastAPI
import onnxruntime as ort
import numpy as np

app = FastAPI()

# Load ONNX model (dummy for demo)
session = ort.InferenceSession("model.onnx")

@app.get("/")
def root():
    return {"status": "AI Infra Inference Service running"}

@app.post("/predict")
def predict(x: float, y: float):
    input_data = np.array([[x, y]], dtype=np.float32)
    inputs = {session.get_inputs()[0].name: input_data}
    result = session.run(None, inputs)
    return {"prediction": float(result[0][0][0])}
