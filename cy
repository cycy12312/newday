name: cy

on:
  push:
    branches:
      - main
  schedule:
    - cron: "0 0 * * *"

jobs:
  autogreen:
    runs-on: ubuntu-latest
    
    permissions:
      contents: write
  
    steps:
      - name: Clone repository
        uses: actions/checkout@v3

      - name: Auto green
        run: |
          git config --local user.email "qweere21@gmail.com"
          git config --local user.name "cycy12312"
          git remote set-url origin https://${{ github.actor }}:${{ secrets.GITHUB_TOKEN }}@github.com/${{ github.repository }}
          git pull --rebase
          git commit --allow-empty -m "a commit a day keeps your girlfriend away"
          git push
