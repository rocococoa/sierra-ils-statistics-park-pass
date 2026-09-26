# Sierra ILS Statistics - Park Pass Automated Report
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![Python](https://img.shields.io/badge/python-%233670A0.svg?style=for-the-badge&logo=python&logoColor=ffdd54)

## Summary
Scheduled for the close of business each quarter, this automated report delivers key statistics for California and Santa Clara County park passes.

## Features and Deliverables

**Automated Email:**

<img width="738" height="611" alt="Quarterly Park Pass Email" src="https://github.com/user-attachments/assets/a2857308-072f-4ace-b6f0-3d32bca36143" />

**Attached Excel Report:**

<img width="852" height="335" alt="Park-Pass-Stats" src="https://github.com/user-attachments/assets/e7236d11-6999-476a-9eb5-9b8c4c72478a" />

**Park Pass YTD Circ Stats Tracker:**

<img width="1536" height="590" alt="Park-Pass-Tracker" src="https://github.com/user-attachments/assets/07b8ea15-2af2-4698-83d0-2e6f4bd108db" />


## Data Pipeline Architecture
This repository features an automated data pipeline that generates, formats, and distributes Excel reports via email. The system integrates Windows Task Scheduler, a Batch script, SQL, and Python to handle the end-to-end workflow without manual intervention. The automated process is fully productionized within a Windows environment.

**Workflow Overview:**

[Windows Task Scheduler] ──> [orchestrator.bat] ──> [main.py] ──> [Sub-modules & SQL] ──> [Report delivered to Email Inbox]

**Repository Contents & Security Note:**

To comply with data security policies, the core Python automation scripts have been omitted from this public repository. Instead, this repository provides:
- The SQL Data-Extraction Script: The exact logic used to pull and aggregate Sierra ILS production data.
- Manual Alternative: If you do not have an automated environment, you can run the provided SQL script manually in pgAdmin and export the results directly to a spreadsheet.

## Acknowledgments
The automated pipeline is built off the brilliant work of Gem Stone-Logan. For more information on implementing the automated system, please see her IUG presentations, [Automating Reports with Python.](https://www.gemstonelogan.com/presentations.html)
