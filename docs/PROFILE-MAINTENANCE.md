# Profile Maintenance Guide

This guide explains how to maintain the `Nambekai/Nambekai` GitHub profile repository with Git and GitHub CLI. Run commands from the repository root in PowerShell.

## 1. Prerequisites

- Install [Git](https://git-scm.com/downloads).
- Install [GitHub CLI](https://cli.github.com/).
- Sign in with `gh auth login` and confirm access with `gh auth status`.

## 2. Update the Profile README

1. Edit `README.md`.
2. Store repository images in `assets/`.
3. Use relative image paths such as `./assets/file-name.png`.
4. Write concise alternative text for every image.
5. Keep the profile-views counter only in the root `README.md`.
6. Confirm that personal details are still appropriate for public display.

## 3. Review Before Publishing

```powershell
git status --short
git diff --check
git diff
```

Confirm the following:

- Names, school details, contact information, and time zone are current.
- Every local image exists and remains readable at desktop and mobile widths.
- External links use HTTPS, except for `mailto:` and `tel:` links.
- SVG text contains plain English and does not overlap its containers.
- No password, access token, private key, student record, or confidential document is staged.

## 4. Commit and Push

```powershell
git add --all
git commit -m "docs: update professional profile"
git push
```

## 5. Update Repository Metadata

```powershell
gh repo edit Nambekai/Nambekai `
  --description "Professional profile of Tran Si Nam, an Electronics and Telecommunications student focused on intelligent and connected systems." `
  --homepage "https://www.linkedin.com/in/nambekai/"
```

Add a topic with `gh repo edit Nambekai/Nambekai --add-topic topic-name`. Topic names should be short, lowercase, and separated with hyphens.

## 6. Update Public Profile Fields

Review all values before running this example:

```powershell
gh api --method PATCH user `
  -f name="Tran Si Nam" `
  -f bio="Senior Electronics and Telecommunications student at FETEL, VNUHCM-US, focused on computer vision, machine learning, networks, and reliable engineering." `
  -f company="FETEL, VNUHCM-University of Science" `
  -f location="Ho Chi Minh City, Vietnam (UTC+7)" `
  -f blog="https://www.linkedin.com/in/nambekai/"
```

To set a concise profile status through GitHub GraphQL:

```powershell
$statusMessage = "Engineering reliable vision, learning, and communications systems."
$query = 'mutation($message:String!) { changeUserStatus(input:{message:$message, limitedAvailability:false}) { status { message } } }'
gh api graphql -f query=$query -f message=$statusMessage
```

## 7. Create a Release

Update `CHANGELOG.md`, commit the change, and then run:

```powershell
gh release create v1.1.0 --title "Professional Profile v1.1.0" --notes-file CHANGELOG.md
```

Use semantic versioning: major versions for substantial restructuring, minor versions for new profile sections or assets, and patch versions for corrections.

## Frequently Asked Questions

### Why must the repository name match the GitHub user name?

GitHub automatically displays the root `README.md` on the account profile when a public repository has the same name as the account.

### Why are images stored locally?

Local assets remain versioned with the profile and avoid fragile links to unrelated image hosts. Service-generated badges remain external because they display live data.

### How should a private document be handled?

Do not add it to this public profile repository. Use a private repository and share access only with the intended readers.

### How is a previous version restored?

Inspect the history with `git log --oneline`, identify the desired revision, and restore individual files with `git restore --source REVISION -- path`. Review the resulting diff before committing.
