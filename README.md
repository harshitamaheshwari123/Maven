
# 📚 Book Management CRUD Application

A **Java Maven** project implementing full **CRUD (Create, Read, Update, Delete)** operations for managing books.  
This project demonstrates clean coding practices, REST API design, and containerized deployment using **Docker** and **Render**.

---
Screenshots-

<img width="1920" height="1020" alt="Screenshot 2025-08-18 221424" src="https://github.com/user-attachments/assets/829ba24b-dc7b-4b6e-93e5-fd59b55069ca" />



<img width="1920" height="1020" alt="Screenshot 2025-08-18 221436" src="https://github.com/user-attachments/assets/62a7b7e6-00a5-469e-9b87-99af609482b2" />



<img width="1920" height="1020" alt="Screenshot 2025-08-18 221442" src="https://github.com/user-attachments/assets/00c80111-6601-49a1-ba96-2672799974f8" />




## ✨ Features
- ➕ **Create** a new book with title, author, and ISBN  
- 📖 **Read** book details (single or list all books)  
- ✏️ **Update** existing book information  
- ❌ **Delete** a book by ID  
- 🛠 Built with **Java 17 + Maven**  
- 🌐 Exposed as **REST APIs** (JSON-based responses)  
- 📦 Deployable via **Docker** and live on **Render**  

---

## 🏗️ Project Structure
```
demo/
 ├── src/main/java/com/example/bookmanagement/
 │    ├── controller/   # REST controllers (BookController.java)
 │    ├── model/        # Data models (Book.java)
 │    ├── service/      # Business logic (BookService.java)
 │
 ├── src/main/resources/
 │    ├── static/       # Static files (index.html)
 │    ├── application.properties
 │
 ├── .dockerignore
 ├── Dockerfile
 ├── HELP.md
 ├── mvnw / mvnw.cmd
 ├── pom.xml

````

---

## ⚙️ Tech Stack
- **Java 17**
- **Maven 3.9+**
- **Spring Boot** (or plain REST depending on your setup)
- **Docker**
- **Render (Cloud Deployment)**

---

## 🚀 Running Locally

### Prerequisites
- Install [Java 17](https://adoptium.net/)
- Install [Maven](https://maven.apache.org/)
- Install [Docker](https://www.docker.com/) (optional for containerized run)

### 1. Clone the repository
```bash
git clone https://github.com/<your-username>/<your-repo>.git
cd <your-repo>
````

### 2. Build the project

```bash
mvn clean package -DskipTests
```

### 3. Run locally

```bash
java -jar target/*.jar
```

Access the API at: [http://localhost:3000/api/books](http://localhost:3000/api/books)

---

## 📡 API Endpoints

| Method | Endpoint          | Description       |
| ------ | ----------------- | ----------------- |
| POST   | `/api/books`      | Create a new book |
| GET    | `/api/books`      | List all books    |
| GET    | `/api/books/{id}` | Get book by ID    |
| PUT    | `/api/books/{id}` | Update book by ID |
| DELETE | `/api/books/{id}` | Delete book by ID |

---

## 🐳 Docker Support

### Build image

```bash
docker build -t books-app .
```

### Run container

```bash
docker run -p 3000:3000 books-app
```

Now the app is accessible at [http://localhost:8080](http://localhost:8080).

---

## 🌍 Deployment on Render

This project is configured for easy deployment on [Render](https://render.com).

### Option 1: Deploy with Dockerfile

1. Push your project to GitHub.
2. Go to [Render Dashboard](https://dashboard.render.com/) → **New +** → **Web Service**.
3. Select your repository.
4. Render will detect the **Dockerfile** automatically.
5. Deploy → You’ll get a live link like:

   ```
   https://books-crud.onrender.com
   ```

### Option 2: Deploy without Docker (Native Build)

1. Push your project to GitHub.
2. On Render:

   * **Build Command:**

     ```bash
     mvn clean package -DskipTests
     ```
   * **Start Command:**

     ```bash
     java -jar target/*.jar --server.port=$PORT
     ```
   * Ensure your app listens on `$PORT` (Render requirement).
3. Deploy → get your live URL.

---

## 📝 Example API Usage

### Create Book

```bash
curl -X POST https://books-crud.onrender.com/api/books \
   -H "Content-Type: application/json" \
   -d '{"title":"Effective Java","author":"Joshua Bloch","isbn":"9780134685991"}'
```

### Get All Books

```bash
curl https://books-crud.onrender.com/api/books
```
