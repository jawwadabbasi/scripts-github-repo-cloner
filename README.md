### **`github-repo-cloner`**  
_Automate cloning of all repositories from a GitHub organization._

---

## 🚀 Overview  
This script automates the process of **cloning all repositories** from a given **GitHub organization** using the GitHub API. It supports **pagination**, ensures **secure authentication**, and provides a clean **bulk cloning** experience.  

## 🔧 Features  
✅ **Clone all repositories** from a GitHub organization  
✅ **Handles pagination** for organizations with many repositories  
✅ **Uses SSH URLs** for secure and efficient cloning  
✅ **Supports Personal Access Token (PAT) authentication**  
✅ **Customizable directory** for cloning repositories  

## 📦 Requirements  
Ensure you have the following installed:  
- **Git** (`git --version`)  
- **cURL** (`curl --version`)  
- **jq** (`jq --version`) _(for JSON parsing)_  

> _If `jq` is missing, install it via:_  
> - **Mac**: `brew install jq`  
> - **Windows**: `choco install jq`  
> - **Linux**: `sudo apt-get install jq`  

---

## ⚙️ Setup & Usage  

### **1️⃣ Configure GitHub Credentials**  
Edit the script and replace the placeholders:  
```bash
GITHUB_USERNAME="your-github-username"
GITHUB_TOKEN="your-personal-access-token"
ORGANIZATION="KodelleInc"
CLONE_DIR="./my-repos"
```
> 🔹 **Generate a Personal Access Token (PAT)**:  
> - Go to [GitHub Token Settings](https://github.com/settings/tokens)  
> - Select scopes: **repo, read:org** _(for private orgs)_  
> - Copy & paste the token into `GITHUB_TOKEN`

### **2️⃣ Run the Script**  
```bash
chmod +x github-org-cloner.sh
./github-org-cloner.sh
```
_All repositories will be cloned into `CLONE_DIR`._

---

## 🛠 Example Output  
```bash
Cloning git@github.com:my-org/repo-1.git into ./repo-1...
Cloning git@github.com:my-org/repo-2.git into ./repo-2...
...
✅ All repositories cloned successfully!
```

---

## 🦇 Built for DevOps Automation  
_"Once written, forever automated."_ ⚡  

**Author**: [Jawwad Abbasi](https://github.com/jawwadabbasi)  

---