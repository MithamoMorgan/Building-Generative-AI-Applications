```markdown
## Project Overview

This project scrapes car data from Kai and Karo to analyze pricing trends in Kenya's car market. It features web scraping using BeautifulSoup, data storage in MySQL, and analysis with Pandas and visualization libraries. The project includes an interactive Tableau dashboard for exploratory data analysis. Users can run the project by cloning the repository, installing dependencies, and following the provided notebooks for data scraping, processing, and EDA.

## Repo Structure

```
.
├── Book1.twb
├── .git
│   ├── config
│   ├── description
│   ├── HEAD
│   ├── hooks
│   │   ├── applypatch-msg.sample
│   │   ├── commit-msg.sample
│   │   ├── fsmonitor-watchman.sample
│   │   ├── post-update.sample
│   │   ├── pre-applypatch.sample
│   │   ├── pre-commit.sample
│   │   ├── pre-merge-commit.sample
│   │   ├── pre-push.sample
│   │   ├── pre-rebase.sample
│   │   ├── pre-receive.sample
│   │   ├── prepare-commit-msg.sample
│   │   ├── push-to-checkout.sample
│   │   └── update.sample
│   ├── index
│   ├── info
│   │   └── exclude
│   ├── logs
│   │   ├── HEAD
│   │   ├── refs
│   │   │   ├── heads
│   │   │   │   └── master
│   │   │   └── remotes
│   │   │       └── origin
│   │   │           └── HEAD
│   │   └── refs
│   │       └── heads
│   │           └── master
│   ├── objects
│   │   └── pack
│   │       ├── pack-df6389af60fc16db40360da8fe3e1a0e929d01a0.idx
│   │       ├── pack-df6389af60fc16db40360da8fe3e1a0e929d01a0.pack
│   │       └── pack-df6389af60fc16db40360da8fe3e1a0e929d01a0.rev
│   └── packed-refs
├── .ipynb_checkpoints
│   ├── EDA_Descriptive-checkpoint.ipynb
│   ├── preprocessing-checkpoint.ipynb
│   └── Scraping-checkpoint.ipynb
├── Images
│   ├── csv img.jpg
│   ├── header_img2.jpeg
│   ├── img1.jpg
│   ├── img2.jpg
│   └── Tableau_desktop_icon.jpg
├── Scraping.ipynb
├── EDA_Descriptive.ipynb
├── preprocessing.ipynb
├── car_df.csv
├── cleaned_df.csv
├── final_clean_car_data.csv
├── README.md
├── requirements.txt
└── ~Book1__13048.twbr

```

## Installation & Usage

1.  **Clone the repository:**

    ```bash
    git clone <repository_url>
    cd <repository_name>
    ```
2.  **Install dependencies:**

    ```bash
    pip install -r requirements.txt
    ```
3.  **Run the notebooks:**

    *   `Scraping.ipynb`:  Scrapes car data from Kai and Karo.
    *   `preprocessing.ipynb`: Cleans and prepares the scraped data.
    *   `EDA_Descriptive.ipynb`: Performs exploratory data analysis.
4.  **Tableau Dashboard:**

    *   `Book1.twb`: Contains the interactive Tableau dashboard for visualizing the data. Open with Tableau Desktop.

## API / Key Functions

The project uses the following libraries and techniques:

*   **BeautifulSoup:** For web scraping.
*   **Pandas:** For data manipulation and analysis.
*   **MySQL:** For data storage (implementation details are likely within the notebooks).
*   **Visualization libraries (likely Matplotlib, Seaborn):**  For creating visualizations within the EDA notebook.
*   **Tableau:** For creating the interactive dashboard.

The core functions are within the provided notebooks.  Specifically, the `Scraping.ipynb` notebook contains the web scraping logic, `preprocessing.ipynb` contains data cleaning and transformation steps, and `EDA_Descriptive.ipynb` contains the data analysis and visualization code.

## Code Relationships

*No code relationships to display.*
