# 📊 Fintrack - Financial Tracker App

Fintrack is a Flutter-based mobile application that helps users track their stock and cryptocurrency investments. With a clean interface and smooth performance, it provides real-time financial data, company details, and the ability to comment on stocks.

<p align="center">
  <img src="https://github.com/user-attachments/assets/a1b82237-7377-4c58-bbdd-b3494fcaf2a5" width="250"/>
  <img src="https://github.com/user-attachments/assets/5026c37f-38ad-4c86-8ea5-5b9300237967" width="250"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/271bdf31-a80f-4d97-8de7-8a921598b540" width="250"/>
  <img src= "https://github.com/user-attachments/assets/b20f5c8e-f40f-4a46-aab9-db48967a6577" width="250"/>
</p>

## 🚀 Features

- 📈 **Real-time Market Data** (Stocks & Crypto)
- 👤 **User Authentication** (Register & Login)
- 📝 **Comment System** (Stock-based)
- 💳 **Mock Purchase Page** with Credit Card UI
- 📊 **Dynamic Graphs** for Crypto
- 💬 **Company Details** with user feedback
- 🌙 **Modern UI** with animations and responsive layout

## 🛠️ Tech Stack

- **Flutter** (UI/Frontend)
- **Dart** (Language)
- **Dio** (HTTP client)
- **Custom Widgets** (Reusable TextField, Buttons, etc.)
- **State Management** via ViewModel (MVVM style)

## 📷 Screenshots



### Detail View, Crypto Graph 
<p align="center">
  <img src="https://github.com/user-attachments/assets/a2e2df05-2a68-4f04-940b-aec9e383a1fa" width="220"/>
  <img src="https://github.com/user-attachments/assets/56762db2-393b-4e0b-8e49-bf10cd48b85f" width="220"/>
  <img src="https://github.com/user-attachments/assets/37d168cf-2c47-4155-bfb3-9d12dbc139d4" width="220"/>
</p>

### 💳 Payment • 📉 Full Crypto List • 🏦 Full Stock List
<p align="center">
  <img src="https://github.com/user-attachments/assets/0a148617-3b5f-4dea-8a66-6cbaedbec0ae" width="250"/>
  <img src="https://github.com/user-attachments/assets/f7621b72-da8e-473c-ae5f-f52647c0df3c" width="250"/>
  <img src="https://github.com/user-attachments/assets/58dfc619-affe-465d-88a6-fffd796aa040" width="250"/>
</p>



## 📁 Project Structure

```
lib/
├── feature/
│   ├── model/
│   ├── service/
│   ├── view/
│   └── view_model/
├── product/
│   ├── constant/
│   ├── helper/
│   ├── init/
│   ├── utility/
│   └── widget/
```

---

## 🖥️ Backend - ASP.NET Core Web API

The backend of Fintrack is a fully self-developed **ASP.NET Core Web API** application, responsible for managing authentication, portfolios, stock/crypto data, and user comments.

### 📆 Project Structure Highlights

| Folder        | Purpose |
|---------------|---------|
| `Controllers/` | API endpoints (Login, Register, Portfolio, Comments) |
| `Dtos/`        | Data Transfer Objects for safe and structured communication |
| `Interfaces/`  | Service and repository contracts for DI |
| `Repository/`  | Data access layer (Entity Framework + LINQ queries) |
| `Service/`     | Business logic and service layer implementations |
| `Mappers/`     | AutoMapper profiles for model-to-dto mapping |
| `Models/`      | Entity classes (User, Stock, Coin, Portfolio, etc.) |
| `Data/`        | DB Context and seeding logic |
| `Helpers/`     | Utility classes (Token generator, validators) |

### 🔐 Authentication

- JWT-based secure token generation  
- Role and claim-based route protection  
- Login/Register endpoint validation with `ModelState`

### 🚪 API Usage

- Swagger support enabled for testing endpoints  
- Example request/response formats available in `api.http`

### 🗃️ Database

- SQL Server with Entity Framework Core  
- Migrations and seeding implemented  
- Supports relationships like:
  - One-to-many (User → Portfolio)
  - Many-to-many (Users ↔ Stocks through Portfolios)


