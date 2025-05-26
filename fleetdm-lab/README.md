# FleetDM Docker Architecture

This project uses `docker-compose` to run a local FleetDM instance with:

### ✅ Services Included

| Service | Description |
|--------|-------------|
| **Fleet** | The main web server and REST API (access at http://localhost:8080) |
| **MySQL** | Stores all data: users, devices, query results |
| **Redis** | Handles background jobs and real-time metrics caching |

### 📦 Why Each Service Matters

- **Fleet** is the control center. It provides the user interface and handles API requests.
- **MySQL** acts as the memory — it stores all persistent data like enrolled devices and query logs.
- **Redis** handles fast, temporary data and background job processing like scheduled queries and live status checks.

### 🔄 Diagram

![FleetDM Architecture](./fleetdm_architecture.png)

---

### 🚀 Run the Stack

```bash
docker compose up -d
