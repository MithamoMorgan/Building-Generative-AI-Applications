```markdown
## Project Overview

ShambaHive is a project featuring a frontend and backend. The frontend, located in the `Frontend` directory, likely handles the user interface and presentation. The backend, in the `Backend` directory, likely manages data, logic, and APIs. The project also includes image folders for products and farmers, suggesting image-related functionalities.

## Repository Structure

```markdown
## Repository Structure

- 📁 Backend
  - 📄 bot.jac
  - 📄 auth.jac
  - 📄 requirements.txt
- 📁 farmers
  - 📄 ft.jpg
  - 📄 me.jpg
  - 📄 image (2).jpg
  - 📄 tm.jpg
  - 📄 po.jpg
  - 📄 my.jpg
  - 📄 jm.jpg
  - 📄 jj.jpg
  - 📄 lu.jpg
  - 📄 dv.jpg
  - 📄 ax.jpg
  - 📄 am.jpg
  - 📄 pt.jpg
  - 📄 so.jpg
  - 📄 image (6).jpg
  - 📄 gg.jpg
- 📁 products
  - 📄 milk.jpeg
  - 📄 canes.jpeg
  - 📄 chicks.jpeg
  - 📄 bananas.jpeg
  - 📄 eggs.jpeg
  - 📄 onions.jpeg
  - 📄 kales.jpeg
  - 📄 goat.jpg
  - 📄 carrots.jpeg
  - 📄 tomatoes.jpg
  - 📄 melons.jpeg
  - 📄 cabbages.jpeg
- 📁 .git
  - 📁 logs
    - 📄 HEAD
    - 📁 refs
      - 📁 remotes
        - 📁 origin
          - 📄 HEAD
      - 📁 heads
        - 📄 main
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
  - 📁 objects
    - 📁 pack
      - 📄 pack-60db2eb5a070622d60c422fd4acf74113b8a01a8.idx
      - 📄 pack-60db2eb5a070622d60c422fd4acf74113b8a01a8.pack
      - 📄 pack-60db2eb5a070622d60c422fd4acf74113b8a01a8.rev
  - 📁 refs
    - 📁 remotes
      - 📁 origin
        - 📄 HEAD
    - 📁 heads
      - 📄 main
  - 📄 description
  - 📄 config
  - 📄 packed-refs
  - 📄 HEAD
  - 📄 index
- 📁 Frontend
  - 📄 home.html
  - 📄 ai.html
  - 📄 alerts.html
  - 📄 messages.html
  - 📄 market.html
  - 📄 create_login.html
  - 📄 index.html
  - 📄 profile.html
- 📄 .gitignore
- 📄 README.md

## Languages Detected
- Markdown
- HTML
- JPEG
- Python Requirements File
- Jac

## Entry Points
- README.md
- Frontend/index.html
- Backend/bot.jac
```

## Installation & Usage

1.  **Backend Dependencies:** Navigate to the `Backend` directory and install the required Python packages using pip:

    ```bash
    cd Backend
    pip install -r requirements.txt
    ```

2.  **Frontend Setup:** The frontend consists of HTML, CSS, and JavaScript files.  No specific build process is mentioned; it's likely served directly by a web server.

3.  **Running the Application:**  Details on how to run the frontend and backend together are not explicitly provided.  The backend, written in Jac, likely requires a Jac interpreter or runtime environment.  The frontend likely requires a web server to serve the HTML files.

## Key Functions

| File        | Description                                                                                                                                                                                                                                                                                                                                                                                          |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `auth.jac`  | Handles user authentication. Likely contains functions or classes for user registration (`Signup`) and login (`Login`).                                                                                                                                                                                                                                                                            |
| `bot.jac`   | Implements an AI agricultural expert chatbot using the Gemini LLM via the `byllm` import. The `expert_response()` function is likely the main entry point for querying the chatbot.                                                                                                                                                                                                            |
| `index.html` | The main landing page of the ShambaHive application.                                                                                                                                                                                                                                                                                                                                             |
| Frontend HTML files | These files (`home.html`, `ai.html`, `alerts.html`, `messages.html`, `market.html`, `create_login.html`, `profile.html`) define the structure and content of various pages in the frontend application. They use Bootstrap for styling and potentially JavaScript for dynamic behavior. Functionalities includes: social feed (`home.html`), AI assistant (`ai.html`), alerts, and messaging. |

## Code Relationships

```markdown
## Code Context Graph

### Summary

The ShambaHive project consists of a backend built with Jac and a frontend built with HTML, CSS, and JavaScript, leveraging Bootstrap for styling. The backend handles user authentication (`auth.jac`) with `User` class and `Signup` and `Login` walkers, and provides an AI agricultural expert chatbot (`bot.jac`) using the Gemini LLM via the `byllm` import, exposing the `expert_response()` function. The frontend comprises multiple HTML files for different pages: a landing page (`index.html`), a login/signup page (`create_login.html`), a home page with social feed (`home.html`), an AI assistant interface (`ai.html`), an alerts display (`alerts.html`), a messaging interface (`messages.html`), a market page (`market.html`), and a user profile page (`profile.html`). These frontend pages heavily rely on Bootstrap and Bootstrap Icons for styling and interactivity, incorporating JavaScript for dynamic content rendering and user interactions such as posting, liking, commenting, and managing user profiles.

### Dependency Diagram (Text-Based)

```
Frontend (HTML/JS/CSS) ⚙️
├── index.html 🡒 bootstrap, bootstrap-icons
├── create_login.html 🡒 bootstrap
├── home.html 🡒 bootstrap, bootstrap-icons
├── ai.html 🡒 bootstrap, bootstrap-icons
├── alerts.html 🡒 bootstrap, bootstrap-icons
├── messages.html 🡒 bootstrap, bootstrap-icons
├── market.html 🡒 bootstrap
└── profile.html 🡒 bootstrap, bootstrap-icons
│
Backend (Jac) 🟦
├── auth.jac
└── bot.jac 🡒 byllm
```
```
