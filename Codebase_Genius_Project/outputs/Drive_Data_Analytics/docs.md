```markdown
# Car Price Analysis in Kenya: Scraping, EDA, and Interactive Dashboard

## 1. Project Overview

This project scrapes car data from Kai and Karo to analyze pricing trends in Kenya's car market. Key features include data processing, feature engineering, and exploratory data analysis, culminating in an interactive Tableau dashboard. Users can explore factors influencing car prices through the dashboard's filters. To use, clone the repository, install dependencies, and interact with the Tableau dashboard online.

## 2. Repo Structure

```markdown
## Repository Structure

- 📁 .git
  - 📄 description
  - 📄 config
  - 📄 packed-refs
  - 📁 hooks
    - 📄 push-to-checkout.sample
    - 📄 pre-applypatch.sample
    - 📄 post-update.sample
    - 📄 pre-receive.sample
    - 📄 applypatch-msg.sample
    - 📄 prepare-commit-msg.sample
    - 📄 pre-push.sample
    - 📄 pre-commit.sample
    - 📄 sendemail-validate.sample
    - 📄 fsmonitor-watchman.sample
    - 📄 pre-merge-commit.sample
    - 📄 pre-rebase.sample
    - 📄 commit-msg.sample
    - 📄 update.sample
  - 📁 info
    - 📄 exclude
  - 📄 HEAD
  - 📁 objects
    - 📁 pack
      - 📄 pack-df6389af60fc16db40360da8fe3e1a0e929d01a0.rev
      - 📄 pack-df6389af60fc16db40360da8fe3e1a0e929d01a0.pack
      - 📄 pack-df6389af60fc16db40360da8fe3e1a0e929d01a0.idx
  - 📄 index
  - 📁 refs
    - 📁 remotes
      - 📁 origin
        - 📄 HEAD
    - 📁 heads
      - 📄 master
  - 📁 logs
    - 📄 HEAD
    - 📁 refs
      - 📁 remotes
        - 📁 origin
          - 📄 HEAD
      - 📁 heads
        - 📄 master
- 📁 .ipynb_checkpoints
  - 📄 EDA_Descriptive-checkpoint.ipynb
  - 📄 Scraping-checkpoint.ipynb
  - 📄 preprocessing-checkpoint.ipynb
- 📁 Images
  - 📄 Tableau_desktop_icon.jpg
  - 📄 img2.jpg
  - 📄 img1.jpg
  - 📄 header_img2.jpeg
  - 📄 csv img.jpg
- 📄 car_df.csv
- 📄 Book1.twb
- 📄 preprocessing.ipynb
- 📄 README.md
- 📄 ~Book1__13048.twbr
- 📄 cleaned_df.csv
- 📄 Scraping.ipynb
- 📄 final_clean_car_data.csv
- 📄 EDA_Descriptive.ipynb
- 📄 requirements.txt

## Languages Detected

- Python (Jupyter Notebook)
- Markdown
- Tableau Workbook

## Entry Points

- `preprocessing.ipynb` - Likely contains data cleaning and transformation steps.
- `Scraping.ipynb` - Probably responsible for web scraping data.
- `EDA_Descriptive.ipynb` - Contains exploratory data analysis and descriptive statistics.
- `README.md` - Provides an overview of the project.
- `requirements.txt` - Lists the Python dependencies for the project.
```

## 3. Installation & Usage

1.  **Clone the repository:**

    ```bash
    git clone <repository_url>
    cd <repository_directory>
    ```

2.  **Install dependencies:**

    ```bash
    pip install -r requirements.txt
    ```

3.  **Run the Jupyter Notebooks:**

    *   `Scraping.ipynb`:  Execute this notebook to scrape the car data.
    *   `preprocessing.ipynb`: Run this notebook to clean and prepare the data.
    *   `EDA_Descriptive.ipynb`:  Execute this for exploratory data analysis.

4.  **Interact with the Tableau dashboard:**

    *   Open `Book1.twb` (or the appropriate `.twb` file) in Tableau Desktop.
    *   Alternatively, access the interactive dashboard online (if deployed).

## 4. API / Key Functions

Since the project primarily uses Jupyter Notebooks, the "API" consists of the functions and data transformations within those notebooks. Key functions are likely within:

*   `Scraping.ipynb`: Functions to scrape data from Kai and Karo.
*   `preprocessing.ipynb`: Functions for data cleaning, transformation, and feature engineering.
*   `EDA_Descriptive.ipynb`: Functions for statistical analysis and data visualization.

The project utilizes the Tableau workbook (`Book1.twb`) for interactive visualization.  This is not an API in the traditional sense but provides a user interface to explore the processed data.

## 5. Code Relationships

```json
{
  "nodes": [],
  "edges": []
}
```

The `ccg_json` indicates there are no explicit code relationships detected between files. This is common in projects primarily using Jupyter Notebooks for analysis, where the flow of data is sequential within each notebook rather than through inter-file function calls. The notebooks likely operate independently, with data flowing from scraping to preprocessing to EDA.
