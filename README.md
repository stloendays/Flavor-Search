# Flavor Intelligence Platform

A full-stack flavor and chemical-data platform spanning data acquisition, structured storage, REST APIs, and a responsive web interface.

## What I built

- **Full-stack application:** HTML/CSS/JavaScript frontend + Node.js/Express backend + MySQL database.
- **Web data acquisition:** developed crawler/scraping and ingestion workflows to collect flavor, fruit, and chemical-compound information from online sources, then clean and standardize the records before database loading.
- **Scientific data modeling:** organized fruit entities, flavor molecules, metadata fields, and properties into a searchable relational structure.
- **REST API layer:** implemented Express endpoints, parameterized MySQL queries, JSON responses, CORS handling, error handling, and a health-check endpoint.
- **Frontend experience:** built responsive home, flavor-list, flavor-detail, compound, search, and about pages with API-backed data retrieval.

## Architecture

`Web sources -> crawler / data acquisition -> cleaning & structuring -> MySQL -> Node.js/Express REST API -> JavaScript frontend -> search & detail views`

> Note: the current public repository contains the full-stack application and database/API implementation. The web-crawling/data-acquisition work was part of the project workflow, but the crawler source is not currently included in this repository.

## Technology Stack

**Frontend:** HTML, CSS, JavaScript  
**Backend:** Node.js, Express.js  
**Database:** MySQL  
**Data / Automation:** Python, web crawling/scraping, data cleaning, structured ingestion  
**API:** REST, JSON, CORS

## Quick Start

### Requirements

- Node.js
- Python
- MySQL or XAMPP

### One-click setup

```bash
setup-database.bat
quick-start.bat
```

### Manual startup

1. Set up the database:

```bash
setup-database.bat
```

2. Start the backend:

```bash
cd backend
npm install
npm run dev
```

3. Start the frontend:

```bash
cd frontend
python -m http.server 8000
```

## Project Structure

```text
flavor/
├── backend/
│   ├── app.js
│   ├── package.json
│   └── .env
├── frontend/
│   ├── index.html
│   ├── flavor.html
│   ├── flavor-detail.html
│   ├── compound.html
│   ├── search.html
│   ├── about.html
│   ├── css/
│   ├── js/
│   └── images/
├── database/
│   └── flavor_schema.sql
├── setup-database.bat
├── quick-start.bat
└── README.md
```

## Database Configuration

Default backend environment variables:

```text
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=123456
DB_NAME=flavor_db
PORT=5000
NODE_ENV=development
```

## API

- `GET /api/flavors/:type` - retrieve structured information for a flavor type.
- `GET /api/health` - backend health check.

The backend uses parameterized MySQL queries and returns structured JSON consumed by the frontend.

## Frontend

The interface includes:

- Home page
- Flavor list
- Flavor detail
- Compound view
- Search
- About page

The UI uses responsive CSS, Grid/Flexbox layouts, transitions, and API-backed dynamic data.

## Data Workflow

The project was designed as an end-to-end data product rather than a static website:

1. Acquire flavor/compound information from web sources.
2. Clean and standardize heterogeneous records.
3. Load structured records into MySQL.
4. Expose the data through backend APIs.
5. Retrieve and present the data through searchable web interfaces.

This architecture makes the project relevant to full-stack engineering, scientific data engineering, database development, and AI-agent data infrastructure.

## License

ISC
