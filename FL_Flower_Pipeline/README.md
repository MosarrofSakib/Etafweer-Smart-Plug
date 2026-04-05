# Federated Learning (FL) Flower Pipeline

This module implements a Federated Learning (FL) pipeline using the Flower framework for multi-modal (MM) classification. It supports both **pre-deployment** and **post-deployment** stages as part of the Semi-Supervised Federated Learning (SSFL) framework.

---

## 📌 Overview

The pipeline follows a **server-client architecture**:

- `server.py` → Coordinates federated training and aggregation
- `client.py` → Simulates distributed clients with local datasets

### Supported Stages

- **Pre-deployment (`--stage Pre`)**
  - Uses benchmark datasets (QUD, DRED)
  - Validates FL and SSFL pipeline before real-world deployment

- **Post-deployment (`--stage Post`)**
  - Uses real-world smart plug data
  - Evaluates model performance under deployment conditions

---

## ⚙️ Requirements

- Python 3.11+
- TensorFlow 2.x
- Flower (`flwr`)
- NumPy
- Pandas
- Scikit-learn
- Matplotlib

Install dependencies:

```bash
pip install -r requirements.txt
```

---

## 🚀 Usage

### 1. Start the FL Server

```bash
python server.py --stage Pre --fed-alg FedAvg --dataset QUD --pretrained
```

### Server Arguments

| Argument       | Description                                                  |
| -------------- | ------------------------------------------------------------ |
| `--stage`      | `Pre` or `Post`                                              |
| `--fed-alg`    | Federated aggregation algorithm (e.g., `FedAvg`)             |
| `--dataset`    | Dataset selection (`QUD` or `DRED`) (required for Pre stage) |
| `--pretrained` | Enable SSFL pretraining (optional flag)                      |

---

### 2. Start FL Clients

```bash
python client.py --client_id 1 --stage Pre --dataset QUD
```

### Client Arguments

| Argument      | Description                                                  |
| ------------- | ------------------------------------------------------------ |
| `--client_id` | Unique client identifier (e.g., 1, 2, 3, ...)                |
| `--stage`     | `Pre` or `Post`                                              |
| `--dataset`   | Dataset selection (`QUD` or `DRED`) (required for Pre stage) |

💡 Run multiple clients in separate terminals:

```bash
python client.py --client_id 1 --stage Pre --dataset QUD
python client.py --client_id 2 --stage Pre --dataset QUD
python client.py --client_id 3 --stage Pre --dataset QUD
```

---

## 🔁 Workflow

### Pre-deployment Stage

1. Select dataset (`QUD` or `DRED`)
2. Optionally train a supervised baseline (`--pretrained`)
3. Distribute data across simulated clients
4. Perform federated training using selected algorithm
5. Evaluate on a fixed global test set

---

### Post-deployment Stage

1. Load real-world smart plug data
2. Initialize model (from pretrained weights)
3. Perform federated updates across deployed clients
4. Evaluate real-world performance and system impact

---

## 🧠 SSFL Integration

When `--pretrained` is enabled:

- A supervised model is first trained on labeled data
- Pseudo-labels are generated for unlabeled samples
- Federated learning proceeds using both labeled and pseudo-labeled data

---

## 📂 Project Structure

```text
FL_Flower_Pipeline/
│
├── Dataset/            # Dataset files (QUD, DRED, Post data)
├── Results/            # Output results, logs and metrics, save model weights
├── Utils/
│   ├── FL_utils.py     # Federated learning utilities
│   ├── models.py       # Model definitions
│   └── utils.py        # General helper functions
│
├── client.py           # FL client implementation
├── server.py           # FL server implementation
├── client_ha.sh        # Script to run client.py in HA
├── requirements.txt
├── .gitignore
└── README.md
```

---

## 📝 Notes

- Start the server **before** launching clients
- Run each client in a separate terminal
- Dataset selection is only required for **Pre stage**
- Post stage assumes availability of real-world collected data
- `client_id` is used to simulate different federated participants

---

## 🔗 Full Implementation

The complete implementation, including:

- Supervised training
- SSFL pipeline
- Recommender system application

is available at:

https://github.com/MosarrofSakib/Etawfeer-Smart-Plug

---

## 📄 Citation

If you use this work, please cite the associated publication (to be added).

---

## 👨‍💻 Author

Md Mosarrof Hossen  
Research Assistant  
Qatar University – Electrical Engineering
