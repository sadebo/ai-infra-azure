from fastapi import FastAPI
import onnxruntime as ort
import numpy as np

app = FastAPI()

# Dummy ONNX session
session = ort.InferenceSession("model.onnx", providers=["CPUExecutionProvider"])

@app.get("/")
def health():
    return {"status": "FastAPI Inference Service Running"}

@app.post("/predict")
def predict(x: float, y: float):
    arr = np.array([[x, y]], dtype=np.float32)
    inputs = {session.get_inputs()[0].name: arr}
    result = session.run(None, inputs)
    return {"prediction": float(result[0][0][0])}
